grammar edu:umn:cs:melt:ableC:testing;

import edu:umn:cs:melt:ableC:host;
import edu:umn:cs:melt:ableC:drivers:test;

function main
IOVal<Integer> ::= args::[String] io_in::IOToken
{
  return evalIO(driver(ablecParser, args), io_in);
}

