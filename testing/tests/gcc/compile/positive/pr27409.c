/* { dg-do compile } */

typedef struct {
        struct { } z;
} thang_t;

struct {
        short           e;
        thang_t         f;
        int g;
} my_struct;

extern void foo(thang_t *); // AbleC change

void function(int blaz)
{
  thang_t *fp = &my_struct.f;
  foo(fp);
}
