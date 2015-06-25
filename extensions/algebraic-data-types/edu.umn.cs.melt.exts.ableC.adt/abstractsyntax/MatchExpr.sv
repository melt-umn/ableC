grammar edu:umn:cs:melt:exts:ableC:adt:abstractsyntax;

{- ToDo: 
 - Type-check the expressions in the clause and make sure they match.

 - Can we check for non-exhaustiveness of matches?

 - Raise an error if there are no clauses.  We can't type that match expression
   if we don't have at least one value in a clause.

 - Better failure if no patterns match.  We need a way to create a cast of the appropriate type. 
   We need a way to go from a Type to a TypeName.  Not sure if this is always feasible or how
   to describe, for error messages, when it is not.
-}

abstract production matchExpr
e::Expr ::= scrutinee::Expr cs::ExprClauses
{
  
  e.errors := case scrutinee.typerep of
              | pointerType(_,adtTagType(_, adtRefId, _)) -> []
              | _ -> [err(scrutinee.location,
                          "scrutinee expression does not have adt pointer type (got " ++
                          showType(scrutinee.typerep) ++ ")")]
              end ++ scrutinee.errors ++ cs.errors;

  local scrutineeTypeInfo :: Pair<String [ Pair<String [Type]> ]>    
    = case scrutinee.typerep of
      | pointerType(_,adtTagType(_, adtRefId, _)) ->
        case lookupRefId(adtRefId, e.env) of
        | [] -> error ("Internal error: ADT_11: id is:" ++ adtRefId ++ " " ++
                       hackUnparse(scrutinee.typerep) ++ "\n showType: " ++
                       showType(scrutinee.typerep)
                      )
        | xs -> case head(xs) of
                | adtRefIdItem(adtDcl,_) -> adtDcl.adtInfo
                | _ -> error ("Internal error: ADT_22")
                end
        end
      | _ -> error ("Expected ADT type: ADT_33: " ++ 
                     hackUnparse(scrutinee.typerep) )
      end;

  cs.expectedType = scrutinee.typerep;

  cs.nonEvaluatedFailureExpr = 
    stmtExpr( 
      txtStmt("fprintf(stderr, \"Non-exhaustive match failure!\\n\"); exit(1);"), 
      explicitCastExpr(
        typeName(
          directTypeExpr(e.typerep),
          baseTypeExpr()
         ),
        realConstant(integerConstant("0",false,noIntSuffix(),location=e.location),location=e.location),
        location=e.location
       ),
      location=e.location
     ); 
  
  forwards to
      stmtExpr (
        foldStmt([
          {-blockCommentStmt(concat([ text("match"), space(), parens(scrutinee.pp), 
            text(" ...") ])),-}
          -- Allocate space for pointers for pattern variables.
          -- 10 should be the depth of patterns, this is wrong
          txtStmt ("void *_current_" ++ scrutineeTypeInfo.fst ++ "[10];"), 
          
          txtStmt ("_current_" ++ scrutineeTypeInfo.fst ++ "[0] = " ++
                     "(void *)( " ++ show(100,scrutinee.pp) ++ " );"),
          txtStmt ("")
         ]), 

        cs.transform,

        location=e.location
       ) ;
}


-- Clauses --
-------------

{-  A sequence of ExprClauses

     p1 : e1 
     p2 : e2
     ...
     pn : en
     default: ed

    becomes, roughly

    ({
     ( ( ... p1 matches ... )
       ? e1
       : ( ( ... p2 matches ... )
           ? e2
           : ( ...
               ( ... pn matches ... )
               ? en
               : ed
             )
         )
     )
    })

    Thus, the translation of later clauses are children of the
    translation of earlier clauses.  To achieve this, a pair of
    (backward) threaded attribute, transform and tranformIn, are used.
 -}

{-  Patterns are checked against an expected type, which is initially
    the type of the scrutinne.  The following inherited attribute are
    used to pass these types down the clause and pattern ASTs.
 -}


nonterminal ExprClauses with location, pp, errors, env, 
  expectedType, transform<Expr>, nonEvaluatedFailureExpr;

inherited attribute nonEvaluatedFailureExpr :: Expr;

abstract production consExprClause
cs::ExprClauses ::= c::ExprClause rest::ExprClauses
{ 
  cs.pp = cat( c.pp, rest.pp );

  c.expectedType = cs.expectedType;
  rest.expectedType = cs.expectedType;
  cs.errors := c.errors ++ rest.errors;

  rest.nonEvaluatedFailureExpr =  cs.nonEvaluatedFailureExpr;

  cs.transform = c.transform;
  c.transformIn = rest.transform;
}

abstract production failureClause
cs::ExprClauses ::= 
{
  cs.pp = text("");
  cs.errors := [];
  cs.transform = cs.nonEvaluatedFailureExpr;
}
  

nonterminal ExprClause with location, pp, errors, env, 
  expectedType, transform<Expr>, transformIn<Expr>;

abstract production exprClause
c::ExprClause ::= p::Pattern s::Expr
{
  c.pp = concat([ p.pp, text(":"), space(), nestlines(2, s.pp) ]);

  p.expectedType = c.expectedType;
  s.env = addEnv(p.defs,c.env);
  c.errors := p.errors ++ s.errors;

  c.transform 
    = stmtExpr(
        -- Declarations of pattern variables.
        foldStmt(p.decls),

        conditionalExpr (
          stmtExpr(
              foldStmt ([
                mkIntDeclInit ("_match", "0", p.location),
                -- If-stmt to set _match and values to pattern variables.
                p.transform 
               ]),

              -- The stmtExpr result is the value of _match, which would be set
              -- by the translation of the pattern p, above.
              declRefExpr (name("_match", location=p.location), location=p.location),

              location=p.location
          ),

          -- The expression to evaluation on a successful match
          s,

          -- The expression to evaluation for following clauses
          c.transformIn,

          location=c.location
	),

        location=c.location
      );      

  p.transformIn = mkIntAssign( "_match", "1", p.location );
  p.position = 0;
  p.depth = 0;
  p.parentTag = "NoParent";  
  
  p.parent_id = "NoParent";
  p.parent_idType = "NoParent";
  p.parent_idTypeIndicator = scrutineeTypeInfo.fst;

  local scrutineeTypeInfo :: Pair<String [ Pair<String [Type]> ]> 
    = getExpectedADTTypeInfo ( c.expectedType, c.env );
}


abstract production defaultClause
c::ExprClause ::= e::Expr
{
  c.pp = e.pp;
  c.errors := e.errors;
  c.transform = e;
}
