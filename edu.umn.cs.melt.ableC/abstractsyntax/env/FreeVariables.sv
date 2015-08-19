grammar edu:umn:cs:melt:ableC:abstractsyntax:env;

-- For effeciency and simplicity, duplicates are not removed automaticly.  
-- This must be done at the top level, where the attribute is used, by calling removeDuplicateNames.  
synthesized attribute freeVariables::[Name];

function removeDefsFromNames
[Name] ::= defs::[Def] names::[Name]
{
  return if null(names)
         then []
         else if !null(filter(definesVarWithName(_, head(names).name), defs))
         then removeDefsFromNames(defs, tail(names))
         else head(names) :: removeDefsFromNames(defs, tail(names));
}

function removeDuplicateNames
[Name] ::= n::[Name]
{
  return removeDuplicatesBy(nameEq, n);
}

function nameEq
Boolean ::= n1::Name n2::Name
{
  return n1.name == n2.name;
}

function removeDuplicatesBy
[a] ::= eq::(Boolean ::= a a) l::[a]
{
  return if null(l)
         then []
         else if containsBy(eq, head(l), tail(l))
         then removeDuplicatesBy(eq, tail(l))
         else head(l) :: removeDuplicatesBy(eq, tail(l));
}

function definesVarWithName
Boolean ::= d::Def n::String
{
  return
    case d of
      valueDef(n1, _) -> n == n1
    | _ -> false
    end;
}