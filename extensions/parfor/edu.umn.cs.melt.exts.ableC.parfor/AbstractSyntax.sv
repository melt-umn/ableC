grammar edu:umn:cs:melt:exts:ableC:parfor;

import edu:umn:cs:melt:ableC:abstractsyntax;
import edu:umn:cs:melt:ableC:abstractsyntax:construction;
import edu:umn:cs:melt:ableC:abstractsyntax:env;

import silver:langutil;

abstract production parfor
top::Stmt ::=
  poolref::Expr
  storageClass::[StorageClass]
  attributes::[Attribute]
  bt::BaseTypeExpr
  mt::TypeModifierExpr
  id::Name
  init::Initializer
  cond::Expr
  iter::Expr
  body::Stmt
{
  top.functiondefs = []; -- We need to close a circularity here

-- We have the variable declaration here, so we can use that just fine.
-- We need to decomposed 'cond' to determine if its < or <=
  local upperBound :: Either<Expr String> =
    case cond of
    | binaryOpExpr(declRefExpr(condid), compareOp(ltOp()), bound) ->
        if condid.name == id.name then
          left(bound)
        else
          right("upper bound not on declared identifier " ++ id.name)
    | _ -> right("unknown loop bound type (expected " ++ id.name ++ " < ...)")
    end;
  local getUpperBound :: Expr = case upperBound of left(x) -> x end;

-- Take parallelize for(int i = 0; i < 10; i++) { body }
-- Emit
-- { 
--   int __parfor_orig_lower = 0;
--   int __parfor_orig_upper = 10;
--   int __parfor_orig_size = __parfor_orig_upper - __parfor_orig_lower;
--   void __parfor_action(threaddata_t *__parfor__thread) {
--     int __parfor_lower = __parfor_orig_size * __parfor__thread->threadid / __parfor__thread->pool->nthreads + __parfor_orig_lower;
--     int __parfor_upper = __parfor_orig_size * (__parfor__thread->threadid + 1) / __parfor__thread->pool->nthreads + __parfor_orig_lower;
--     for(int i = __parfor_lower, i < __parfor_upper; i++) { body }
--   }
--   threadpool_execute(pool, __parfor_action);
-- }

  local block :: Stmt =
    -- We do want to create a scope here
    compoundStmt(
      foldStmt([
        declStmt(variableDecls(storageClass, attributes, bt, foldDeclarator([
          -- int __parfor_orig_lower = 0;
          declarator(olow, mt, [], justInitializer(init)),
          -- int __parfor_orig_upper = 10;
          declarator(ohigh, mt, [], justInitializer(exprInitializer(getUpperBound))),
          -- int __parfor_orig_size = __parfor_orig_upper - __parfor_orig_lower;
          declarator(osize, mt, [],
            justInitializer(exprInitializer(binaryOpExpr(
              d(ohigh),
              numOp(subOp(location=bogusLocation), location=bogusLocation),
              d(olow),
              location=bogusLocation))))
        ]))),
        -- void __parfor_action(threaddata_t *__parfor__thread) {
        declStmt(functionDeclaration(functionDecl(
          [], -- storage class
          [], -- function qualifiers
          directTypeExpr(builtinType([], voidType())),
          functionTypeExprWithArgs(
            baseTypeExpr(),
            foldParameterDecl([
              parameterDecl([], typedefTypeExpr([], threaddata_t), pointerTypeExpr([], baseTypeExpr()), justName(pthr), [])
            ]),
            false),
          actfun,
          [], -- attributes
          foldDecl([]),
          foldStmt([
            declStmt(variableDecls(storageClass, attributes, bt, foldDeclarator([
              -- int __parfor_lower = ...
              declarator(lower, mt, [], justInitializer(exprInitializer(bound(getThreadId)))),
              -- int __parfor_upper = ...
              declarator(upper, mt, [], justInitializer(exprInitializer(bound(plusOne(getThreadId)))))
            ]))),
            -- for(int i = __parfor_lower, i < __parfor_upper; i++) { body }
            forDeclStmt(
              variableDecls(storageClass, attributes, bt, foldDeclarator([declarator(id, mt, [], justInitializer(exprInitializer(d(lower))))])),
              justExpr(binaryOpExpr(d(id), compareOp(ltOp(location=bogusLocation), location=bogusLocation), d(upper), location=bogusLocation)),
              justExpr(iter),
              body)
          ])))),
        -- threadpool_execute(pool, __parfor_action);
        exprStmt(callExpr(
          d(threadpool_execute),
          foldExpr([poolref, d(actfun)]),
          location=bogusLocation))
      ])
    );

  production attribute myerrors :: [Message] with ++;
  myerrors := [];
  myerrors <-
    case upperBound of
    | right(e) -> [err(cond.location, e)]
    | _ -> []
    end;

  local tydef :: [ValueItem] = lookupValue("threadpool_execute", top.env);
  myerrors <-
    if null(tydef) then
      [err(poolref.location, "parallelize requires #include \"threadpool.h\"")]
    else [];
  myerrors <- poolref.errors ++ bt.errors ++ mt.errors ++ init.errors ++ cond.errors; -- we can skip body and iter because they appear exactly once in the forward tree, and so they'll be properly emitted there

  forwards to
    if null(myerrors) then warnStmt(myerrors)
    else block;
}

global olow :: Name = n("__parfor_orig_lower");
global ohigh :: Name = n("__parfor_orig_upper");
global osize :: Name = n("__parfor_orig_size");

global actfun :: Name = n("__parfor_action");
global lower :: Name = n("__parfor_lower");
global upper :: Name = n("__parfor_upper");
global pthr :: Name = n("__parfor__thread");

global threaddata_t :: Name = n("threaddata_t");
global threadpool_execute :: Name = n("threadpool_execute");
global pool :: Name = n("pool");
global threadid :: Name = n("threadid");
global nthreads :: Name = n("nthreads");

global bogusLocation :: Location = loc("<generated>", -1,-1,-1,-1,-1,-1);

function n
Name ::= s::String
{ return name(s, location=bogusLocation); }

function d
Expr ::= n::Name
{ return declRefExpr(n, location=bogusLocation); }


global getThreadId :: Expr =
  memberExpr(d(pthr), true, threadid, location=bogusLocation);

function plusOne
Expr ::= e::Expr
{
  return binaryOpExpr(e, numOp(addOp(location=bogusLocation), location=bogusLocation), realConstant(integerConstant("1", false, noIntSuffix(), location=bogusLocation), location=bogusLocation), location=bogusLocation);
}

function bound
Expr ::= e::Expr
{
-- where e = __parfor__thread->threadid
-- __parfor_orig_size * 'e / __parfor__thread->pool->nthreads + __parfor_orig_lower;
  local mul :: Expr =
    binaryOpExpr(d(osize), numOp(mulOp(location=bogusLocation), location=bogusLocation), e, location=bogusLocation);
  local div :: Expr =
    binaryOpExpr(mul, numOp(divOp(location=bogusLocation), location=bogusLocation), memberExpr(memberExpr(d(pthr), true, pool, location=bogusLocation), true, nthreads, location=bogusLocation), location=bogusLocation);
  local add :: Expr =
    binaryOpExpr(div, numOp(addOp(location=bogusLocation), location=bogusLocation), d(olow), location=bogusLocation);
  return add;
}

