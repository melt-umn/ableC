grammar edu:umn:cs:melt:exts:ableC:regex;

imports edu:umn:cs:melt:ableC:abstractsyntax as abs;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction as abs;
imports edu:umn:cs:melt:ableC:abstractsyntax:env as abs;

imports silver:langutil;
imports silver:langutil:pp;

abstract production regexLiteralExpr
top::abs:Expr ::= l1::String
{
  -- We check to make sure regcomp is in the environment. We could further check
  -- that it has the right type, but that can come later.

  local localErrs :: [Message] =
    (if !null(abs:lookupValue("regcomp", top.abs:env)) then [] else
      [err(top.location, "Regex literals require <regex.h> to be included.")]);

  
  forwards to
    if null(localErrs) then
      regexLiteral
    else
      abs:errorExpr(localErrs, location=top.location);

  
  local regExtended :: abs:Expr =
    --abs:declRefExpr(abs:name("REG_EXTENDED", location=top.location), location=top.location);
    -- TODO: problem, these are #defines in the header file.
    abs:realConstant(
      abs:integerConstant("1", false, abs:noIntSuffix(), location=top.location),
      location=top.location);
  
  local regNosub :: abs:Expr =
    --abs:declRefExpr(abs:name("REG_NOSUB", location=top.location), location=top.location)
    -- TODO: ditto problem
    abs:realConstant(
      abs:integerConstant("8", false, abs:noIntSuffix(), location=top.location),
      location=top.location);
  
  local regexLiteral :: abs:Expr =
    abs:stmtExpr(
      abs:foldStmt([
        -- static regex_t thisRegex;
        abs:declStmt(
          abs:variableDecls(
            [abs:staticStorageClass()],
            [],
            abs:typedefTypeExpr([], abs:name("regex_t", location=top.location)),
            abs:foldDeclarator([
              abs:declarator(
                abs:name("thisRegex", location=top.location),
                abs:baseTypeExpr(),
                [],
                abs:nothingInitializer()
              )
            ])
          )
        ),
        -- static bool uninited = 0;
        abs:declStmt(
          abs:variableDecls(
            [abs:staticStorageClass()],
            [],
            abs:directTypeExpr(abs:builtinType([], abs:boolType())),
            abs:foldDeclarator([
              abs:declarator(
                abs:name("uninited", location=top.location),
                abs:baseTypeExpr(),
                [],
                abs:justInitializer(
                  abs:exprInitializer(
                    abs:realConstant(
                      abs:integerConstant("1", false, abs:noIntSuffix(), location=top.location),
                      location=top.location)))
              )
            ])
          )
        ),
        -- if(uninited) { regcomp(&thisRegex, "regstr", REG_EXTENDED | REG_NOSUB); uninited = 0; }
        abs:ifStmt(
          abs:declRefExpr(abs:name("uninited", location=top.location), location=top.location),
          abs:seqStmt(
            abs:exprStmt(
              abs:directCallExpr(
                abs:name("regcomp", location=top.location),
                abs:foldExpr([
                  abs:unaryOpExpr(
                    abs:addressOfOp(location=top.location),
                    abs:declRefExpr(abs:name("thisRegex", location=top.location), location=top.location),
                    location=top.location
                  ),
                  -- Escape backslashes, as they're now in a string literal
                  abs:stringLiteral(substitute("\\", "\\\\", l1), location=top.location),
                  abs:binaryOpExpr(
                    regExtended,
                    abs:bitOp(abs:orBitOp(location=top.location), location=top.location),
                    regNosub,
                    location=top.location
                  )
                ]),
                location=top.location
              )
            ),
            abs:exprStmt(
              abs:binaryOpExpr(
                abs:declRefExpr(abs:name("uninited", location=top.location), location=top.location),
                abs:assignOp(abs:eqOp(location=top.location), location=top.location),
                abs:realConstant(
                  abs:integerConstant("0", false, abs:noIntSuffix(), location=top.location),
                  location=top.location
                ),
                location=top.location
              )
            )
          ),
          abs:nullStmt()
        )
      ]),
      -- &thisRegex
      abs:unaryOpExpr(
        abs:addressOfOp(location=top.location),
        abs:declRefExpr(abs:name("thisRegex", location=top.location), location=top.location),
        location=top.location
      ),
      location=top.location
    );
}

abstract production regexMatch
top::abs:Expr ::= text::abs:Expr  re::abs:Expr
{
  -- Yep, a *value* item. C. lol.
  local regext :: [abs:ValueItem] = abs:lookupValue("regex_t", top.abs:env);

  local localErrs :: [Message] =
    (if !null(regext) then [] else
      [err(top.location, "Regex match operators require <regex.h> to be included.")]) ++
    (if abs:compatibleTypes(text.abs:typerep, abs:pointerType([], abs:builtinType([], abs:signedType(abs:charType()))), true) then [] else
      [err(top.location, "First operand to =~ must be char * (got " ++ abs:showType(text.abs:typerep) ++ ")")]) ++
    (if abs:compatibleTypes(re.abs:typerep, abs:pointerType([], head(regext).abs:typerep), true) then [] else
      [err(top.location, "Second operand to =~ must be regex_t * (got " ++ abs:showType(re.abs:typerep) ++ ")")]);

  forwards to
    if null(localErrs) then
      matchingExpr
    else
      -- Remember not to supress subexpressions' errors.
      abs:errorExpr(localErrs ++ text.errors ++ re.errors, location=top.location);

  
  local zero :: abs:Expr =
    abs:realConstant(
      abs:integerConstant("0", false, abs:noIntSuffix(), location=top.location),
      location=top.location);
  
  local matchingExpr :: abs:Expr =
    -- REG_NOMATCH != regexec(re, text, 0, 0, 0)
    abs:binaryOpExpr(
      abs:declRefExpr(abs:name("REG_NOMATCH", location=top.location), location=top.location),
      abs:compareOp(abs:notEqualsOp(location=top.location), location=top.location),
      abs:directCallExpr(
        abs:name("regexec", location=top.location),
        abs:foldExpr([
          re,
          text,
          zero, zero, zero
        ]),
        location=top.location
      ),
      location=top.location
    );
{-  
    -- matchRegex (r, t)
    abs:directCallExpr(
      abs:name("matchRegex", location=top.location),
      abs:foldExpr([
        r,
        text]),
      location=top.location
    );-}
}


