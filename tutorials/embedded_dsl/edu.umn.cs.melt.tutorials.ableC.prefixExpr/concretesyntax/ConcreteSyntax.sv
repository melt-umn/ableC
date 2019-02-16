grammar edu:umn:cs:melt:tutorials:ableC:prefixExpr:concretesyntax;

imports silver:langutil;

imports edu:umn:cs:melt:ableC:concretesyntax;

imports edu:umn:cs:melt:ableC:abstractsyntax:host;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
imports edu:umn:cs:melt:tutorials:ableC:prefixExpr:abstractsyntax;

marking terminal PrefixExpr_t 'prefix' lexer classes {Ckeyword};

-- Bridge production from host concrete syntax to extension concrete syntax
-- Note that this begins with a 'marking' terminal, more on that later
concrete production prefixExpr_c
top::AssignExpr_c ::= 'prefix' '(' pe::PrefixExpr_c ')'
{
  top.ast = prefixExpr(pe.ast, location=top.location);
}

-- 'closed' nonterminal = allow nonforwarding productions, disallow new attributes in other extensions
closed nonterminal PrefixExpr_c with ast<PrefixExpr>, location;


terminal NewPlus_t '+' ;

-- New syntax for prefix expressions
-- Note that most of the terminals used here are from the host
-- Only the NewPlus_t above is now.
-- Note how it overlaps with the Plus_t from the host.
  
concrete productions top::PrefixExpr_c
| NewPlus_t pe1::PrefixExpr_c pe2::PrefixExpr_c
  { top.ast = addPrefixExpr(pe1.ast, pe2.ast, location=top.location); }
{- XX
| '-' pe1::PrefixExpr_c pe2::PrefixExpr_c
  { top.ast = subPrefixExpr(pe1.ast, pe2.ast, location=top.location); }
-}
| '*' pe1::PrefixExpr_c pe2::PrefixExpr_c
  { top.ast = mulPrefixExpr(pe1.ast, pe2.ast, location=top.location); }
{-
| '/' pe1::PrefixExpr_c pe2::PrefixExpr_c
  { top.ast = divPrefixExpr(pe1.ast, pe2.ast, location=top.location); }
-}
| c::PrefixConstant_c
  { top.ast = exprPrefixExpr(c.ast, location=top.location); }
| id::Identifier_t
  { top.ast = exprPrefixExpr(declRefExpr(fromId(id), location=top.location), location=top.location); }
-- 'Escape hatch' production for writing normal expressions
| '(' e::Expr_c  ')'
  { top.ast = exprPrefixExpr(e.ast, location=top.location); }

-- Mirrors Constant_c
-- Can't use Constant_c due to constraints on adding new terminals to host follow sets
-- More on that later.
closed nonterminal PrefixConstant_c with location, ast<Expr>;
concrete productions top::PrefixConstant_c
-- dec
| c::DecConstant_t
    { top.ast = realConstant(integerConstant(c.lexeme, false, noIntSuffix(), location=top.location), location=top.location); }
| c::DecConstantU_t
    { top.ast = realConstant(integerConstant(c.lexeme, true, noIntSuffix(), location=top.location), location=top.location); }
| c::DecConstantL_t
    { top.ast = realConstant(integerConstant(c.lexeme, false, longIntSuffix(), location=top.location), location=top.location); }
| c::DecConstantUL_t
    { top.ast = realConstant(integerConstant(c.lexeme, true, longIntSuffix(), location=top.location), location=top.location); }
| c::DecConstantLL_t
    { top.ast = realConstant(integerConstant(c.lexeme, false, longLongIntSuffix(), location=top.location), location=top.location); }
| c::DecConstantULL_t
    { top.ast = realConstant(integerConstant(c.lexeme, true, longLongIntSuffix(), location=top.location), location=top.location); }
-- oct
| c::OctConstant_t
    { top.ast = realConstant(octIntegerConstant(c.lexeme, false, noIntSuffix(), location=top.location), location=top.location); }
| c::OctConstantU_t
    { top.ast = realConstant(integerConstant(c.lexeme, true, noIntSuffix(), location=top.location), location=top.location); }
| c::OctConstantL_t
    { top.ast = realConstant(integerConstant(c.lexeme, false, longIntSuffix(), location=top.location), location=top.location); }
| c::OctConstantUL_t
    { top.ast = realConstant(integerConstant(c.lexeme, true, longIntSuffix(), location=top.location), location=top.location); }
| c::OctConstantLL_t
    { top.ast = realConstant(integerConstant(c.lexeme, false, longLongIntSuffix(), location=top.location), location=top.location); }
| c::OctConstantULL_t
    { top.ast = realConstant(integerConstant(c.lexeme, true, longLongIntSuffix(), location=top.location), location=top.location); }
| c::OctConstantError_t
    { top.ast = errorExpr([err(top.location, "Erroneous octal constant: " ++ c.lexeme)], location=top.location); }
-- hex
| c::HexConstant_t
    { top.ast = realConstant(hexIntegerConstant(c.lexeme, false, noIntSuffix(), location=top.location), location=top.location); }
| c::HexConstantU_t
    { top.ast = realConstant(hexIntegerConstant(c.lexeme, true, noIntSuffix(), location=top.location), location=top.location); }
| c::HexConstantL_t
    { top.ast = realConstant(hexIntegerConstant(c.lexeme, false, longIntSuffix(), location=top.location), location=top.location); }
| c::HexConstantUL_t
    { top.ast = realConstant(hexIntegerConstant(c.lexeme, true, longIntSuffix(), location=top.location), location=top.location); }
| c::HexConstantLL_t
    { top.ast = realConstant(hexIntegerConstant(c.lexeme, false, longLongIntSuffix(), location=top.location), location=top.location); }
| c::HexConstantULL_t
    { top.ast = realConstant(hexIntegerConstant(c.lexeme, true, longLongIntSuffix(), location=top.location), location=top.location); }
-- floats
| c::FloatConstant_t
    { top.ast = realConstant(floatConstant(c.lexeme, doubleFloatSuffix(), location=top.location), location=top.location); }
| c::FloatConstantFloat_t
    { top.ast = realConstant(floatConstant(c.lexeme, floatFloatSuffix(), location=top.location), location=top.location); }
| c::FloatConstantLongDouble_t
    { top.ast = realConstant(floatConstant(c.lexeme, longDoubleFloatSuffix(), location=top.location), location=top.location); }
-- hex floats
| c::HexFloatConstant_t
    { top.ast = realConstant(hexFloatConstant(c.lexeme, doubleFloatSuffix(), location=top.location), location=top.location); }
| c::HexFloatConstantFloat_t
    { top.ast = realConstant(hexFloatConstant(c.lexeme, floatFloatSuffix(), location=top.location), location=top.location); }
| c::HexFloatConstantLongDouble_t
    { top.ast = realConstant(hexFloatConstant(c.lexeme, longDoubleFloatSuffix(), location=top.location), location=top.location); }
-- characters
| c::CharConstant_t
    { top.ast = characterConstant(c.lexeme, noCharPrefix(), location=top.location); }
| c::CharConstantL_t
    { top.ast = characterConstant(c.lexeme, wcharCharPrefix(), location=top.location); }
| c::CharConstantU_t
    { top.ast = characterConstant(c.lexeme, char16CharPrefix(), location=top.location); }
| c::CharConstantUBig_t
    { top.ast = characterConstant(c.lexeme, char32CharPrefix(), location=top.location); }
