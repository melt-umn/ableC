grammar edu:umn:cs:melt:ableC:abstractsyntax:env;

closed nonterminal MiscItem;

{- Misc items are used to put various bits of information into the
   environment such that it can be extracted later by, typically, some
   related extension construct. 
-}


{- This can be used in cases where a Boolean value is needed. The
   presence or absence of the name in the Misc name space can serve
   this purpose.  Thus there is no need to actually store anything in
   the env and this production thus has no children.
-}
abstract production emptyMiscItem
top::MiscItem ::= 
{
}

abstract production currentFunctionItem
top::MiscItem ::= n::Decorated Name f::Decorated FunctionDecl
{
}

