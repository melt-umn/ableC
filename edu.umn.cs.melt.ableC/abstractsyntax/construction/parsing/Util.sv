grammar edu:umn:cs:melt:ableC:abstractsyntax:construction:parsing;

function parseInline
a ::= nt::String parser::(ParseResult<a> ::= String String) text::String
{
  local result::ParseResult<a> =
    parser(text, s"parse${nt}(\"\"\"\n${foldLineNums(text)}\n\"\"\")");
  return
    if result.parseSuccess
    then result.parseTree
    else error("Syntax errors in parse${nt} string:\n" ++ result.parseErrors);
}

-- TODO: Maybe these belong in core or langutil?
function padRight
String ::= len::Integer s::String
{
  return
    if length(s) < len
    then s ++ replicate(len - length(s), " ")
    else s;
}

function foldLineNums
String ::= text::String
{
  local lineNums::[Integer] = 1 :: map(\i::Integer -> i + 1, lineNums); -- Lazyness is awesome.
  local lines::[String] = explode("\n", text);
  return implode("\n", zipWith(\lineNum::Integer line::String -> padRight(3, toString(lineNum)) ++ line, lineNums, lines));
}
