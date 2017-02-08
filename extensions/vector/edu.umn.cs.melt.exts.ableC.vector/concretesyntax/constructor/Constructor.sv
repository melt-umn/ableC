grammar edu:umn:cs:melt:exts:ableC:vector:concretesyntax:constructor;

imports edu:umn:cs:melt:ableC:concretesyntax;
imports silver:langutil only ast;

imports edu:umn:cs:melt:ableC:abstractsyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;
--imports edu:umn:cs:melt:ableC:abstractsyntax:debug;

import edu:umn:cs:melt:exts:ableC:vector;

-- Spurious import, to trigger the tests on build.
import edu:umn:cs:melt:exts:ableC:vector:mda_test;

marking terminal NewVector_t 'new_vector' lexer classes {Ckeyword};
marking terminal InitVector_t 'init_vector' lexer classes {Ckeyword};

concrete productions top::PrimaryExpr_c
| 'new_vector' '(' sub::TypeName_c ')' elems::VectorConstructorList_c
  { top.ast = constructVector(sub.ast, elems.ast, location=top.location); }
| 'init_vector' '(' sub::TypeName_c ')' '(' size::AssignExpr_c ')'
  { top.ast = initVector(sub.ast, size.ast, location=top.location); }

nonterminal VectorConstructorList_c with location, ast<Exprs>;

concrete productions top::VectorConstructorList_c
|'[' elems::ArgumentExprList_c ']'
  { top.ast = foldExpr(elems.ast); }
|'[' ']'
  { top.ast = nilExpr(); }