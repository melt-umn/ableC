#include "regex_ext.h"

int main (int argc, char **argv) {

  const char *text = "Some text to match." ;

  regex_t re = / [a-zA-Z]+ / ;

  int match = re =~ text ;

}
