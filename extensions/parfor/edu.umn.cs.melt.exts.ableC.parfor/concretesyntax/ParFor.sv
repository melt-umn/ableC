grammar edu:umn:cs:melt:exts:ableC:parfor:concretesyntax;

import edu:umn:cs:melt:ableC:concretesyntax;
import edu:umn:cs:melt:ableC:abstractsyntax as ast;
import edu:umn:cs:melt:ableC:abstractsyntax:construction as ast;
import edu:umn:cs:melt:exts:ableC:parfor as ast;

import silver:langutil;

terminal Parallelize 'parallelize' lexer classes { Ckeyword };

concrete productions top::IterationStmt_c
| 'parallelize' '(' pool::Expr_c ')'
  'for' '('
  ds::DeclarationSpecifiers_c d::Declarator_c '=' i::Initializer_c ';'
  cond::RelationalExpr_c ';'
  iter::Expr_c ')' body::Stmt_c
    { 
      top.ast = ast:parfor(pool.ast, ds.storageClass, ds.attributes, newbt, d.ast, d.declaredIdent, i.ast, cond.ast, iter.ast, body.ast);

      ds.givenQualifiers = ds.typeQualifiers;
      d.givenType = ast:baseTypeExpr();
      
      local dcls :: ast:Declarators =
        ast:foldDeclarator([ast:declarator(d.declaredIdent, d.ast, [], ast:justInitializer(i.ast))]);

      local bt :: ast:BaseTypeExpr =
        ast:figureOutTypeFromSpecifiers(ds.location, ds.typeQualifiers, ds.preTypeSpecifiers, ds.realTypeSpecifiers, ds.mutateTypeSpecifiers);
      
      local newbt :: ast:BaseTypeExpr =
        if ds.isTypedef then
          ast:warnTypeExpr([err(ds.location, "Typedef not permitted within parallized for loop declaration")], bt)
        else bt;
   }


