grammar edu:umn:cs:melt:exts:ableC:regex;

imports edu:umn:cs:melt:ableC:abstractsyntax as abs;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction as abs;

-- To make it as easy as including :regex into the parser, we export each bit of syntax.
exports edu:umn:cs:melt:exts:ableC:regex:regexLiterals;
exports edu:umn:cs:melt:exts:ableC:regex:regexMatching;

imports silver:langutil;
imports silver:langutil:pp;

abstract production regexLiteralExpr
top::abs:Expr ::= l1::String
{
  -- We do nothing special here, as the only real point of this is to ensure the regex parses.
  forwards to
    -- makeRegex (l1)
    abs:directCallExpr(
      abs:name("makeRegex", location=top.location),
      abs:foldExpr([
        abs:stringLiteral(l1, location=top.location)]),
      location=top.location
    );
}

abstract production regexMatch
top::abs:Expr ::= r::abs:Expr  text::abs:Expr
{
  forwards to
    -- matchRegex (r, t)
    abs:directCallExpr(
      abs:name("matchRegex", location=top.location),
      abs:foldExpr([
        r,
        text]),
      location=top.location
    );
}


