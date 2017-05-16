grammar edu:umn:cs:melt:tutorials:ableC:helloworld:concretesyntax;

imports edu:umn:cs:melt:ableC:concretesyntax;
imports silver:langutil only ast; 

imports edu:umn:cs:melt:tutorials:ableC:helloworld:abstractsyntax;

marking terminal Hello_t 'hello!';

concrete production skeleton_c
s::Stmt_c ::= sk::Hello_t
{
  s.ast = hello();
}