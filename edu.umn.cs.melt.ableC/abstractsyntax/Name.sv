grammar edu:umn:cs:melt:ableC:abstractsyntax;

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
synthesized attribute labelLookupCheck :: [Message];
synthesized attribute tagLookupCheck :: [Message];

synthesized attribute valueItem :: Decorated ValueItem;
synthesized attribute labelItem :: Decorated LabelItem;
synthesized attribute tagItem :: Decorated TagItem;

nonterminal Name with location, name, pp, host<Name>, lifted<Name>, env, valueLocalLookup, labelRedeclarationCheck, valueLookupCheck, labelLookupCheck, tagLookupCheck, valueItem, labelItem, tagItem, tagLocalLookup, tagHasForwardDcl, tagRefId, valueRedeclarationCheck, valueRedeclarationCheckNoCompatible, valueMergeRedeclExtnQualifiers;
flowtype Name = decorate {env}, name {}, valueLocalLookup {env}, labelRedeclarationCheck {env}, valueLookupCheck {env}, labelLookupCheck {env}, tagLookupCheck {env}, valueItem {env}, labelItem {env}, tagItem {env}, tagLocalLookup {env}, tagHasForwardDcl {env}, tagRefId {env}, valueRedeclarationCheck {env}, valueRedeclarationCheckNoCompatible {env}, valueMergeRedeclExtnQualifiers {env};

synthesized attribute maybename :: Maybe<Name>;
synthesized attribute hasName :: Boolean;

nonterminal MaybeName with maybename, pp, host<MaybeName>, lifted<MaybeName>, env, valueLocalLookup, tagLocalLookup, tagHasForwardDcl, tagRefId, hasName, valueRedeclarationCheckNoCompatible, valueRedeclarationCheck, valueMergeRedeclExtnQualifiers;
flowtype MaybeName = decorate {env}, maybename {}, hasName {}, valueLocalLookup {env}, tagLocalLookup {env}, tagHasForwardDcl {env}, tagRefId {env}, valueRedeclarationCheckNoCompatible {env}, valueRedeclarationCheck {env}, valueMergeRedeclExtnQualifiers {env};

