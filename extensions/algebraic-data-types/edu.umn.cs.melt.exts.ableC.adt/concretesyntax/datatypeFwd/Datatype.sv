grammar edu:umn:cs:melt:exts:ableC:adt:concretesyntax:datatypeFwd;

imports silver:langutil only ast, pp, errors; 
imports silver:langutil:pp;

imports edu:umn:cs:melt:ableC:concretesyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;

imports edu:umn:cs:melt:exts:ableC:adt:abstractsyntax;

exports edu:umn:cs:melt:exts:ableC:adt:concretesyntax;

-- trigger the test
import edu:umn:cs:melt:exts:ableC:adt:mda_test;

-- e.g. "datatype Type;"
-- Forward declaration, mirroring C stucts closely
concrete productions s::StructOrUnionSpecifier_c
| 'datatype' id::Identifier_t
    { s.realTypeSpecifiers = 
        [ adtTagReferenceTypeExpr( s.givenQualifiers, 
             name(id.lexeme, location=s.location) ) ];
    }

