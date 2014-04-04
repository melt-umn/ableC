/* This is a modified file of containing basically what ableC
 * generates for test1.xc.  Includes are put back in and a few bugs in
 * the C pretty print are fixed manually.
 */

#include <stdio.h>
#include <stdlib.h>
#include <regex.h>


regex_t makeRegex(const signed char  *pattern){

  signed int rc;
  regex_t r;
  ((rc) = ((regcomp)((&(r)), (pattern), 1)));
  if (((rc) != 0))
  {
    ((printf)("Error in compiling regular expression.\n"));
    size_t length = ((regerror)((rc), (&(r)), (((void *)0)), 0));
    signed char *buffer = ((signed char *)((malloc)(((sizeof(signed char)) * (length)))));
    ((void)((regerror)((rc), (&(r)), (buffer), (length))));
    ((printf)("%s\n", (buffer)));
    
  }
  return (r);
  
}
signed int matchRegex(regex_t re, const signed char  *text){

  signed int status;
  const signed int nsub = 1;
  regmatch_t matches[ (nsub)];
  ((status) = ((regexec)((&(re)), (text), ((size_t)(nsub)), (matches), 0)));
  if (((status) == (REG_NOMATCH)))
  {
    return 0;
    
  } else {
    return (((matches)[0]).rm_eo);
    
  }
  
}
signed int main(signed int argc, signed char  * *argv){

  const signed char *text = "Some text to match.";
  regex_t re = ((makeRegex)(" [a-zA-Z]+ "));
  signed int match = ((matchRegex)((re), (text)));
  
}
