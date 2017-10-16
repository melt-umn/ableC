grammar edu:umn:cs:melt:ableC:abstractsyntax:host;

abstract production name
top::Name ::= n::String
{
  propagate host, lifted;
  
  top.name = n;
  top.pp = text(n);
  
  top.valueLocalLookup = lookupValueInLocalScope(n, top.env);
  top.valueRedeclarationCheck = doValueRedeclarationCheck(_, top);
  top.valueRedeclarationCheckNoCompatible = doValueRedeclarationCheckNoCompatible(top);
  top.valueMergeRedeclExtnQualifiers = doValueMergeQualifiers(_, top);
  
  top.tagLocalLookup = lookupTagInLocalScope(n, top.env);
  local refIdIfOld :: Maybe<String> =
    case top.tagLocalLookup of
    | refIdTagItem(_, thisRefID) :: _ -> just(thisRefID)
    | _ -> nothing()
    end;
  top.tagHasForwardDcl = refIdIfOld.isJust;
  top.tagRefId = fromMaybe(toString(genInt()), refIdIfOld);
  
  local labdcls :: [LabelItem] = lookupLabel(n, top.env);
  top.labelRedeclarationCheck =
    case labdcls of
    | [] -> [err(top.location, "INTERNAL compiler error: expected to find label in function scope, was missing.")] -- TODO?
    | [_] -> [] -- We found ourselves. Labels are in function scope, so a-okay!
    | _ :: _ :: _ -> [err(top.location, "Redeclaration of " ++ n)]
    end;
  
  local values :: [ValueItem] = lookupValue(n, top.env);
  local tags :: [TagItem] = lookupTag(n, top.env);
  local labels :: [LabelItem] = lookupLabel(n, top.env);
  top.valueLookupCheck =
    case values of
    | [] -> [err(top.location, "Undeclared value " ++ n)]
    | _ :: _ -> []
    end;
  top.labelLookupCheck =
    case labels of
    | [] -> [err(top.location, "Undeclared label " ++ n)]
    | _ :: _ -> []
    end;
  top.tagLookupCheck =
    case tags of
    | [] -> [err(top.location, "Undeclared tag " ++ n)]
    | _ :: _ -> []
    end;
  
  local value :: ValueItem = if null(values) then errorValueItem() else head(values);
  local tag :: TagItem = if null(tags) then errorTagItem() else head(tags);
  local label :: LabelItem = if null(labels) then errorLabelItem() else head(labels);
  
  top.valueItem = value;
  top.tagItem = tag;
  top.labelItem = label;
}

abstract production justName
top::MaybeName ::= n::Name
{
  propagate host, lifted;
  top.pp = n.pp;
  top.maybename = just(n);
  top.hasName = true;

  top.valueRedeclarationCheck = n.valueRedeclarationCheck;
  top.valueRedeclarationCheckNoCompatible = n.valueRedeclarationCheckNoCompatible;
  top.valueMergeRedeclExtnQualifiers = n.valueMergeRedeclExtnQualifiers;
  top.valueLocalLookup = n.valueLocalLookup;
  top.tagLocalLookup = n.tagLocalLookup;
  top.tagHasForwardDcl = n.tagHasForwardDcl;
  top.tagRefId = n.tagRefId;
}
abstract production nothingName
top::MaybeName ::=
{
  propagate host, lifted;
  top.pp = notext();
  top.maybename = nothing();
  top.hasName = false;

  top.valueRedeclarationCheck = doNotDoValueRedeclarationCheck;
  top.valueRedeclarationCheckNoCompatible = [];
  top.valueMergeRedeclExtnQualifiers = \t::Type -> errorType();

  top.valueLocalLookup = [];
  top.tagLocalLookup = [];
  top.tagHasForwardDcl = false;
  top.tagRefId = toString(genInt());
}

function doNotDoValueRedeclarationCheck
[Message] ::= t::Type
{
  return [];
}
function doValueRedeclarationCheck
[Message] ::= t::Type  n::Decorated Name
{
  return case n.valueLocalLookup of
  | [] -> []
  | v :: _ -> 
      if compatibleTypes(t.withoutExtensionQualifiers, v.typerep.withoutExtensionQualifiers, false, false)
      then []
      else 
        let originalPP :: String = show(100, cat(v.typerep.lpp, v.typerep.rpp)),
            herePP :: String = show(100, cat(t.lpp, t.rpp))
         in
            [err(n.location, 
              "Redeclaration of " ++ n.name ++ " with incompatible types. Original (from line " ++
              toString(v.sourceLocation.line) ++ ") " ++ originalPP ++ 
              " but here it is " ++ herePP)]
        end
  end;
}

function doValueRedeclarationCheckNoCompatible
[Message] ::= n::Decorated Name
{
  return case n.valueLocalLookup of
  | [] -> []
  | v :: _ -> 
      [err(n.location, 
        "Redeclaration of " ++ n.name ++ ". Original (from line " ++
        toString(v.sourceLocation.line) ++ ")")]
  end;
}

function doValueMergeQualifiers
Type ::= t::Type  n::Decorated Name
{
  return foldr(\t1::Type t2::Type -> t2.mergeQualifiers(t1), t, map((.typerep), n.valueLocalLookup));
}

--  return
--    if null(valueLookup)
--    then t
--    else mergeRedeclarationExtnQuals
--
--  return case n.valueLocalLookup of
--  | [] -> []
--  | v :: _ -> 
--      if compatibleTypes(t.withoutExtensionQualifiers, v.typerep.withoutExtensionQualifiers, false, false)
--      then []
--      else 
--        let originalPP :: String = show(100, cat(v.typerep.lpp, v.typerep.rpp)),
--            herePP :: String = show(100, cat(t.lpp, t.rpp))
--         in
--            [err(n.location, 
--              "Redeclaration of " ++ n.name ++ " with incompatible types. Original (from line " ++
--              toString(v.sourceLocation.line) ++ ") " ++ originalPP ++ 
--              " but here it is " ++ herePP)]
--        end
--  end;
--}

