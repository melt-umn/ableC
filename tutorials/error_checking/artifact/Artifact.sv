grammar artifact;

import edu:umn:cs:melt:ableC:concretesyntax as cst;
import edu:umn:cs:melt:ableC:drivers:compile;


parser extendedParser :: cst:Root {
  edu:umn:cs:melt:ableC:concretesyntax;
  edu:umn:cs:melt:tutorials:ableC:average;
} 

function main
IOVal<Integer> ::= args::[String] io_in::IO
{
  return driver(args, io_in, extendedParser);
}
