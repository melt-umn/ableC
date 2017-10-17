grammar edu:umn:cs:melt:ableC:monto:providers;

import edu:umn:cs:melt:ableC:abstractsyntax as abs;
import edu:umn:cs:melt:ableC:concretesyntax as cst;
import silver:json;
import silver:langutil;
import silver:support:monto;
import silver:support:monto:products;
import silver:support:monto:utils;

function mkErrorProvider
ServiceProvider ::= parse::(ParseResult<cst:Root> ::= String String)
{
  local desc :: ProductDescriptor = productDescriptor("errors", "c");
  return serviceProvider(desc, processErrorProduct(parse, _, _));
}

function processErrorProduct
Pair<Either<[ServiceError] Product> [ServiceNotice]> ::= parse::(ParseResult<cst:Root> ::= String String) path::String deps::[Product]
{
  local srcIdent :: ProductIdentifier = productIdentifier("edu.umn.cs.melt.preprocessed_source", "c", path);
  return case mapMaybe((.json), mapMaybe((.productValue), getProduct(srcIdent, deps))) of
    | just(jsonString(src)) -> let
        result :: ParseResult<cst:Root> = parse(src, path)
      in if !result.parseSuccess then
        case result.parseError of
          | syntaxError(s, l, _, _) -> let
            err :: Error = byteRangeError(
              l.index,
              l.endIndex,
              s, severityError())
          in
            pair(right(product(errorsProduct([err]), [], "c", path)), [])
          end
          | _ -> error("TODO")
        end
      else let
        errs :: [Error] = map(messageError, result.parseTree.ast.errors)
      in
        pair(right(product(errorsProduct(errs), [], "c", path)), [])
      end end
    | _ -> pair(left([errorUnmetDependency(srcIdent)]), [])
  end;
}
