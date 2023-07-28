# 1 "nlist.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "nlist.c"
# 36 "nlist.c"
# 1 "/usr/include/bsd/nlist.h" 1 3 4
# 30 "/usr/include/bsd/nlist.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 1 3 4
# 23 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 3 4
# 1 "/usr/include/features.h" 1 3 4
# 391 "/usr/include/features.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 1 3 4
# 10 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/gnu/stubs-64.h" 1 3 4
# 11 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 2 3 4
# 392 "/usr/include/features.h" 2 3 4
# 24 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 2 3 4
# 410 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 411 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 2 3 4
# 31 "/usr/include/bsd/nlist.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/a.out.h" 1 3 4



# 1 "/usr/include/x86_64-linux-gnu/bits/a.out.h" 1 3 4
# 5 "/usr/include/x86_64-linux-gnu/a.out.h" 2 3 4



struct exec
{
  unsigned long a_info;
  unsigned int a_text;
  unsigned int a_data;
  unsigned int a_bss;
  unsigned int a_syms;
  unsigned int a_entry;
  unsigned int a_trsize;
  unsigned int a_drsize;
};

enum machine_type
{
  M_OLDSUN2 = 0,
  M_68010 = 1,
  M_68020 = 2,
  M_SPARC = 3,
  M_386 = 100,
  M_MIPS1 = 151,
  M_MIPS2 = 152
};
# 90 "/usr/include/x86_64-linux-gnu/a.out.h" 3 4
struct nlist
{
  union
    {
      char *n_name;
      struct nlist *n_next;
      long n_strx;
    } n_un;
  unsigned char n_type;
  char n_other;
  short n_desc;
  unsigned long n_value;
};
# 127 "/usr/include/x86_64-linux-gnu/a.out.h" 3 4
struct relocation_info
{
  int r_address;
  unsigned int r_symbolnum:24;
  unsigned int r_pcrel:1;
  unsigned int r_length:2;
  unsigned int r_extern:1;
  unsigned int r_pad:4;
};
# 32 "/usr/include/bsd/nlist.h" 2 3 4


extern int nlist(const char *filename, struct nlist *list);

# 37 "nlist.c" 2
