grammar edu:umn:cs:melt:exts:ableC:adt:abstractsyntax;

imports silver:langutil only ast, pp, errors, err; --, err, wrn;
imports silver:langutil:pp with implode as ppImplode ;

imports edu:umn:cs:melt:ableC:abstractsyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;
--imports edu:umn:cs:melt:ableC:abstractsyntax:debug;

abstract production matchStmt
e::Expr ::= scrutinee::Expr cs::StmtClauses
{
  e.errors := case scrutinee.typerep of
              | pointerType(_,adtTagType(_, adtRefId, _)) -> []
              | _ -> [err(scrutinee.location, "scrutinee expression does not have adt pointer type (got " ++ showType(scrutinee.typerep) ++ ")")]
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
          txtStmt (""),

          cs.transform  
         ]), 
        comment ("no value to return", location=e.location),
        location=e.location
       ) ;
}



-- Clauses --
-------------

{-  A sequence of StmtClauses

     p1 -> s1 
     p2 -> s2
     ...
     pn -> sn

    becomes

     if ( ... p1 matches ... ) {
       s1
     } else {
     if ( ... p2 matches ... ) {
       s2
     } else {
     ...
     } else {
     if ( ... pn matches ... ) {
       sn
     }

    Thus, the translation of later clauses are children of the
    translation of earlier clauses.  To achieve this, a pair of
    (backward) threaded attribute, transform and tranformIn, are used.
 -}
synthesized attribute transform<a> :: a;
inherited attribute transformIn<a> :: a;

{-  Patterns are checked against an expected type, which is initially
    the type of the scrutinne.  The following inherited attribute are
    used to pass these types down the clause and pattern ASTs.
 -}
inherited attribute expectedType :: Type;
inherited attribute expectedTypes :: [Type];


nonterminal StmtClauses with location, pp, errors, env, 
  expectedType, transform<Stmt>;

abstract production consStmtClause
cs::StmtClauses ::= c::StmtClause rest::StmtClauses
{ 
  cs.pp = cat( c.pp, rest.pp );

  c.expectedType = cs.expectedType;
  rest.expectedType = cs.expectedType;
  cs.errors := c.errors ++ rest.errors;

  cs.transform = c.transform;
  c.transformIn = rest.transform;
}

abstract production nilStmtClause
cs::StmtClauses ::= {-empty-}
{
  cs.pp = notext();
  cs.errors := [];
  cs.transform = nullStmt();
}
  
nonterminal StmtClause with location, pp, errors, env, 
  expectedType, transform<Stmt>, transformIn<Stmt>;

abstract production stmtClause
c::StmtClause ::= p::Pattern s::Stmt
{
  c.pp = concat([ p.pp, text(":"), space(), nestlines(2, s.pp) ]);

  p.expectedType = c.expectedType;
  s.env = addEnv(p.defs,c.env);
  c.errors := p.errors ++ s.errors;

  c.transform 
    = foldStmt ( [ 
        {-blockCommentStmt( cat(text("Match pattern: "), p.pp ))-} ] ++
        -- Declarations of pattern variables.
        p.decls ++

        [ ifStmt (
            -- Code the match the pattern.
            stmtExpr( 
              foldStmt ([
                mkIntDeclInit ("_match", "0", p.location),
                p.transform
              ]),
              -- The stmtExpr result is the value of _match, which would be set
              -- by the translation of the pattern p, above.
              declRefExpr (name("_match", location=p.location), location=p.location),
              location=p.location
            ), 
            -- The statement to execute on a successful match
            s, 

            -- The translation of the StmtClauses that follow this one.
            c.transformIn ) ] 
       ) ;

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


-- Patterns --
--------------
-- Declarations of pattern variables
synthesized attribute decls :: [Stmt];

-- The positin of a pattern in a list, and its depths.
-- These are used to access the value matched by pattern variables.
inherited attribute position :: Integer;
inherited attribute depth :: Integer;

-- These are all suspect, there may be a better way
inherited attribute parentTag :: String;
autocopy attribute parent_id:: String;
autocopy attribute parent_idType :: String;
autocopy attribute parent_idTypeIndicator :: String;

nonterminal Pattern with location, pp, defs, env, errors, 
  position, depth, parentTag, decls, parent_id, parent_idType, expectedType, parent_idTypeIndicator, transform<Stmt>, transformIn<Stmt> ;

abstract production constructorPattern
p::Pattern ::= id::String ps::PatternList
{
  p.pp = cat( text(id), parens( ppImplode(text(","), ps.pps) ) );
  p.defs = ps.defs;

  -- Type checking
  p.errors :=
    -- Check that expected type for this pattern is an ADT type of some sort.
    if  ! adtTypeInfo.fst
    then [ err( p.location, "Constructor \"" ++ id ++ "\" does not match " ++
           "expected type of \"" ++ 
           show(100,cat(p.expectedType.lpp,p.expectedType.rpp)) ++ "\".") ]
    else 

    -- Check that this pattern is a constructor for the expected ADT type.
    if ! constructorM.isJust
    then [ err( p.location, "\"" ++ id ++ "\" is not a valid constructor " ++
           "for the expected type of \"" ++ 
           show(100,cat(p.expectedType.lpp,p.expectedType.rpp)) ++ "\".") ]
    else

    -- Check that the number of patterns matches number of arguments for 
    -- this constructor.
    if  ps.pslength != length( constructorM.fromJust.snd )
    then [ err( p.location, "This pattern has " ++ toString(ps.pslength) ++ 
           " arguments, but " ++ 
           toString(length( constructorM.fromJust.snd )) ++ " were expected.") ]
    else ps.errors;

  local adtTypeInfo :: Pair<Boolean [RefIdItem]>
    = case p.expectedType of
      | adtTagType( _, adtRefId,_) -> pair(true, lookupRefId(adtRefId, p.env))
      | pointerType( _, adtTagType(_,adtRefId,_) ) -> pair(true, lookupRefId(adtRefId, p.env))
      | _ -> pair(false, [])
      end;

  local constructors :: [ Pair<String [Type]> ]
    = case adtTypeInfo.snd of
      | [] -> []
      | xs -> case head(xs) of
              | adtRefIdItem(adtDcl,_) -> adtDcl.adtInfo.snd
              | _ -> []
              end
      end;

  -- the constructor and its argument types matching the pattern, if it exists
  local constructorM :: Maybe< Pair<String [Type]> >
    = case filter( matchConstructorName(id,_), constructors ) of
      | [] -> nothing()
      | x::[] -> just(x)
      | _ -> error ("Two constructors with the same name in ADT type")
      end;

  ps.expectedTypes 
    = case constructorM of
      | just(pair(_,ts)) -> ts
      | _ -> []
      end ;

  p.decls = ps.decls;
  ps.transformIn = p.transformIn;

  p.transform =
   foldStmt (
     (if   p.depth > 0 
      then [txtStmt("_current_" ++ idTypeIndicator ++ "[" ++ toString(p.depth) ++ "] = " ++
                    "( void *)" ++
                    "((" ++ p.parent_idType ++ ")" ++
                    "_current_" ++ p.parent_idTypeIndicator ++ "[" ++ 
                    toString(p.depth-1) ++ "])" ++ 
                    "->contents." ++ 
                    p.parent_id ++ ".f" ++ toString(p.position) ++ " ; ")]
      else [ ] ) ++

    [ ifStmt(
        -- check that the 'tag' field of the current node has the tag for this pattern.
        txtExpr(" ((" ++ idType ++ ")" ++ 
                "_current_" ++ idTypeIndicator ++ "[" ++ toString(p.depth) ++ "])->tag == " ++
                " " ++ idTypeIndicator ++ "_" ++ id, location=p.location),
      
        -- then clause
        foldStmt ([ 
          ps.transform
         ]),           
        -- else clause  
        nullStmt()
       ) 
    ]);
      
  local scrutineeTypeInfo :: Pair<String [ Pair<String [Type]> ]> 
    = getExpectedADTTypeInfo ( p.expectedType, p.env );

  local idType :: String = scrutineeTypeInfo.fst ++ " *";
  local attribute idTypeIndicator :: String = scrutineeTypeInfo.fst;
    -- if head(explode("",id)) == "v" then "int " else "Expr" ;
  
  ps.position = 0;
  ps.depth = p.depth + 1;
  ps.parentTag = id;
  ps.parent_id = id;
  ps.parent_idType = idType;
  ps.parent_idTypeIndicator = idTypeIndicator;
}

function getExpectedADTTypeInfo
Pair<String [ Pair<String [Type]> ]> ::= t::Type e::Decorated Env
{
  return 
      case t of
      | pointerType(_,adtTagType(_, adtRefId, _)) ->
        case lookupRefId(adtRefId, e) of
        | [] -> error ("Internal error: ADT_1: " ++ hackUnparse(t) )
        | xs -> case head(xs) of
                | adtRefIdItem(adtDcl,_) -> adtDcl.adtInfo
                | _ -> error ("Internal error: ADT_2")
                end
        end
      | _ -> error ("Internal error: ADT_3: " ++ hackUnparse(t))
      end;
}


function matchConstructorName
Boolean ::= n::String cnst::Pair<String [Type]>
{ return n == cnst.fst;
}

abstract production patternVariable
p::Pattern ::= id::String
{
  p.pp = text(id);
  p.defs = d.defs;
  local d :: Decl
    = variableDecls( [], [], directTypeExpr(p.expectedType), 
        consDeclarator(
          declarator( name(id, location=p.location), baseTypeExpr(), [], 
            nothingInitializer() ),
          nilDeclarator()) );
  d.env = emptyEnv(); 
  d.isTopLevel = false;

  p.decls = [declStmt(d)];

  p.errors := []; --ToDo: - check for non-linearity

  p.transform = 
    seqStmt ( txtStmt(id ++ " = ((" ++ p.parent_idType ++ ")" ++ 
                  "_current_" ++ p.parent_idTypeIndicator ++ "[" ++ toString(p.depth-1) ++ "])->contents." ++ 
                  p.parentTag ++ ".f" ++ toString(p.position) ++ " ; " ),

              p.transformIn) ;
}

abstract production patternWildcard
p::Pattern ::=
{
  p.pp = text("_");
  p.defs = [];
  p.errors := [];
  p.transform = p.transformIn;
  p.decls = [];
}

abstract production patternIntegerConst
p::Pattern ::= i::Integer
{
  p.pp = text(toString(i));
  p.defs = [];
  p.errors := (if compatibleTypes(p.expectedType, builtinType([], signedType(intType())), false) then [] else
                  [err(p.location, "Unexpected integer constant in pattern")]);
  p.transform = p.transformIn;
  p.decls = [];
}
synthesized attribute pslength::Integer ;

nonterminal PatternList 
  with location, pps, defs, env, errors, pslength, position, depth, parent_id, parent_idType, parent_idTypeIndicator, parentTag, 
       expectedTypes,
       decls, transform<Stmt>, transformIn<Stmt>;

abstract production consPattern
ps::PatternList ::= p::Pattern rest::PatternList
{
  ps.pps = p.pp :: rest.pps;
  ps.defs = p.defs ++ rest.defs;
  ps.errors := p.errors ++ rest.errors;

  ps.pslength = 1 + rest.pslength;

  local splitTypes :: Pair<Type [Type]>
    = case ps.expectedTypes of
      | t::ts -> pair(t,ts)
      | _ -> pair(errorType(),[])
      end;
  p.expectedType = splitTypes.fst;
  rest.expectedTypes = splitTypes.snd;

  rest.transformIn = ps.transformIn;
  p.transformIn = rest.transform;
  ps.transform = p.transform;

  ps.decls = p.decls ++ rest.decls;
  p.position = ps.position ;
  rest.position = ps.position + 1;
  p.depth = ps.depth;
  rest.depth = ps.depth;
  p.parentTag = ps.parentTag;
  rest.parentTag = ps.parentTag;
}

abstract production nilPattern
ps::PatternList ::= {-empty-}
{
  ps.pps = [];
  ps.defs = [];
  ps.errors := [];
  ps.pslength = 0;
  ps.decls = [ ];
  ps.transform = ps.transformIn;
}

