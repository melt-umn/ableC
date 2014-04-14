grammar edu:umn:cs:melt:exts:ableC:regex:regexLiterals;

imports edu:umn:cs:melt:ableC:concretesyntax as cnc;
imports silver:langutil only ast;

import edu:umn:cs:melt:exts:ableC:regex;

-- Spurious import, to trigger the tests on build.
import edu:umn:cs:melt:exts:ableC:regex:mda_test;

marking terminal RegexBegin_t '/';
terminal RegexEnd_t '/';

concrete production regex_c
e::cnc:PrimaryExpr_c ::= d1::RegexBegin_t  r::Regex_R  d2::RegexEnd_t
layout {}
{
  e.ast = regexLiteralExpr("\"" ++ r.regString ++ "\"", location=e.location);
}


