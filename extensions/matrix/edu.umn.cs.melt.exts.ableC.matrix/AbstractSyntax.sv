grammar edu:umn:cs:melt:exts:ableC:matrix;

imports edu:umn:cs:melt:ableC:abstractsyntax as abs;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction as abs;
imports edu:umn:cs:melt:ableC:abstractsyntax:env as abs;

imports silver:langutil;
imports silver:langutil:pp;

abstract production matrixIndex
top::abs:Expr ::= m::abs:Name  i::[abs:Expr]
{
  -- This is a quick hack, not necessarily the recommended way of implementing overriding.
  -- The issue is that collections like this are discouraged: every one is a potential hole
  -- where there needs to be a defined semantics for how it works, especially w.r.t extension.
  -- This one has no such semantics.
  -- More preferrably, we'd have a list of ("struct name" --> handler) mappings,
  -- where our rules could be "only map your extension's structs to
  -- their respective handlers".
  production attribute overrides :: [abs:Expr] with ++;
  overrides := [];
  
  forwards to if null(overrides) then matrixActualIndex(m, abs:foldExpr(i), location=top.location) else head(overrides);
}

abstract production matrixActualIndex
top::abs:Expr ::= m::abs:Name  i::abs:Exprs
{
  local tydef :: [abs:ValueItem] = abs:lookupValue("Matrix", top.abs:env);
  local localErrs :: [Message] =
    (if !null(tydef) then 
      (if abs:compatibleTypes(
            m.abs:valueItem.abs:typerep,
            head(tydef).abs:typerep, true) then
        []
       else
        [err(m.location, "Matrix indexing expression expected Matrix type (got " ++ abs:showType(m.abs:valueItem.abs:typerep) ++ ")")])
     else
      [err(top.location, "Matrix indexing requires \"matrix.h\" to be included.")]) ++
    m.abs:valueLookupCheck ++
    i.abs:argumentErrors;

  i.abs:expectedTypes =
    [abs:builtinType([], abs:signedType(abs:intType())),
     abs:builtinType([], abs:signedType(abs:intType()))];
  i.abs:argumentPosition = 1;
  i.abs:callExpr = top;
  i.abs:callVariadic = false;
  
  forwards to
    if null(localErrs) then
      fwdTree
    else
      -- Do not supress subexpression errors, here.
      abs:errorExpr(localErrs ++ i.errors, location=top.location);

  -- C: *matrix_index(&m, i0, i1)
  local fwdTree :: abs:Expr =
    abs:unaryOpExpr(
      abs:dereferenceOp(location=top.location),
      abs:directCallExpr(
        abs:name("matrix_index", location=top.location),
        abs:consExpr(
          takeAddr(m),
          i
        ),
        location=top.location),
      location=top.location
    );    
}

abstract production matrixAssign
top::abs:Stmt ::= id::abs:Name  e::MatrixExpr  doFree::Boolean
{
  local tydef :: [abs:ValueItem] = abs:lookupValue("Matrix", top.abs:env);
  local localErrs :: [Message] =
    (if !null(tydef) then 
      (if abs:compatibleTypes(
            id.abs:valueItem.abs:typerep,
            head(tydef).abs:typerep, true) then
         e.errors
       else
         [err(id.location, "Matrix assignment expected identifier of Matrix type (got " ++ abs:showType(id.abs:valueItem.abs:typerep) ++ ")")])
     else
      [err(id.location, "Matrix indexing requires \"matrix.h\" to be included.")]) ++
    id.abs:valueLookupCheck;

  e.givenStorage = just(id);
  
  top.abs:functiondefs = [];
  forwards to
    if null(localErrs) then
      fwdTree
    else
      -- Don't ask for subexpression errors if there's local problems.
      -- We'll assume we find Matrix as a type in the subexpr
      abs:warnStmt(localErrs);

  -- C: { e.temporaries; e.actions; free(e.temporaries); }
  local fwdTree :: abs:Stmt =
    abs:compoundStmt(
      abs:foldStmt(
        (if doFree then [freeMat(id, id.location)] else []) ++
        map(declareMat(_, id.location), e.temporaries) ++
        e.actions ++
        map(freeMat(_, id.location), e.temporaries)
      )
    );
}

abstract production matrixDeclare
top::abs:Stmt ::= id::abs:Name  e::MatrixExpr
{
  local tydef :: [abs:ValueItem] = abs:lookupValue("Matrix", top.abs:env);
  local localErrs :: [Message] =
    (if !null(tydef) then 
      []
     else
      [err(id.location, "Matrix indexing requires \"matrix.h\" to be included.")]);

  top.abs:functiondefs = [];
  forwards to
    if null(localErrs) then
      fwdTree
    else
      -- Don't ask for subexpression errors if there's local problems.
      -- We'll assume we find Matrix as a type in the subexpr
      abs:warnStmt(localErrs);

  -- C: Matrix id; matrixAssign(id, e);
  local fwdTree :: abs:Stmt =
    abs:seqStmt(
      declareMat(id, id.location),
      matrixAssign(id, e, false)
    );
}

function declareMat
abs:Stmt ::= id::abs:Name  l::Location
{
  -- Matrix id;
  return abs:declStmt(
    abs:variableDecls(
      [],
      [],
      abs:typedefTypeExpr([], abs:name("Matrix", location=l)),
      abs:foldDeclarator([
        abs:declarator(
          id,
          abs:baseTypeExpr(),
          [],
          abs:nothingInitializer()
        )
      ])
    )
  );
}
function freeMat
abs:Stmt ::= id::abs:Name  l::Location
{
  -- matrix_free(&id);
  return abs:exprStmt(
    abs:directCallExpr(
      abs:name("matrix_free", location=l),
      abs:foldExpr([
        takeAddr(id)
      ]),
      location=l
    )
  );
}

nonterminal MatrixExpr with location, givenStorage, usedStorage, temporaries, actions, errors, abs:env;

-- Informs this matrixExpr whether or not there is a variable already created to store this matrix, and if so, what its name is
inherited attribute givenStorage :: Maybe<abs:Name>;
-- Informs the parent what variable this matrix value was stored in. If there was givenStorage, it must be the same!
synthesized attribute usedStorage :: abs:Name;
-- A list of temporary intermediate values. Need to pre-declare these, and post-clean up and deallocate them as well.
synthesized attribute temporaries :: [abs:Name];
-- Actions to take to compute all the values, in order.
synthesized attribute actions :: [abs:Stmt];

abstract production matrixRef
top::MatrixExpr ::= id::abs:Name
{
  top.errors := id.abs:valueLookupCheck;
  local tydef :: [abs:ValueItem] = abs:lookupValue("Matrix", top.abs:env);
  top.errors <-
    if abs:compatibleTypes(id.abs:valueItem.abs:typerep, head(tydef).abs:typerep, true) then
      []
    else
      [err(top.location, "'" ++ id.abs:name ++ "' does not have Matrix type (got " ++ abs:showType(id.abs:valueItem.abs:typerep) ++ ")")];

  top.usedStorage = fromMaybe(id, top.givenStorage);
  top.temporaries = [];
  top.actions = 
    if !top.givenStorage.isJust then [] else
      -- If we were given storage, then we have to copy this value. Otherwise, just use that!
      [abs:exprStmt(abs:directCallExpr(
        abs:name("matrix_copy", location=top.location),
        abs:foldExpr([
          takeAddr(top.usedStorage),
          takeAddr(id)
        ]),
        location=top.location
      ))];
  -- C: id
}
abstract production matrixCall
top::MatrixExpr ::= id::abs:Name  e::abs:Exprs
{
  -- We can get away with minimal error checking here, because the C errors raised
  -- by what we forward to are absolutely accurate.
  -- We just need to make sure it returns a Matrix.
  local tydef :: [abs:ValueItem] = abs:lookupValue("Matrix", top.abs:env);
  top.errors := 
    case id.abs:valueItem.abs:typerep of
    | abs:functionType(rt, _) ->
        if abs:compatibleTypes(rt, head(tydef).abs:typerep, true) then [] else
          [err(top.location, "Function in matrix expression does not return a matrix (got " ++ abs:showType(rt) ++ ")")]
    | _ -> [] -- whatever, the host language can figure this out
    end;
  
  top.usedStorage = fromMaybe(abs:name("__local_mat_" ++ toString(genInt()), location=top.location), top.givenStorage);
  top.temporaries = if top.givenStorage.isJust then [] else [top.usedStorage];
  top.actions =
    -- regular C assignment of the struct to where we store it here
    [abs:exprStmt(
      abs:binaryOpExpr(
        abs:declRefExpr(top.usedStorage, location=top.location),
        abs:assignOp(abs:eqOp(location=top.location), location=top.location),
        abs:directCallExpr(id, e, location=top.location),
        location=top.location)
    )];
  -- C: id(e)
}
abstract production matrixAdd
top::MatrixExpr ::= l::MatrixExpr  r::MatrixExpr
{
  top.errors := l.errors ++ r.errors;

  top.usedStorage = fromMaybe(abs:name("__local_mat_" ++ toString(genInt()), location=top.location), top.givenStorage);
  top.temporaries = if top.givenStorage.isJust then [] else [top.usedStorage];
  top.actions =
    [abs:exprStmt(
      abs:directCallExpr(
        abs:name("matrix_matrix_elementwise_add", location=top.location),
        abs:foldExpr([
          takeAddr(l.usedStorage),
          takeAddr(r.usedStorage),
          takeAddr(top.usedStorage)
        ]),
        location=top.location
      )
    )];
  -- C: matrix_matrix_elementwise_add(&l, &r, &result)
  l.givenStorage = nothing();
  r.givenStorage = nothing();
}
abstract production matrixMultiply
top::MatrixExpr ::= l::MatrixExpr  r::MatrixExpr
{
  top.errors := l.errors ++ r.errors;

  top.usedStorage = fromMaybe(abs:name("__local_mat_" ++ toString(genInt()), location=top.location), top.givenStorage);
  top.temporaries = if top.givenStorage.isJust then [] else [top.usedStorage];
  top.actions =
    [abs:exprStmt(
      abs:directCallExpr(
        abs:name("matrix_matrix_multiply", location=top.location),
        abs:foldExpr([
          takeAddr(l.usedStorage),
          takeAddr(r.usedStorage),
          takeAddr(top.usedStorage)
        ]),
        location=top.location
      )
    )];
  -- C: matrix_matrix_multiply(&l, &r, &result)
  l.givenStorage = nothing();
  r.givenStorage = nothing();
}
abstract production matrixElementwiseMultiply
top::MatrixExpr ::= l::MatrixExpr  r::MatrixExpr
{
  top.errors := l.errors ++ r.errors;

  top.usedStorage = fromMaybe(abs:name("__local_mat_" ++ toString(genInt()), location=top.location), top.givenStorage);
  top.temporaries = if top.givenStorage.isJust then [] else [top.usedStorage];
  top.actions =
    [abs:exprStmt(
      abs:directCallExpr(
        abs:name("matrix_matrix_elementwise_multiply", location=top.location),
        abs:foldExpr([
          takeAddr(l.usedStorage),
          takeAddr(r.usedStorage),
          takeAddr(top.usedStorage)
        ]),
        location=top.location
      )
    )];
  -- C: matrix_matrix_elementwise_multiply(&l, &r, &result)
  l.givenStorage = nothing();
  r.givenStorage = nothing();
}
abstract production matrixCExpr
top::MatrixExpr ::= e::abs:Expr
{
  local tydef :: [abs:ValueItem] = abs:lookupValue("Matrix", top.abs:env);
  top.errors :=
    if abs:compatibleTypes(e.abs:typerep, head(tydef).abs:typerep, true) then
      []
    else
      [err(top.location, "C subexpression does not have Matrix type (got " ++ abs:showType(e.abs:typerep) ++ ")")];

  top.usedStorage = fromMaybe(abs:name("__local_mat_" ++ toString(genInt()), location=top.location), top.givenStorage);
  top.temporaries = if top.givenStorage.isJust then [] else [top.usedStorage];
  top.actions =
    -- regular C assignment of the struct to where we store it here
    [abs:exprStmt(
      abs:binaryOpExpr(
        abs:declRefExpr(top.usedStorage, location=top.location),
        abs:assignOp(abs:eqOp(location=top.location), location=top.location),
        e,
        location=top.location)
    )];
  -- C: e
}
abstract production matrixComprehension
top::MatrixExpr ::= ids::[abs:Name]  e::abs:Exprs  v::abs:Expr
{
  -- We can get away with not checking 'v' type because the host language
  -- should check it just fine for us.
  top.errors := e.abs:argumentErrors;

  e.abs:expectedTypes =
    [abs:builtinType([], abs:signedType(abs:intType())),
     abs:builtinType([], abs:signedType(abs:intType()))];
  e.abs:argumentPosition = 1;
  e.abs:callExpr = v; -- TODO: FIXME: this isn't right
  e.abs:callVariadic = false;

  top.usedStorage = fromMaybe(abs:name("__local_mat_" ++ toString(genInt()), location=top.location), top.givenStorage);
  top.temporaries = if top.givenStorage.isJust then [] else [top.usedStorage];
  local fn :: abs:Name =
    abs:name("__local_mat_def_" ++ toString(genInt()), location=top.location);
  top.actions = [
    abs:declStmt(
      abs:functionDeclaration(
        abs:functionDecl(
          -- storage::[StorageClass]
          [],
          -- fnquals::[SpecialSpecifier]
          [],
          -- bty::BaseTypeExpr
          abs:directTypeExpr(abs:builtinType([], abs:realType(abs:doubleType()))),
          -- mty::TypeModifierExpr
          abs:functionTypeExprWithArgs(
            abs:baseTypeExpr(),
            abs:foldParameterDecl([
              abs:parameterDecl(
                [],
                abs:typedefTypeExpr([], abs:name("size_t", location=top.location)),
                abs:baseTypeExpr(),
                abs:justName(head(ids)),
                []
              ),
              abs:parameterDecl(
                [],
                abs:typedefTypeExpr([], abs:name("size_t", location=top.location)),
                abs:baseTypeExpr(),
                abs:justName(head(tail(ids))),
                []
              )
            ]),
            false
          ),
          -- name::Name
          fn,
          -- attrs::[Attribute]
          [],
          -- decls::Decls
          abs:foldDecl([]),
          -- body::Stmt
          abs:returnStmt(
            abs:justExpr(
              v
            )
          )
        )
      )
    ),
    abs:exprStmt(
      abs:directCallExpr(
        abs:name("matrix_define", location=top.location),
        abs:consExpr(
          abs:declRefExpr(fn, location=fn.location),
          abs:consExpr(
            takeAddr(top.usedStorage),
            e
          )
        ),
        location=top.location
      )
    )
  ];
  -- C: { double __local<genInt>(size_t ids0, size_t ids1) { return v; }; matrix_define(__local, &result, e0, e1); }
}

-- helpers
function takeAddr
abs:Expr ::= id::abs:Name
{
  return
    abs:unaryOpExpr(
      abs:addressOfOp(location=id.location),
      abs:declRefExpr(id, location=id.location),
      location=id.location
    );
}
