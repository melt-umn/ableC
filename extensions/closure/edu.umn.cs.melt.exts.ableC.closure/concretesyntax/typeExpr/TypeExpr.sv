grammar edu:umn:cs:melt:exts:ableC:closure:concretesyntax:typeExpr;

imports edu:umn:cs:melt:ableC:concretesyntax;
imports silver:langutil only ast;

imports edu:umn:cs:melt:ableC:abstractsyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;
--imports edu:umn:cs:melt:ableC:abstractsyntax:debug;

import edu:umn:cs:melt:exts:ableC:closure;

-- Spurious import, to trigger the tests on build.
import edu:umn:cs:melt:exts:ableC:closure:mda_test;

marking terminal Closure_t 'closure' lexer classes {Ckeyword};

concrete productions top::TypeSpecifier_c
| 'closure' '(' te::ClosureTypeExpr_c ')'
    { top.realTypeSpecifiers = [te.ast];
      top.preTypeSpecifiers = []; }
{-| 'closure' '(' res::TypeName_c '(' params::TypeNames_c ')' ')'
    { top.realTypeSpecifiers = [closureTypeExpr(params.ast, res.ast)];
      top.preTypeSpecifiers = []; } -}

nonterminal ClosureTypeExpr_c with ast<BaseTypeExpr>;

concrete productions top::ClosureTypeExpr_c
| '(' params::TypeNames_c ')' '->' rest::ClosureTypeExpr_c
    { top.ast = closureTypeExpr(params.ast, typeName(rest.ast, baseTypeExpr())); }
| '(' params::TypeNames_c ')' '->' ret::TypeName_c
    { top.ast = closureTypeExpr(params.ast, ret.ast); }
| '(' param::ClosureTypeExpr_c ')' '->' ret::TypeName_c
    { top.ast = closureTypeExpr(consTypeName(typeName(param.ast, baseTypeExpr()), nilTypeName()), ret.ast); }
| '(' param::ClosureTypeExpr_c ')' '->' rest::ClosureTypeExpr_c
    { top.ast = closureTypeExpr(consTypeName(typeName(param.ast, baseTypeExpr()), nilTypeName()), typeName(rest.ast, baseTypeExpr())); }