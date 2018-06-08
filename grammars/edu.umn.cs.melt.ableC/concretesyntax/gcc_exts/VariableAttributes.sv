grammar edu:umn:cs:melt:ableC:concretesyntax:gcc_exts;

import edu:umn:cs:melt:ableC:abstractsyntax:env only env;

-- We have AttrList in Lists of other stuff, this precedence is here to each it up in one go
terminal CPP_Attribute_t '__attribute__' lexer classes {Ckeyword}, precedence=10;
terminal CPP_UUAttribute_t '__attribute' lexer classes {Ckeyword}, precedence=10;
terminal CPP_Attr_LowerPrec_t '' precedence=5;

closed nonterminal Attributes_c with location, ast<ast:Attributes>;
concrete productions top::Attributes_c
| h::Attribute_c
    operator=CPP_Attr_LowerPrec_t -- shift/reduce on Attr? shift! gobble up the whole list.
    { top.ast = ast:consAttribute(h.ast, ast:nilAttribute()); }
| h::Attribute_c t::Attributes_c
    { top.ast = ast:consAttribute(h.ast, t.ast); }

closed nonterminal Attribute_c with location, ast<ast:Attribute>;
concrete productions top::Attribute_c
| '__attribute__' '(' '(' a::AttributeList_c ')' ')'
    { top.ast = ast:gccAttribute(foldr(ast:consAttrib, ast:nilAttrib(), a.ast)); }
| '__attribute' '(' '(' a::AttributeList_c ')' ')'
    { top.ast = ast:gccAttribute(foldr(ast:consAttrib, ast:nilAttrib(), a.ast)); }

closed nonterminal AttributeList_c with location, ast<[ast:Attrib]>;
concrete productions top::AttributeList_c
| h::Attrib_c
    { top.ast = [h.ast]; }
| h::AttributeList_c ',' t::Attrib_c
    { top.ast = h.ast ++ [t.ast]; }

closed nonterminal Attrib_c with location, ast<ast:Attrib>;
concrete productions top::Attrib_c
| 
    { top.ast = ast:emptyAttrib(); }
| n::AttribName_c
    { top.ast = ast:wordAttrib(n.ast); }
-- TODO: This is supposed to be separately recognized syntax, probably with a specific meaning.
-- However, it's in conflict with the Identifier just being recognized as an expression.
-- We omit it from the syntax, but perhaps we should specially recognize this case
-- in the translation of the next case to abstract syntax.
--| AttribName_c '(' Identifier_t ')'
--    {}
--| AttribName_c '(' Identifier_t ',' ArgumentExprList_c ')'
--    {}
| n::AttribName_c '(' e::ArgumentExprList_c ')'
    { top.ast = case e.ast of
      | [] -> ast:appliedAttrib(n.ast, ast:foldExpr([]))
      | hd::tl -> case e.directName of
                    just(id) -> ast:idAppliedAttrib(n.ast, id.ast, ast:foldExpr(tl))
                  | nothing() -> ast:appliedAttrib(n.ast, ast:foldExpr(e.ast))
                  end
      end; 
    }

terminal AttributeNameUnfetterdByKeywords_t /[A-Za-z_\$][A-Za-z_0-9\$]*/;

closed nonterminal AttribName_c with location, ast<ast:AttribName>;
concrete productions top::AttribName_c
-- GCC Specifies the following syntax, or rather it allows the keywords from the
-- following syntax, but thanks to context-aware scanning we can do better, easier.
--| Identifier_t
--   {}
--| TypeSpecifier_c
--    {}
--| TypeQualifier_c
--    {}
--| StorageClassSpecifier_c
--    {}
| t::AttributeNameUnfetterdByKeywords_t
    { top.ast = ast:attribName(ast:name(t.lexeme, location=t.location)); }




