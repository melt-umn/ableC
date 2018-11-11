grammar edu:umn:cs:melt:ableC:abstractsyntax:substitution;

aspect production deferredDecl
top::Decl ::= refId::String d::Decl
{
  local substitutions::Substitutions = top.substitutions;
  substitutions.nameIn = refId;
  top.substituted =
    case substitutions.refIdSub of
      just(sub) -> deferredDecl(sub, d.substituted)
    | nothing() -> deferredDecl(refId, d.substituted)
    end;
}
