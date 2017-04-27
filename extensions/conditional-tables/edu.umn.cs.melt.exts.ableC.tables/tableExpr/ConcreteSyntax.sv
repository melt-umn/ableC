grammar edu:umn:cs:melt:exts:ableC:tables:tableExpr;

imports edu:umn:cs:melt:ableC:concretesyntax as cnc;
imports edu:umn:cs:melt:exts:ableC:tables;

imports silver:langutil;

-- trigger the test
import edu:umn:cs:melt:exts:ableC:tables:mda_test;

marking terminal Table_t 'table' lexer classes {Ckeyword};

terminal NewLine2_t /[\r]?\n/;
terminal TrueTV_t   'T';
terminal FalseTV_t  'F';
terminal StarTV_t   '*';

-- TODO: investigate why this turns out to be needed, someday.
disambiguate NewLine2_t, cnc:NewLine_t
{
  pluck NewLine2_t;
}


concrete production table_c
top::cnc:PrimaryExpr_c ::= 'table' '{' trows::TableRows_c '}'
{
  top.ast = table(trows.ast, location=top.location);
}


nonterminal TableRows_c with ast<TableRows>, location;

concrete production tableRowSnoc_c
top::TableRows_c ::= trowstail::TableRows_c  n::NewLine2_t  trow::TableRow_c
layout { cnc:Spaces_t }
{
  top.ast = tableRowSnoc(trowstail.ast, trow.ast, location=top.location);
}

concrete production tableRowOne_c
top::TableRows_c ::= trow::TableRow_c
{
  top.ast = tableRowOne(trow.ast, location=top.location);
}


nonterminal TableRow_c  with ast<TableRow>, location;

concrete production tableRow_c
top::TableRow_c ::= e::cnc:Expr_c ':' tvs::TruthValueList_c
{
  top.ast = tableRow(e.ast, tvs.ast, location=top.location);
}


nonterminal TruthValueList_c with ast<TruthFlagList>, location;

concrete production tvlistCons_c
top::TruthValueList_c ::= tv::TruthValue_c  tvltail::TruthValueList_c
{
  top.ast = tvlistCons(tv.ast, tvltail.ast);
}

concrete production tvlistOne_c
top::TruthValueList_c ::= tv::TruthValue_c
{
  top.ast = tvlistOne(tv.ast);
}


nonterminal TruthValue_c with ast<TruthFlag>, location;

concrete production tvTrue_c
top::TruthValue_c ::= truetv::TrueTV_t
{
  top.ast = tvTrue();
}

concrete production tvFalse_c
top::TruthValue_c ::= falsetv::FalseTV_t
{
  top.ast = tvFalse();
}

concrete production tvStar_c
top::TruthValue_c ::= startv::StarTV_t
{
  top.ast = tvStar();
}

