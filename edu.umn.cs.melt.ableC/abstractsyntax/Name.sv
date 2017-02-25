grammar edu:umn:cs:melt:ableC:abstractsyntax;

synthesized attribute name :: String;

synthesized attribute labelRedeclarationCheck :: [Message];

synthesized attribute valueLocalLookup :: [ValueItem];
synthesized attribute valueRedeclarationCheck :: ([Message] ::= Type);
synthesized attribute valueRedeclarationCheckNoCompatible :: [Message];

synthesized attribute tagLocalLookup :: [TagItem];
synthesized attribute tagHasForwardDcl :: Boolean;
synthesized attribute tagRefId :: String;

synthesized attribute valueLookupCheck :: [Message];
synthesized attribute labelLookupCheck :: [Message];
synthesized attribute tagLookupCheck :: [Message];

synthesized attribute valueItem :: Decorated ValueItem;
synthesized attribute labelItem :: Decorated LabelItem;
synthesized attribute tagItem :: Decorated TagItem;

nonterminal Name with location, name, pp, host<Name>, lifted<Name>, env, valueLocalLookup, labelRedeclarationCheck, valueLookupCheck, labelLookupCheck, tagLookupCheck, valueItem, labelItem, tagItem, tagLocalLookup, tagHasForwardDcl, tagRefId, valueRedeclarationCheck, valueRedeclarationCheckNoCompatible;--

abstract production name
top::Name ::= n::String
{
  propagate host, lifted;
  
  top.name = n;
  top.pp = text(n);
  
  top.valueLocalLookup = lookupValueInLocalScope(n, top.env);
  top.valueRedeclarationCheck = doValueRedeclarationCheck(_, top);
  top.valueRedeclarationCheckNoCompatible = doValueRedeclarationCheckNoCompatible(top);
  
  top.tagLocalLookup = lookupTagInLocalScope(n, top.env);
  local refIdIfOld :: Maybe<String> =
    case top.tagLocalLookup of
    | refIdTagItem(_, thisRefID) :: _ -> just(thisRefID)
    | _ -> nothing()
    end;
  top.tagHasForwardDcl = refIdIfOld.isJust;
  top.tagRefId = fromMaybe(toString(genInt()), refIdIfOld);
  
  local labdcls :: [LabelItem] = lookupLabelInLocalScope(n, top.env);
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

synthesized attribute maybename :: Maybe<Name>;
synthesized attribute hasName :: Boolean;

nonterminal MaybeName with maybename, pp, host<MaybeName>, lifted<MaybeName>, env, valueLocalLookup, tagLocalLookup, tagHasForwardDcl, tagRefId, hasName, valueRedeclarationCheckNoCompatible, valueRedeclarationCheck;

abstract production justName
top::MaybeName ::= n::Name
{
  propagate host, lifted;
  top.pp = n.pp;
  top.maybename = just(n);
  top.hasName = true;

  top.valueRedeclarationCheck = n.valueRedeclarationCheck;
  top.valueRedeclarationCheckNoCompatible = n.valueRedeclarationCheckNoCompatible;
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
      if compatibleTypes(t, v.typerep, true) -- TODO: not sure about this, but I think its safe to ignore qualifiers? (certainly sometimes okay. e.g. "int foo(int) and int foo(const int)" is okay and foo is assumed const.
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

