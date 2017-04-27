
#include <vector.xh>

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
  vector<vector<string>> elems = vec<vector<string>> [];
  elems[0] = vec<string> [str("abcd")];

  for (int i = 1; i < 7; i++) {
    elems[i] = vec<string> [str("Hello"), str("World"), str(i), show(elems[i - 1])];
  }

  printf("%s\n", show(elems).text);

  return 0;
}
