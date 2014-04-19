grammar edu:umn:cs:melt:exts:ableC:matrix:matrixSyntax;

imports edu:umn:cs:melt:ableC:concretesyntax as cnc;
imports edu:umn:cs:melt:ableC:abstractsyntax as abs;
imports edu:umn:cs:melt:exts:ableC:matrix;

imports silver:langutil;

-- trigger the test
import edu:umn:cs:melt:exts:ableC:matrix:mda_test;

marking terminal Matrix 'matrix' lexer classes {Ckeyword};

terminal MatrixID /[A-Za-z_\$][A-Za-z_0-9\$]*/ lexer classes {Cidentifier};

-- Some helpers
function fromMId
abs:Name ::= n::MatrixID
{
  return abs:name(n.lexeme, location=n.location);
}

