grammar edu:umn:cs:melt:ableC:abstractsyntax:construction:parsing;

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