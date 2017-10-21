{- A Monto service for ableC.

  The only argument is the port to serve on.

 -}

grammar edu:umn:cs:melt:ableC:drivers:monto;

import edu:umn:cs:melt:ableC:concretesyntax as cst;
import edu:umn:cs:melt:ableC:monto:providers;
import silver:json;
import silver:support:monto; 
import silver:support:monto:negotiation; 
import silver:support:monto:products; 
import silver:support:monto:utils; 

function driver
IOVal<Integer> ::= args::[String] ioIn::IO parse::(ParseResult<cst:Root> ::= String String)
{
  local port :: Integer =
    if listLength(args) == 1 then
      toInt(head(args))
    else
      error("Usage: <ableC-monto invocation> <port>");

  local version :: SoftwareVersion =
    softwareVersion(
      "edu.umn.cs.melt.ableC.drivers.monto",
      -- TODO: Give values here.
      nothing(),
      nothing(),
      nothing(),
      nothing(),
      nothing());
  local providers :: [ServiceProvider] =
    [ mkErrorProvider(parse)
    , mkHighlightingProvider(parse, colorize)
    ];

  local svc :: Service = simpleService(version, providers);
  return ioval(runService(svc, port, ioIn), 0);
}


function colorize
Maybe<Color> ::= td::TerminalDescriptor
{
  local n :: String = td.terminalName;
  return if startsWith("edu:umn:cs:melt:ableC:concretesyntax", n) then
    just(paletteColor(0))
  else
    unsafeTrace(nothing(), print("unknown terminal: " ++ n ++ "\n", unsafeIO()));
}
