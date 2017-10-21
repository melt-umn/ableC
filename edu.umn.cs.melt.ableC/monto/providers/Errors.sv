grammar edu:umn:cs:melt:ableC:monto:providers;

import edu:umn:cs:melt:ableC:abstractsyntax as abs;
import edu:umn:cs:melt:ableC:abstractsyntax:env;
import edu:umn:cs:melt:ableC:concretesyntax as cst;
import silver:json;
import silver:langutil;
import silver:support:monto;
import silver:support:monto:products;
import silver:support:monto:utils;

function mkErrorProvider
ServiceProvider ::= parse::(ParseResult<cst:Root> ::= String String)
{
  local desc :: ProductDescriptor = productDescriptor("edu.umn.cs.melt.ablec.errors", "c");
  return serviceProvider(desc, processErrorProduct(parse, _, _));
}

function processErrorProduct
Pair<Either<[ServiceError] Product> [ServiceNotice]> ::= parse::(ParseResult<cst:Root> ::= String String) path::String deps::[Product]
{
  local srcIdent :: ProductIdentifier = productIdentifier("edu.umn.cs.melt.preprocessed_source", "c", path);

  local r :: Either<[ServiceError] Product> = case mapMaybe((.json), mapMaybe((.productValue), getProduct(srcIdent, deps))) of
    | just(jsonString(src)) -> right(extractAllErrors(parse, src, path))
    | _ -> left([errorUnmetDependency(srcIdent)])
  end;

  return pair(r, []);
}

function extractAllErrors
Product ::= parse::(ParseResult<cst:Root> ::= String String) src::String path::String
{
  local result :: ParseResult<cst:Root> = parse(src, path);

  local errs :: [Json] = if result.parseSuccess then
    extractSemanticErrors(result.parseTree, path)
  else
    extractParseErrors(result, path);

  return product(productValue("edu.umn.cs.melt.ablec.errors", jsonArray(errs)), [], "c", path);
}

function extractParseErrors
[Json] ::= result::ParseResult<cst:Root> path::String
{
  return if !result.parseSuccess then
    case result.parseError of
    | syntaxError(s, l, _, _) -> if l.filename == path then
        [jsonObject(
          [ pair("start_col", jsonInteger(l.column))
          , pair("start_line", jsonInteger(l.line))
          , pair("end_col", jsonInteger(l.endColumn))
          , pair("end_line", jsonInteger(l.endLine))
          , pair("message", jsonString(s))
          , pair("severity", severityError().json)
          ])]
      else
        []
    | _ -> error("TODO")
    end
  else
    [];
}

function extractSemanticErrors
[Json] ::= tree::cst:Root path::String
{
  local errs :: [Message] =
    (decorate abs:compilation(tree.ast) with {
      env = emptyEnv();
    }).errors;
  return map(\m::Message -> jsonObject(
    [ pair("start_col", jsonInteger(m.where.column))
    , pair("start_line", jsonInteger(m.where.line))
    , pair("end_col", jsonInteger(m.where.endColumn))
    , pair("end_line", jsonInteger(m.where.endLine))
    , pair("message", jsonString(m.output))
    , pair("severity", (case m.severity of
      | 0 -> severityInfo()
      | 1 -> severityWarning()
      | _ -> severityError()
      end).json)
    ]), filter(\m::Message -> m.where.filename == path, errs));
}
