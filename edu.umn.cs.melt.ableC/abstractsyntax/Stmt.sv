
nonterminal Stmt with pp, errors, defs, env, functiondefs;

autocopy attribute returnType :: Type;

abstract production nullStmt
top::Stmt ::=
{
  top.pp = notext();
  top.errors := [];
  top.defs = [];
  top.functiondefs = [];
}

abstract production seqStmt
top::Stmt ::= h::Stmt  t::Stmt
{
  top.pp = concat([ h.pp, line(), t.pp ]);
  top.errors := h.errors ++ t.errors;
  top.defs = h.defs ++ t.defs;
  top.functiondefs = h.functiondefs ++ t.functiondefs;
  
  t.env = addEnv(h.defs, top.env);
}

abstract production compoundStmt
top::Stmt ::= s::Stmt
{
  top.pp = braces(nestlines(2, s.pp));
  top.errors := s.errors;
  top.defs = []; -- compound prevents declarations from bubbling up
  top.functiondefs = s.functiondefs;

  s.env = openScope(top.env);
}

-- ditto warnExternalDecl, if warning or empty, then this pretends it doesn't exist.
abstract production warnStmt
top::Stmt ::= msg::[Message]
{
  top.pp = text("/*err*/");
  top.errors := msg;
  top.defs = [];
  top.functiondefs = [];
}

abstract production blockCommentStmt
top::Stmt ::= c::Document
{
  top.pp = concat([ text("/* "), c, text(" */") ]);
  top.errors := [];
  top.defs = [];
  top.functiondefs = [];
}

abstract production declStmt
top::Stmt ::= d::Decl
{
  top.pp = cat( d.pp, semi() );
  top.errors := d.errors;
  top.defs = d.defs;
  top.functiondefs = [];
  d.isTopLevel = false;
}

abstract production exprStmt
top::Stmt ::= d::Expr
{
  top.pp = cat( d.pp, semi() );
  top.errors := d.errors;
  top.defs = d.defs;
  top.functiondefs = [];
}

abstract production ifStmt
top::Stmt ::= c::Expr  t::Stmt  e::Stmt
{
  top.pp = concat([
    text("if"), space(), parens(c.pp), line(),
    braces(nestlines(2, t.pp)) ] ++
      case e of nullStmt() -> []
      | _ -> [
          text(" else "),
          braces(nestlines(2, e.pp))]
      end);
  top.errors := c.errors ++ t.errors ++ e.errors;
  top.functiondefs = t.functiondefs ++ e.functiondefs;
  
  -- A selection statement is a block whose scope is a strict subset of the scope of its
  -- enclosing block. Each associated substatement is also a block whose scope is a strict
  -- subset of the scope of the selection statement.
  top.defs = [];
  c.env = openScope(top.env);
  local newEnv :: Decorated Env = addEnv(c.defs, c.env);
  t.env = newEnv;
  e.env = newEnv;
  
  top.errors <-
    if c.typerep.defaultFunctionArrayLvalueConversion.isScalarType then []
    else [err(c.location, "If condition must be scalar type, instead it is " ++ showType(c.typerep))];
}

abstract production whileStmt
top::Stmt ::= e::Expr  b::Stmt
{
  top.pp = concat([ text("while"), space(), parens(e.pp), line(), 
                    braces(nestlines(2, b.pp)) ]);
  top.errors := e.errors ++ b.errors;
  top.functiondefs = b.functiondefs;
  
  -- An iteration statement is a block whose scope is a strict subset of the scope of its
  -- enclosing block. The loop body is also a block whose scope is a strict subset of the scope
  -- of the iteration statement.
  top.defs = [];
  e.env = openScope(top.env);
  b.env = addEnv(e.defs, e.env);

  top.errors <-
    if e.typerep.defaultFunctionArrayLvalueConversion.isScalarType then []
    else [err(e.location, "While condition must be scalar type, instead it is " ++ showType(e.typerep))];
}

abstract production doStmt
top::Stmt ::= b::Stmt  e::Expr
{
  top.pp = concat([ text("do"),  line(), 
                    braces(nestlines(2,b.pp)), line(), 
                    text("while"), space(), parens(e.pp), semi()]);
  top.errors := b.errors ++ e.errors;
  top.functiondefs = b.functiondefs;
  
  -- An iteration statement is a block whose scope is a strict subset of the scope of its
  -- enclosing block. The loop body is also a block whose scope is a strict subset of the scope
  -- of the iteration statement.
  top.defs = [];
  b.env = openScope(top.env);
  e.env = b.env;

  top.errors <-
    if e.typerep.defaultFunctionArrayLvalueConversion.isScalarType then []
    else [err(e.location, "Do-while condition must be scalar type, instead it is " ++ showType(e.typerep))];
}

abstract production forStmt
top::Stmt ::= i::MaybeExpr  c::MaybeExpr  s::MaybeExpr  b::Stmt
{
  top.pp = concat([ text("for"), space(), parens( concat([
    case i.pp of
    | cat(cat(text("("), iNoParens), text(")")) -> iNoParens
    | _ -> text(hackUnparse(i.pp))
    end, semi(), space(), 
    case c.pp of
    | cat(cat(text("("), cNoParens), text(")")) -> cNoParens
    | _ -> text(hackUnparse(c.pp))
    end, semi(), space(), 
    case s.pp of 
    | cat(cat(text("("), sNoParens), text(")")) -> sNoParens
    | _ -> text(hackUnparse(s.pp))
    end])), line(), 
                    braces(nestlines(2, b.pp)) ]);
  top.errors := i.errors ++ c.errors ++ s.errors ++ b.errors;
  top.functiondefs = b.functiondefs;
  
  -- An iteration statement is a block whose scope is a strict subset of the scope of its
  -- enclosing block. The loop body is also a block whose scope is a strict subset of the scope
  -- of the iteration statement.
  top.defs = [];
  i.env = openScope(top.env);
  c.env = addEnv(i.defs, i.env);
  s.env = addEnv(c.defs, c.env);
  b.env = addEnv(s.defs, s.env);

  local cty :: Type = fromMaybe(errorType(), c.maybeTyperep);
  top.errors <-
    if cty.defaultFunctionArrayLvalueConversion.isScalarType then []
    else [err(loc("TODOfor1",-1,-1,-1,-1,-1,-1), "For condition must be scalar type, instead it is " ++ showType(cty))];
}

abstract production forDeclStmt
top::Stmt ::= i::Decls  c::MaybeExpr  s::MaybeExpr  b::Stmt
{
  top.pp = concat([ text("for"), space(), parens( concat([ ppImplode( cat( comma(), space() ), i.pps ), 
                                                           semi(), space(), c.pp, semi(), space(), s.pp]) ), 
                    line(), braces(nestlines(2, b.pp)) ]);
  top.errors := i.errors ++ c.errors ++ s.errors ++ b.errors;
  top.functiondefs = b.functiondefs;
  
  -- An iteration statement is a block whose scope is a strict subset of the scope of its
  -- enclosing block. The loop body is also a block whose scope is a strict subset of the scope
  -- of the iteration statement.
  top.defs = [];
  i.env = openScope(top.env);
  c.env = addEnv(i.defs, i.env);
  s.env = addEnv(c.defs, c.env);
  b.env = addEnv(s.defs, s.env);
  i.isTopLevel = false;

  local cty :: Type = fromMaybe(errorType(), c.maybeTyperep);
  top.errors <-
    if cty.defaultFunctionArrayLvalueConversion.isScalarType then []
    else [err(loc("TODOfor2",-1,-1,-1,-1,-1,-1), "For condition must be scalar type, instead it is " ++ showType(cty))];
}

abstract production returnStmt
top::Stmt ::= e::MaybeExpr
{
  top.pp = concat([text("return"), space(), e.pp, semi()]);
  top.errors := e.errors;
  top.defs = e.defs;
  top.functiondefs = [];
  -- TODO: this needs to follow the same rules as assignment. We should try to factor that out.
}

abstract production switchStmt
top::Stmt ::= e::Expr  b::Stmt
{
  top.pp = concat([ text("switch"), space(), parens(e.pp),  line(), 
                    braces(nestlines(2, b.pp)) ]);
  top.errors := e.errors ++ b.errors;
  top.functiondefs = b.functiondefs;
  
  -- A selection statement is a block whose scope is a strict subset of the scope of its
  -- enclosing block. Each associated substatement is also a block whose scope is a strict
  -- subset of the scope of the selection statement.
  top.defs = [];
  e.env = openScope(top.env);
  b.env = addEnv(e.defs, e.env);

  top.errors <-
    if e.typerep.defaultFunctionArrayLvalueConversion.isIntegerType then []
    else [err(e.location, "Switch expression must have integer type, instead it is " ++ showType(e.typerep))];
}

abstract production gotoStmt
top::Stmt ::= l::Name
{
  top.pp = concat([ text("goto"), space(), l.pp, semi() ]);
  top.errors := [];
  top.defs = [];
  top.functiondefs = [];
  
  top.errors <- l.labelLookupCheck;
}

abstract production continueStmt
top::Stmt ::=
{
  top.pp = cat( text("continue"), semi() );
  top.errors := [];
  top.defs = [];
  top.functiondefs = [];
}

abstract production breakStmt
top::Stmt ::=
{
  top.pp = concat([ text("break"), semi()  ]);
  top.errors := [];
  top.defs = [];
  top.functiondefs = [];
}

abstract production labelStmt
top::Stmt ::= l::Name  s::Stmt
{
  top.pp = concat([ l.pp, text(":"), space(), s.pp]);
  top.errors := s.errors;
  top.defs = s.defs;
  top.functiondefs = [labelDef(l.name, labelItem(top))] ++ s.functiondefs;
  
  top.errors <- l.labelRedeclarationCheck;
}

abstract production caseLabelStmt
top::Stmt ::= v::Expr  s::Stmt
{
  top.pp = concat([text("case"), space(), v.pp, text(":"), nestlines(2,s.pp)]); 
  top.errors := v.errors ++ s.errors;
  top.defs = v.defs ++ s.defs;
  top.functiondefs = s.functiondefs; -- ??
  
  s.env = addEnv(v.defs, v.env);
}

abstract production defaultLabelStmt
top::Stmt ::= s::Stmt
{
  top.pp = concat([ text("default"), text(":"), nestlines(2,s.pp)]);
  top.errors := s.errors;
  top.defs = s.defs;
  top.functiondefs = s.functiondefs; -- ??
}

-- GCC extension:
abstract production functionDeclStmt
top::Stmt ::= d::FunctionDecl
{
  top.pp = d.pp;
  top.errors := d.errors;
  top.defs = d.defs;
  top.functiondefs = [];
}

-- GCC extension:
abstract production caseLabelRangeStmt
top::Stmt ::= l::Expr  u::Expr  s::Stmt
{
  top.pp = concat([text("case"), space(), l.pp, text("..."), u.pp, text(":"), space(),s.pp]); 
  top.errors := l.errors ++ u.errors ++ s.errors;
  top.defs = l.defs ++ u.defs ++ s.defs;
  top.functiondefs = s.functiondefs;
}

abstract production asmStmt
top::Stmt ::= asm::AsmStatement
{ top.pp = asm.pp;
  top.errors := [];
  top.defs = [];
  top.functiondefs = [];
}

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

