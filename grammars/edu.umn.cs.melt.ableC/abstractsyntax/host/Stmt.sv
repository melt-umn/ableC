grammar edu:umn:cs:melt:ableC:abstractsyntax:host;

nonterminal Stmt with pp, host<Stmt>, errors, globalDecls, functionDecls, defs, env, functionDefs, returnType, freeVariables;
flowtype Stmt = decorate {env, returnType};

autocopy attribute returnType :: Maybe<Type>;

abstract production nullStmt
top::Stmt ::=
{
  propagate host;
  top.pp = semi();
  top.errors := [];
  top.globalDecls := [];
  top.functionDecls := [];
  top.defs := [];
  top.freeVariables := [];
  top.functionDefs := [];
}

abstract production seqStmt
top::Stmt ::= h::Stmt  t::Stmt
{
  propagate host;
  top.pp = ppConcat([ h.pp, line(), t.pp ]);
  top.errors := h.errors ++ t.errors;
  top.globalDecls := h.globalDecls ++ t.globalDecls;
  top.functionDecls := h.functionDecls ++ t.functionDecls;
  top.defs := h.defs ++ t.defs;
  top.freeVariables :=
    h.freeVariables ++
    removeDefsFromNames(h.defs, t.freeVariables);
  top.functionDefs := h.functionDefs ++ t.functionDefs;
  
  t.env = addEnv(h.defs, top.env);
}

abstract production compoundStmt
top::Stmt ::= s::Stmt
{
  propagate host;
  top.pp = braces(nestlines(2, s.pp));
  top.errors := s.errors;
  top.globalDecls := s.globalDecls;
  top.functionDecls := s.functionDecls;
  top.defs := globalDeclsDefs(s.globalDecls) ++ functionDeclsDefs(s.functionDecls); -- compound prevents defs from bubbling up
  top.freeVariables := s.freeVariables;
  top.functionDefs := s.functionDefs;

  s.env = openScopeEnv(top.env);
}

-- ditto warnExternalDecl, if warning or empty, then this pretends it doesn't exist.
-- TODO: why is this called warnStmt not errorStmt?
abstract production warnStmt
top::Stmt ::= msg::[Message]
{
  propagate host;
  top.pp = text("/*err*/");
  top.errors := msg;
  top.globalDecls := [];
  top.functionDecls := [];
  top.defs := [];
  top.freeVariables := [];
  top.functionDefs := [];
}

{--
 - The purpose of this production is for an extension production to use to wrap
 - children that have already been decorated during error checking, etc. when
 - computing a forward tree, to avoid re-decoration and potential exponential
 - performance hits.  When using this production, one must be very careful to
 - ensure that the inherited attributes recieved by the wrapped tree are equivalent
 - to the ones that would have been passed down in the forward tree.
 - See https://github.com/melt-umn/silver/issues/86
 -}
abstract production decStmt
top::Stmt ::= s::Decorated Stmt
{
  top.pp = s.pp;
  top.host = s.host;
  top.errors := s.errors;
  top.globalDecls := s.globalDecls;
  top.functionDecls := s.functionDecls;
  top.defs := s.defs;
  top.freeVariables := s.freeVariables;
  top.functionDefs := s.functionDefs;
  forwards to new(s); -- for easier pattern matching
}

abstract production declStmt
top::Stmt ::= d::Decl
{
  propagate host;
  top.pp = d.pp;
  top.errors := d.errors;
  top.globalDecls := d.globalDecls;
  top.functionDecls := d.functionDecls;
  top.defs := d.defs;
  top.freeVariables := d.freeVariables;
  top.functionDefs := [];
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
        nilStorageClass(), nilAttribute(),
        directTypeExpr(t),
        consDeclarator(
          declarator(
            n,
            baseTypeExpr(),
            nilAttribute(),
            justInitializer(exprInitializer(init))),
          nilDeclarator())));
        
}

abstract production exprStmt
top::Stmt ::= d::Expr
{
  propagate host;
  top.pp = cat( d.pp, semi() );
  top.errors := d.errors;
  top.globalDecls := d.globalDecls;
  top.functionDecls := d.functionDecls;
  top.defs := d.defs;
  top.freeVariables := d.freeVariables;
  top.functionDefs := [];
}

abstract production ifStmt
top::Stmt ::= c::Expr  t::Stmt  e::Stmt
{
  propagate host;
  top.pp = ppConcat([
    text("if"), space(), parens(c.pp), line(),
    braces(nestlines(2, t.pp)),
    text(" else "), braces(nestlines(2, e.pp))]);
  top.errors := c.errors ++ t.errors ++ e.errors;
  top.globalDecls := c.globalDecls ++ t.globalDecls ++ e.globalDecls;
  top.functionDecls := c.functionDecls ++ t.functionDecls ++ e.functionDecls;
  top.functionDefs := t.functionDefs ++ e.functionDefs;
  
  -- A selection statement is a block whose scope is a strict subset of the scope of its
  -- enclosing block. Each associated substatement is also a block whose scope is a strict
  -- subset of the scope of the selection statement.
  top.defs := globalDeclsDefs(c.globalDecls) ++ globalDeclsDefs(t.globalDecls) ++ globalDeclsDefs(e.globalDecls)
           ++ functionDeclsDefs(c.functionDecls) ++ functionDeclsDefs(t.functionDecls) ++ functionDeclsDefs(e.functionDecls);
  top.freeVariables :=
    c.freeVariables ++
    removeDefsFromNames(c.defs, t.freeVariables) ++
    removeDefsFromNames(c.defs, e.freeVariables);
  
  c.env = openScopeEnv(top.env);
  t.env = addEnv(c.defs, c.env);
  e.env = addEnv(globalDeclsDefs(t.globalDecls) ++ functionDeclsDefs(t.functionDecls), t.env);
  
  top.errors <-
    if c.typerep.defaultFunctionArrayLvalueConversion.isScalarType then []
    else [err(c.location, "If condition must be scalar type, instead it is " ++ showType(c.typerep))];
}

abstract production ifStmtNoElse
top::Stmt ::= c::Expr  t::Stmt
{
  top.pp = ppConcat([
    text("if"), space(), parens(c.pp), line(),
    braces(nestlines(2, t.pp)) ]);
  forwards to ifStmt(c, t, nullStmt());
}

abstract production whileStmt
top::Stmt ::= e::Expr  b::Stmt
{
  propagate host;
  top.pp = ppConcat([ text("while"), space(), parens(e.pp), line(), 
                    braces(nestlines(2, b.pp)) ]);
  top.errors := e.errors ++ b.errors;
  top.globalDecls := e.globalDecls ++ b.globalDecls;
  top.functionDecls := e.functionDecls ++ b.functionDecls;
  top.functionDefs := b.functionDefs;
  
  -- An iteration statement is a block whose scope is a strict subset of the scope of its
  -- enclosing block. The loop body is also a block whose scope is a strict subset of the scope
  -- of the iteration statement.
  top.defs := globalDeclsDefs(e.globalDecls) ++ globalDeclsDefs(b.globalDecls) ++ functionDeclsDefs(e.functionDecls) ++ functionDeclsDefs(b.functionDecls);
  top.freeVariables :=
    e.freeVariables ++
    removeDefsFromNames(e.defs, b.freeVariables);
  
  e.env = openScopeEnv(top.env);
  b.env = addEnv(e.defs, e.env);

  top.errors <-
    if e.typerep.defaultFunctionArrayLvalueConversion.isScalarType then []
    else [err(e.location, "While condition must be scalar type, instead it is " ++ showType(e.typerep))];
}

abstract production doStmt
top::Stmt ::= b::Stmt  e::Expr
{
  propagate host;
  top.pp = ppConcat([ text("do"),  line(), 
                    braces(nestlines(2,b.pp)), line(), 
                    text("while"), space(), parens(e.pp), semi()]);
  top.errors := b.errors ++ e.errors;
  top.globalDecls := b.globalDecls ++ e.globalDecls;
  top.functionDecls := b.functionDecls ++ e.functionDecls;
  top.functionDefs := b.functionDefs;
  
  -- An iteration statement is a block whose scope is a strict subset of the scope of its
  -- enclosing block. The loop body is also a block whose scope is a strict subset of the scope
  -- of the iteration statement.
  top.defs := globalDeclsDefs(b.globalDecls) ++ globalDeclsDefs(e.globalDecls) ++ functionDeclsDefs(b.functionDecls) ++ functionDeclsDefs(e.functionDecls);
  top.freeVariables :=
    b.freeVariables ++
    removeDefsFromNames(b.defs, e.freeVariables);
  
  b.env = openScopeEnv(top.env);
  e.env = addEnv(globalDeclsDefs(b.globalDecls) ++ functionDeclsDefs(b.functionDecls), b.env);

  top.errors <-
    if e.typerep.defaultFunctionArrayLvalueConversion.isScalarType then []
    else [err(e.location, "Do-while condition must be scalar type, instead it is " ++ showType(e.typerep))];
}

abstract production forStmt
top::Stmt ::= i::MaybeExpr  c::MaybeExpr  s::MaybeExpr  b::Stmt
{
  propagate host;
  top.pp = 
    ppConcat([text("for"), parens(ppConcat([i.pp, semi(), space(), c.pp, semi(), space(), s.pp])), line(),
      braces(nestlines(2, b.pp)) ]);
  top.errors := i.errors ++ c.errors ++ s.errors ++ b.errors;
  top.globalDecls := i.globalDecls ++ c.globalDecls ++ s.globalDecls ++ b.globalDecls;
  top.functionDecls := i.functionDecls ++ c.functionDecls ++ s.functionDecls ++ b.functionDecls;
  top.functionDefs := b.functionDefs;
  
  -- An iteration statement is a block whose scope is a strict subset of the scope of its
  -- enclosing block. The loop body is also a block whose scope is a strict subset of the scope
  -- of the iteration statement.
  top.defs :=
    globalDeclsDefs(i.globalDecls) ++
    globalDeclsDefs(c.globalDecls) ++
    globalDeclsDefs(s.globalDecls) ++
    globalDeclsDefs(b.globalDecls) ++
    functionDeclsDefs(i.functionDecls) ++
    functionDeclsDefs(c.functionDecls) ++
    functionDeclsDefs(s.functionDecls) ++
    functionDeclsDefs(b.functionDecls);
  top.freeVariables :=
    i.freeVariables ++
    removeDefsFromNames(i.defs, c.freeVariables) ++
    removeDefsFromNames(i.defs ++ c.defs, s.freeVariables) ++
    removeDefsFromNames(i.defs ++ c.defs ++ s.defs, b.freeVariables);
  
  i.env = openScopeEnv(top.env);
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
  propagate host;
  top.pp = ppConcat([ text("for"), space(), parens( ppConcat([ i.pp, space(), c.pp, semi(), space(), s.pp]) ), 
                    line(), braces(nestlines(2, b.pp)) ]);
  top.errors := i.errors ++ c.errors ++ s.errors ++ b.errors;
  top.globalDecls := i.globalDecls ++ c.globalDecls ++ s.globalDecls ++ b.globalDecls;
  top.functionDecls := i.functionDecls ++ c.functionDecls ++ s.functionDecls ++ b.functionDecls;
  top.functionDefs := b.functionDefs;
  
  -- An iteration statement is a block whose scope is a strict subset of the scope of its
  -- enclosing block. The loop body is also a block whose scope is a strict subset of the scope
  -- of the iteration statement.
  top.defs :=
    globalDeclsDefs(i.globalDecls) ++
    globalDeclsDefs(c.globalDecls) ++
    globalDeclsDefs(s.globalDecls) ++
    globalDeclsDefs(b.globalDecls) ++
    functionDeclsDefs(i.functionDecls) ++
    functionDeclsDefs(c.functionDecls) ++
    functionDeclsDefs(s.functionDecls) ++
    functionDeclsDefs(b.functionDecls);
  top.freeVariables :=
    i.freeVariables ++
    removeDefsFromNames(i.defs, c.freeVariables) ++
    removeDefsFromNames(i.defs ++ c.defs, s.freeVariables) ++
    removeDefsFromNames(i.defs ++ c.defs ++ s.defs, b.freeVariables);
  
  i.env = openScopeEnv(top.env);
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
top::Stmt ::= e::MaybeExpr {- loc::Location -} -- TODO: Add location to signature
{
  propagate host;
  top.pp = ppConcat([text("return"), space(), e.pp, semi()]);
  top.errors := case top.returnType, e.maybeTyperep of
                  nothing(), nothing() -> []
                | just(builtinType(_, voidType())), nothing() -> []
                | just(expected), just(actual) ->
                    if typeAssignableTo(expected, actual) then []
                    else [err(case e of justExpr(e1) -> e1.location end,
                              "Incorrect return type, expected " ++ showType(expected) ++ " but found " ++ showType(actual))]
                | nothing(), just(actual) -> [err(case e of justExpr(e1) -> e1.location end, "Unexpected return")]
                | just(expected), nothing() -> [err({-loc-} loc("TODOreturn",-1,-1,-1,-1,-1,-1), "Expected return value, but found valueless return")] -- TODO: location
                end ++ e.errors;
  top.globalDecls := e.globalDecls;
  top.functionDecls := e.functionDecls;
  top.defs := e.defs;
  top.freeVariables := e.freeVariables;
  top.functionDefs := [];
  -- TODO: this needs to follow the same rules as assignment. We should try to factor that out.
}

abstract production switchStmt
top::Stmt ::= e::Expr  b::Stmt
{
  propagate host;
  top.pp = ppConcat([ text("switch"), space(), parens(e.pp),  line(), 
                    braces(nestlines(2, b.pp)) ]);
  top.errors := e.errors ++ b.errors;
  top.globalDecls := e.globalDecls ++ b.globalDecls;
  top.functionDecls := e.functionDecls ++ b.functionDecls;
  top.functionDefs := b.functionDefs;
  
  -- A selection statement is a block whose scope is a strict subset of the scope of its
  -- enclosing block. Each associated substatement is also a block whose scope is a strict
  -- subset of the scope of the selection statement.
  top.defs := globalDeclsDefs(e.globalDecls) ++ globalDeclsDefs(b.globalDecls) ++ functionDeclsDefs(e.functionDecls) ++ functionDeclsDefs(b.functionDecls);
  top.freeVariables :=
    e.freeVariables ++
    removeDefsFromNames(e.defs, b.freeVariables);
  
  e.env = openScopeEnv(top.env);
  b.env = addEnv(e.defs, e.env);

  top.errors <-
    if e.typerep.defaultFunctionArrayLvalueConversion.isIntegerType then []
    else [err(e.location, "Switch expression must have integer type, instead it is " ++ showType(e.typerep))];
}

abstract production gotoStmt
top::Stmt ::= l::Name
{
  propagate host;
  top.pp = ppConcat([ text("goto"), space(), l.pp, semi() ]);
  top.errors := [];
  top.globalDecls := [];
  top.functionDecls := [];
  top.defs := [];
  top.freeVariables := [];
  top.functionDefs := [];
  
  top.errors <- l.labelLookupCheck;
}

abstract production continueStmt
top::Stmt ::=
{
  propagate host;
  top.pp = cat( text("continue"), semi() );
  top.errors := [];
  top.globalDecls := [];
  top.functionDecls := [];
  top.defs := [];
  top.freeVariables := [];
  top.functionDefs := [];
}

abstract production breakStmt
top::Stmt ::=
{
  propagate host;
  top.pp = ppConcat([ text("break"), semi()  ]);
  top.errors := [];
  top.globalDecls := [];
  top.functionDecls := [];
  top.defs := [];
  top.freeVariables := [];
  top.functionDefs := [];
}

abstract production labelStmt
top::Stmt ::= l::Name  s::Stmt
{
  propagate host;
  top.pp = ppConcat([ l.pp, text(":"), space(), s.pp]);
  top.errors := s.errors;
  top.globalDecls := s.globalDecls;
  top.functionDecls := s.functionDecls;
  top.defs := s.defs;
  top.freeVariables := s.freeVariables;
  top.functionDefs := s.functionDefs;
  
  top.errors <- l.labelRedeclarationCheck;
  top.functionDefs <- [labelDef(l.name, labelItem(l.location))];
}

abstract production caseLabelStmt
top::Stmt ::= v::Expr  s::Stmt
{
  propagate host;
  top.pp = ppConcat([text("case"), space(), v.pp, text(":"), nestlines(2,s.pp)]); 
  top.errors := v.errors ++ s.errors;
  top.globalDecls := v.globalDecls ++ s.globalDecls;
  top.functionDecls := v.functionDecls ++ s.functionDecls;
  top.defs := v.defs ++ s.defs;
  top.freeVariables :=
    v.freeVariables ++
    removeDefsFromNames(v.defs, s.freeVariables);
  top.functionDefs := s.functionDefs; -- ??
  
  s.env = addEnv(v.defs, v.env);
}

abstract production defaultLabelStmt
top::Stmt ::= s::Stmt
{
  propagate host;
  top.pp = ppConcat([ text("default"), text(":"), nestlines(2,s.pp)]);
  top.errors := s.errors;
  top.globalDecls := s.globalDecls;
  top.functionDecls := s.functionDecls;
  top.defs := s.defs;
  top.freeVariables := s.freeVariables;
  top.functionDefs := s.functionDefs; -- ??
}

-- GCC extension:
abstract production functionDeclStmt
top::Stmt ::= d::FunctionDecl
{
  top.host = declStmt(d.host);
  top.pp = d.pp;
  top.errors := d.errors;
  top.globalDecls := d.globalDecls;
  top.functionDecls := [];
  top.defs := d.defs;
  top.freeVariables := d.freeVariables;
  top.functionDefs := [];
}

-- GCC extension:
abstract production caseLabelRangeStmt
top::Stmt ::= l::Expr  u::Expr  s::Stmt
{
  propagate host;
  top.pp = ppConcat([text("case"), space(), l.pp, text("..."), u.pp, text(":"), space(),s.pp]); 
  top.errors := l.errors ++ u.errors ++ s.errors;
  top.globalDecls := l.globalDecls ++ u.globalDecls ++ s.globalDecls;
  top.functionDecls := l.functionDecls ++ u.functionDecls ++ s.functionDecls;
  top.defs := l.defs ++ u.defs ++ s.defs;
  top.freeVariables := l.freeVariables ++ u.freeVariables ++ s.freeVariables;
  top.functionDefs := s.functionDefs;
}

abstract production asmStmt
top::Stmt ::= asm::AsmStatement
{
  propagate host;
  top.pp = asm.pp;
  top.errors := [];
  top.globalDecls := [];
  top.functionDecls := [];
  top.defs := [];
  top.freeVariables := asm.freeVariables;
  top.functionDefs := [];
}

{-
abstract production blockCommentStmt
top::Stmt ::= c::Document
{
  top.pp = ppConcat([ text("/* "), c, text(" */") ]);
  top.errors := [];
  top.defs := [];
  top.functionDefs := [];
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

