grammar edu:umn:cs:melt:exts:ableC:adt:abstractsyntax ;

{- 
 - datatype Type {
 -   Unit();
 -   Arrow(Type *, Type *);
 -   Var(char *);
 -  };
 - 
 - becomes 
 - 
 - struct Type {
 -   enum { Type_Unit, Type_Arrow, Type_Var } tag;
 -   struct Contents_s {
 -     struct Type_Unit_s { } Unit ;
 -     struct Type_Arrow_s { struct Type *p1; struct Type *p2; } Arrow;
 -     struct Type_Var_s { char* p1; } Var;
 -   } contents;
 - };

 - // Constructor functions for each variant
 - static inline Type *Unit() { ... }
 - static inline Type *Arrow(...) { ... }
 - ...
 -}

abstract production datatypeDecl
top::Decl ::= adt::ADTDecl
{ 
  adt.env = top.env ;

  -- Get the struct RefId and StructDecl off of forwards to tree since
  -- they are to be used in the ADT tag and ref Def items.
  adt.structRefId
    = case head(lookupTag( adt.name, addEnv(forward.defs, emptyEnv()) ) ) of
      | refIdTagItem(_, r) -> r
      | _ -> error( "struct ref id not found.")
      end;

  adt.structDcl
    = case head(lookupRefId(adt.structRefId, addEnv(forward.defs, emptyEnv()) ) ) of
      | structRefIdItem (s) -> s
      | _ -> error( "struct decl not found")
      end;

  top.defs = adt.defs ++
    -- We don't really want all of these.
    -- We want the functions for constructing values,
    -- but not the 'struct ADT' defs.
    forward.defs;

  forwards to adt.transform with {env = addEnv(adt.defs, top.env);};
}

nonterminal ADTDecl with env, defs, structRefId, structDcl, name, adtInfo, transform<Decl>;

inherited attribute structRefId :: String;
inherited attribute structDcl :: Decorated StructDecl;
synthesized attribute adtInfo :: Pair<String [ Pair<String [Type]> ]>;

abstract production adtDecl
top::ADTDecl ::= n::Name cs::ConstructorList
{
  {- Since ADTs translate down to structs with the same name, we don't
     want to allow programmer to create structs that also have this
     name.  So we use the same namespace in the environment for ADTs
     and structs (and enums and unions).
   
     structs create a tagItem and a refIdItem in the environment
      < structName, refIdTagItem ( SEU, RefIdAsString ) >
      < refIdAsString, structRefIdItem(decorated StructDecl) >
     The resaon for this is to deal with forward declarations of structs.
     
     We have to do this for ADTs as well.
   -} 
  top.name = n.name;

  local preDefs :: [Def] = 
    if name_tagHasForwardDcl_workaround -- n.tagHasForwardDcl {-|| !name.hasName-} 
    then []
    else [ adtTagDef( n.name, adtRefIdTagItem( name_tagRefId_workaround, -- n.tagRefId,
                                               top.structRefId )) ];

  cs.env = addEnv(preDefs, top.env);

  top.defs = preDefs ++
    [ adtRefIdDef( name_tagRefId_workaround, adtRefIdItem(top, top.structDcl) ) ] ;

  local name_refIdIfOld_workaround :: Maybe<String>
    = case n.tagLocalLookup of
      | adtRefIdTagItem(thisRefId,_) :: _ -> just(thisRefId)
      -- | refIdTagItem(_, thisRefID) :: _ -> just(thisRefID)
      | _ -> nothing()
      end;
  local name_tagRefId_workaround :: String
    = fromMaybe(toString(genInt()), name_refIdIfOld_workaround);
  local name_tagHasForwardDcl_workaround :: Boolean
    = name_refIdIfOld_workaround.isJust;

  top.adtInfo = pair(n.name,cs.constructors);

  cs.topTypeName = n.name;
  
  {- This attribute is for extensions to use to add additional auto-generated functions
     for ADT, for example an auto-generated recursive freeing function.  This is being used
     in the rewriting extension for the construct and destruct functions.
  -}
  production attribute adtDecls::Decls with appendDecls;
  adtDecls := nilDecl();
  
  {- Used to generate prototypes for adtDecls which are inserted before the constructors -}
  production attribute adtProtos::Decls with appendDecls;
  adtProtos := nilDecl();
  
  production attribute structItems::StructItemList with appendStructItemList;
  structItems := nilStructItem();
  
  structItems <-
    consStructItem(
      structItem(
        [],
        directTypeExpr(
          builtinType(
            [],
            unsignedType(intType()))),
            consStructDeclarator(
              structField(
                name("refId", location=builtIn()),
                baseTypeExpr(),
                []),
            nilStructDeclarator())),
      nilStructItem());
      
  local attribute genericAdtDecl::Decl =
    typeExprDecl(
      [],
      structTypeExpr(
        [],
        structDecl([],
          justName(name("_GenericDatatype", location=builtIn())),
          appendStructItemList(
            structItems,
            consStructItem(
              structItem(
                [],
                directTypeExpr(
                  builtinType(
                    [],
                    unsignedType(intType()))),
                consStructDeclarator(
                  structField(
                    name("tag", location=builtIn()),
                    baseTypeExpr(),
                    []),
                  nilStructDeclarator())),
              nilStructItem())),
          location=builtIn())));
  

  local attribute defaultDecls::Decls =
      consDecl(
        typeExprDecl(
          [],
          structTypeExpr(
            [],
            structDecl([],
              justName( n ),
              appendStructItemList(
                structItems,
                consStructItem(
                  structItem([],
                    enumTypeExpr(
                      [],
                      enumDecl(justName(name("_" ++ n.name ++ "_types", location=builtIn())),
                      case cs.enumItems of
                        nilEnumItem() ->
                          consEnumItem(
                            enumItem(
                              name("_dummy_" ++ n.name ++ "_enum_item", location=builtIn()),
                              nothingExpr()),
                            nilEnumItem())
                      | _ -> cs.enumItems
                      end,
                      location=builtIn())),
                     consStructDeclarator(
                      structField(
                        name("tag", location=builtIn()),
                        baseTypeExpr(),
                        []),
                      nilStructDeclarator())),
                  consStructItem(
                    structItem([],
                      unionTypeExpr(
                        [],
                        unionDecl(
                          [],
                          justName(
                            name("_" ++ n.name ++ "_contents", location=builtIn())),
                          cs.structItems, location=builtIn())),
                      consStructDeclarator(
                        structField(
                          name("contents",location=builtIn()), 
                          baseTypeExpr(),
                          []),
                        nilStructDeclarator())),
                    nilStructItem()))), location=builtIn()))),
        nilDecl() ) ; --cs.funDecls);


  local attribute testing_defaultDecls::Decls =
      consDecl(
        typeExprDecl(
          [],
          structTypeExpr(
            [],
            structDecl([],
              justName( n ),

              consStructItem(
                structItem([],
                  directTypeExpr(
                    builtinType(
                      [],
                      signedType(intType()))),
                  consStructDeclarator(
                    structField(
                      name("refId", location=builtIn()),
                      baseTypeExpr(),
                      []),
                    nilStructDeclarator())),

                consStructItem(
                  structItem([],

                    enumTypeExpr(
                      [],
                      enumDecl(justName(name("_" ++ n.name ++ "_types", location=builtIn())),
                        cs.enumItems, location=builtIn())),

                    consStructDeclarator(
                      structField(
                        name("tag", location=builtIn()),
                        baseTypeExpr(),
                        []),
                      nilStructDeclarator())),

                  consStructItem(
                    structItem([],
                      unionTypeExpr(
                        [],
                        unionDecl([],
                          justName(
                            name("_" ++ n.name ++ "_contents", location=builtIn())),
                          cs.structItems, location=builtIn())),
                      consStructDeclarator(
                        structField(
                          name("contents",location=builtIn()), 
                          baseTypeExpr(),
                          []),
                        nilStructDeclarator())),


                    nilStructItem()
                  )           
                )
              ), location=builtIn()))),

        cs.funDecls);

--  top.transform = decls(appendDecls(defaultDecls, adtDecls));

  top.transform =
    if !null(lookupTag("_GenericDatatype", top.env))
    then decls(
           appendDecls(
             defaultDecls,
             appendDecls(
               adtProtos,
               appendDecls(
                 cs.funDecls,
                 adtDecls))))
    else decls(
           consDecl(
             genericAdtDecl,
               appendDecls(
                 defaultDecls,
                 appendDecls(
                   adtProtos,
                   appendDecls(
                     cs.funDecls,
                     adtDecls)))));

}

function appendStructItemList
StructItemList ::= d1::StructItemList d2::StructItemList
{
  return case d1 of
              nilStructItem() -> d2
            | consStructItem(d, rest) -> consStructItem(d, appendStructItemList(rest, d2))
         end;
}


-- Constructs the enum item for each constructor
synthesized attribute enumItems :: EnumItemList;

-- Constructs the struct item for each constructor
synthesized attribute structItems :: StructItemList;

-- Constructs the initialization function for each constructor
synthesized attribute funDecls :: Decls;

-- Used to pass down the datatype's name for naming conventions
inherited attribute topTypeName :: String;

-- Cosntructor list used, e.g., when type checking patterns
synthesized attribute constructors :: [ Pair<String [Type]> ];

nonterminal ConstructorList
  with pp,env, enumItems, structItems, funDecls, topTypeName, constructors;

abstract production consConstructor
top::ConstructorList ::= c::Constructor cl::ConstructorList
{
  top.pp = concat([ c.pp, sep, cl.pp ]) ;
  local attribute sep::Document =
    case cl of
    | consConstructor(_,_) -> line()
    | nilConstructor() -> notext()
    end ;
  top.enumItems = consEnumItem(c.enumItem, cl.enumItems);
  top.structItems = consStructItem(c.structItem, cl.structItems);
  top.funDecls = consDecl( c.funDecl, cl.funDecls );

  c.topTypeName = top.topTypeName;
  cl.topTypeName = top.topTypeName;
  top.constructors = c.constructors ++ cl.constructors;
}

abstract production nilConstructor
top::ConstructorList ::=
{
  top.pp = notext();
  top.enumItems = nilEnumItem();
  top.structItems = nilStructItem();
  top.funDecls = nilDecl();
  top.constructors = [];
}


-- Constructs the enum item for each constructor
synthesized attribute enumItem :: EnumItem;

-- Constructs the struct item for each constructor
synthesized attribute structItem :: StructItem;

-- Constructs the function declaration to create each constructor
synthesized attribute funDecl :: Decl;

nonterminal Constructor
  with pp, env, enumItem, structItem, funDecl, topTypeName, constructors;

abstract production constructor
top::Constructor ::= n::String tms::TypeNameList
{
  production attribute initStmts::[Stmt] with ++;
  initStmts := [];

  top.pp = concat( [ text(n ++ " ( "), ppImplode (text(", "), tms.pps),
                     text(" );") ] );
  tms.position = 0;  
  tms.name_i = n;

  top.constructors = [ pair(n, tms.typereps) ];

  top.enumItem =
    enumItem(
      name( top.topTypeName ++ "_" ++ n, location=builtIn() ),
      nothingExpr());

  top.structItem =
    structItem([],
      structTypeExpr(
        [],
        structDecl([],
          justName(
            name(top.topTypeName ++ "_" ++ n ++ "_s", location=builtIn())),
          tms.asStructItemList, location=builtIn())),
      consStructDeclarator(
        structField(
          name(n, location=builtIn()),
          baseTypeExpr(), []),
        nilStructDeclarator()));

  top.funDecl =
    functionDeclaration(
      functionDecl(
        [staticStorageClass()],
        [inlineQualifier()],
        typedefTypeExpr(
          [],
          name(top.topTypeName, location=builtIn())),
        functionTypeExprWithArgs(
          pointerTypeExpr([], baseTypeExpr()),
          tms.asParameters,
          false),
        name(n, location=builtIn()),
        [],

        nilDecl(),

        foldStmt([
          declStmt(
            variableDecls(
              [], [],
              typedefTypeExpr(
                [], 
                name(top.topTypeName, location=builtIn())), 
              consDeclarator(
                declarator(
                  name("temp", location=builtIn()), 
                  pointerTypeExpr([], baseTypeExpr()),
                  [],
                  nothingInitializer()),
                nilDeclarator()))),


          txtStmt("temp = (" ++ top.topTypeName ++ " *) malloc (sizeof(" ++ top.topTypeName ++ "));"), --ToDo
          exprStmt(
            binaryOpExpr(
              memberExpr(
                declRefExpr(
                  name("temp",location=builtIn()),location=builtIn()),
                true,
                name("tag",location=builtIn()),location=builtIn()),
              assignOp(
                eqOp(location=builtIn()),location=builtIn()), 
              declRefExpr(
                name(top.topTypeName++"_"++n,location=builtIn()),location=builtIn()),location=builtIn())),

          exprStmt(
            binaryOpExpr(
              memberExpr(
                declRefExpr(
                  name("temp",location=builtIn()),location=builtIn()),
                true,
                name("refId",location=builtIn()),location=builtIn()),
              assignOp(
                eqOp(location=builtIn()),location=builtIn()), 
              realConstant(
                integerConstant(
-- orig                 case head(lookupRefId(top.topTypeName, top.env)) of
-- orig                  structRefIdItem(d) -> d.refId
-- orig                end,

                  case lookupRefId(top.topTypeName, top.env) of
                  | [] -> "123456"
                          -- error("BOOM-EVW-1: not found " ++ top.topTypeName)
                  | xs -> case head(xs) of
                          | structRefIdItem(d) -> d.refId
                          end
                  end,
                  true, -- Lucas, verify that this should be true and not false
                  noIntSuffix(),
                  location=builtIn()),
                location=builtIn()),
              location=builtIn())),
          foldStmt(initStmts),
          tms.asAssignments,
          returnStmt(justExpr(declRefExpr(name("temp",location=builtIn()),location=builtIn())))


        ])

       ));
}


{-
 - New location for expressions which don't have real locations
 -}
abstract production builtIn
top::Location ::=
{
  forwards to loc("Built In", 0, 0, 0, 0, 0, 0);
}



{-
function convertTypeNamesToParameters
Parameters ::= tms::[TypeName]
{
  return convertTypeNamesToParametersHelper( tms, 0 );
}

function convertTypeNamesToParametersHelper
Parameters ::= tms::[TypeName] i::Integer
{
  return
    if null(tms) then nilParameters()
    else case head(tms) of
         | typeName(bty,mty) ->
             consParameters(
               parameterDecl(
                 [],
                 bty,
                 mty,
                 justName(name("f"++toString(i),location=builtIn())),
                 []),
               convertTypeNamesToParametersHelper( tail(tms), i+1 ))
         end;
}

function convertTypeNamesToStructItems
StructItemList ::= tms::[TypeName]
{
  return convertTypeNamesToStructItemsHelper( tms, 0 );
}

function convertTypeNamesToStructItemsHelper
StructItemList ::= tms::[TypeName] i::Integer
{
  return
    if null(tms) then nilStructItem()
    else case head(tms) of
         | typeName(bty,mty) ->
             consStructItem(
               structItem([],
                 bty,
                 consStructDeclarator(
                   structField(
                     name("f"++toString(i),location=builtIn()),
                     mty,
                     []),
                   nilStructDeclarator())),
               convertTypeNamesToStructItemsHelper( tail(tms), i+1 ))
         end;
}

function convertTypeNamesToAssignments
Stmt ::= tms::[TypeName] n::String
{
  return convertTypeNamesToAssignmentsHelper( tms, n, 0 );
}

function convertTypeNamesToAssignmentsHelper
Stmt ::= tms::[TypeName] n::String i::Integer
{
  return
    if null(tms) then nullStmt()
    else case head(tms) of
         | typeName(btw,mty) ->
             seqStmt(
               exprStmt(
                 binaryOpExpr(
                   memberExpr(
                     memberExpr(
                       memberExpr(
                         declRefExpr(
                           name("temp",location=builtIn()),location=builtIn()),
                         true,
                         name("contents",location=builtIn()),location=builtIn()),
                       false,
                       name(n,location=builtIn()),location=builtIn()),
                     false,
                     name("f"++toString(i),location=builtIn()),location=builtIn()),
                   assignOp(
                     eqOp(location=builtIn()),location=builtIn()),
                   declRefExpr(
                     name("f"++toString(i),location=builtIn()),location=builtIn()),location=builtIn())),
               convertTypeNamesToAssignmentsHelper( tail(tms), n, i+1 ))
         end;
}
-}

