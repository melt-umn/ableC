grammar edu:umn:cs:melt:ableC:abstractsyntax:host;

synthesized attribute name :: String;

synthesized attribute labelRedeclarationCheck :: [Message];

synthesized attribute valueLocalLookup :: [ValueItem];
synthesized attribute valueRedeclarationCheck :: ([Message] ::= Type);
synthesized attribute valueRedeclarationCheckNoCompatible :: [Message];
synthesized attribute valueMergeRedeclExtnQualifiers :: (Type ::= Type);

synthesized attribute tagLocalLookup :: [TagItem];
synthesized attribute tagHasForwardDcl :: Boolean;
synthesized attribute tagRefId :: String;

synthesized attribute valueLookupCheck :: [Message];
synthesized attribute tagLookupCheck :: [Message];
synthesized attribute labelLookupCheck :: [Message];

restricted synthesized attribute valueItem :: ValueItem;
restricted synthesized attribute tagItem :: TagItem;
restricted synthesized attribute labelItem :: LabelItem;

tracked nonterminal Name with name, compareTo, isEqual, pp, host, env, valueLocalLookup, labelRedeclarationCheck, valueLookupCheck, tagLookupCheck, labelLookupCheck, valueItem, tagItem, labelItem, tagLocalLookup, tagHasForwardDcl, tagRefId, valueRedeclarationCheck, valueRedeclarationCheckNoCompatible, valueMergeRedeclExtnQualifiers, controlStmtContext;
flowtype Name = decorate {env}, name {}, host {}, valueLocalLookup {env}, labelRedeclarationCheck {controlStmtContext}, valueLookupCheck {env}, tagLookupCheck {env}, labelLookupCheck {controlStmtContext}, valueItem {env}, tagItem {env}, labelItem {controlStmtContext}, tagLocalLookup {env}, tagHasForwardDcl {env}, tagRefId {env}, valueRedeclarationCheck {decorate}, valueRedeclarationCheckNoCompatible {decorate}, valueMergeRedeclExtnQualifiers {decorate};

abstract production name
top::Name ::= n::String
{
  propagate host, compareTo, isEqual;
  
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
  
  local labdcls :: [LabelItem] = lookupLabel(n, top.controlStmtContext);
  top.labelRedeclarationCheck =
    case labdcls of
    | [] -> [errFromOrigin(top, "INTERNAL compiler error: expected to find label in function scope, was missing.")] -- TODO?
    | [_] -> [] -- We found ourselves. Labels are in function scope, so a-okay!
    | _ :: _ :: _ -> [errFromOrigin(top, "Redeclaration of " ++ n)]
    end;
  
  local values :: [ValueItem] = lookupValue(n, top.env);
  local tags :: [TagItem] = lookupTag(n, top.env);
  local labels :: [LabelItem] = lookupLabel(n, top.controlStmtContext);
  top.valueLookupCheck =
    case values of
    | [] -> [errFromOrigin(top, "Undeclared value " ++ n)]
    | _ :: _ -> []
    end;
  top.labelLookupCheck =
    case labels of
    | [] -> [errFromOrigin(top, "Undeclared label " ++ n)]
    | _ :: _ -> []
    end;
  top.tagLookupCheck =
    case tags of
    | [] -> [errFromOrigin(top, "Undeclared tag " ++ n)]
    | _ :: _ -> []
    end;
  
  local value :: ValueItem = if null(values) then errorValueItem() else head(values);
  local tag :: TagItem = if null(tags) then errorTagItem() else head(tags);
  local label :: LabelItem = if null(labels) then errorLabelItem() else head(labels);
  
  top.valueItem = value;
  top.tagItem = tag;
  top.labelItem = label;
}

inherited attribute anonTagRefId::String;
synthesized attribute maybename :: Maybe<Name>;
synthesized attribute hasName :: Boolean;

tracked nonterminal MaybeName with maybename, pp, host, env, valueLocalLookup, tagLocalLookup, tagHasForwardDcl, anonTagRefId, tagRefId, hasName, valueRedeclarationCheckNoCompatible, valueRedeclarationCheck, valueMergeRedeclExtnQualifiers;
flowtype MaybeName = decorate {env}, maybename {}, hasName {}, host {}, valueLocalLookup {env}, tagLocalLookup {env}, tagHasForwardDcl {env}, tagRefId {anonTagRefId, env}, valueRedeclarationCheckNoCompatible {decorate}, valueRedeclarationCheck {decorate}, valueMergeRedeclExtnQualifiers {decorate};

abstract production justName
top::MaybeName ::= n::Name
{
  propagate env, host;
  top.pp = n.pp;
  top.maybename = just(^n);
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
  propagate host;
  top.pp = notext();
  top.maybename = nothing();
  top.hasName = false;

  top.valueRedeclarationCheck = doNotDoValueRedeclarationCheck;
  top.valueRedeclarationCheckNoCompatible = [];
  top.valueMergeRedeclExtnQualifiers = \t::Type -> errorType();

  top.valueLocalLookup = [];
  top.tagLocalLookup = [];
  top.tagHasForwardDcl = false;
  top.tagRefId = top.anonTagRefId;
}

synthesized attribute names :: [String];

inherited attribute appendedNames :: Names;
synthesized attribute appendedNamesRes :: Names;

tracked nonterminal Names with env, pps, names, count, valueRedeclarationCheck, valueRedeclarationCheckNoCompatible, appendedNames, appendedNamesRes;
flowtype Names = decorate {env}, pps {}, names {}, count {}, valueRedeclarationCheck {decorate}, valueRedeclarationCheckNoCompatible {decorate}, appendedNamesRes {appendedNames};

propagate env on Names;

abstract production consName
top::Names ::= h::Name t::Names
{
  top.pps = h.pp :: t.pps;
  top.names = h.name :: t.names;
  top.count = 1 + t.count;
  top.valueRedeclarationCheck = \ ty -> h.valueRedeclarationCheck(ty) ++ t.valueRedeclarationCheck(ty);
  top.valueRedeclarationCheckNoCompatible = h.valueRedeclarationCheckNoCompatible ++ t.valueRedeclarationCheckNoCompatible;
  t.appendedNames = top.appendedNames;
  top.appendedNamesRes = consName(^h, t.appendedNamesRes);
}

abstract production nilName
top::Names ::=
{
  top.pps = [];
  top.names = [];
  top.count = 0;
  top.valueRedeclarationCheck = \ _ -> [];
  top.valueRedeclarationCheckNoCompatible = [];
  top.appendedNamesRes = top.appendedNames;
}

function appendNames
Names ::= e1::Names e2::Names
{
  e1.appendedNames = ^e2;
  return e1.appendedNamesRes;
}

fun freshName Name ::= n::String = name(s"_${n}_${toString(genInt())}");
fun freshNames Names ::= i::Integer n::String =
  if i == 0 then nilName()
  else consName(freshName(n ++ toString(i)), freshNames(i - 1, n));

fun doNotDoValueRedeclarationCheck [Message] ::= t::Type = [];
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
            [errFromOrigin(n, 
              "Redeclaration of " ++ n.name ++ " with incompatible types. Original (from " ++
              getParsedOriginLocationOrFallback(v).unparse ++ ") " ++ originalPP ++
              " but here it is " ++ herePP)]
        end
  end;
}

fun doValueRedeclarationCheckNoCompatible [Message] ::= n::Decorated Name =
  case n.valueLocalLookup of
  | [] -> []
  | v :: _ -> 
      [errFromOrigin(n, 
        "Redeclaration of " ++ n.name ++ ". Original (from " ++
        getParsedOriginLocationOrFallback(v).unparse ++ ")")]
  end;

fun doValueMergeQualifiers Type ::= t::Type  n::Decorated Name =
  foldr(\t1::Type t2::Type -> t2.mergeQualifiers(t1), t, map((.typerep), n.valueLocalLookup));

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
--            [errFromOrigin(n, 
--              "Redeclaration of " ++ n.name ++ " with incompatible types. Original (from line " ++
--              toString(v.sourceLocation.line) ++ ") " ++ originalPP ++ 
--              " but here it is " ++ herePP)]
--        end
--  end;
--}

