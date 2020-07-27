grammar edu:umn:cs:melt:ableC:abstractsyntax:injectable;

abstract production preIncExpr
top::host:Expr ::= e::host:Expr
{
  top.pp = parens( cat( text("++"), e.pp ) );
  production attribute lerrors :: [Message] with ++;
  {- TODO: Seed flow types properly on lerrors, runtimeMods, and injectedQualifiers. 
    These equations exist only to seed dependencies on env and returnType so
    extensions can freely compute these synthesized attributes based on them
    while still passing the modular well-definedness analysis. -}
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[RuntimeMod] with ++;
  runtimeMods := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        host:preIncExpr(applyMods(runtimeMods, e))));
}
abstract production preDecExpr
top::host:Expr ::= e::host:Expr
{
  top.pp = parens( cat( text("--"), e.pp ) );
  production attribute lerrors :: [Message] with ++;
  {- TODO: Seed flow types properly on lerrors, runtimeMods, and injectedQualifiers. 
    These equations exist only to seed dependencies on env and returnType so
    extensions can freely compute these synthesized attributes based on them
    while still passing the modular well-definedness analysis. -}
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[RuntimeMod] with ++;
  runtimeMods := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        host:preDecExpr(applyMods(runtimeMods, e))));
}
abstract production postIncExpr
top::host:Expr ::= e::host:Expr
{
  top.pp = parens( cat( e.pp, text("++") ) );
  production attribute lerrors :: [Message] with ++;
  {- TODO: Seed flow types properly on lerrors, runtimeMods, and injectedQualifiers. 
    These equations exist only to seed dependencies on env and returnType so
    extensions can freely compute these synthesized attributes based on them
    while still passing the modular well-definedness analysis. -}
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[RuntimeMod] with ++;
  runtimeMods := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        host:postIncExpr(applyMods(runtimeMods, e))));
}
abstract production postDecExpr
top::host:Expr ::= e::host:Expr
{
  top.pp = parens( cat( e.pp, text("--") ) );
  production attribute lerrors :: [Message] with ++;
  {- TODO: Seed flow types properly on lerrors, runtimeMods, and injectedQualifiers. 
    These equations exist only to seed dependencies on env and returnType so
    extensions can freely compute these synthesized attributes based on them
    while still passing the modular well-definedness analysis. -}
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[RuntimeMod] with ++;
  runtimeMods := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        host:postDecExpr(applyMods(runtimeMods, e))));
}
abstract production addressOfExpr
top::host:Expr ::= e::host:Expr
{
  top.pp = parens( cat( text("&"), e.pp ) );
  production attribute lerrors :: [Message] with ++;
  {- TODO: Seed flow types properly on lerrors, runtimeMods, and injectedQualifiers. 
    These equations exist only to seed dependencies on env and returnType so
    extensions can freely compute these synthesized attributes based on them
    while still passing the modular well-definedness analysis. -}
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[RuntimeMod] with ++;
  runtimeMods := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        host:addressOfExpr(applyMods(runtimeMods, e))));
}
abstract production dereferenceExpr
top::host:Expr ::= e::host:Expr
{
  top.pp = parens( cat(text("*"), e.pp) );
  production attribute lerrors :: [Message] with ++;
  {- TODO: Seed flow types properly on lerrors, runtimeMods, and injectedQualifiers. 
    These equations exist only to seed dependencies on env and returnType so
    extensions can freely compute these synthesized attributes based on them
    while still passing the modular well-definedness analysis. -}
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[RuntimeMod] with ++;
  runtimeMods := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        host:dereferenceExpr(applyMods(runtimeMods, e))));
}
abstract production positiveExpr
top::host:Expr ::= e::host:Expr
{
  top.pp = parens( cat( text("+"), e.pp ) );
  production attribute lerrors :: [Message] with ++;
  {- TODO: Seed flow types properly on lerrors, runtimeMods, and injectedQualifiers. 
    These equations exist only to seed dependencies on env and returnType so
    extensions can freely compute these synthesized attributes based on them
    while still passing the modular well-definedness analysis. -}
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[RuntimeMod] with ++;
  runtimeMods := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        host:positiveExpr(applyMods(runtimeMods, e))));
}
abstract production negativeExpr
top::host:Expr ::= e::host:Expr
{
  top.pp = parens( cat( text("-"), e.pp ) );
  production attribute lerrors :: [Message] with ++;
  {- TODO: Seed flow types properly on lerrors, runtimeMods, and injectedQualifiers. 
    These equations exist only to seed dependencies on env and returnType so
    extensions can freely compute these synthesized attributes based on them
    while still passing the modular well-definedness analysis. -}
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[RuntimeMod] with ++;
  runtimeMods := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        host:negativeExpr(applyMods(runtimeMods, e))));
}
abstract production bitNegateExpr
top::host:Expr ::= e::host:Expr
{
  top.pp = parens( cat( text("~"), e.pp ) );
  production attribute lerrors :: [Message] with ++;
  {- TODO: Seed flow types properly on lerrors, runtimeMods, and injectedQualifiers. 
    These equations exist only to seed dependencies on env and returnType so
    extensions can freely compute these synthesized attributes based on them
    while still passing the modular well-definedness analysis. -}
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[RuntimeMod] with ++;
  runtimeMods := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        host:bitNegateExpr(applyMods(runtimeMods, e))));
}
abstract production notExpr
top::host:Expr ::= e::host:Expr
{
  top.pp = parens( cat( text("!"), e.pp ) );
  production attribute lerrors :: [Message] with ++;
  {- TODO: Seed flow types properly on lerrors, runtimeMods, and injectedQualifiers. 
    These equations exist only to seed dependencies on env and returnType so
    extensions can freely compute these synthesized attributes based on them
    while still passing the modular well-definedness analysis. -}
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[RuntimeMod] with ++;
  runtimeMods := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        host:notExpr(applyMods(runtimeMods, e))));
}

-- GCC extension
abstract production realExpr
top::host:Expr ::= e::host:Expr
{
  top.pp = parens( cat( text("__real__"), e.pp ) );
  production attribute lerrors :: [Message] with ++;
  {- TODO: Seed flow types properly on lerrors, runtimeMods, and injectedQualifiers. 
    These equations exist only to seed dependencies on env and returnType so
    extensions can freely compute these synthesized attributes based on them
    while still passing the modular well-definedness analysis. -}
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[RuntimeMod] with ++;
  runtimeMods := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        host:realExpr(applyMods(runtimeMods, e))));
}
-- GCC extension
abstract production imagExpr
top::host:Expr ::= e::host:Expr
{
  top.pp = parens( cat( text("__imag__"), e.pp ) );
  production attribute lerrors :: [Message] with ++;
  {- TODO: Seed flow types properly on lerrors, runtimeMods, and injectedQualifiers. 
    These equations exist only to seed dependencies on env and returnType so
    extensions can freely compute these synthesized attributes based on them
    while still passing the modular well-definedness analysis. -}
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[RuntimeMod] with ++;
  runtimeMods := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        host:imagExpr(applyMods(runtimeMods, e))));
}

abstract production sizeofExpr
top::host:Expr ::= e::host:ExprOrTypeName
{
  top.pp = parens( ppConcat([text("sizeof"), parens(e.pp)]) );
  production attribute lerrors :: [Message] with ++;
  {- TODO: Seed flow types properly on lerrors, runtimeMods, and injectedQualifiers. 
    These equations exist only to seed dependencies on env and returnType so
    extensions can freely compute these synthesized attributes based on them
    while still passing the modular well-definedness analysis. -}
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        host:sizeofExpr(e)));
}
-- C11
abstract production alignofExpr
top::host:Expr ::= e::host:ExprOrTypeName
{
  top.pp = parens( ppConcat([text("_Alignof"), parens(e.pp)]) );
  production attribute lerrors :: [Message] with ++;
  {- TODO: Seed flow types properly on lerrors, runtimeMods, and injectedQualifiers. 
    These equations exist only to seed dependencies on env and returnType so
    extensions can freely compute these synthesized attributes based on them
    while still passing the modular well-definedness analysis. -}
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        host:alignofExpr(e)));
}

