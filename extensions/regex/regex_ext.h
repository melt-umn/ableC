#include <stdio.h>
#include <stdlib.h>
#include <regex.h>

regex_t makeRegex (const char* pattern) {
  int rc ;
  regex_t r ;

  /* "Compile" the regular expression.  This sets up the regex to do
     the matching specified by the regular expression given as a
     character string.
   */
  rc = regcomp(&r, pattern, REG_EXTENDED) ;

  if (rc!= 0) {
      printf ("Error in compiling regular expression.\n");
      size_t length = regerror (rc, &r, NULL, 0) ;
      char *buffer = (char *) malloc( sizeof(char) * length ) ;
      (void) regerror (rc, &r, buffer, length) ;
      printf ("%s\n", buffer);
  }

  return r ;
}

int matchRegex (regex_t re, const char *text) {
    int status ;
    const int nsub=1 ;
    regmatch_t matches[nsub] ;

  /* execute the regular expression match against the text.  If it
     matches, the beginning and ending of the matched text are stored
     in the first element of the matches array.
   */
    status = regexec(&re, text, (size_t)nsub, matches, 0); 

    if (status==REG_NOMATCH) {
        return 0 ;
    }
    else {
        return matches[0].rm_eo ;
    }
}



