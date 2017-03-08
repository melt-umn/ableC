grammar edu:umn:cs:melt:ableC:abstractsyntax;

nonterminal Stmt with pp, host<Stmt>, lifted<Stmt>, errors, globalDecls, defs, env, functiondefs, returnType, freeVariables;

autocopy attribute returnType :: Maybe<Type>;

abstract production nullStmt
top::Stmt ::=
{
  propagate host, lifted;
  top.pp = notext();
  top.errors := [];
  top.globalDecls := [];
  top.defs := [];
  top.freeVariables = [];
  top.functiondefs := [];
}

abstract production seqStmt
top::Stmt ::= h::Stmt  t::Stmt
{
  propagate host, lifted;
  top.pp = concat([ h.pp, line(), t.pp ]);
  top.errors := h.errors ++ t.errors;
  top.globalDecls := h.globalDecls ++ t.globalDecls;
  top.defs := h.defs ++ t.defs;
  top.freeVariables =
    h.freeVariables ++
    removeDefsFromNames(h.defs, t.freeVariables);
  top.functiondefs := h.functiondefs ++ t.functiondefs;
  
  t.env = addEnv(h.defs, top.env);
}

abstract production compoundStmt
top::Stmt ::= s::Stmt
{
  propagate host, lifted;
  top.pp = braces(nestlines(2, s.pp));
  top.errors := s.errors;
  top.globalDecls := s.globalDecls;
  top.defs := []; -- compound prevents declarations from bubbling up
  top.freeVariables = s.freeVariables;
  top.functiondefs := s.functiondefs;

  s.env = openScope(top.env);
}

-- ditto warnExternalDecl, if warning or empty, then this pretends it doesn't exist.
-- TODO: why is this called warnStmt not errorStmt?
abstract production warnStmt
top::Stmt ::= msg::[Message]
{
  propagate host, lifted;
  top.pp = text("/*err*/");
  top.errors := msg;
  top.globalDecls := [];
  top.defs := [];
  top.freeVariables = [];
  top.functiondefs := [];
}

abstract production declStmt
top::Stmt ::= d::Decl
{
  propagate host, lifted;
  top.pp = cat( d.pp, semi() );
  top.errors := d.errors;
  top.globalDecls := d.globalDecls;
  top.defs := d.defs;
  top.freeVariables = d.freeVariables;
  top.functiondefs := [];
  d.isTopLevel = false;
}

-- Most common use case, makes things easier for extensions
-- TODO: Remove this, duplicate of DeclHelpers.sv
abstract production basicVarDeclStmt
top::Stmt ::= t::Type n::Name init::Expr
{
  forwards to
    declStmt(
      variableDecls(
        [], [],
        directTypeExpr(t),
        consDeclarator(
          declarator(
            n,
            baseTypeExpr(),
            [],
            justInitializer(exprInitializer(init))),
          nilDeclarator())));
        
}

abstract production exprStmt
top::Stmt ::= d::Expr
{
  propagate host, lifted;
  top.pp = cat( d.pp, semi() );
  top.errors := d.errors;
  top.globalDecls := d.globalDecls;
  top.defs := d.defs;
  top.freeVariables = d.freeVariables;
  top.functiondefs := [];
}

abstract production ifStmt
top::Stmt ::= c::Expr  t::Stmt  e::Stmt
{
  propagate host, lifted;
  top.pp = concat([
    text("if"), space(), parens(c.pp), line(),
    braces(nestlines(2, t.pp)),
    text(" else "), braces(nestlines(2, e.pp))]);
  top.errors := c.errors ++ t.errors ++ e.errors;
  top.globalDecls := c.globalDecls ++ t.globalDecls ++ e.globalDecls;
  top.functiondefs := t.functiondefs ++ e.functiondefs;
  
  -- A selection statement is a block whose scope is a strict subset of the scope of its
  -- enclosing block. Each associated substatement is also a block whose scope is a strict
  -- subset of the scope of the selection statement.
  top.defs := [];
  top.freeVariables =
    c.freeVariables ++
    removeDefsFromNames(c.defs, t.freeVariables) ++
    removeDefsFromNames(c.defs, e.freeVariables);
  
  c.env = openScope(top.env);
  local newEnv :: Decorated Env = addEnv(c.defs, c.env);
  t.env = newEnv;
  e.env = newEnv;
  
  top.errors <-
    if c.typerep.defaultFunctionArrayLvalueConversion.isScalarType then []
    else [err(c.location, "If condition must be scalar type, instead it is " ++ showType(c.typerep))];
}

abstract production ifStmtNoElse
top::Stmt ::= c::Expr  t::Stmt
{
  top.pp = concat([
    text("if"), space(), parens(c.pp), line(),
    braces(nestlines(2, t.pp)) ]);
  forwards to ifStmt(c, t, nullStmt());
}

abstract production whileStmt
top::Stmt ::= e::Expr  b::Stmt
{
  propagate host, lifted;
  top.pp = concat([ text("while"), space(), parens(e.pp), line(), 
                    braces(nestlines(2, b.pp)) ]);
  top.errors := e.errors ++ b.errors;
  top.globalDecls := e.globalDecls ++ b.globalDecls;
  top.functiondefs := b.functiondefs;
  
  -- An iteration statement is a block whose scope is a strict subset of the scope of its
  -- enclosing block. The loop body is also a block whose scope is a strict subset of the scope
  -- of the iteration statement.
  top.defs := [];
  top.freeVariables =
    e.freeVariables ++
    removeDefsFromNames(e.defs, b.freeVariables);
  
  e.env = openScope(top.env);
  b.env = addEnv(e.defs, e.env);

  top.errors <-
    if e.typerep.defaultFunctionArrayLvalueConversion.isScalarType then []
    else [err(e.location, "While condition must be scalar type, instead it is " ++ showType(e.typerep))];
}

abstract production doStmt
top::Stmt ::= b::Stmt  e::Expr
{
  propagate host, lifted;
  top.pp = concat([ text("do"),  line(), 
                    braces(nestlines(2,b.pp)), line(), 
                    text("while"), space(), parens(e.pp), semi()]);
  top.errors := b.errors ++ e.errors;
  top.globalDecls := b.globalDecls ++ e.globalDecls;
  top.functiondefs := b.functiondefs;
  
  -- An iteration statement is a block whose scope is a strict subset of the scope of its
  -- enclosing block. The loop body is also a block whose scope is a strict subset of the scope
  -- of the iteration statement.
  top.defs := [];
  top.freeVariables =
    b.freeVariables ++
    removeDefsFromNames(b.defs, e.freeVariables);
  
  b.env = openScope(top.env);
  e.env = b.env;

  top.errors <-
    if e.typerep.defaultFunctionArrayLvalueConversion.isScalarType then []
    else [err(e.location, "Do-while condition must be scalar type, instead it is " ++ showType(e.typerep))];
}

abstract production forStmt
top::Stmt ::= i::MaybeExpr  c::MaybeExpr  s::MaybeExpr  b::Stmt
{
  propagate host, lifted;
  top.pp = 
    concat([text("for"), parens(concat([i.pp, semi(), space(), c.pp, semi(), space(), s.pp])), line(),
      braces(nestlines(2, b.pp)) ]);
  top.errors := i.errors ++ c.errors ++ s.errors ++ b.errors;
  top.globalDecls := i.globalDecls ++ c.globalDecls ++ s.globalDecls ++ b.globalDecls;
  top.functiondefs := b.functiondefs;
  
  -- An iteration statement is a block whose scope is a strict subset of the scope of its
  -- enclosing block. The loop body is also a block whose scope is a strict subset of the scope
  -- of the iteration statement.
  top.defs := [];
  top.freeVariables =
    i.freeVariables ++
    removeDefsFromNames(i.defs, c.freeVariables) ++
    removeDefsFromNames(i.defs ++ c.defs, s.freeVariables) ++
    removeDefsFromNames(i.defs ++ c.defs ++ s.defs, b.freeVariables);
  
  i.env = openScope(top.env);
  c.env = addEnv(i.defs, i.env);
  s.env = addEnv(c.defs, c.env);
  b.env = addEnv(s.defs, s.env);

  local cty :: Type = fromMaybe(errorType(), c.maybeTyperep);
  top.errors <-
    if cty.defaultFunctionArrayLvalueConversion.isScalarType then []
    else [err(loc("TODOfor1",-1,-1,-1,-1,-1,-1), "For condition must be scalar type, instead it is " ++ showType(cty))]; -- TODO: location
}

abstract production forDeclStmt
top::Stmt ::= i::Decl  c::MaybeExpr  s::MaybeExpr  b::Stmt
{
  propagate host, lifted;
  top.pp = concat([ text("for"), space(), parens( concat([ i.pp, space(), c.pp, semi(), space(), s.pp]) ), 
                    line(), braces(nestlines(2, b.pp)) ]);
  top.errors := i.errors ++ c.errors ++ s.errors ++ b.errors;
  top.globalDecls := i.globalDecls ++ c.globalDecls ++ s.globalDecls ++ b.globalDecls;
  top.functiondefs := b.functiondefs;
  
  -- An iteration statement is a block whose scope is a strict subset of the scope of its
  -- enclosing block. The loop body is also a block whose scope is a strict subset of the scope
  -- of the iteration statement.
  top.defs := [];
  top.freeVariables =
    i.freeVariables ++
    removeDefsFromNames(i.defs, c.freeVariables) ++
    removeDefsFromNames(i.defs ++ c.defs, s.freeVariables) ++
    removeDefsFromNames(i.defs ++ c.defs ++ s.defs, b.freeVariables);
  
  i.env = openScope(top.env);
  c.env = addEnv(i.defs, i.env);
  s.env = addEnv(c.defs, c.env);
  b.env = addEnv(s.defs, s.env);
  i.isTopLevel = false;

  local cty :: Type = fromMaybe(errorType(), c.maybeTyperep);
  top.errors <-
    if cty.defaultFunctionArrayLvalueConversion.isScalarType then []
    else [err(loc("TODOfor2",-1,-1,-1,-1,-1,-1), "For condition must be scalar type, instead it is " ++ showType(cty))]; -- TODO: location
}

abstract production returnStmt
top::Stmt ::= e::MaybeExpr
{
  propagate host, lifted;
  top.pp = concat([text("return"), space(), e.pp, semi()]);
  top.errors := case top.returnType, e.maybeTyperep of
                  nothing(), nothing() -> []
                | just(builtinType(_, voidType())), nothing() -> []
                | just(expected), just(actual) ->
                    if typeAssignableTo(expected, actual) then []
                    else [err(case e of justExpr(e1) -> e1.location end,
                              "Incorrect return type, expected " ++ showType(expected) ++ " but found " ++ showType(actual))]
                | nothing(), just(actual) -> [err(case e of justExpr(e1) -> e1.location end, "Unexpected return")]
                | just(expected), nothing() -> [err(loc("TODOreturn",-1,-1,-1,-1,-1,-1), "Expected return value, but found valueless return")] -- TODO: location
                end ++ e.errors;
  top.globalDecls := e.globalDecls;
  top.defs := e.defs;
  top.freeVariables = e.freeVariables;
  top.functiondefs := [];
  -- TODO: this needs to follow the same rules as assignment. We should try to factor that out.
}

abstract production switchStmt
top::Stmt ::= e::Expr  b::Stmt
{
  propagate host, lifted;
  top.pp = concat([ text("switch"), space(), parens(e.pp),  line(), 
                    braces(nestlines(2, b.pp)) ]);
  top.errors := e.errors ++ b.errors;
  top.globalDecls := e.globalDecls ++ b.globalDecls;
  top.functiondefs := b.functiondefs;
  
  -- A selection statement is a block whose scope is a strict subset of the scope of its
  -- enclosing block. Each associated substatement is also a block whose scope is a strict
  -- subset of the scope of the selection statement.
  top.defs := [];
  top.freeVariables =
    e.freeVariables ++
    removeDefsFromNames(e.defs, b.freeVariables);
  
  e.env = openScope(top.env);
  b.env = addEnv(e.defs, e.env);

  top.errors <-
    if e.typerep.defaultFunctionArrayLvalueConversion.isIntegerType then []
    else [err(e.location, "Switch expression must have integer type, instead it is " ++ showType(e.typerep))];
}

abstract production gotoStmt
top::Stmt ::= l::Name
{
  propagate host, lifted;
  top.pp = concat([ text("goto"), space(), l.pp, semi() ]);
  top.errors := [];
  top.globalDecls := [];
  top.defs := [];
  top.freeVariables = [];
  top.functiondefs := [];
  
  top.errors <- l.labelLookupCheck;
}

abstract production continueStmt
top::Stmt ::=
{
  propagate host, lifted;
  top.pp = cat( text("continue"), semi() );
  top.errors := [];
  top.globalDecls := [];
  top.defs := [];
  top.freeVariables = [];
  top.functiondefs := [];
}

abstract production breakStmt
top::Stmt ::=
{
  propagate host, lifted;
  top.pp = concat([ text("break"), semi()  ]);
  top.errors := [];
  top.globalDecls := [];
  top.defs := [];
  top.freeVariables = [];
  top.functiondefs := [];
}

abstract production labelStmt
top::Stmt ::= l::Name  s::Stmt
{
  propagate host, lifted;
  top.pp = concat([ l.pp, text(":"), space(), s.pp]);
  top.errors := s.errors;
  top.globalDecls := s.globalDecls;
  top.defs := s.defs;
  top.freeVariables = s.freeVariables;
  top.functiondefs := [labelDef(l.name, labelItem(top))] ++ s.functiondefs;
  
  top.errors <- l.labelRedeclarationCheck;
}

abstract production caseLabelStmt
top::Stmt ::= v::Expr  s::Stmt
{
  propagate host, lifted;
  top.pp = concat([text("case"), space(), v.pp, text(":"), nestlines(2,s.pp)]); 
  top.errors := v.errors ++ s.errors;
  top.globalDecls := v.globalDecls ++ s.globalDecls;
  top.defs := v.defs ++ s.defs;
  top.freeVariables =
    v.freeVariables ++
    removeDefsFromNames(v.defs, s.freeVariables);
  top.functiondefs := s.functiondefs; -- ??
  
  s.env = addEnv(v.defs, v.env);
}

abstract production defaultLabelStmt
top::Stmt ::= s::Stmt
{
  propagate host, lifted;
  top.pp = concat([ text("default"), text(":"), nestlines(2,s.pp)]);
  top.errors := s.errors;
  top.globalDecls := s.globalDecls;
  top.defs := s.defs;
  top.freeVariables = s.freeVariables;
  top.functiondefs := s.functiondefs; -- ??
}

-- GCC extension:
abstract production functionDeclStmt
top::Stmt ::= d::FunctionDecl
{
  propagate host, lifted;
  top.pp = d.pp;
  top.errors := d.errors;
  top.globalDecls := d.globalDecls;
  top.defs := d.defs;
  top.freeVariables = d.freeVariables;
  top.functiondefs := [];
}

-- GCC extension:
abstract production caseLabelRangeStmt
top::Stmt ::= l::Expr  u::Expr  s::Stmt
{
  propagate host, lifted;
  top.pp = concat([text("case"), space(), l.pp, text("..."), u.pp, text(":"), space(),s.pp]); 
  top.errors := l.errors ++ u.errors ++ s.errors;
  top.globalDecls := l.globalDecls ++ u.globalDecls ++ s.globalDecls;
  top.defs := l.defs ++ u.defs ++ s.defs;
  top.freeVariables = l.freeVariables ++ u.freeVariables ++ s.freeVariables;
  top.functiondefs := s.functiondefs;
}

abstract production asmStmt
top::Stmt ::= asm::AsmStatement
{
  propagate host, lifted;
  top.pp = asm.pp;
  top.errors := [];
  top.globalDecls := [];
  top.defs := [];
  top.freeVariables = asm.freeVariables;
  top.functiondefs := [];
}


-- Temporary hack to affect flowtypes generated by the host language.
-- Silver needs declarations to do this directly instead.
--{-
abstract production hackUnusedStmt
top::Stmt ::=
{
  -- Not allowed to need env.
  top.functiondefs := [];
  -- pp doesn't depend on env
  top.pp = text("hack");
  
  -- Forwarding based on env.
  forwards to if false then error(hackUnparse(top.env) ++ hackUnparse(top.returnType)) else hackUnusedStmt();
}---}
{-
abstract production blockCommentStmt
top::Stmt ::= c::Document
{
  top.pp = concat([ text("/* "), c, text(" */") ]);
  top.errors := [];
  top.defs := [];
  top.functiondefs := [];
}-}



{- from clang:

abstract production
top::Stmt ::=
{
}

def NullStmt : Stmt;
def CompoundStmt : Stmt;
def LabelStmt : Stmt;
def IfStmt : Stmt;
def SwitchStmt : Stmt;
def WhileStmt : Stmt;
def DoStmt : Stmt;
def ForStmt : Stmt;
def GotoStmt : Stmt;
def IndirectGotoStmt : Stmt;
def ContinueStmt : Stmt;
def BreakStmt : Stmt;
def ReturnStmt : Stmt;
def DeclStmt  : Stmt;
def SwitchCase : Stmt<1>;
def CaseStmt : DStmt<SwitchCase>;
def DefaultStmt : DStmt<SwitchCase>;


def AttributedStmt : Stmt;  -- no worries yet, gcc ext
def CapturedStmt : Stmt;  -- no worries yet, this is something different (e.g. omp parts)

// Asm statements
def AsmStmt : Stmt<1>;
def GCCAsmStmt : DStmt<AsmStmt>;
def MSAsmStmt : DStmt<AsmStmt>;

-}

