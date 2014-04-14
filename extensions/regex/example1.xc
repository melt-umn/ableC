#include <regex.h>
#include <stdio.h>

int main (int argc, char **argv) {

  const char *text = "Some text to match.";

  // Literal syntax
  regex_t *identifier = /[A-Za-z_][A-Za-z0-9_]*$/;

  // Just match syntax
  if(text =~ identifier) {
    printf("First matched (incorrect)\n");
  } else {
    printf("First does not match (correct)\n");
  }
  
  // Both at once
  if(text =~ /[A-Za-z \.]$/) {
    printf("Second matched (correct)\n");
  } else {
    printf("Second does not match (incorrect)\n");
  }
  
}
