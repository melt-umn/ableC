grammar edu:umn:cs:melt:ableC:cfg;

import edu:umn:cs:melt:ableC:abstractsyntax;

aspect production root
r::Root ::= d::GlobalDecls
{
--  d.cfg = controlFlowGraph(foldr(consControlFlowEdge, nilControlFlowEdge(), d.flowEdges));
}

