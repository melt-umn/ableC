
abstract production matchStmtNew
e::Expr ::= scrutinee::Expr cs::StmtClauses
{
  forwards to 
    stmtExpr (
      matchStmtAsStmt( scrutinee, cs ),
      mkIntConst(0,e.location), -- this will go away when this production does.
      location=e.location
    ) ;
}

abstract production matchStmtAsStmt
s::Stmt ::= scrutinee::Expr cs::StmtClauses
{

  cs.expectedType = scrutinee.typerep;  --orig

  forwards to
    compoundStmt(
      foldStmt([
        txtStmt ("'scs.patternType'  scrutinee_val = scrutinee;"),
        txtStmt ("'scs.patternType' *scrutinee_ptr = &scrutinee_val;"),
        cs.transform  
       ])
    );
}


