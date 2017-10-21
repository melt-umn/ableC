grammar edu:umn:cs:melt:ableC:monto:providers;

import edu:umn:cs:melt:ableC:abstractsyntax as abs;
import edu:umn:cs:melt:ableC:abstractsyntax:env;
import edu:umn:cs:melt:ableC:concretesyntax as cst;
import silver:json;
import silver:langutil;
import silver:support:monto;
import silver:support:monto:products;
import silver:support:monto:utils;

function mkHighlightingProvider
ServiceProvider ::= parse::(ParseResult<cst:Root> ::= String String) colorize::(Maybe<Color> ::= TerminalDescriptor)
{
  local desc :: ProductDescriptor = productDescriptor("edu.umn.cs.melt.ablec.highlighting", "c");
  return serviceProvider(desc, processHighlightingProduct(parse, colorize, _, _));
}

function processHighlightingProduct
Pair<Either<[ServiceError] Product> [ServiceNotice]> ::= parse::(ParseResult<cst:Root> ::= String String) colorize::(Maybe<Color> ::= TerminalDescriptor) path::String deps::[Product]
{
  local srcIdent :: ProductIdentifier = productIdentifier("edu.umn.cs.melt.preprocessed_source", "c", path);

  local r :: Either<[ServiceError] Product> = case mapMaybe((.json), mapMaybe((.productValue), getProduct(srcIdent, deps))) of
    | just(jsonString(src)) -> right(extractHighlightingTokens(parse, colorize, src, path))
    | _ -> left([errorUnmetDependency(srcIdent)])
  end;

  return pair(r, []);
}

function extractHighlightingTokens
Product ::= parse::(ParseResult<cst:Root> ::= String String) colorize::(Maybe<Color> ::= TerminalDescriptor) src::String path::String
{
  local terminals :: [TerminalDescriptor] = parse(src, path).parseTerminals;
  local toks :: [Json] = catMaybes(map(makeHighlightingToken(_, colorize), terminals));

  return product(productValue("edu.umn.cs.melt.ablec.highlighting", jsonArray(toks)), [], "c", path);
}

function makeHighlightingToken
Maybe<Json> ::= td::TerminalDescriptor colorize::(Maybe<Color> ::= TerminalDescriptor)
{
  return case colorize(td) of
  | just(color) -> just(jsonObject(
      [ pair("start_col", jsonInteger(td.terminalLocation.column))
      , pair("start_line", jsonInteger(td.terminalLocation.line))
      , pair("end_col", jsonInteger(td.terminalLocation.endColumn))
      , pair("end_line", jsonInteger(td.terminalLocation.endLine))
      , pair("color", color.json)
      ]))
  | nothing() -> nothing()
  end;
}
