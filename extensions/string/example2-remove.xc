#include <string.xh>

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
  string test = str("abcdefgabcabcxyzabcxyxyxyz");
  
  string a = test - "abc";
  printf("a: %s\n", a.text);
  if (a != "defgxyzxyxyxyz")
    return 1;
  
  string b = test - "xyz";
  printf("b: %s\n", b.text);
  if (b != "abcdefgabcabcabcxyxy")
    return 2;
  
  string c = test - "xyx";
  printf("c: %s\n", c.text);
  if (c != "abcdefgabcabcxyzabcyxyz")
    return 3;

  test -= "abca";
  printf("test: %s\n", test.text);
  if (test != "abcdefgbcxyzabcxyxyxyz")
    return 4;

  return 0;
}
