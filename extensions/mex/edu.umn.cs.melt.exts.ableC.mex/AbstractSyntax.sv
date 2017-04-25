grammar edu:umn:cs:melt:exts:ableC:mex;

imports edu:umn:cs:melt:ableC:abstractsyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;

imports silver:langutil;
imports silver:langutil:pp;

import edu:umn:cs:melt:exts:ableC:matrix as matrix;


abstract production mexExternalDecl
top::Decl ::= d::MexFunctionDecl
{
  forwards to 
    if null(d.errors) then
      functionDeclaration(d.ast)
    else
      warnDecl(d.errors);
}


global bogus :: Location = loc("?", -1,-1,-1,-1,-1,-1);

nonterminal MexFunctionDecl with ast<FunctionDecl>, env, errors;

abstract production mexFunction
top::MexFunctionDecl ::= out::MexOutputDecls  id::Name  inp::MexInputDecls  body::Stmt
{
  local mxarraytydef :: [ValueItem] = lookupValue("mxArray", top.env);
  
  top.errors := -- body gets its errors checks via what we forward to
    if !null(mxarraytydef) then out.errors ++ inp.errors else
      [err(id.location, "Matlab function declarations require <mex.h> from MATLAB to be in the include path.")];

  -- TODO: this needs to create an external file really.
  
  top.ast =
    functionDecl(
      [], [],
      directTypeExpr(builtinType([], voidType())), -- void
      functionTypeExprWithArgs(
        baseTypeExpr(),
        parameters,
        false),
      name("mexFunction", location=id.location),
      [],
      nilDecl(),
      -- new body consists of input decls, output decls, and then the old body and THEN output post ops:
      foldStmt(inp.ast ++ out.ast ++ [body] ++ out.postOps));

  local parameters :: Parameters = 
    foldParameterDecl([
      parameterDecl(
        [],
        directTypeExpr(builtinType([], signedType(intType()))),
        baseTypeExpr(),
        justName(name("nlhs", location=bogus)),
        []),
      parameterDecl(
        [],
        typedefTypeExpr([], name("mxArray", location=bogus)),
        arrayTypeExprWithoutExpr(
          pointerTypeExpr([], baseTypeExpr()),
          [], normalArraySize()),
        justName(name("plhs", location=bogus)),
        []),
      parameterDecl(
        [],
        directTypeExpr(builtinType([], signedType(intType()))),
        baseTypeExpr(),
        justName(name("nrhs", location=bogus)),
        []),
      parameterDecl(
        [],
        typedefTypeExpr([constQualifier()], name("mxArray", location=bogus)),
        arrayTypeExprWithoutExpr(
          pointerTypeExpr([], baseTypeExpr()),
          [], normalArraySize()),
        justName(name("prhs", location=bogus)),
        [])
      ]);
  
  out.index = 0;
  inp.index = 0;
}

nonterminal MexOutputDecls with env, ast<[Stmt]>, errors, index, postOps;
abstract production nilMexOutputDecl
top::MexOutputDecls ::=
{
  top.ast = [];
  top.errors := [];
  top.postOps = [];
}
abstract production consMexOutputDecl
top::MexOutputDecls ::= h::MexDecl  t::MexOutputDecls
{
  top.ast = h.outputTranslate ++ t.ast;
  h.index = top.index;
  h.isInput = false;
  t.index = top.index + 1;
  top.errors := h.errors ++ t.errors;
  top.postOps = h.postOps ++ t.postOps;
}


nonterminal MexInputDecls with env, ast<[Stmt]>, errors, index;
abstract production nilMexInputDecl
top::MexInputDecls ::=
{
  top.ast = [];
  top.errors := [];
}
abstract production consMexInputDecl
top::MexInputDecls ::= h::MexDecl  t::MexInputDecls
{
  top.ast = h.inputTranslate ++ t.ast;
  h.index = top.index;
  h.isInput = true;
  t.index = top.index + 1;
  top.errors := h.errors ++ t.errors;
}


synthesized attribute outputTranslate :: [Stmt];
synthesized attribute inputTranslate :: [Stmt];
inherited attribute index :: Integer;
inherited attribute isInput :: Boolean;

function myor
Boolean ::= l::Boolean r::Boolean
{ return l || r; }

function extractName
Maybe<Name> ::= e::Expr
{
  return case e of
  | declRefExpr(n) -> just(n)
  | _ -> nothing()
  end;
}
function zipFind
Expr ::= n::[Expr] m::[Maybe<a>]
{
  return if null(m) then error("oops")
  else if head(m).isJust then zipFind(tail(n), tail(m))
  else head(n);
}
function fJ
a ::= x::Maybe<a>
{
  return x.fromJust;
}


function oneVarDecl
Stmt ::= bty::BaseTypeExpr  mty::TypeModifierExpr  id::Name  init::MaybeInitializer
{
  return
    declStmt(
      variableDecls([], [], bty,
        foldDeclarator([
          declarator(id, mty, [], init)
        ])));
}

synthesized attribute postOps :: [Stmt];

nonterminal MexDecl with env, outputTranslate, inputTranslate, index, isInput, errors, postOps;
abstract production mexDecl
top::MexDecl ::= bty::BaseTypeExpr  mty::TypeModifierExpr  id::Name
{
  local tystring :: String = show(100, ppConcat([bty.pp, mty.lpp, mty.rpp]));

  top.errors := 
    if bty.mexTypeOkay && mty.mexTypeOkay then []
    else [err(id.location, "Unable to translate '" ++ tystring ++ "' to a matlab type")];
  
  top.errors <-
    if all_names || !top.isInput then []
    else [err(zipFind(dim_exprs, dim_mnames).location, "Expected identifier, not expression")];
  
  local baseType :: BuiltinType = bty.mexBaseType;
  local dim_exprs :: [Expr] = mty.mexDimensionExprs;
    local dim_mnames :: [Maybe<Name>] = map(extractName, dim_exprs);
    local all_names :: Boolean = foldr(myor, true, map((.isJust), dim_mnames));
  local dim_names :: [Name] = map(fJ, dim_mnames);
  -- scalars are vectors of length 1
  local expected_dimension :: Integer = if null(dim_exprs) then 1 else length(dim_exprs);
  
  local this_prhs :: Expr = 
    arraySubscriptExpr(var("prhs"), intv(top.index), location=bogus);
  local nrhs :: Expr = var("nrhs");
  local idx :: String = toString(top.index + 1); -- humans don't 0-index
  
  local name_dim :: Name = name(id.name ++ "__dimensions", location=id.location);
  local name_dat :: Name = name(id.name ++ "__data", location=id.location);
  
  top.inputTranslate = [
    -- Emit the check that ensures we have this argument
    ifStmt(
      binaryOpExpr(
        nrhs,
        compareOp(lteOp(location=bogus), location=bogus),
        intv(top.index),
        location=bogus),
      errcall("Missing parameter " ++ idx ++ " (" ++ id.name ++ ")"),
      nullStmt()),
    -- Type check what we're looking at
    ifStmt(
      binaryOpExpr(
        fcall("mxGetClassID", [this_prhs]),
        compareOp(notEqualsOp(location=bogus), location=bogus),
        var(baseType.mexTypeTranslation),
        location=bogus),
      errcall("Parameter " ++ idx ++ " expected type " ++ tystring),
      nullStmt()),
    ifStmt(
      fcall("mxIsComplex", [this_prhs]),
      errcall("Parameter " ++ idx ++ " is complex, not real."),
      nullStmt()),
    ifStmt(
      fcall("mxIsSparse", [this_prhs]),
      errcall("Parameter " ++ idx ++ " is sparse, not dense."),
      nullStmt())
    ] ++
    if null(dim_exprs) then [
      -- It's a scalar, so emit that checks that ensures this
      ifStmt(
        binaryOpExpr(
          fcall("mxGetNumberOfElements", [this_prhs]),
          compareOp(notEqualsOp(location=bogus), location=bogus),
          intv(1),
          location=bogus),
        errcall("Parameter " ++ idx ++ " is an array, not a scalar."),
        nullStmt()),
      -- Declare it!
      oneVarDecl(bty, mty, id, 
        justInitializer(exprInitializer(
          arraySubscriptExpr(
            parenExpr(
              explicitCastExpr(
                typeName(directTypeExpr(builtinType([], baseType)),
                  pointerTypeExpr([], baseTypeExpr())),
                fcall("mxGetData", [this_prhs]),
                location=bogus),
              location=bogus),
            intv(0),
            location=bogus))))
    ] else [
      -- It's a matrix / array / etc, so check that the number of dimensions is the expected number
      ifStmt(
        binaryOpExpr(
          fcall("mxGetNumberOfDimensions", [this_prhs]),
          compareOp(notEqualsOp(location=bogus), location=bogus),
          intv(length(mty.mexDimensionExprs)),
          location=bogus),
        errcall("Parameter " ++ idx ++ " expected to have dimension " ++ toString(length(mty.mexDimensionExprs))),
        nullStmt()),
      oneVarDecl(
        typedefTypeExpr([constQualifier()], name("mwSize", location=bogus)),
        pointerTypeExpr([], baseTypeExpr()),
        name_dim,
        justInitializer(exprInitializer(
          fcall("mxGetDimensions", [this_prhs])
          ))
      )
    ] ++ -- Please note that we're still in the 'else' branch here. i.e. not a scalar.
    assignDimensionName(name_dim, dim_names, 0) ++
    if length(dim_exprs) > 1 then [
      -- Declare a matrix as two values: (1) with __DATA as a pointer to the data
      oneVarDecl(
        directTypeExpr(builtinType([], baseType)),
        pointerTypeExpr([], baseTypeExpr()),
        name_dat,
        justInitializer(exprInitializer(
          explicitCastExpr(
            typeName(
              directTypeExpr(builtinType([], baseType)),
              pointerTypeExpr([], baseTypeExpr())),
            fcall("mxGetData", [this_prhs]),
            location=bogus)
          ))
      ),
      --  and (2) no suffix, the mxArray pointer directly
      oneVarDecl(
        typedefTypeExpr([constQualifier()], name("mxArray", location=bogus)),
        pointerTypeExpr([], baseTypeExpr()),
        id,
        justInitializer(exprInitializer(this_prhs))
      )      
    ] else [
      -- Declare an array directly as an array (er, well, pointer)
      oneVarDecl(
        directTypeExpr(builtinType([], baseType)),
        pointerTypeExpr([], baseTypeExpr()),
        id,
        justInitializer(exprInitializer(
          explicitCastExpr(
            typeName(
              directTypeExpr(builtinType([], baseType)),
              pointerTypeExpr([], baseTypeExpr())),
            fcall("mxGetData", [this_prhs]), location=bogus)
          ))
      )
    ];
  

  local nlhs :: Expr = var("nlhs");
  local this_plhs :: Expr = 
    arraySubscriptExpr(var("plhs"), intv(top.index), location=bogus);

  top.outputTranslate = 
    ( if top.index != 0 then
        -- If nlhs = 0, then we technically DO have an output variable (ans)
        -- so skip the "is there enough output vars" check for that.
        [
          ifStmt(
            binaryOpExpr(
              nlhs,
              compareOp(lteOp(location=bogus), location=bogus),
              intv(top.index),
              location=bogus),
            errcall("Missing output variable " ++ idx),
            nullStmt())
        ]
        else [] ) ++
    if !null(dim_exprs) then ([
      -- Declare the __dimensions value
      oneVarDecl(
        typedefTypeExpr([constQualifier()], name("mwSize", location=bogus)),
        arrayTypeExprWithExpr(
          baseTypeExpr(),
          [],
          normalArraySize(),
          intv(length(dim_exprs))),
        name_dim,
        justInitializer(objectInitializer(
          foldInit(map(init, map(exprInitializer, reverse(dim_exprs))))
          ))
      ),
      -- assign to the output a newly created mxArray
      exprStmt(binaryOpExpr(
        this_plhs,
        assignOp(eqOp(location=bogus), location=bogus),
        fcall("mxCreateNumericArray", [intv(length(dim_exprs)), declRefExpr(name_dim, location=name_dim.location), var(baseType.mexTypeTranslation), var("mxREAL")]),
        location=bogus))
    ] ++ if length(dim_exprs) == 1 then [
      -- For array, don't assign to __data, use id directly
      oneVarDecl(
        directTypeExpr(builtinType([], baseType)),
        pointerTypeExpr([], baseTypeExpr()),
        id,
        justInitializer(exprInitializer(
          explicitCastExpr(
            typeName(
              directTypeExpr(builtinType([], baseType)),
              pointerTypeExpr([], baseTypeExpr())),
            fcall("mxGetData", [this_plhs]),
            location=bogus)
          ))
      )
    ] else [
      -- For matrixes, assign to __data
      oneVarDecl(
        directTypeExpr(builtinType([], baseType)),
        pointerTypeExpr([], baseTypeExpr()),
        name_dat,
        justInitializer(exprInitializer(
          explicitCastExpr(
            typeName(
              directTypeExpr(builtinType([], baseType)),
              pointerTypeExpr([], baseTypeExpr())),
            fcall("mxGetData", [this_plhs]),
            location=bogus)
          ))
      ),
      -- AND make the id point to the mxArray
      oneVarDecl(
        typedefTypeExpr([constQualifier()], name("mxArray", location=bogus)),
        pointerTypeExpr([], baseTypeExpr()),
        id,
        justInitializer(exprInitializer(this_plhs))
      )      
    ]) else [ -- for scalars:
      -- Define the __dimensions value
      oneVarDecl(
        typedefTypeExpr([constQualifier()], name("mwSize", location=bogus)),
        arrayTypeExprWithExpr(
          baseTypeExpr(),
          [],
          normalArraySize(),
          intv(1)),
        name_dim,
        justInitializer(objectInitializer(
          foldInit(map(init, map(exprInitializer, [intv(1)])))
          ))
      ),
      -- Create the scalar array
      exprStmt(binaryOpExpr(
        this_plhs,
        assignOp(eqOp(location=bogus), location=bogus),
        fcall("mxCreateNumericArray", [intv(1), declRefExpr(name_dim, location=name_dim.location), var(baseType.mexTypeTranslation), var("mxREAL")]),
        location=bogus)),
      -- Make __data point to the value in the array
      oneVarDecl(
        directTypeExpr(builtinType([], baseType)),
        pointerTypeExpr([], baseTypeExpr()),
        name_dat,
        justInitializer(exprInitializer(
          explicitCastExpr(
            typeName(
              directTypeExpr(builtinType([], baseType)),
              pointerTypeExpr([], baseTypeExpr())),
            fcall("mxGetData", [this_plhs]),
            location=bogus)
          ))
      ),
      -- Declare the single variable
      oneVarDecl(
        directTypeExpr(builtinType([], baseType)),
        baseTypeExpr(),
        id,
        nothingInitializer()
      )
    ];

  top.postOps = 
    if !null(dim_exprs) then []
    else
      [
      exprStmt(binaryOpExpr(
        arraySubscriptExpr(
          declRefExpr(name_dat, location=name_dim.location),
          intv(0),
          location=bogus),
        assignOp(eqOp(location=bogus), location=bogus),
        declRefExpr(id, location=name_dim.location),
        location=bogus))
      ];

{-
if length == 0 :

mwSize NAME__dimensions[1] = {1};
this_plhs = mxCreateNumericArray(1, NAME__dimensions, baseType.mexTypeTranslation, mxReal)
TYPE * NAME__data = (TYPE *)mxGetData(this_plhs);
TYPE NAME;
(insert post op: NAME__data[0] = NAME;
-}

}

function assignDimensionName
[Stmt] ::= name_dim::Name  n::[Name]  i::Integer
{
  return if null(n) then []
  else assign :: assignDimensionName(name_dim, tail(n), i+1);
 
  --const mwSize M = *NAME__dimensions[0]
  local assign :: Stmt =
    oneVarDecl(
      typedefTypeExpr([constQualifier()], name("mwSize", location=bogus)),
      baseTypeExpr(),
      head(n),
      justInitializer(exprInitializer(
          arraySubscriptExpr(
            declRefExpr(name_dim, location=name_dim.location),
            intv(i), location=bogus)
        ))
    );
   
}

abstract production mexDeclDefaulted
top::MexDecl ::= bty::BaseTypeExpr  mty::TypeModifierExpr  id::Name  e::Expr
{
  top.errors := [err(id.location, "Default values for arguments are not yet supported.")];

  top.inputTranslate = error("not possible");
  top.outputTranslate = error("not possible");
  top.postOps = error("not possible");
}


function var
Expr ::= s::String
{
  return declRefExpr(name(s, location=bogus), location=bogus);
}
function fcall
Expr ::= s::String  e::[Expr]
{
  return callExpr(var(s), foldExpr(e), location=bogus);
}
function intv
Expr ::= i::Integer
{
  return realConstant(integerConstant(toString(i), false, noIntSuffix(), location=bogus), location=bogus);
}
function errcall
Stmt ::= s::String
{
  return exprStmt(fcall("mexErrMsgTxt", [stringLiteral("\"" ++ s ++ "\"", location=bogus)]));
}

-----------------------------------------------------------------------------


aspect production matrix:matrixIndex
top::Expr ::= m::Name  i::[Expr]
{
  local tydef :: [ValueItem] = lookupValue("mxArray", top.env);
  
  overrides <-
    if !null(tydef) &&
       compatibleTypes(m.valueItem.typerep, pointerType([], head(tydef).typerep), true)
    then [mexIndex(m, i, location=top.location)]
    else [];
}

abstract production mexIndex
top::Expr ::= id::Name  ind::[Expr]
{
  -- id__data[ind[0] + id__dimensions[0]*(ind[1] + id__dimesnions[1]*(0))]
  local name_data :: Expr = var(id.name ++ "__data");
  local name_dim :: Expr = var(id.name ++ "__dimensions");
  
  forwards to 
    arraySubscriptExpr(
      name_data,
      multiplyDimensions(ind, name_dim, 0),
      location=bogus);
}

function multiplyDimensions
Expr ::= ind::[Expr]  id_dim::Expr  index::Integer
{
  return if null(ind) then intv(0)
  else parenExpr(
         binaryOpExpr(
           head(ind),
           numOp(addOp(location=bogus), location=bogus),
           binaryOpExpr(
             arraySubscriptExpr(
               id_dim,
               intv(index),
               location=bogus),             
             numOp(mulOp(location=bogus), location=bogus),
             multiplyDimensions(tail(ind), id_dim, index+1),
             location=bogus
           ),
           location=bogus
         ),
         location=bogus);
}



-------------

function foldMexInputDecl
MexInputDecls ::= l::[MexDecl]
{
  return foldr(consMexInputDecl, nilMexInputDecl(), l);
}
function foldMexOutputDecl
MexOutputDecls ::= l::[MexDecl]
{
  return foldr(consMexOutputDecl, nilMexOutputDecl(), l);
}

------------------------------

-- Typechecking isn't in place yet, so we have to do this syntactically

synthesized attribute mexTypeOkay :: Boolean;
synthesized attribute mexDimensionExprs :: [Expr];
synthesized attribute mexBaseType :: BuiltinType;

attribute mexTypeOkay, mexBaseType occurs on BaseTypeExpr;
attribute mexTypeOkay, mexDimensionExprs occurs on TypeModifierExpr;

aspect default production
top::BaseTypeExpr ::=
{
  top.mexTypeOkay = false;
  top.mexBaseType = error("not possible");
}
aspect default production
top::TypeModifierExpr ::=
{
  top.mexTypeOkay = false;
  top.mexDimensionExprs = error("not possible");
}


aspect production directTypeExpr
top::BaseTypeExpr ::= result::Type
{
  top.mexTypeOkay =
    case result of
    | builtinType([], bt) -> bt.mexTypeOkay
    | _ -> false
    end;
  top.mexBaseType =
    case result of
    | builtinType([], bt) -> bt
    | _ -> error("not possible")
    end;
}
aspect production arrayTypeExprWithExpr
top::TypeModifierExpr ::= element::TypeModifierExpr  indexQualifiers::[Qualifier]  sizeModifier::ArraySizeModifier  size::Expr
{
  top.mexTypeOkay = element.mexTypeOkay;
  top.mexDimensionExprs = element.mexDimensionExprs ++ [size];
}
aspect production baseTypeExpr
top::TypeModifierExpr ::=
{
  top.mexTypeOkay = true;
  top.mexDimensionExprs = [];
}


------------

synthesized attribute mexTypeTranslation :: String;

attribute mexTypeOkay, mexTypeTranslation occurs on BuiltinType;

aspect default production
top::BuiltinType ::=
{
  top.mexTypeTranslation = error("not possible");
  top.mexTypeOkay = false;
}

aspect production realType
top::BuiltinType ::= rt::RealType
{
  top.mexTypeTranslation = rt.mexTypeTranslation;
  top.mexTypeOkay = true;
}
aspect production signedType
top::BuiltinType ::= it::IntegerType
{
  top.mexTypeTranslation = it.mexTypeTranslation;
  top.mexTypeOkay = true;
}
aspect production unsignedType
top::BuiltinType ::= it::IntegerType
{
  top.mexTypeTranslation = substitute("INT", "UINT", it.mexTypeTranslation);
  top.mexTypeOkay = true;
}

attribute mexTypeTranslation occurs on RealType;

aspect production floatType
top::RealType ::=
{
  top.mexTypeTranslation = "mxSINGLE_CLASS";
}
aspect production doubleType
top::RealType ::=
{
  top.mexTypeTranslation = "mxDOUBLE_CLASS";
}
aspect production longdoubleType
top::RealType ::=
{
  top.mexTypeTranslation = error("whoopsie");
}

attribute mexTypeTranslation occurs on IntegerType;

aspect production charType
top::IntegerType ::=
{
  top.mexTypeTranslation = "mxINT8_CLASS";
}
aspect production shortType
top::IntegerType ::=
{
  top.mexTypeTranslation = "mxINT16_CLASS";
}
aspect production intType
top::IntegerType ::=
{
  top.mexTypeTranslation = "mxINT32_CLASS";
}
aspect production longType
top::IntegerType ::=
{
  top.mexTypeTranslation = "mxINT32_CLASS";
}
aspect production longlongType
top::IntegerType ::=
{
  top.mexTypeTranslation = "mxINT64_CLASS";
}
aspect production int128Type
top::IntegerType ::=
{
  top.mexTypeTranslation = error("whoopsie");
}

