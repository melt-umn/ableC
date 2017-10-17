grammar edu:umn:cs:melt:ableC:monto;

import edu:umn:cs:melt:ableC:drivers:monto;
import edu:umn:cs:melt:ableC:host;

function main
IOVal<Integer> ::= args::[String] ioIn::IO
{
  return driver(args, ioIn, ablecParser);
}
