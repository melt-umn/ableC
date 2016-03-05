#include <string.xh>

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
  string a = "abc";
  printf("a: %s\n", a);

  if (a != "abc")
    return 1;

  if (a == "abcd")
    return 2;

  string b = "def";
  printf("b: %s\n", b);
  string c = "ghi";
  printf("c: %s\n", c);
  string d = a + b;
  printf("d: %s\n", d);

  if (d != "abcdef")
    return 3;

  d += c;
  d += 'j';
  printf("d: %s\n", d);

  if (d != "abcdefghij")
    return 4;

  string e = tostring(-1234 + 5);
  printf("e: %s\n", e);

  if (e != "-1229")
    return 5;
  
  string f = tostring(-1234) + 5;
  printf("f: %s\n", f);

  if (f != "-12345")
    return 6;

  string g = "xyz";
  string h = g * 5;
  printf("h: %s\n", h);

  if (h != "xyzxyzxyzxyzxyz")
    return 7;
  
  g *= 7;
  printf("g: %s\n", g);

  if (g != "xyzxyzxyzxyzxyzxyzxyz")
    return 8;

  string i = tostring(3.14);
  printf("i: %s\n", i);

  if (i != "3.140000")
    return 9;

  if (i.length != 8)
    return 10;

  string j = i.substring(3, 6);
  printf("j: %s\n", j);
  if (j != "400")
    return 11;

  return 0;
}
