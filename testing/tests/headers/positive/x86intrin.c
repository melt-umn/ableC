# 1 "x86intrin.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "x86intrin.c"
# 27 "x86intrin.c"
# 1 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/ia32intrin.h" 1 3 4
# 29 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/ia32intrin.h" 3 4
extern __inline int
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
__bsfd (int __X)
{
  return __builtin_ctz (__X);
}


extern __inline int
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
__bsrd (int __X)
{
  return __builtin_ia32_bsrsi (__X);
}


extern __inline int
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
__bswapd (int __X)
{
  return __builtin_bswap32 (__X);
}


#pragma GCC push_options
#pragma GCC target("sse4.2")




extern __inline unsigned int
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
__crc32b (unsigned int __C, unsigned char __V)
{
  return __builtin_ia32_crc32qi (__C, __V);
}

extern __inline unsigned int
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
__crc32w (unsigned int __C, unsigned short __V)
{
  return __builtin_ia32_crc32hi (__C, __V);
}

extern __inline unsigned int
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
__crc32d (unsigned int __C, unsigned int __V)
{
  return __builtin_ia32_crc32si (__C, __V);
}



#pragma GCC pop_options



extern __inline int
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
__popcntd (unsigned int __X)
{
  return __builtin_popcount (__X);
}


extern __inline unsigned long long
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
__rdpmc (int __S)
{
  return __builtin_ia32_rdpmc (__S);
}


extern __inline unsigned long long
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
__rdtsc (void)
{
  return __builtin_ia32_rdtsc ();
}


extern __inline unsigned long long
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
__rdtscp (unsigned int *__A)
{
  return __builtin_ia32_rdtscp (__A);
}


extern __inline unsigned char
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
__rolb (unsigned char __X, int __C)
{
  return __builtin_ia32_rolqi (__X, __C);
}


extern __inline unsigned short
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
__rolw (unsigned short __X, int __C)
{
  return __builtin_ia32_rolhi (__X, __C);
}


extern __inline unsigned int
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
__rold (unsigned int __X, int __C)
{
  return (__X << __C) | (__X >> (32 - __C));
}


extern __inline unsigned char
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
__rorb (unsigned char __X, int __C)
{
  return __builtin_ia32_rorqi (__X, __C);
}


extern __inline unsigned short
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
__rorw (unsigned short __X, int __C)
{
  return __builtin_ia32_rorhi (__X, __C);
}


extern __inline unsigned int
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
__rord (unsigned int __X, int __C)
{
  return (__X >> __C) | (__X << (32 - __C));
}


extern __inline void
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
__pause (void)
{
  __builtin_ia32_pause ();
}



extern __inline int
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
__bsfq (long long __X)
{
  return __builtin_ctzll (__X);
}


extern __inline int
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
__bsrq (long long __X)
{
  return __builtin_ia32_bsrdi (__X);
}


extern __inline long long
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
__bswapq (long long __X)
{
  return __builtin_bswap64 (__X);
}


#pragma GCC push_options
#pragma GCC target("sse4.2")




extern __inline unsigned long long
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
__crc32q (unsigned long long __C, unsigned long long __V)
{
  return __builtin_ia32_crc32di (__C, __V);
}



#pragma GCC pop_options



extern __inline long long
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
__popcntq (unsigned long long __X)
{
  return __builtin_popcountll (__X);
}


extern __inline unsigned long long
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
__rolq (unsigned long long __X, int __C)
{
  return (__X << __C) | (__X >> (64 - __C));
}


extern __inline unsigned long long
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
__rorq (unsigned long long __X, int __C)
{
  return (__X >> __C) | (__X << (64 - __C));
}


extern __inline unsigned long long
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
__readeflags (void)
{
  return __builtin_ia32_readeflags_u64 ();
}


extern __inline void
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
__writeeflags (unsigned long long X)
{
  __builtin_ia32_writeeflags_u64 (X);
}
# 28 "x86intrin.c" 2


# 1 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/mmintrin.h" 1 3 4
# 38 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/mmintrin.h" 3 4
typedef int __m64 __attribute__ ((__vector_size__ (8), __may_alias__));


typedef int __v2si __attribute__ ((__vector_size__ (8)));
typedef short __v4hi __attribute__ ((__vector_size__ (8)));
typedef char __v8qi __attribute__ ((__vector_size__ (8)));
typedef long long __v1di __attribute__ ((__vector_size__ (8)));
typedef float __v2sf __attribute__ ((__vector_size__ (8)));


extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_empty (void)
{
  __builtin_ia32_emms ();
}

extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_empty (void)
{
  _mm_empty ();
}


extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtsi32_si64 (int __i)
{
  return (__m64) __builtin_ia32_vec_init_v2si (__i, 0);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_from_int (int __i)
{
  return _mm_cvtsi32_si64 (__i);
}





extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_from_int64 (long long __i)
{
  return (__m64) __i;
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtsi64_m64 (long long __i)
{
  return (__m64) __i;
}


extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtsi64x_si64 (long long __i)
{
  return (__m64) __i;
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_set_pi64x (long long __i)
{
  return (__m64) __i;
}



extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtsi64_si32 (__m64 __i)
{
  return __builtin_ia32_vec_ext_v2si ((__v2si)__i, 0);
}

extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_to_int (__m64 __i)
{
  return _mm_cvtsi64_si32 (__i);
}





extern __inline long long __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_to_int64 (__m64 __i)
{
  return (long long)__i;
}

extern __inline long long __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtm64_si64 (__m64 __i)
{
  return (long long)__i;
}


extern __inline long long __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtsi64_si64x (__m64 __i)
{
  return (long long)__i;
}





extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_packs_pi16 (__m64 __m1, __m64 __m2)
{
  return (__m64) __builtin_ia32_packsswb ((__v4hi)__m1, (__v4hi)__m2);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_packsswb (__m64 __m1, __m64 __m2)
{
  return _mm_packs_pi16 (__m1, __m2);
}




extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_packs_pi32 (__m64 __m1, __m64 __m2)
{
  return (__m64) __builtin_ia32_packssdw ((__v2si)__m1, (__v2si)__m2);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_packssdw (__m64 __m1, __m64 __m2)
{
  return _mm_packs_pi32 (__m1, __m2);
}




extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_packs_pu16 (__m64 __m1, __m64 __m2)
{
  return (__m64) __builtin_ia32_packuswb ((__v4hi)__m1, (__v4hi)__m2);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_packuswb (__m64 __m1, __m64 __m2)
{
  return _mm_packs_pu16 (__m1, __m2);
}



extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_unpackhi_pi8 (__m64 __m1, __m64 __m2)
{
  return (__m64) __builtin_ia32_punpckhbw ((__v8qi)__m1, (__v8qi)__m2);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_punpckhbw (__m64 __m1, __m64 __m2)
{
  return _mm_unpackhi_pi8 (__m1, __m2);
}



extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_unpackhi_pi16 (__m64 __m1, __m64 __m2)
{
  return (__m64) __builtin_ia32_punpckhwd ((__v4hi)__m1, (__v4hi)__m2);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_punpckhwd (__m64 __m1, __m64 __m2)
{
  return _mm_unpackhi_pi16 (__m1, __m2);
}



extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_unpackhi_pi32 (__m64 __m1, __m64 __m2)
{
  return (__m64) __builtin_ia32_punpckhdq ((__v2si)__m1, (__v2si)__m2);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_punpckhdq (__m64 __m1, __m64 __m2)
{
  return _mm_unpackhi_pi32 (__m1, __m2);
}



extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_unpacklo_pi8 (__m64 __m1, __m64 __m2)
{
  return (__m64) __builtin_ia32_punpcklbw ((__v8qi)__m1, (__v8qi)__m2);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_punpcklbw (__m64 __m1, __m64 __m2)
{
  return _mm_unpacklo_pi8 (__m1, __m2);
}



extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_unpacklo_pi16 (__m64 __m1, __m64 __m2)
{
  return (__m64) __builtin_ia32_punpcklwd ((__v4hi)__m1, (__v4hi)__m2);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_punpcklwd (__m64 __m1, __m64 __m2)
{
  return _mm_unpacklo_pi16 (__m1, __m2);
}



extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_unpacklo_pi32 (__m64 __m1, __m64 __m2)
{
  return (__m64) __builtin_ia32_punpckldq ((__v2si)__m1, (__v2si)__m2);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_punpckldq (__m64 __m1, __m64 __m2)
{
  return _mm_unpacklo_pi32 (__m1, __m2);
}


extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_add_pi8 (__m64 __m1, __m64 __m2)
{
  return (__m64) __builtin_ia32_paddb ((__v8qi)__m1, (__v8qi)__m2);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_paddb (__m64 __m1, __m64 __m2)
{
  return _mm_add_pi8 (__m1, __m2);
}


extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_add_pi16 (__m64 __m1, __m64 __m2)
{
  return (__m64) __builtin_ia32_paddw ((__v4hi)__m1, (__v4hi)__m2);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_paddw (__m64 __m1, __m64 __m2)
{
  return _mm_add_pi16 (__m1, __m2);
}


extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_add_pi32 (__m64 __m1, __m64 __m2)
{
  return (__m64) __builtin_ia32_paddd ((__v2si)__m1, (__v2si)__m2);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_paddd (__m64 __m1, __m64 __m2)
{
  return _mm_add_pi32 (__m1, __m2);
}
# 315 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/mmintrin.h" 3 4
extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_add_si64 (__m64 __m1, __m64 __m2)
{
  return (__m64) __builtin_ia32_paddq ((__v1di)__m1, (__v1di)__m2);
}







extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_adds_pi8 (__m64 __m1, __m64 __m2)
{
  return (__m64) __builtin_ia32_paddsb ((__v8qi)__m1, (__v8qi)__m2);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_paddsb (__m64 __m1, __m64 __m2)
{
  return _mm_adds_pi8 (__m1, __m2);
}



extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_adds_pi16 (__m64 __m1, __m64 __m2)
{
  return (__m64) __builtin_ia32_paddsw ((__v4hi)__m1, (__v4hi)__m2);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_paddsw (__m64 __m1, __m64 __m2)
{
  return _mm_adds_pi16 (__m1, __m2);
}



extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_adds_pu8 (__m64 __m1, __m64 __m2)
{
  return (__m64) __builtin_ia32_paddusb ((__v8qi)__m1, (__v8qi)__m2);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_paddusb (__m64 __m1, __m64 __m2)
{
  return _mm_adds_pu8 (__m1, __m2);
}



extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_adds_pu16 (__m64 __m1, __m64 __m2)
{
  return (__m64) __builtin_ia32_paddusw ((__v4hi)__m1, (__v4hi)__m2);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_paddusw (__m64 __m1, __m64 __m2)
{
  return _mm_adds_pu16 (__m1, __m2);
}


extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_sub_pi8 (__m64 __m1, __m64 __m2)
{
  return (__m64) __builtin_ia32_psubb ((__v8qi)__m1, (__v8qi)__m2);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_psubb (__m64 __m1, __m64 __m2)
{
  return _mm_sub_pi8 (__m1, __m2);
}


extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_sub_pi16 (__m64 __m1, __m64 __m2)
{
  return (__m64) __builtin_ia32_psubw ((__v4hi)__m1, (__v4hi)__m2);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_psubw (__m64 __m1, __m64 __m2)
{
  return _mm_sub_pi16 (__m1, __m2);
}


extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_sub_pi32 (__m64 __m1, __m64 __m2)
{
  return (__m64) __builtin_ia32_psubd ((__v2si)__m1, (__v2si)__m2);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_psubd (__m64 __m1, __m64 __m2)
{
  return _mm_sub_pi32 (__m1, __m2);
}
# 427 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/mmintrin.h" 3 4
extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_sub_si64 (__m64 __m1, __m64 __m2)
{
  return (__m64) __builtin_ia32_psubq ((__v1di)__m1, (__v1di)__m2);
}







extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_subs_pi8 (__m64 __m1, __m64 __m2)
{
  return (__m64) __builtin_ia32_psubsb ((__v8qi)__m1, (__v8qi)__m2);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_psubsb (__m64 __m1, __m64 __m2)
{
  return _mm_subs_pi8 (__m1, __m2);
}



extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_subs_pi16 (__m64 __m1, __m64 __m2)
{
  return (__m64) __builtin_ia32_psubsw ((__v4hi)__m1, (__v4hi)__m2);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_psubsw (__m64 __m1, __m64 __m2)
{
  return _mm_subs_pi16 (__m1, __m2);
}



extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_subs_pu8 (__m64 __m1, __m64 __m2)
{
  return (__m64) __builtin_ia32_psubusb ((__v8qi)__m1, (__v8qi)__m2);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_psubusb (__m64 __m1, __m64 __m2)
{
  return _mm_subs_pu8 (__m1, __m2);
}



extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_subs_pu16 (__m64 __m1, __m64 __m2)
{
  return (__m64) __builtin_ia32_psubusw ((__v4hi)__m1, (__v4hi)__m2);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_psubusw (__m64 __m1, __m64 __m2)
{
  return _mm_subs_pu16 (__m1, __m2);
}




extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_madd_pi16 (__m64 __m1, __m64 __m2)
{
  return (__m64) __builtin_ia32_pmaddwd ((__v4hi)__m1, (__v4hi)__m2);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_pmaddwd (__m64 __m1, __m64 __m2)
{
  return _mm_madd_pi16 (__m1, __m2);
}



extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_mulhi_pi16 (__m64 __m1, __m64 __m2)
{
  return (__m64) __builtin_ia32_pmulhw ((__v4hi)__m1, (__v4hi)__m2);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_pmulhw (__m64 __m1, __m64 __m2)
{
  return _mm_mulhi_pi16 (__m1, __m2);
}



extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_mullo_pi16 (__m64 __m1, __m64 __m2)
{
  return (__m64) __builtin_ia32_pmullw ((__v4hi)__m1, (__v4hi)__m2);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_pmullw (__m64 __m1, __m64 __m2)
{
  return _mm_mullo_pi16 (__m1, __m2);
}


extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_sll_pi16 (__m64 __m, __m64 __count)
{
  return (__m64) __builtin_ia32_psllw ((__v4hi)__m, (__v4hi)__count);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_psllw (__m64 __m, __m64 __count)
{
  return _mm_sll_pi16 (__m, __count);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_slli_pi16 (__m64 __m, int __count)
{
  return (__m64) __builtin_ia32_psllwi ((__v4hi)__m, __count);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_psllwi (__m64 __m, int __count)
{
  return _mm_slli_pi16 (__m, __count);
}


extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_sll_pi32 (__m64 __m, __m64 __count)
{
  return (__m64) __builtin_ia32_pslld ((__v2si)__m, (__v2si)__count);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_pslld (__m64 __m, __m64 __count)
{
  return _mm_sll_pi32 (__m, __count);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_slli_pi32 (__m64 __m, int __count)
{
  return (__m64) __builtin_ia32_pslldi ((__v2si)__m, __count);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_pslldi (__m64 __m, int __count)
{
  return _mm_slli_pi32 (__m, __count);
}


extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_sll_si64 (__m64 __m, __m64 __count)
{
  return (__m64) __builtin_ia32_psllq ((__v1di)__m, (__v1di)__count);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_psllq (__m64 __m, __m64 __count)
{
  return _mm_sll_si64 (__m, __count);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_slli_si64 (__m64 __m, int __count)
{
  return (__m64) __builtin_ia32_psllqi ((__v1di)__m, __count);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_psllqi (__m64 __m, int __count)
{
  return _mm_slli_si64 (__m, __count);
}


extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_sra_pi16 (__m64 __m, __m64 __count)
{
  return (__m64) __builtin_ia32_psraw ((__v4hi)__m, (__v4hi)__count);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_psraw (__m64 __m, __m64 __count)
{
  return _mm_sra_pi16 (__m, __count);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_srai_pi16 (__m64 __m, int __count)
{
  return (__m64) __builtin_ia32_psrawi ((__v4hi)__m, __count);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_psrawi (__m64 __m, int __count)
{
  return _mm_srai_pi16 (__m, __count);
}


extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_sra_pi32 (__m64 __m, __m64 __count)
{
  return (__m64) __builtin_ia32_psrad ((__v2si)__m, (__v2si)__count);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_psrad (__m64 __m, __m64 __count)
{
  return _mm_sra_pi32 (__m, __count);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_srai_pi32 (__m64 __m, int __count)
{
  return (__m64) __builtin_ia32_psradi ((__v2si)__m, __count);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_psradi (__m64 __m, int __count)
{
  return _mm_srai_pi32 (__m, __count);
}


extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_srl_pi16 (__m64 __m, __m64 __count)
{
  return (__m64) __builtin_ia32_psrlw ((__v4hi)__m, (__v4hi)__count);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_psrlw (__m64 __m, __m64 __count)
{
  return _mm_srl_pi16 (__m, __count);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_srli_pi16 (__m64 __m, int __count)
{
  return (__m64) __builtin_ia32_psrlwi ((__v4hi)__m, __count);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_psrlwi (__m64 __m, int __count)
{
  return _mm_srli_pi16 (__m, __count);
}


extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_srl_pi32 (__m64 __m, __m64 __count)
{
  return (__m64) __builtin_ia32_psrld ((__v2si)__m, (__v2si)__count);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_psrld (__m64 __m, __m64 __count)
{
  return _mm_srl_pi32 (__m, __count);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_srli_pi32 (__m64 __m, int __count)
{
  return (__m64) __builtin_ia32_psrldi ((__v2si)__m, __count);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_psrldi (__m64 __m, int __count)
{
  return _mm_srli_pi32 (__m, __count);
}


extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_srl_si64 (__m64 __m, __m64 __count)
{
  return (__m64) __builtin_ia32_psrlq ((__v1di)__m, (__v1di)__count);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_psrlq (__m64 __m, __m64 __count)
{
  return _mm_srl_si64 (__m, __count);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_srli_si64 (__m64 __m, int __count)
{
  return (__m64) __builtin_ia32_psrlqi ((__v1di)__m, __count);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_psrlqi (__m64 __m, int __count)
{
  return _mm_srli_si64 (__m, __count);
}


extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_and_si64 (__m64 __m1, __m64 __m2)
{
  return __builtin_ia32_pand (__m1, __m2);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_pand (__m64 __m1, __m64 __m2)
{
  return _mm_and_si64 (__m1, __m2);
}



extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_andnot_si64 (__m64 __m1, __m64 __m2)
{
  return __builtin_ia32_pandn (__m1, __m2);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_pandn (__m64 __m1, __m64 __m2)
{
  return _mm_andnot_si64 (__m1, __m2);
}


extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_or_si64 (__m64 __m1, __m64 __m2)
{
  return __builtin_ia32_por (__m1, __m2);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_por (__m64 __m1, __m64 __m2)
{
  return _mm_or_si64 (__m1, __m2);
}


extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_xor_si64 (__m64 __m1, __m64 __m2)
{
  return __builtin_ia32_pxor (__m1, __m2);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_pxor (__m64 __m1, __m64 __m2)
{
  return _mm_xor_si64 (__m1, __m2);
}



extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpeq_pi8 (__m64 __m1, __m64 __m2)
{
  return (__m64) __builtin_ia32_pcmpeqb ((__v8qi)__m1, (__v8qi)__m2);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_pcmpeqb (__m64 __m1, __m64 __m2)
{
  return _mm_cmpeq_pi8 (__m1, __m2);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpgt_pi8 (__m64 __m1, __m64 __m2)
{
  return (__m64) __builtin_ia32_pcmpgtb ((__v8qi)__m1, (__v8qi)__m2);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_pcmpgtb (__m64 __m1, __m64 __m2)
{
  return _mm_cmpgt_pi8 (__m1, __m2);
}



extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpeq_pi16 (__m64 __m1, __m64 __m2)
{
  return (__m64) __builtin_ia32_pcmpeqw ((__v4hi)__m1, (__v4hi)__m2);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_pcmpeqw (__m64 __m1, __m64 __m2)
{
  return _mm_cmpeq_pi16 (__m1, __m2);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpgt_pi16 (__m64 __m1, __m64 __m2)
{
  return (__m64) __builtin_ia32_pcmpgtw ((__v4hi)__m1, (__v4hi)__m2);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_pcmpgtw (__m64 __m1, __m64 __m2)
{
  return _mm_cmpgt_pi16 (__m1, __m2);
}



extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpeq_pi32 (__m64 __m1, __m64 __m2)
{
  return (__m64) __builtin_ia32_pcmpeqd ((__v2si)__m1, (__v2si)__m2);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_pcmpeqd (__m64 __m1, __m64 __m2)
{
  return _mm_cmpeq_pi32 (__m1, __m2);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpgt_pi32 (__m64 __m1, __m64 __m2)
{
  return (__m64) __builtin_ia32_pcmpgtd ((__v2si)__m1, (__v2si)__m2);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_pcmpgtd (__m64 __m1, __m64 __m2)
{
  return _mm_cmpgt_pi32 (__m1, __m2);
}


extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_setzero_si64 (void)
{
  return (__m64)0LL;
}


extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_set_pi32 (int __i1, int __i0)
{
  return (__m64) __builtin_ia32_vec_init_v2si (__i0, __i1);
}


extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_set_pi16 (short __w3, short __w2, short __w1, short __w0)
{
  return (__m64) __builtin_ia32_vec_init_v4hi (__w0, __w1, __w2, __w3);
}


extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_set_pi8 (char __b7, char __b6, char __b5, char __b4,
      char __b3, char __b2, char __b1, char __b0)
{
  return (__m64) __builtin_ia32_vec_init_v8qi (__b0, __b1, __b2, __b3,
            __b4, __b5, __b6, __b7);
}


extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_setr_pi32 (int __i0, int __i1)
{
  return _mm_set_pi32 (__i1, __i0);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_setr_pi16 (short __w0, short __w1, short __w2, short __w3)
{
  return _mm_set_pi16 (__w3, __w2, __w1, __w0);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_setr_pi8 (char __b0, char __b1, char __b2, char __b3,
       char __b4, char __b5, char __b6, char __b7)
{
  return _mm_set_pi8 (__b7, __b6, __b5, __b4, __b3, __b2, __b1, __b0);
}


extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_set1_pi32 (int __i)
{
  return _mm_set_pi32 (__i, __i);
}


extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_set1_pi16 (short __w)
{
  return _mm_set_pi16 (__w, __w, __w, __w);
}


extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_set1_pi8 (char __b)
{
  return _mm_set_pi8 (__b, __b, __b, __b, __b, __b, __b, __b);
}
# 31 "x86intrin.c" 2



# 1 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/xmmintrin.h" 1 3 4
# 34 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/xmmintrin.h" 3 4
# 1 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/mm_malloc.h" 1 3 4
# 27 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/mm_malloc.h" 3 4
# 1 "/usr/include/stdlib.h" 1 3 4
# 24 "/usr/include/stdlib.h" 3 4
# 1 "/usr/include/features.h" 1 3 4
# 367 "/usr/include/features.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 1 3 4
# 410 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 411 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 2 3 4
# 368 "/usr/include/features.h" 2 3 4
# 391 "/usr/include/features.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 1 3 4
# 10 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/gnu/stubs-64.h" 1 3 4
# 11 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 2 3 4
# 392 "/usr/include/features.h" 2 3 4
# 25 "/usr/include/stdlib.h" 2 3 4







# 1 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/stddef.h" 1 3 4
# 212 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/stddef.h" 3 4
typedef long unsigned int size_t;
# 324 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/stddef.h" 3 4
typedef int wchar_t;
# 33 "/usr/include/stdlib.h" 2 3 4








# 1 "/usr/include/x86_64-linux-gnu/bits/waitflags.h" 1 3 4
# 50 "/usr/include/x86_64-linux-gnu/bits/waitflags.h" 3 4
typedef enum
{
  P_ALL,
  P_PID,
  P_PGID
} idtype_t;
# 42 "/usr/include/stdlib.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/waitstatus.h" 1 3 4
# 43 "/usr/include/stdlib.h" 2 3 4
# 95 "/usr/include/stdlib.h" 3 4


typedef struct
  {
    int quot;
    int rem;
  } div_t;



typedef struct
  {
    long int quot;
    long int rem;
  } ldiv_t;







__extension__ typedef struct
  {
    long long int quot;
    long long int rem;
  } lldiv_t;


# 139 "/usr/include/stdlib.h" 3 4
extern size_t __ctype_get_mb_cur_max (void) __attribute__ ((__nothrow__ , __leaf__)) ;




extern double atof (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;

extern int atoi (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;

extern long int atol (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;





__extension__ extern long long int atoll (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;





extern double strtod (const char *__restrict __nptr,
        char **__restrict __endptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





extern float strtof (const char *__restrict __nptr,
       char **__restrict __endptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

extern long double strtold (const char *__restrict __nptr,
       char **__restrict __endptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





extern long int strtol (const char *__restrict __nptr,
   char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

extern unsigned long int strtoul (const char *__restrict __nptr,
      char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

# 206 "/usr/include/stdlib.h" 3 4


__extension__
extern long long int strtoll (const char *__restrict __nptr,
         char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

__extension__
extern unsigned long long int strtoull (const char *__restrict __nptr,
     char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

# 372 "/usr/include/stdlib.h" 3 4


extern int rand (void) __attribute__ ((__nothrow__ , __leaf__));

extern void srand (unsigned int __seed) __attribute__ ((__nothrow__ , __leaf__));




extern int rand_r (unsigned int *__seed) __attribute__ ((__nothrow__ , __leaf__));
# 464 "/usr/include/stdlib.h" 3 4


extern void *malloc (size_t __size) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) ;

extern void *calloc (size_t __nmemb, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) ;










extern void *realloc (void *__ptr, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));

extern void free (void *__ptr) __attribute__ ((__nothrow__ , __leaf__));

# 503 "/usr/include/stdlib.h" 3 4
extern int posix_memalign (void **__memptr, size_t __alignment, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;




extern void *aligned_alloc (size_t __alignment, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__alloc_size__ (2))) ;




extern void abort (void) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));



extern int atexit (void (*__func) (void)) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));







extern int at_quick_exit (void (*__func) (void)) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



# 539 "/usr/include/stdlib.h" 3 4




extern void exit (int __status) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));





extern void quick_exit (int __status) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));







extern void _Exit (int __status) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));






extern char *getenv (const char *__name) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;

# 584 "/usr/include/stdlib.h" 3 4
extern int setenv (const char *__name, const char *__value, int __replace)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));


extern int unsetenv (const char *__name) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 619 "/usr/include/stdlib.h" 3 4
extern int mkstemp (char *__template) __attribute__ ((__nonnull__ (1))) ;
# 662 "/usr/include/stdlib.h" 3 4
extern char *mkdtemp (char *__template) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;
# 711 "/usr/include/stdlib.h" 3 4





extern int system (const char *__command) ;

# 741 "/usr/include/stdlib.h" 3 4
typedef int (*__compar_fn_t) (const void *, const void *);
# 751 "/usr/include/stdlib.h" 3 4



extern void *bsearch (const void *__key, const void *__base,
        size_t __nmemb, size_t __size, __compar_fn_t __compar)
     __attribute__ ((__nonnull__ (1, 2, 5))) ;







extern void qsort (void *__base, size_t __nmemb, size_t __size,
     __compar_fn_t __compar) __attribute__ ((__nonnull__ (1, 4)));
# 774 "/usr/include/stdlib.h" 3 4
extern int abs (int __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;
extern long int labs (long int __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;



__extension__ extern long long int llabs (long long int __x)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;







extern div_t div (int __numer, int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;
extern ldiv_t ldiv (long int __numer, long int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;




__extension__ extern lldiv_t lldiv (long long int __numer,
        long long int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;

# 859 "/usr/include/stdlib.h" 3 4



extern int mblen (const char *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));


extern int mbtowc (wchar_t *__restrict __pwc,
     const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));


extern int wctomb (char *__s, wchar_t __wchar) __attribute__ ((__nothrow__ , __leaf__));



extern size_t mbstowcs (wchar_t *__restrict __pwcs,
   const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));

extern size_t wcstombs (char *__restrict __s,
   const wchar_t *__restrict __pwcs, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__));

# 898 "/usr/include/stdlib.h" 3 4
extern int getsubopt (char **__restrict __optionp,
        char *const *__restrict __tokens,
        char **__restrict __valuep)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2, 3))) ;
# 954 "/usr/include/stdlib.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h" 1 3 4
# 955 "/usr/include/stdlib.h" 2 3 4
# 967 "/usr/include/stdlib.h" 3 4

# 28 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/mm_malloc.h" 2 3 4




extern int posix_memalign (void **, size_t, size_t);




static __inline void *
_mm_malloc (size_t size, size_t alignment)
{
  void *ptr;
  if (alignment == 1)
    return malloc (size);
  if (alignment == 2 || (sizeof (void *) == 8 && alignment == 4))
    alignment = sizeof (void *);
  if (posix_memalign (&ptr, alignment, size) == 0)
    return ptr;
  else
    return ((void *)0);
}

static __inline void
_mm_free (void * ptr)
{
  free (ptr);
}
# 35 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/xmmintrin.h" 2 3 4


enum _mm_hint
{

  _MM_HINT_ET0 = 7,
  _MM_HINT_ET1 = 6,
  _MM_HINT_T0 = 3,
  _MM_HINT_T1 = 2,
  _MM_HINT_T2 = 1,
  _MM_HINT_NTA = 0
};
# 69 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/xmmintrin.h" 3 4
typedef float __m128 __attribute__ ((__vector_size__ (16), __may_alias__));


typedef float __v4sf __attribute__ ((__vector_size__ (16)));
# 106 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/xmmintrin.h" 3 4
extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_undefined_ps (void)
{
  __m128 __Y = __Y;
  return __Y;
}


extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_setzero_ps (void)
{
  return __extension__ (__m128){ 0.0f, 0.0f, 0.0f, 0.0f };
}





extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_add_ss (__m128 __A, __m128 __B)
{
  return (__m128) __builtin_ia32_addss ((__v4sf)__A, (__v4sf)__B);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_sub_ss (__m128 __A, __m128 __B)
{
  return (__m128) __builtin_ia32_subss ((__v4sf)__A, (__v4sf)__B);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_mul_ss (__m128 __A, __m128 __B)
{
  return (__m128) __builtin_ia32_mulss ((__v4sf)__A, (__v4sf)__B);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_div_ss (__m128 __A, __m128 __B)
{
  return (__m128) __builtin_ia32_divss ((__v4sf)__A, (__v4sf)__B);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_sqrt_ss (__m128 __A)
{
  return (__m128) __builtin_ia32_sqrtss ((__v4sf)__A);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_rcp_ss (__m128 __A)
{
  return (__m128) __builtin_ia32_rcpss ((__v4sf)__A);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_rsqrt_ss (__m128 __A)
{
  return (__m128) __builtin_ia32_rsqrtss ((__v4sf)__A);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_min_ss (__m128 __A, __m128 __B)
{
  return (__m128) __builtin_ia32_minss ((__v4sf)__A, (__v4sf)__B);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_max_ss (__m128 __A, __m128 __B)
{
  return (__m128) __builtin_ia32_maxss ((__v4sf)__A, (__v4sf)__B);
}



extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_add_ps (__m128 __A, __m128 __B)
{
  return (__m128) __builtin_ia32_addps ((__v4sf)__A, (__v4sf)__B);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_sub_ps (__m128 __A, __m128 __B)
{
  return (__m128) __builtin_ia32_subps ((__v4sf)__A, (__v4sf)__B);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_mul_ps (__m128 __A, __m128 __B)
{
  return (__m128) __builtin_ia32_mulps ((__v4sf)__A, (__v4sf)__B);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_div_ps (__m128 __A, __m128 __B)
{
  return (__m128) __builtin_ia32_divps ((__v4sf)__A, (__v4sf)__B);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_sqrt_ps (__m128 __A)
{
  return (__m128) __builtin_ia32_sqrtps ((__v4sf)__A);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_rcp_ps (__m128 __A)
{
  return (__m128) __builtin_ia32_rcpps ((__v4sf)__A);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_rsqrt_ps (__m128 __A)
{
  return (__m128) __builtin_ia32_rsqrtps ((__v4sf)__A);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_min_ps (__m128 __A, __m128 __B)
{
  return (__m128) __builtin_ia32_minps ((__v4sf)__A, (__v4sf)__B);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_max_ps (__m128 __A, __m128 __B)
{
  return (__m128) __builtin_ia32_maxps ((__v4sf)__A, (__v4sf)__B);
}



extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_and_ps (__m128 __A, __m128 __B)
{
  return __builtin_ia32_andps (__A, __B);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_andnot_ps (__m128 __A, __m128 __B)
{
  return __builtin_ia32_andnps (__A, __B);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_or_ps (__m128 __A, __m128 __B)
{
  return __builtin_ia32_orps (__A, __B);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_xor_ps (__m128 __A, __m128 __B)
{
  return __builtin_ia32_xorps (__A, __B);
}





extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpeq_ss (__m128 __A, __m128 __B)
{
  return (__m128) __builtin_ia32_cmpeqss ((__v4sf)__A, (__v4sf)__B);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmplt_ss (__m128 __A, __m128 __B)
{
  return (__m128) __builtin_ia32_cmpltss ((__v4sf)__A, (__v4sf)__B);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmple_ss (__m128 __A, __m128 __B)
{
  return (__m128) __builtin_ia32_cmpless ((__v4sf)__A, (__v4sf)__B);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpgt_ss (__m128 __A, __m128 __B)
{
  return (__m128) __builtin_ia32_movss ((__v4sf) __A,
     (__v4sf)
     __builtin_ia32_cmpltss ((__v4sf) __B,
        (__v4sf)
        __A));
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpge_ss (__m128 __A, __m128 __B)
{
  return (__m128) __builtin_ia32_movss ((__v4sf) __A,
     (__v4sf)
     __builtin_ia32_cmpless ((__v4sf) __B,
        (__v4sf)
        __A));
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpneq_ss (__m128 __A, __m128 __B)
{
  return (__m128) __builtin_ia32_cmpneqss ((__v4sf)__A, (__v4sf)__B);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpnlt_ss (__m128 __A, __m128 __B)
{
  return (__m128) __builtin_ia32_cmpnltss ((__v4sf)__A, (__v4sf)__B);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpnle_ss (__m128 __A, __m128 __B)
{
  return (__m128) __builtin_ia32_cmpnless ((__v4sf)__A, (__v4sf)__B);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpngt_ss (__m128 __A, __m128 __B)
{
  return (__m128) __builtin_ia32_movss ((__v4sf) __A,
     (__v4sf)
     __builtin_ia32_cmpnltss ((__v4sf) __B,
         (__v4sf)
         __A));
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpnge_ss (__m128 __A, __m128 __B)
{
  return (__m128) __builtin_ia32_movss ((__v4sf) __A,
     (__v4sf)
     __builtin_ia32_cmpnless ((__v4sf) __B,
         (__v4sf)
         __A));
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpord_ss (__m128 __A, __m128 __B)
{
  return (__m128) __builtin_ia32_cmpordss ((__v4sf)__A, (__v4sf)__B);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpunord_ss (__m128 __A, __m128 __B)
{
  return (__m128) __builtin_ia32_cmpunordss ((__v4sf)__A, (__v4sf)__B);
}





extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpeq_ps (__m128 __A, __m128 __B)
{
  return (__m128) __builtin_ia32_cmpeqps ((__v4sf)__A, (__v4sf)__B);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmplt_ps (__m128 __A, __m128 __B)
{
  return (__m128) __builtin_ia32_cmpltps ((__v4sf)__A, (__v4sf)__B);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmple_ps (__m128 __A, __m128 __B)
{
  return (__m128) __builtin_ia32_cmpleps ((__v4sf)__A, (__v4sf)__B);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpgt_ps (__m128 __A, __m128 __B)
{
  return (__m128) __builtin_ia32_cmpgtps ((__v4sf)__A, (__v4sf)__B);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpge_ps (__m128 __A, __m128 __B)
{
  return (__m128) __builtin_ia32_cmpgeps ((__v4sf)__A, (__v4sf)__B);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpneq_ps (__m128 __A, __m128 __B)
{
  return (__m128) __builtin_ia32_cmpneqps ((__v4sf)__A, (__v4sf)__B);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpnlt_ps (__m128 __A, __m128 __B)
{
  return (__m128) __builtin_ia32_cmpnltps ((__v4sf)__A, (__v4sf)__B);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpnle_ps (__m128 __A, __m128 __B)
{
  return (__m128) __builtin_ia32_cmpnleps ((__v4sf)__A, (__v4sf)__B);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpngt_ps (__m128 __A, __m128 __B)
{
  return (__m128) __builtin_ia32_cmpngtps ((__v4sf)__A, (__v4sf)__B);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpnge_ps (__m128 __A, __m128 __B)
{
  return (__m128) __builtin_ia32_cmpngeps ((__v4sf)__A, (__v4sf)__B);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpord_ps (__m128 __A, __m128 __B)
{
  return (__m128) __builtin_ia32_cmpordps ((__v4sf)__A, (__v4sf)__B);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpunord_ps (__m128 __A, __m128 __B)
{
  return (__m128) __builtin_ia32_cmpunordps ((__v4sf)__A, (__v4sf)__B);
}




extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_comieq_ss (__m128 __A, __m128 __B)
{
  return __builtin_ia32_comieq ((__v4sf)__A, (__v4sf)__B);
}

extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_comilt_ss (__m128 __A, __m128 __B)
{
  return __builtin_ia32_comilt ((__v4sf)__A, (__v4sf)__B);
}

extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_comile_ss (__m128 __A, __m128 __B)
{
  return __builtin_ia32_comile ((__v4sf)__A, (__v4sf)__B);
}

extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_comigt_ss (__m128 __A, __m128 __B)
{
  return __builtin_ia32_comigt ((__v4sf)__A, (__v4sf)__B);
}

extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_comige_ss (__m128 __A, __m128 __B)
{
  return __builtin_ia32_comige ((__v4sf)__A, (__v4sf)__B);
}

extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_comineq_ss (__m128 __A, __m128 __B)
{
  return __builtin_ia32_comineq ((__v4sf)__A, (__v4sf)__B);
}

extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_ucomieq_ss (__m128 __A, __m128 __B)
{
  return __builtin_ia32_ucomieq ((__v4sf)__A, (__v4sf)__B);
}

extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_ucomilt_ss (__m128 __A, __m128 __B)
{
  return __builtin_ia32_ucomilt ((__v4sf)__A, (__v4sf)__B);
}

extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_ucomile_ss (__m128 __A, __m128 __B)
{
  return __builtin_ia32_ucomile ((__v4sf)__A, (__v4sf)__B);
}

extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_ucomigt_ss (__m128 __A, __m128 __B)
{
  return __builtin_ia32_ucomigt ((__v4sf)__A, (__v4sf)__B);
}

extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_ucomige_ss (__m128 __A, __m128 __B)
{
  return __builtin_ia32_ucomige ((__v4sf)__A, (__v4sf)__B);
}

extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_ucomineq_ss (__m128 __A, __m128 __B)
{
  return __builtin_ia32_ucomineq ((__v4sf)__A, (__v4sf)__B);
}



extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtss_si32 (__m128 __A)
{
  return __builtin_ia32_cvtss2si ((__v4sf) __A);
}

extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvt_ss2si (__m128 __A)
{
  return _mm_cvtss_si32 (__A);
}






extern __inline long long __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtss_si64 (__m128 __A)
{
  return __builtin_ia32_cvtss2si64 ((__v4sf) __A);
}


extern __inline long long __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtss_si64x (__m128 __A)
{
  return __builtin_ia32_cvtss2si64 ((__v4sf) __A);
}




extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtps_pi32 (__m128 __A)
{
  return (__m64) __builtin_ia32_cvtps2pi ((__v4sf) __A);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvt_ps2pi (__m128 __A)
{
  return _mm_cvtps_pi32 (__A);
}


extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvttss_si32 (__m128 __A)
{
  return __builtin_ia32_cvttss2si ((__v4sf) __A);
}

extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtt_ss2si (__m128 __A)
{
  return _mm_cvttss_si32 (__A);
}





extern __inline long long __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvttss_si64 (__m128 __A)
{
  return __builtin_ia32_cvttss2si64 ((__v4sf) __A);
}


extern __inline long long __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvttss_si64x (__m128 __A)
{
  return __builtin_ia32_cvttss2si64 ((__v4sf) __A);
}




extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvttps_pi32 (__m128 __A)
{
  return (__m64) __builtin_ia32_cvttps2pi ((__v4sf) __A);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtt_ps2pi (__m128 __A)
{
  return _mm_cvttps_pi32 (__A);
}


extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtsi32_ss (__m128 __A, int __B)
{
  return (__m128) __builtin_ia32_cvtsi2ss ((__v4sf) __A, __B);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvt_si2ss (__m128 __A, int __B)
{
  return _mm_cvtsi32_ss (__A, __B);
}





extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtsi64_ss (__m128 __A, long long __B)
{
  return (__m128) __builtin_ia32_cvtsi642ss ((__v4sf) __A, __B);
}


extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtsi64x_ss (__m128 __A, long long __B)
{
  return (__m128) __builtin_ia32_cvtsi642ss ((__v4sf) __A, __B);
}




extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtpi32_ps (__m128 __A, __m64 __B)
{
  return (__m128) __builtin_ia32_cvtpi2ps ((__v4sf) __A, (__v2si)__B);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvt_pi2ps (__m128 __A, __m64 __B)
{
  return _mm_cvtpi32_ps (__A, __B);
}


extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtpi16_ps (__m64 __A)
{
  __v4hi __sign;
  __v2si __hisi, __losi;
  __v4sf __zero, __ra, __rb;




  __sign = __builtin_ia32_pcmpgtw ((__v4hi)0LL, (__v4hi)__A);


  __losi = (__v2si) __builtin_ia32_punpcklwd ((__v4hi)__A, __sign);
  __hisi = (__v2si) __builtin_ia32_punpckhwd ((__v4hi)__A, __sign);


  __zero = (__v4sf) _mm_setzero_ps ();
  __ra = __builtin_ia32_cvtpi2ps (__zero, __losi);
  __rb = __builtin_ia32_cvtpi2ps (__ra, __hisi);

  return (__m128) __builtin_ia32_movlhps (__ra, __rb);
}


extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtpu16_ps (__m64 __A)
{
  __v2si __hisi, __losi;
  __v4sf __zero, __ra, __rb;


  __losi = (__v2si) __builtin_ia32_punpcklwd ((__v4hi)__A, (__v4hi)0LL);
  __hisi = (__v2si) __builtin_ia32_punpckhwd ((__v4hi)__A, (__v4hi)0LL);


  __zero = (__v4sf) _mm_setzero_ps ();
  __ra = __builtin_ia32_cvtpi2ps (__zero, __losi);
  __rb = __builtin_ia32_cvtpi2ps (__ra, __hisi);

  return (__m128) __builtin_ia32_movlhps (__ra, __rb);
}


extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtpi8_ps (__m64 __A)
{
  __v8qi __sign;




  __sign = __builtin_ia32_pcmpgtb ((__v8qi)0LL, (__v8qi)__A);


  __A = (__m64) __builtin_ia32_punpcklbw ((__v8qi)__A, __sign);

  return _mm_cvtpi16_ps(__A);
}


extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtpu8_ps(__m64 __A)
{
  __A = (__m64) __builtin_ia32_punpcklbw ((__v8qi)__A, (__v8qi)0LL);
  return _mm_cvtpu16_ps(__A);
}


extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtpi32x2_ps(__m64 __A, __m64 __B)
{
  __v4sf __zero = (__v4sf) _mm_setzero_ps ();
  __v4sf __sfa = __builtin_ia32_cvtpi2ps (__zero, (__v2si)__A);
  __v4sf __sfb = __builtin_ia32_cvtpi2ps (__sfa, (__v2si)__B);
  return (__m128) __builtin_ia32_movlhps (__sfa, __sfb);
}


extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtps_pi16(__m128 __A)
{
  __v4sf __hisf = (__v4sf)__A;
  __v4sf __losf = __builtin_ia32_movhlps (__hisf, __hisf);
  __v2si __hisi = __builtin_ia32_cvtps2pi (__hisf);
  __v2si __losi = __builtin_ia32_cvtps2pi (__losf);
  return (__m64) __builtin_ia32_packssdw (__hisi, __losi);
}


extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtps_pi8(__m128 __A)
{
  __v4hi __tmp = (__v4hi) _mm_cvtps_pi16 (__A);
  return (__m64) __builtin_ia32_packsswb (__tmp, (__v4hi)0LL);
}
# 752 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/xmmintrin.h" 3 4
extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_unpackhi_ps (__m128 __A, __m128 __B)
{
  return (__m128) __builtin_ia32_unpckhps ((__v4sf)__A, (__v4sf)__B);
}


extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_unpacklo_ps (__m128 __A, __m128 __B)
{
  return (__m128) __builtin_ia32_unpcklps ((__v4sf)__A, (__v4sf)__B);
}



extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_loadh_pi (__m128 __A, __m64 const *__P)
{
  return (__m128) __builtin_ia32_loadhps ((__v4sf)__A, (const __v2sf *)__P);
}


extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_storeh_pi (__m64 *__P, __m128 __A)
{
  __builtin_ia32_storehps ((__v2sf *)__P, (__v4sf)__A);
}


extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_movehl_ps (__m128 __A, __m128 __B)
{
  return (__m128) __builtin_ia32_movhlps ((__v4sf)__A, (__v4sf)__B);
}


extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_movelh_ps (__m128 __A, __m128 __B)
{
  return (__m128) __builtin_ia32_movlhps ((__v4sf)__A, (__v4sf)__B);
}



extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_loadl_pi (__m128 __A, __m64 const *__P)
{
  return (__m128) __builtin_ia32_loadlps ((__v4sf)__A, (const __v2sf *)__P);
}


extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_storel_pi (__m64 *__P, __m128 __A)
{
  __builtin_ia32_storelps ((__v2sf *)__P, (__v4sf)__A);
}


extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_movemask_ps (__m128 __A)
{
  return __builtin_ia32_movmskps ((__v4sf)__A);
}


extern __inline unsigned int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_getcsr (void)
{
  return __builtin_ia32_stmxcsr ();
}


extern __inline unsigned int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_MM_GET_EXCEPTION_STATE (void)
{
  return _mm_getcsr() & 0x003f;
}

extern __inline unsigned int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_MM_GET_EXCEPTION_MASK (void)
{
  return _mm_getcsr() & 0x1f80;
}

extern __inline unsigned int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_MM_GET_ROUNDING_MODE (void)
{
  return _mm_getcsr() & 0x6000;
}

extern __inline unsigned int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_MM_GET_FLUSH_ZERO_MODE (void)
{
  return _mm_getcsr() & 0x8000;
}


extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_setcsr (unsigned int __I)
{
  __builtin_ia32_ldmxcsr (__I);
}


extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_MM_SET_EXCEPTION_STATE(unsigned int __mask)
{
  _mm_setcsr((_mm_getcsr() & ~0x003f) | __mask);
}

extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_MM_SET_EXCEPTION_MASK (unsigned int __mask)
{
  _mm_setcsr((_mm_getcsr() & ~0x1f80) | __mask);
}

extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_MM_SET_ROUNDING_MODE (unsigned int __mode)
{
  _mm_setcsr((_mm_getcsr() & ~0x6000) | __mode);
}

extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_MM_SET_FLUSH_ZERO_MODE (unsigned int __mode)
{
  _mm_setcsr((_mm_getcsr() & ~0x8000) | __mode);
}


extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_set_ss (float __F)
{
  return __extension__ (__m128)(__v4sf){ __F, 0.0f, 0.0f, 0.0f };
}


extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_set1_ps (float __F)
{
  return __extension__ (__m128)(__v4sf){ __F, __F, __F, __F };
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_set_ps1 (float __F)
{
  return _mm_set1_ps (__F);
}


extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_load_ss (float const *__P)
{
  return _mm_set_ss (*__P);
}


extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_load1_ps (float const *__P)
{
  return _mm_set1_ps (*__P);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_load_ps1 (float const *__P)
{
  return _mm_load1_ps (__P);
}


extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_load_ps (float const *__P)
{
  return (__m128) *(__v4sf *)__P;
}


extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_loadu_ps (float const *__P)
{
  return (__m128) __builtin_ia32_loadups (__P);
}


extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_loadr_ps (float const *__P)
{
  __v4sf __tmp = *(__v4sf *)__P;
  return (__m128) __builtin_ia32_shufps (__tmp, __tmp, (((0) << 6) | ((1) << 4) | ((2) << 2) | (3)));
}


extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_set_ps (const float __Z, const float __Y, const float __X, const float __W)
{
  return __extension__ (__m128)(__v4sf){ __W, __X, __Y, __Z };
}


extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_setr_ps (float __Z, float __Y, float __X, float __W)
{
  return __extension__ (__m128)(__v4sf){ __Z, __Y, __X, __W };
}


extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_store_ss (float *__P, __m128 __A)
{
  *__P = __builtin_ia32_vec_ext_v4sf ((__v4sf)__A, 0);
}

extern __inline float __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtss_f32 (__m128 __A)
{
  return __builtin_ia32_vec_ext_v4sf ((__v4sf)__A, 0);
}


extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_store_ps (float *__P, __m128 __A)
{
  *(__v4sf *)__P = (__v4sf)__A;
}


extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_storeu_ps (float *__P, __m128 __A)
{
  __builtin_ia32_storeups (__P, (__v4sf)__A);
}


extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_store1_ps (float *__P, __m128 __A)
{
  __v4sf __va = (__v4sf)__A;
  __v4sf __tmp = __builtin_ia32_shufps (__va, __va, (((0) << 6) | ((0) << 4) | ((0) << 2) | (0)));
  _mm_storeu_ps (__P, __tmp);
}

extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_store_ps1 (float *__P, __m128 __A)
{
  _mm_store1_ps (__P, __A);
}


extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_storer_ps (float *__P, __m128 __A)
{
  __v4sf __va = (__v4sf)__A;
  __v4sf __tmp = __builtin_ia32_shufps (__va, __va, (((0) << 6) | ((1) << 4) | ((2) << 2) | (3)));
  _mm_store_ps (__P, __tmp);
}


extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_move_ss (__m128 __A, __m128 __B)
{
  return (__m128) __builtin_ia32_movss ((__v4sf)__A, (__v4sf)__B);
}
# 1057 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/xmmintrin.h" 3 4
extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_max_pi16 (__m64 __A, __m64 __B)
{
  return (__m64) __builtin_ia32_pmaxsw ((__v4hi)__A, (__v4hi)__B);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_pmaxsw (__m64 __A, __m64 __B)
{
  return _mm_max_pi16 (__A, __B);
}


extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_max_pu8 (__m64 __A, __m64 __B)
{
  return (__m64) __builtin_ia32_pmaxub ((__v8qi)__A, (__v8qi)__B);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_pmaxub (__m64 __A, __m64 __B)
{
  return _mm_max_pu8 (__A, __B);
}


extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_min_pi16 (__m64 __A, __m64 __B)
{
  return (__m64) __builtin_ia32_pminsw ((__v4hi)__A, (__v4hi)__B);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_pminsw (__m64 __A, __m64 __B)
{
  return _mm_min_pi16 (__A, __B);
}


extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_min_pu8 (__m64 __A, __m64 __B)
{
  return (__m64) __builtin_ia32_pminub ((__v8qi)__A, (__v8qi)__B);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_pminub (__m64 __A, __m64 __B)
{
  return _mm_min_pu8 (__A, __B);
}


extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_movemask_pi8 (__m64 __A)
{
  return __builtin_ia32_pmovmskb ((__v8qi)__A);
}

extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_pmovmskb (__m64 __A)
{
  return _mm_movemask_pi8 (__A);
}



extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_mulhi_pu16 (__m64 __A, __m64 __B)
{
  return (__m64) __builtin_ia32_pmulhuw ((__v4hi)__A, (__v4hi)__B);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_pmulhuw (__m64 __A, __m64 __B)
{
  return _mm_mulhi_pu16 (__A, __B);
}
# 1159 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/xmmintrin.h" 3 4
extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_maskmove_si64 (__m64 __A, __m64 __N, char *__P)
{
  __builtin_ia32_maskmovq ((__v8qi)__A, (__v8qi)__N, __P);
}

extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_maskmovq (__m64 __A, __m64 __N, char *__P)
{
  _mm_maskmove_si64 (__A, __N, __P);
}


extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_avg_pu8 (__m64 __A, __m64 __B)
{
  return (__m64) __builtin_ia32_pavgb ((__v8qi)__A, (__v8qi)__B);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_pavgb (__m64 __A, __m64 __B)
{
  return _mm_avg_pu8 (__A, __B);
}


extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_avg_pu16 (__m64 __A, __m64 __B)
{
  return (__m64) __builtin_ia32_pavgw ((__v4hi)__A, (__v4hi)__B);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_pavgw (__m64 __A, __m64 __B)
{
  return _mm_avg_pu16 (__A, __B);
}




extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_sad_pu8 (__m64 __A, __m64 __B)
{
  return (__m64) __builtin_ia32_psadbw ((__v8qi)__A, (__v8qi)__B);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_m_psadbw (__m64 __A, __m64 __B)
{
  return _mm_sad_pu8 (__A, __B);
}


extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_stream_pi (__m64 *__P, __m64 __A)
{
  __builtin_ia32_movntq ((unsigned long long *)__P, (unsigned long long)__A);
}


extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_stream_ps (float *__P, __m128 __A)
{
  __builtin_ia32_movntps (__P, (__v4sf)__A);
}



extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_sfence (void)
{
  __builtin_ia32_sfence ();
}




extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_pause (void)
{
  __builtin_ia32_pause ();
}
# 1258 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/xmmintrin.h" 3 4
# 1 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/emmintrin.h" 1 3 4
# 31 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/emmintrin.h" 3 4
# 1 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/xmmintrin.h" 1 3 4
# 32 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/emmintrin.h" 2 3 4
# 40 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/emmintrin.h" 3 4
typedef double __v2df __attribute__ ((__vector_size__ (16)));
typedef long long __v2di __attribute__ ((__vector_size__ (16)));
typedef int __v4si __attribute__ ((__vector_size__ (16)));
typedef short __v8hi __attribute__ ((__vector_size__ (16)));
typedef char __v16qi __attribute__ ((__vector_size__ (16)));



typedef long long __m128i __attribute__ ((__vector_size__ (16), __may_alias__));
typedef double __m128d __attribute__ ((__vector_size__ (16), __may_alias__));






extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_set_sd (double __F)
{
  return __extension__ (__m128d){ __F, 0.0 };
}


extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_set1_pd (double __F)
{
  return __extension__ (__m128d){ __F, __F };
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_set_pd1 (double __F)
{
  return _mm_set1_pd (__F);
}


extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_set_pd (double __W, double __X)
{
  return __extension__ (__m128d){ __X, __W };
}


extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_setr_pd (double __W, double __X)
{
  return __extension__ (__m128d){ __W, __X };
}


extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_undefined_pd (void)
{
  __m128d __Y = __Y;
  return __Y;
}


extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_setzero_pd (void)
{
  return __extension__ (__m128d){ 0.0, 0.0 };
}


extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_move_sd (__m128d __A, __m128d __B)
{
  return (__m128d) __builtin_ia32_movsd ((__v2df)__A, (__v2df)__B);
}


extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_load_pd (double const *__P)
{
  return *(__m128d *)__P;
}


extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_loadu_pd (double const *__P)
{
  return __builtin_ia32_loadupd (__P);
}


extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_load1_pd (double const *__P)
{
  return _mm_set1_pd (*__P);
}


extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_load_sd (double const *__P)
{
  return _mm_set_sd (*__P);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_load_pd1 (double const *__P)
{
  return _mm_load1_pd (__P);
}


extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_loadr_pd (double const *__P)
{
  __m128d __tmp = _mm_load_pd (__P);
  return __builtin_ia32_shufpd (__tmp, __tmp, (((0) << 1) | (1)));
}


extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_store_pd (double *__P, __m128d __A)
{
  *(__m128d *)__P = __A;
}


extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_storeu_pd (double *__P, __m128d __A)
{
  __builtin_ia32_storeupd (__P, __A);
}


extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_store_sd (double *__P, __m128d __A)
{
  *__P = __builtin_ia32_vec_ext_v2df (__A, 0);
}

extern __inline double __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtsd_f64 (__m128d __A)
{
  return __builtin_ia32_vec_ext_v2df (__A, 0);
}

extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_storel_pd (double *__P, __m128d __A)
{
  _mm_store_sd (__P, __A);
}


extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_storeh_pd (double *__P, __m128d __A)
{
  *__P = __builtin_ia32_vec_ext_v2df (__A, 1);
}



extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_store1_pd (double *__P, __m128d __A)
{
  _mm_store_pd (__P, __builtin_ia32_shufpd (__A, __A, (((0) << 1) | (0))));
}

extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_store_pd1 (double *__P, __m128d __A)
{
  _mm_store1_pd (__P, __A);
}


extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_storer_pd (double *__P, __m128d __A)
{
  _mm_store_pd (__P, __builtin_ia32_shufpd (__A, __A, (((0) << 1) | (1))));
}

extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtsi128_si32 (__m128i __A)
{
  return __builtin_ia32_vec_ext_v4si ((__v4si)__A, 0);
}



extern __inline long long __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtsi128_si64 (__m128i __A)
{
  return __builtin_ia32_vec_ext_v2di ((__v2di)__A, 0);
}


extern __inline long long __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtsi128_si64x (__m128i __A)
{
  return __builtin_ia32_vec_ext_v2di ((__v2di)__A, 0);
}


extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_add_pd (__m128d __A, __m128d __B)
{
  return (__m128d)__builtin_ia32_addpd ((__v2df)__A, (__v2df)__B);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_add_sd (__m128d __A, __m128d __B)
{
  return (__m128d)__builtin_ia32_addsd ((__v2df)__A, (__v2df)__B);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_sub_pd (__m128d __A, __m128d __B)
{
  return (__m128d)__builtin_ia32_subpd ((__v2df)__A, (__v2df)__B);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_sub_sd (__m128d __A, __m128d __B)
{
  return (__m128d)__builtin_ia32_subsd ((__v2df)__A, (__v2df)__B);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_mul_pd (__m128d __A, __m128d __B)
{
  return (__m128d)__builtin_ia32_mulpd ((__v2df)__A, (__v2df)__B);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_mul_sd (__m128d __A, __m128d __B)
{
  return (__m128d)__builtin_ia32_mulsd ((__v2df)__A, (__v2df)__B);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_div_pd (__m128d __A, __m128d __B)
{
  return (__m128d)__builtin_ia32_divpd ((__v2df)__A, (__v2df)__B);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_div_sd (__m128d __A, __m128d __B)
{
  return (__m128d)__builtin_ia32_divsd ((__v2df)__A, (__v2df)__B);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_sqrt_pd (__m128d __A)
{
  return (__m128d)__builtin_ia32_sqrtpd ((__v2df)__A);
}


extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_sqrt_sd (__m128d __A, __m128d __B)
{
  __v2df __tmp = __builtin_ia32_movsd ((__v2df)__A, (__v2df)__B);
  return (__m128d)__builtin_ia32_sqrtsd ((__v2df)__tmp);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_min_pd (__m128d __A, __m128d __B)
{
  return (__m128d)__builtin_ia32_minpd ((__v2df)__A, (__v2df)__B);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_min_sd (__m128d __A, __m128d __B)
{
  return (__m128d)__builtin_ia32_minsd ((__v2df)__A, (__v2df)__B);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_max_pd (__m128d __A, __m128d __B)
{
  return (__m128d)__builtin_ia32_maxpd ((__v2df)__A, (__v2df)__B);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_max_sd (__m128d __A, __m128d __B)
{
  return (__m128d)__builtin_ia32_maxsd ((__v2df)__A, (__v2df)__B);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_and_pd (__m128d __A, __m128d __B)
{
  return (__m128d)__builtin_ia32_andpd ((__v2df)__A, (__v2df)__B);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_andnot_pd (__m128d __A, __m128d __B)
{
  return (__m128d)__builtin_ia32_andnpd ((__v2df)__A, (__v2df)__B);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_or_pd (__m128d __A, __m128d __B)
{
  return (__m128d)__builtin_ia32_orpd ((__v2df)__A, (__v2df)__B);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_xor_pd (__m128d __A, __m128d __B)
{
  return (__m128d)__builtin_ia32_xorpd ((__v2df)__A, (__v2df)__B);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpeq_pd (__m128d __A, __m128d __B)
{
  return (__m128d)__builtin_ia32_cmpeqpd ((__v2df)__A, (__v2df)__B);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmplt_pd (__m128d __A, __m128d __B)
{
  return (__m128d)__builtin_ia32_cmpltpd ((__v2df)__A, (__v2df)__B);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmple_pd (__m128d __A, __m128d __B)
{
  return (__m128d)__builtin_ia32_cmplepd ((__v2df)__A, (__v2df)__B);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpgt_pd (__m128d __A, __m128d __B)
{
  return (__m128d)__builtin_ia32_cmpgtpd ((__v2df)__A, (__v2df)__B);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpge_pd (__m128d __A, __m128d __B)
{
  return (__m128d)__builtin_ia32_cmpgepd ((__v2df)__A, (__v2df)__B);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpneq_pd (__m128d __A, __m128d __B)
{
  return (__m128d)__builtin_ia32_cmpneqpd ((__v2df)__A, (__v2df)__B);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpnlt_pd (__m128d __A, __m128d __B)
{
  return (__m128d)__builtin_ia32_cmpnltpd ((__v2df)__A, (__v2df)__B);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpnle_pd (__m128d __A, __m128d __B)
{
  return (__m128d)__builtin_ia32_cmpnlepd ((__v2df)__A, (__v2df)__B);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpngt_pd (__m128d __A, __m128d __B)
{
  return (__m128d)__builtin_ia32_cmpngtpd ((__v2df)__A, (__v2df)__B);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpnge_pd (__m128d __A, __m128d __B)
{
  return (__m128d)__builtin_ia32_cmpngepd ((__v2df)__A, (__v2df)__B);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpord_pd (__m128d __A, __m128d __B)
{
  return (__m128d)__builtin_ia32_cmpordpd ((__v2df)__A, (__v2df)__B);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpunord_pd (__m128d __A, __m128d __B)
{
  return (__m128d)__builtin_ia32_cmpunordpd ((__v2df)__A, (__v2df)__B);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpeq_sd (__m128d __A, __m128d __B)
{
  return (__m128d)__builtin_ia32_cmpeqsd ((__v2df)__A, (__v2df)__B);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmplt_sd (__m128d __A, __m128d __B)
{
  return (__m128d)__builtin_ia32_cmpltsd ((__v2df)__A, (__v2df)__B);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmple_sd (__m128d __A, __m128d __B)
{
  return (__m128d)__builtin_ia32_cmplesd ((__v2df)__A, (__v2df)__B);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpgt_sd (__m128d __A, __m128d __B)
{
  return (__m128d) __builtin_ia32_movsd ((__v2df) __A,
      (__v2df)
      __builtin_ia32_cmpltsd ((__v2df) __B,
         (__v2df)
         __A));
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpge_sd (__m128d __A, __m128d __B)
{
  return (__m128d) __builtin_ia32_movsd ((__v2df) __A,
      (__v2df)
      __builtin_ia32_cmplesd ((__v2df) __B,
         (__v2df)
         __A));
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpneq_sd (__m128d __A, __m128d __B)
{
  return (__m128d)__builtin_ia32_cmpneqsd ((__v2df)__A, (__v2df)__B);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpnlt_sd (__m128d __A, __m128d __B)
{
  return (__m128d)__builtin_ia32_cmpnltsd ((__v2df)__A, (__v2df)__B);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpnle_sd (__m128d __A, __m128d __B)
{
  return (__m128d)__builtin_ia32_cmpnlesd ((__v2df)__A, (__v2df)__B);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpngt_sd (__m128d __A, __m128d __B)
{
  return (__m128d) __builtin_ia32_movsd ((__v2df) __A,
      (__v2df)
      __builtin_ia32_cmpnltsd ((__v2df) __B,
          (__v2df)
          __A));
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpnge_sd (__m128d __A, __m128d __B)
{
  return (__m128d) __builtin_ia32_movsd ((__v2df) __A,
      (__v2df)
      __builtin_ia32_cmpnlesd ((__v2df) __B,
          (__v2df)
          __A));
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpord_sd (__m128d __A, __m128d __B)
{
  return (__m128d)__builtin_ia32_cmpordsd ((__v2df)__A, (__v2df)__B);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpunord_sd (__m128d __A, __m128d __B)
{
  return (__m128d)__builtin_ia32_cmpunordsd ((__v2df)__A, (__v2df)__B);
}

extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_comieq_sd (__m128d __A, __m128d __B)
{
  return __builtin_ia32_comisdeq ((__v2df)__A, (__v2df)__B);
}

extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_comilt_sd (__m128d __A, __m128d __B)
{
  return __builtin_ia32_comisdlt ((__v2df)__A, (__v2df)__B);
}

extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_comile_sd (__m128d __A, __m128d __B)
{
  return __builtin_ia32_comisdle ((__v2df)__A, (__v2df)__B);
}

extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_comigt_sd (__m128d __A, __m128d __B)
{
  return __builtin_ia32_comisdgt ((__v2df)__A, (__v2df)__B);
}

extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_comige_sd (__m128d __A, __m128d __B)
{
  return __builtin_ia32_comisdge ((__v2df)__A, (__v2df)__B);
}

extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_comineq_sd (__m128d __A, __m128d __B)
{
  return __builtin_ia32_comisdneq ((__v2df)__A, (__v2df)__B);
}

extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_ucomieq_sd (__m128d __A, __m128d __B)
{
  return __builtin_ia32_ucomisdeq ((__v2df)__A, (__v2df)__B);
}

extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_ucomilt_sd (__m128d __A, __m128d __B)
{
  return __builtin_ia32_ucomisdlt ((__v2df)__A, (__v2df)__B);
}

extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_ucomile_sd (__m128d __A, __m128d __B)
{
  return __builtin_ia32_ucomisdle ((__v2df)__A, (__v2df)__B);
}

extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_ucomigt_sd (__m128d __A, __m128d __B)
{
  return __builtin_ia32_ucomisdgt ((__v2df)__A, (__v2df)__B);
}

extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_ucomige_sd (__m128d __A, __m128d __B)
{
  return __builtin_ia32_ucomisdge ((__v2df)__A, (__v2df)__B);
}

extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_ucomineq_sd (__m128d __A, __m128d __B)
{
  return __builtin_ia32_ucomisdneq ((__v2df)__A, (__v2df)__B);
}



extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_set_epi64x (long long __q1, long long __q0)
{
  return __extension__ (__m128i)(__v2di){ __q0, __q1 };
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_set_epi64 (__m64 __q1, __m64 __q0)
{
  return _mm_set_epi64x ((long long)__q1, (long long)__q0);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_set_epi32 (int __q3, int __q2, int __q1, int __q0)
{
  return __extension__ (__m128i)(__v4si){ __q0, __q1, __q2, __q3 };
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_set_epi16 (short __q7, short __q6, short __q5, short __q4,
        short __q3, short __q2, short __q1, short __q0)
{
  return __extension__ (__m128i)(__v8hi){
    __q0, __q1, __q2, __q3, __q4, __q5, __q6, __q7 };
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_set_epi8 (char __q15, char __q14, char __q13, char __q12,
       char __q11, char __q10, char __q09, char __q08,
       char __q07, char __q06, char __q05, char __q04,
       char __q03, char __q02, char __q01, char __q00)
{
  return __extension__ (__m128i)(__v16qi){
    __q00, __q01, __q02, __q03, __q04, __q05, __q06, __q07,
    __q08, __q09, __q10, __q11, __q12, __q13, __q14, __q15
  };
}



extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_set1_epi64x (long long __A)
{
  return _mm_set_epi64x (__A, __A);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_set1_epi64 (__m64 __A)
{
  return _mm_set_epi64 (__A, __A);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_set1_epi32 (int __A)
{
  return _mm_set_epi32 (__A, __A, __A, __A);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_set1_epi16 (short __A)
{
  return _mm_set_epi16 (__A, __A, __A, __A, __A, __A, __A, __A);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_set1_epi8 (char __A)
{
  return _mm_set_epi8 (__A, __A, __A, __A, __A, __A, __A, __A,
         __A, __A, __A, __A, __A, __A, __A, __A);
}




extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_setr_epi64 (__m64 __q0, __m64 __q1)
{
  return _mm_set_epi64 (__q1, __q0);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_setr_epi32 (int __q0, int __q1, int __q2, int __q3)
{
  return _mm_set_epi32 (__q3, __q2, __q1, __q0);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_setr_epi16 (short __q0, short __q1, short __q2, short __q3,
         short __q4, short __q5, short __q6, short __q7)
{
  return _mm_set_epi16 (__q7, __q6, __q5, __q4, __q3, __q2, __q1, __q0);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_setr_epi8 (char __q00, char __q01, char __q02, char __q03,
        char __q04, char __q05, char __q06, char __q07,
        char __q08, char __q09, char __q10, char __q11,
        char __q12, char __q13, char __q14, char __q15)
{
  return _mm_set_epi8 (__q15, __q14, __q13, __q12, __q11, __q10, __q09, __q08,
         __q07, __q06, __q05, __q04, __q03, __q02, __q01, __q00);
}



extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_load_si128 (__m128i const *__P)
{
  return *__P;
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_loadu_si128 (__m128i const *__P)
{
  return (__m128i) __builtin_ia32_loaddqu ((char const *)__P);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_loadl_epi64 (__m128i const *__P)
{
  return _mm_set_epi64 ((__m64)0LL, *(__m64 *)__P);
}

extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_store_si128 (__m128i *__P, __m128i __B)
{
  *__P = __B;
}

extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_storeu_si128 (__m128i *__P, __m128i __B)
{
  __builtin_ia32_storedqu ((char *)__P, (__v16qi)__B);
}

extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_storel_epi64 (__m128i *__P, __m128i __B)
{
  *(long long *)__P = __builtin_ia32_vec_ext_v2di ((__v2di)__B, 0);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_movepi64_pi64 (__m128i __B)
{
  return (__m64) __builtin_ia32_vec_ext_v2di ((__v2di)__B, 0);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_movpi64_epi64 (__m64 __A)
{
  return _mm_set_epi64 ((__m64)0LL, __A);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_move_epi64 (__m128i __A)
{
  return (__m128i)__builtin_ia32_movq128 ((__v2di) __A);
}


extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_undefined_si128 (void)
{
  __m128i __Y = __Y;
  return __Y;
}


extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_setzero_si128 (void)
{
  return __extension__ (__m128i)(__v4si){ 0, 0, 0, 0 };
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtepi32_pd (__m128i __A)
{
  return (__m128d)__builtin_ia32_cvtdq2pd ((__v4si) __A);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtepi32_ps (__m128i __A)
{
  return (__m128)__builtin_ia32_cvtdq2ps ((__v4si) __A);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtpd_epi32 (__m128d __A)
{
  return (__m128i)__builtin_ia32_cvtpd2dq ((__v2df) __A);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtpd_pi32 (__m128d __A)
{
  return (__m64)__builtin_ia32_cvtpd2pi ((__v2df) __A);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtpd_ps (__m128d __A)
{
  return (__m128)__builtin_ia32_cvtpd2ps ((__v2df) __A);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvttpd_epi32 (__m128d __A)
{
  return (__m128i)__builtin_ia32_cvttpd2dq ((__v2df) __A);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvttpd_pi32 (__m128d __A)
{
  return (__m64)__builtin_ia32_cvttpd2pi ((__v2df) __A);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtpi32_pd (__m64 __A)
{
  return (__m128d)__builtin_ia32_cvtpi2pd ((__v2si) __A);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtps_epi32 (__m128 __A)
{
  return (__m128i)__builtin_ia32_cvtps2dq ((__v4sf) __A);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvttps_epi32 (__m128 __A)
{
  return (__m128i)__builtin_ia32_cvttps2dq ((__v4sf) __A);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtps_pd (__m128 __A)
{
  return (__m128d)__builtin_ia32_cvtps2pd ((__v4sf) __A);
}

extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtsd_si32 (__m128d __A)
{
  return __builtin_ia32_cvtsd2si ((__v2df) __A);
}



extern __inline long long __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtsd_si64 (__m128d __A)
{
  return __builtin_ia32_cvtsd2si64 ((__v2df) __A);
}


extern __inline long long __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtsd_si64x (__m128d __A)
{
  return __builtin_ia32_cvtsd2si64 ((__v2df) __A);
}


extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvttsd_si32 (__m128d __A)
{
  return __builtin_ia32_cvttsd2si ((__v2df) __A);
}



extern __inline long long __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvttsd_si64 (__m128d __A)
{
  return __builtin_ia32_cvttsd2si64 ((__v2df) __A);
}


extern __inline long long __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvttsd_si64x (__m128d __A)
{
  return __builtin_ia32_cvttsd2si64 ((__v2df) __A);
}


extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtsd_ss (__m128 __A, __m128d __B)
{
  return (__m128)__builtin_ia32_cvtsd2ss ((__v4sf) __A, (__v2df) __B);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtsi32_sd (__m128d __A, int __B)
{
  return (__m128d)__builtin_ia32_cvtsi2sd ((__v2df) __A, __B);
}



extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtsi64_sd (__m128d __A, long long __B)
{
  return (__m128d)__builtin_ia32_cvtsi642sd ((__v2df) __A, __B);
}


extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtsi64x_sd (__m128d __A, long long __B)
{
  return (__m128d)__builtin_ia32_cvtsi642sd ((__v2df) __A, __B);
}


extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtss_sd (__m128d __A, __m128 __B)
{
  return (__m128d)__builtin_ia32_cvtss2sd ((__v2df) __A, (__v4sf)__B);
}
# 910 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/emmintrin.h" 3 4
extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_unpackhi_pd (__m128d __A, __m128d __B)
{
  return (__m128d)__builtin_ia32_unpckhpd ((__v2df)__A, (__v2df)__B);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_unpacklo_pd (__m128d __A, __m128d __B)
{
  return (__m128d)__builtin_ia32_unpcklpd ((__v2df)__A, (__v2df)__B);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_loadh_pd (__m128d __A, double const *__B)
{
  return (__m128d)__builtin_ia32_loadhpd ((__v2df)__A, __B);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_loadl_pd (__m128d __A, double const *__B)
{
  return (__m128d)__builtin_ia32_loadlpd ((__v2df)__A, __B);
}

extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_movemask_pd (__m128d __A)
{
  return __builtin_ia32_movmskpd ((__v2df)__A);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_packs_epi16 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_packsswb128 ((__v8hi)__A, (__v8hi)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_packs_epi32 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_packssdw128 ((__v4si)__A, (__v4si)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_packus_epi16 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_packuswb128 ((__v8hi)__A, (__v8hi)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_unpackhi_epi8 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_punpckhbw128 ((__v16qi)__A, (__v16qi)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_unpackhi_epi16 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_punpckhwd128 ((__v8hi)__A, (__v8hi)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_unpackhi_epi32 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_punpckhdq128 ((__v4si)__A, (__v4si)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_unpackhi_epi64 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_punpckhqdq128 ((__v2di)__A, (__v2di)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_unpacklo_epi8 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_punpcklbw128 ((__v16qi)__A, (__v16qi)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_unpacklo_epi16 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_punpcklwd128 ((__v8hi)__A, (__v8hi)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_unpacklo_epi32 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_punpckldq128 ((__v4si)__A, (__v4si)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_unpacklo_epi64 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_punpcklqdq128 ((__v2di)__A, (__v2di)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_add_epi8 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_paddb128 ((__v16qi)__A, (__v16qi)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_add_epi16 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_paddw128 ((__v8hi)__A, (__v8hi)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_add_epi32 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_paddd128 ((__v4si)__A, (__v4si)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_add_epi64 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_paddq128 ((__v2di)__A, (__v2di)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_adds_epi8 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_paddsb128 ((__v16qi)__A, (__v16qi)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_adds_epi16 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_paddsw128 ((__v8hi)__A, (__v8hi)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_adds_epu8 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_paddusb128 ((__v16qi)__A, (__v16qi)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_adds_epu16 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_paddusw128 ((__v8hi)__A, (__v8hi)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_sub_epi8 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_psubb128 ((__v16qi)__A, (__v16qi)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_sub_epi16 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_psubw128 ((__v8hi)__A, (__v8hi)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_sub_epi32 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_psubd128 ((__v4si)__A, (__v4si)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_sub_epi64 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_psubq128 ((__v2di)__A, (__v2di)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_subs_epi8 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_psubsb128 ((__v16qi)__A, (__v16qi)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_subs_epi16 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_psubsw128 ((__v8hi)__A, (__v8hi)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_subs_epu8 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_psubusb128 ((__v16qi)__A, (__v16qi)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_subs_epu16 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_psubusw128 ((__v8hi)__A, (__v8hi)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_madd_epi16 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_pmaddwd128 ((__v8hi)__A, (__v8hi)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_mulhi_epi16 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_pmulhw128 ((__v8hi)__A, (__v8hi)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_mullo_epi16 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_pmullw128 ((__v8hi)__A, (__v8hi)__B);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_mul_su32 (__m64 __A, __m64 __B)
{
  return (__m64)__builtin_ia32_pmuludq ((__v2si)__A, (__v2si)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_mul_epu32 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_pmuludq128 ((__v4si)__A, (__v4si)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_slli_epi16 (__m128i __A, int __B)
{
  return (__m128i)__builtin_ia32_psllwi128 ((__v8hi)__A, __B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_slli_epi32 (__m128i __A, int __B)
{
  return (__m128i)__builtin_ia32_pslldi128 ((__v4si)__A, __B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_slli_epi64 (__m128i __A, int __B)
{
  return (__m128i)__builtin_ia32_psllqi128 ((__v2di)__A, __B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_srai_epi16 (__m128i __A, int __B)
{
  return (__m128i)__builtin_ia32_psrawi128 ((__v8hi)__A, __B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_srai_epi32 (__m128i __A, int __B)
{
  return (__m128i)__builtin_ia32_psradi128 ((__v4si)__A, __B);
}
# 1181 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/emmintrin.h" 3 4
extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_srli_epi16 (__m128i __A, int __B)
{
  return (__m128i)__builtin_ia32_psrlwi128 ((__v8hi)__A, __B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_srli_epi32 (__m128i __A, int __B)
{
  return (__m128i)__builtin_ia32_psrldi128 ((__v4si)__A, __B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_srli_epi64 (__m128i __A, int __B)
{
  return (__m128i)__builtin_ia32_psrlqi128 ((__v2di)__A, __B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_sll_epi16 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_psllw128((__v8hi)__A, (__v8hi)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_sll_epi32 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_pslld128((__v4si)__A, (__v4si)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_sll_epi64 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_psllq128((__v2di)__A, (__v2di)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_sra_epi16 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_psraw128 ((__v8hi)__A, (__v8hi)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_sra_epi32 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_psrad128 ((__v4si)__A, (__v4si)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_srl_epi16 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_psrlw128 ((__v8hi)__A, (__v8hi)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_srl_epi32 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_psrld128 ((__v4si)__A, (__v4si)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_srl_epi64 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_psrlq128 ((__v2di)__A, (__v2di)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_and_si128 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_pand128 ((__v2di)__A, (__v2di)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_andnot_si128 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_pandn128 ((__v2di)__A, (__v2di)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_or_si128 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_por128 ((__v2di)__A, (__v2di)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_xor_si128 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_pxor128 ((__v2di)__A, (__v2di)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpeq_epi8 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_pcmpeqb128 ((__v16qi)__A, (__v16qi)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpeq_epi16 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_pcmpeqw128 ((__v8hi)__A, (__v8hi)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpeq_epi32 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_pcmpeqd128 ((__v4si)__A, (__v4si)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmplt_epi8 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_pcmpgtb128 ((__v16qi)__B, (__v16qi)__A);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmplt_epi16 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_pcmpgtw128 ((__v8hi)__B, (__v8hi)__A);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmplt_epi32 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_pcmpgtd128 ((__v4si)__B, (__v4si)__A);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpgt_epi8 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_pcmpgtb128 ((__v16qi)__A, (__v16qi)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpgt_epi16 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_pcmpgtw128 ((__v8hi)__A, (__v8hi)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpgt_epi32 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_pcmpgtd128 ((__v4si)__A, (__v4si)__B);
}
# 1345 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/emmintrin.h" 3 4
extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_max_epi16 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_pmaxsw128 ((__v8hi)__A, (__v8hi)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_max_epu8 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_pmaxub128 ((__v16qi)__A, (__v16qi)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_min_epi16 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_pminsw128 ((__v8hi)__A, (__v8hi)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_min_epu8 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_pminub128 ((__v16qi)__A, (__v16qi)__B);
}

extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_movemask_epi8 (__m128i __A)
{
  return __builtin_ia32_pmovmskb128 ((__v16qi)__A);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_mulhi_epu16 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_pmulhuw128 ((__v8hi)__A, (__v8hi)__B);
}
# 1408 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/emmintrin.h" 3 4
extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_maskmoveu_si128 (__m128i __A, __m128i __B, char *__C)
{
  __builtin_ia32_maskmovdqu ((__v16qi)__A, (__v16qi)__B, __C);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_avg_epu8 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_pavgb128 ((__v16qi)__A, (__v16qi)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_avg_epu16 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_pavgw128 ((__v8hi)__A, (__v8hi)__B);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_sad_epu8 (__m128i __A, __m128i __B)
{
  return (__m128i)__builtin_ia32_psadbw128 ((__v16qi)__A, (__v16qi)__B);
}

extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_stream_si32 (int *__A, int __B)
{
  __builtin_ia32_movnti (__A, __B);
}


extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_stream_si64 (long long int *__A, long long int __B)
{
  __builtin_ia32_movnti64 (__A, __B);
}


extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_stream_si128 (__m128i *__A, __m128i __B)
{
  __builtin_ia32_movntdq ((__v2di *)__A, (__v2di)__B);
}

extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_stream_pd (double *__A, __m128d __B)
{
  __builtin_ia32_movntpd (__A, (__v2df)__B);
}

extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_clflush (void const *__A)
{
  __builtin_ia32_clflush (__A);
}

extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_lfence (void)
{
  __builtin_ia32_lfence ();
}

extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_mfence (void)
{
  __builtin_ia32_mfence ();
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtsi32_si128 (int __A)
{
  return _mm_set_epi32 (0, 0, 0, __A);
}



extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtsi64_si128 (long long __A)
{
  return _mm_set_epi64x (0, __A);
}


extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtsi64x_si128 (long long __A)
{
  return _mm_set_epi64x (0, __A);
}




extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_castpd_ps(__m128d __A)
{
  return (__m128) __A;
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_castpd_si128(__m128d __A)
{
  return (__m128i) __A;
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_castps_pd(__m128 __A)
{
  return (__m128d) __A;
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_castps_si128(__m128 __A)
{
  return (__m128i) __A;
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_castsi128_ps(__m128i __A)
{
  return (__m128) __A;
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_castsi128_pd(__m128i __A)
{
  return (__m128d) __A;
}
# 1259 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/xmmintrin.h" 2 3 4
# 35 "x86intrin.c" 2
# 62 "x86intrin.c"
# 1 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/immintrin.h" 1 3 4
# 33 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/immintrin.h" 3 4
# 1 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/pmmintrin.h" 1 3 4
# 34 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/pmmintrin.h" 3 4
#pragma GCC push_options
#pragma GCC target("sse3")
# 49 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/pmmintrin.h" 3 4
extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_addsub_ps (__m128 __X, __m128 __Y)
{
  return (__m128) __builtin_ia32_addsubps ((__v4sf)__X, (__v4sf)__Y);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_hadd_ps (__m128 __X, __m128 __Y)
{
  return (__m128) __builtin_ia32_haddps ((__v4sf)__X, (__v4sf)__Y);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_hsub_ps (__m128 __X, __m128 __Y)
{
  return (__m128) __builtin_ia32_hsubps ((__v4sf)__X, (__v4sf)__Y);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_movehdup_ps (__m128 __X)
{
  return (__m128) __builtin_ia32_movshdup ((__v4sf)__X);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_moveldup_ps (__m128 __X)
{
  return (__m128) __builtin_ia32_movsldup ((__v4sf)__X);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_addsub_pd (__m128d __X, __m128d __Y)
{
  return (__m128d) __builtin_ia32_addsubpd ((__v2df)__X, (__v2df)__Y);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_hadd_pd (__m128d __X, __m128d __Y)
{
  return (__m128d) __builtin_ia32_haddpd ((__v2df)__X, (__v2df)__Y);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_hsub_pd (__m128d __X, __m128d __Y)
{
  return (__m128d) __builtin_ia32_hsubpd ((__v2df)__X, (__v2df)__Y);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_loaddup_pd (double const *__P)
{
  return _mm_load1_pd (__P);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_movedup_pd (__m128d __X)
{
  return ((__m128d)__builtin_ia32_shufpd ((__v2df)(__m128d)(__X), (__v2df)(__m128d)(__X), (int)((((0) << 1) | (0)))));
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_lddqu_si128 (__m128i const *__P)
{
  return (__m128i) __builtin_ia32_lddqu ((char const *)__P);
}

extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_monitor (void const * __P, unsigned int __E, unsigned int __H)
{
  __builtin_ia32_monitor (__P, __E, __H);
}

extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_mwait (unsigned int __E, unsigned int __H)
{
  __builtin_ia32_mwait (__E, __H);
}



#pragma GCC pop_options
# 34 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/immintrin.h" 2 3 4

# 1 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/tmmintrin.h" 1 3 4
# 34 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/tmmintrin.h" 3 4
#pragma GCC push_options
#pragma GCC target("ssse3")



extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_hadd_epi16 (__m128i __X, __m128i __Y)
{
  return (__m128i) __builtin_ia32_phaddw128 ((__v8hi)__X, (__v8hi)__Y);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_hadd_epi32 (__m128i __X, __m128i __Y)
{
  return (__m128i) __builtin_ia32_phaddd128 ((__v4si)__X, (__v4si)__Y);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_hadds_epi16 (__m128i __X, __m128i __Y)
{
  return (__m128i) __builtin_ia32_phaddsw128 ((__v8hi)__X, (__v8hi)__Y);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_hadd_pi16 (__m64 __X, __m64 __Y)
{
  return (__m64) __builtin_ia32_phaddw ((__v4hi)__X, (__v4hi)__Y);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_hadd_pi32 (__m64 __X, __m64 __Y)
{
  return (__m64) __builtin_ia32_phaddd ((__v2si)__X, (__v2si)__Y);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_hadds_pi16 (__m64 __X, __m64 __Y)
{
  return (__m64) __builtin_ia32_phaddsw ((__v4hi)__X, (__v4hi)__Y);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_hsub_epi16 (__m128i __X, __m128i __Y)
{
  return (__m128i) __builtin_ia32_phsubw128 ((__v8hi)__X, (__v8hi)__Y);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_hsub_epi32 (__m128i __X, __m128i __Y)
{
  return (__m128i) __builtin_ia32_phsubd128 ((__v4si)__X, (__v4si)__Y);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_hsubs_epi16 (__m128i __X, __m128i __Y)
{
  return (__m128i) __builtin_ia32_phsubsw128 ((__v8hi)__X, (__v8hi)__Y);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_hsub_pi16 (__m64 __X, __m64 __Y)
{
  return (__m64) __builtin_ia32_phsubw ((__v4hi)__X, (__v4hi)__Y);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_hsub_pi32 (__m64 __X, __m64 __Y)
{
  return (__m64) __builtin_ia32_phsubd ((__v2si)__X, (__v2si)__Y);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_hsubs_pi16 (__m64 __X, __m64 __Y)
{
  return (__m64) __builtin_ia32_phsubsw ((__v4hi)__X, (__v4hi)__Y);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_maddubs_epi16 (__m128i __X, __m128i __Y)
{
  return (__m128i) __builtin_ia32_pmaddubsw128 ((__v16qi)__X, (__v16qi)__Y);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_maddubs_pi16 (__m64 __X, __m64 __Y)
{
  return (__m64) __builtin_ia32_pmaddubsw ((__v8qi)__X, (__v8qi)__Y);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_mulhrs_epi16 (__m128i __X, __m128i __Y)
{
  return (__m128i) __builtin_ia32_pmulhrsw128 ((__v8hi)__X, (__v8hi)__Y);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_mulhrs_pi16 (__m64 __X, __m64 __Y)
{
  return (__m64) __builtin_ia32_pmulhrsw ((__v4hi)__X, (__v4hi)__Y);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_shuffle_epi8 (__m128i __X, __m128i __Y)
{
  return (__m128i) __builtin_ia32_pshufb128 ((__v16qi)__X, (__v16qi)__Y);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_shuffle_pi8 (__m64 __X, __m64 __Y)
{
  return (__m64) __builtin_ia32_pshufb ((__v8qi)__X, (__v8qi)__Y);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_sign_epi8 (__m128i __X, __m128i __Y)
{
  return (__m128i) __builtin_ia32_psignb128 ((__v16qi)__X, (__v16qi)__Y);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_sign_epi16 (__m128i __X, __m128i __Y)
{
  return (__m128i) __builtin_ia32_psignw128 ((__v8hi)__X, (__v8hi)__Y);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_sign_epi32 (__m128i __X, __m128i __Y)
{
  return (__m128i) __builtin_ia32_psignd128 ((__v4si)__X, (__v4si)__Y);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_sign_pi8 (__m64 __X, __m64 __Y)
{
  return (__m64) __builtin_ia32_psignb ((__v8qi)__X, (__v8qi)__Y);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_sign_pi16 (__m64 __X, __m64 __Y)
{
  return (__m64) __builtin_ia32_psignw ((__v4hi)__X, (__v4hi)__Y);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_sign_pi32 (__m64 __X, __m64 __Y)
{
  return (__m64) __builtin_ia32_psignd ((__v2si)__X, (__v2si)__Y);
}
# 208 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/tmmintrin.h" 3 4
extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_abs_epi8 (__m128i __X)
{
  return (__m128i) __builtin_ia32_pabsb128 ((__v16qi)__X);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_abs_epi16 (__m128i __X)
{
  return (__m128i) __builtin_ia32_pabsw128 ((__v8hi)__X);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_abs_epi32 (__m128i __X)
{
  return (__m128i) __builtin_ia32_pabsd128 ((__v4si)__X);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_abs_pi8 (__m64 __X)
{
  return (__m64) __builtin_ia32_pabsb ((__v8qi)__X);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_abs_pi16 (__m64 __X)
{
  return (__m64) __builtin_ia32_pabsw ((__v4hi)__X);
}

extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_abs_pi32 (__m64 __X)
{
  return (__m64) __builtin_ia32_pabsd ((__v2si)__X);
}



#pragma GCC pop_options
# 36 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/immintrin.h" 2 3 4

# 1 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/smmintrin.h" 1 3 4
# 35 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/smmintrin.h" 3 4
#pragma GCC push_options
#pragma GCC target("sse4.1")
# 66 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/smmintrin.h" 3 4
extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_testz_si128 (__m128i __M, __m128i __V)
{
  return __builtin_ia32_ptestz128 ((__v2di)__M, (__v2di)__V);
}



extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_testc_si128 (__m128i __M, __m128i __V)
{
  return __builtin_ia32_ptestc128 ((__v2di)__M, (__v2di)__V);
}



extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_testnzc_si128 (__m128i __M, __m128i __V)
{
  return __builtin_ia32_ptestnzc128 ((__v2di)__M, (__v2di)__V);
}
# 178 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/smmintrin.h" 3 4
extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_blendv_epi8 (__m128i __X, __m128i __Y, __m128i __M)
{
  return (__m128i) __builtin_ia32_pblendvb128 ((__v16qi)__X,
            (__v16qi)__Y,
            (__v16qi)__M);
}
# 203 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/smmintrin.h" 3 4
extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_blendv_ps (__m128 __X, __m128 __Y, __m128 __M)
{
  return (__m128) __builtin_ia32_blendvps ((__v4sf)__X,
        (__v4sf)__Y,
        (__v4sf)__M);
}
# 228 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/smmintrin.h" 3 4
extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_blendv_pd (__m128d __X, __m128d __Y, __m128d __M)
{
  return (__m128d) __builtin_ia32_blendvpd ((__v2df)__X,
         (__v2df)__Y,
         (__v2df)__M);
}
# 267 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/smmintrin.h" 3 4
extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpeq_epi64 (__m128i __X, __m128i __Y)
{
  return (__m128i) __builtin_ia32_pcmpeqq ((__v2di)__X, (__v2di)__Y);
}



extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_min_epi8 (__m128i __X, __m128i __Y)
{
  return (__m128i) __builtin_ia32_pminsb128 ((__v16qi)__X, (__v16qi)__Y);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_max_epi8 (__m128i __X, __m128i __Y)
{
  return (__m128i) __builtin_ia32_pmaxsb128 ((__v16qi)__X, (__v16qi)__Y);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_min_epu16 (__m128i __X, __m128i __Y)
{
  return (__m128i) __builtin_ia32_pminuw128 ((__v8hi)__X, (__v8hi)__Y);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_max_epu16 (__m128i __X, __m128i __Y)
{
  return (__m128i) __builtin_ia32_pmaxuw128 ((__v8hi)__X, (__v8hi)__Y);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_min_epi32 (__m128i __X, __m128i __Y)
{
  return (__m128i) __builtin_ia32_pminsd128 ((__v4si)__X, (__v4si)__Y);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_max_epi32 (__m128i __X, __m128i __Y)
{
  return (__m128i) __builtin_ia32_pmaxsd128 ((__v4si)__X, (__v4si)__Y);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_min_epu32 (__m128i __X, __m128i __Y)
{
  return (__m128i) __builtin_ia32_pminud128 ((__v4si)__X, (__v4si)__Y);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_max_epu32 (__m128i __X, __m128i __Y)
{
  return (__m128i) __builtin_ia32_pmaxud128 ((__v4si)__X, (__v4si)__Y);
}



extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_mullo_epi32 (__m128i __X, __m128i __Y)
{
  return (__m128i) __builtin_ia32_pmulld128 ((__v4si)__X, (__v4si)__Y);
}



extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_mul_epi32 (__m128i __X, __m128i __Y)
{
  return (__m128i) __builtin_ia32_pmuldq128 ((__v4si)__X, (__v4si)__Y);
}
# 473 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/smmintrin.h" 3 4
extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_minpos_epu16 (__m128i __X)
{
  return (__m128i) __builtin_ia32_phminposuw128 ((__v8hi)__X);
}



extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtepi8_epi32 (__m128i __X)
{
  return (__m128i) __builtin_ia32_pmovsxbd128 ((__v16qi)__X);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtepi16_epi32 (__m128i __X)
{
  return (__m128i) __builtin_ia32_pmovsxwd128 ((__v8hi)__X);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtepi8_epi64 (__m128i __X)
{
  return (__m128i) __builtin_ia32_pmovsxbq128 ((__v16qi)__X);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtepi32_epi64 (__m128i __X)
{
  return (__m128i) __builtin_ia32_pmovsxdq128 ((__v4si)__X);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtepi16_epi64 (__m128i __X)
{
  return (__m128i) __builtin_ia32_pmovsxwq128 ((__v8hi)__X);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtepi8_epi16 (__m128i __X)
{
  return (__m128i) __builtin_ia32_pmovsxbw128 ((__v16qi)__X);
}



extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtepu8_epi32 (__m128i __X)
{
  return (__m128i) __builtin_ia32_pmovzxbd128 ((__v16qi)__X);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtepu16_epi32 (__m128i __X)
{
  return (__m128i) __builtin_ia32_pmovzxwd128 ((__v8hi)__X);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtepu8_epi64 (__m128i __X)
{
  return (__m128i) __builtin_ia32_pmovzxbq128 ((__v16qi)__X);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtepu32_epi64 (__m128i __X)
{
  return (__m128i) __builtin_ia32_pmovzxdq128 ((__v4si)__X);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtepu16_epi64 (__m128i __X)
{
  return (__m128i) __builtin_ia32_pmovzxwq128 ((__v8hi)__X);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtepu8_epi16 (__m128i __X)
{
  return (__m128i) __builtin_ia32_pmovzxbw128 ((__v16qi)__X);
}



extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_packus_epi32 (__m128i __X, __m128i __Y)
{
  return (__m128i) __builtin_ia32_packusdw128 ((__v4si)__X, (__v4si)__Y);
}
# 581 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/smmintrin.h" 3 4
extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_stream_load_si128 (__m128i *__X)
{
  return (__m128i) __builtin_ia32_movntdqa ((__v2di *) __X);
}


#pragma GCC push_options
#pragma GCC target("sse4.2")
# 795 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/smmintrin.h" 3 4
extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cmpgt_epi64 (__m128i __X, __m128i __Y)
{
  return (__m128i) __builtin_ia32_pcmpgtq ((__v2di)__X, (__v2di)__Y);
}



#pragma GCC pop_options




#pragma GCC pop_options


# 1 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/popcntintrin.h" 1 3 4
# 28 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/popcntintrin.h" 3 4
#pragma GCC push_options
#pragma GCC target("popcnt")




extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_popcnt_u32 (unsigned int __X)
{
  return __builtin_popcount (__X);
}


extern __inline long long __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_popcnt_u64 (unsigned long long __X)
{
  return __builtin_popcountll (__X);
}




#pragma GCC pop_options
# 812 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/smmintrin.h" 2 3 4


#pragma GCC push_options
#pragma GCC target("sse4.1")




#pragma GCC push_options
#pragma GCC target("sse4.2")




extern __inline unsigned int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_crc32_u8 (unsigned int __C, unsigned char __V)
{
  return __builtin_ia32_crc32qi (__C, __V);
}

extern __inline unsigned int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_crc32_u16 (unsigned int __C, unsigned short __V)
{
  return __builtin_ia32_crc32hi (__C, __V);
}

extern __inline unsigned int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_crc32_u32 (unsigned int __C, unsigned int __V)
{
  return __builtin_ia32_crc32si (__C, __V);
}


extern __inline unsigned long long __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_crc32_u64 (unsigned long long __C, unsigned long long __V)
{
  return __builtin_ia32_crc32di (__C, __V);
}




#pragma GCC pop_options




#pragma GCC pop_options
# 38 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/immintrin.h" 2 3 4

# 1 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/wmmintrin.h" 1 3 4
# 36 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/wmmintrin.h" 3 4
#pragma GCC push_options
#pragma GCC target("aes")





extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_aesdec_si128 (__m128i __X, __m128i __Y)
{
  return (__m128i) __builtin_ia32_aesdec128 ((__v2di)__X, (__v2di)__Y);
}



extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_aesdeclast_si128 (__m128i __X, __m128i __Y)
{
  return (__m128i) __builtin_ia32_aesdeclast128 ((__v2di)__X,
       (__v2di)__Y);
}



extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_aesenc_si128 (__m128i __X, __m128i __Y)
{
  return (__m128i) __builtin_ia32_aesenc128 ((__v2di)__X, (__v2di)__Y);
}



extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_aesenclast_si128 (__m128i __X, __m128i __Y)
{
  return (__m128i) __builtin_ia32_aesenclast128 ((__v2di)__X, (__v2di)__Y);
}



extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_aesimc_si128 (__m128i __X)
{
  return (__m128i) __builtin_ia32_aesimc128 ((__v2di)__X);
}
# 99 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/wmmintrin.h" 3 4
#pragma GCC pop_options





#pragma GCC push_options
#pragma GCC target("pclmul")
# 129 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/wmmintrin.h" 3 4
#pragma GCC pop_options
# 40 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/immintrin.h" 2 3 4

# 1 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avxintrin.h" 1 3 4
# 35 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avxintrin.h" 3 4
#pragma GCC push_options
#pragma GCC target("avx")




typedef double __v4df __attribute__ ((__vector_size__ (32)));
typedef float __v8sf __attribute__ ((__vector_size__ (32)));
typedef long long __v4di __attribute__ ((__vector_size__ (32)));
typedef int __v8si __attribute__ ((__vector_size__ (32)));
typedef short __v16hi __attribute__ ((__vector_size__ (32)));
typedef char __v32qi __attribute__ ((__vector_size__ (32)));



typedef float __m256 __attribute__ ((__vector_size__ (32),
         __may_alias__));
typedef long long __m256i __attribute__ ((__vector_size__ (32),
       __may_alias__));
typedef double __m256d __attribute__ ((__vector_size__ (32),
           __may_alias__));
# 124 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avxintrin.h" 3 4
extern __inline __m256d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_add_pd (__m256d __A, __m256d __B)
{
  return (__m256d) __builtin_ia32_addpd256 ((__v4df)__A, (__v4df)__B);
}

extern __inline __m256 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_add_ps (__m256 __A, __m256 __B)
{
  return (__m256) __builtin_ia32_addps256 ((__v8sf)__A, (__v8sf)__B);
}

extern __inline __m256d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_addsub_pd (__m256d __A, __m256d __B)
{
  return (__m256d) __builtin_ia32_addsubpd256 ((__v4df)__A, (__v4df)__B);
}

extern __inline __m256 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_addsub_ps (__m256 __A, __m256 __B)
{
  return (__m256) __builtin_ia32_addsubps256 ((__v8sf)__A, (__v8sf)__B);
}


extern __inline __m256d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_and_pd (__m256d __A, __m256d __B)
{
  return (__m256d) __builtin_ia32_andpd256 ((__v4df)__A, (__v4df)__B);
}

extern __inline __m256 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_and_ps (__m256 __A, __m256 __B)
{
  return (__m256) __builtin_ia32_andps256 ((__v8sf)__A, (__v8sf)__B);
}

extern __inline __m256d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_andnot_pd (__m256d __A, __m256d __B)
{
  return (__m256d) __builtin_ia32_andnpd256 ((__v4df)__A, (__v4df)__B);
}

extern __inline __m256 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_andnot_ps (__m256 __A, __m256 __B)
{
  return (__m256) __builtin_ia32_andnps256 ((__v8sf)__A, (__v8sf)__B);
}
# 202 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avxintrin.h" 3 4
extern __inline __m256d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_blendv_pd (__m256d __X, __m256d __Y, __m256d __M)
{
  return (__m256d) __builtin_ia32_blendvpd256 ((__v4df)__X,
            (__v4df)__Y,
            (__v4df)__M);
}

extern __inline __m256 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_blendv_ps (__m256 __X, __m256 __Y, __m256 __M)
{
  return (__m256) __builtin_ia32_blendvps256 ((__v8sf)__X,
           (__v8sf)__Y,
           (__v8sf)__M);
}

extern __inline __m256d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_div_pd (__m256d __A, __m256d __B)
{
  return (__m256d) __builtin_ia32_divpd256 ((__v4df)__A, (__v4df)__B);
}

extern __inline __m256 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_div_ps (__m256 __A, __m256 __B)
{
  return (__m256) __builtin_ia32_divps256 ((__v8sf)__A, (__v8sf)__B);
}
# 247 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avxintrin.h" 3 4
extern __inline __m256d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_hadd_pd (__m256d __X, __m256d __Y)
{
  return (__m256d) __builtin_ia32_haddpd256 ((__v4df)__X, (__v4df)__Y);
}

extern __inline __m256 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_hadd_ps (__m256 __X, __m256 __Y)
{
  return (__m256) __builtin_ia32_haddps256 ((__v8sf)__X, (__v8sf)__Y);
}

extern __inline __m256d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_hsub_pd (__m256d __X, __m256d __Y)
{
  return (__m256d) __builtin_ia32_hsubpd256 ((__v4df)__X, (__v4df)__Y);
}

extern __inline __m256 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_hsub_ps (__m256 __X, __m256 __Y)
{
  return (__m256) __builtin_ia32_hsubps256 ((__v8sf)__X, (__v8sf)__Y);
}

extern __inline __m256d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_max_pd (__m256d __A, __m256d __B)
{
  return (__m256d) __builtin_ia32_maxpd256 ((__v4df)__A, (__v4df)__B);
}

extern __inline __m256 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_max_ps (__m256 __A, __m256 __B)
{
  return (__m256) __builtin_ia32_maxps256 ((__v8sf)__A, (__v8sf)__B);
}

extern __inline __m256d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_min_pd (__m256d __A, __m256d __B)
{
  return (__m256d) __builtin_ia32_minpd256 ((__v4df)__A, (__v4df)__B);
}

extern __inline __m256 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_min_ps (__m256 __A, __m256 __B)
{
  return (__m256) __builtin_ia32_minps256 ((__v8sf)__A, (__v8sf)__B);
}

extern __inline __m256d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_mul_pd (__m256d __A, __m256d __B)
{
  return (__m256d) __builtin_ia32_mulpd256 ((__v4df)__A, (__v4df)__B);
}

extern __inline __m256 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_mul_ps (__m256 __A, __m256 __B)
{
  return (__m256) __builtin_ia32_mulps256 ((__v8sf)__A, (__v8sf)__B);
}

extern __inline __m256d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_or_pd (__m256d __A, __m256d __B)
{
  return (__m256d) __builtin_ia32_orpd256 ((__v4df)__A, (__v4df)__B);
}

extern __inline __m256 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_or_ps (__m256 __A, __m256 __B)
{
  return (__m256) __builtin_ia32_orps256 ((__v8sf)__A, (__v8sf)__B);
}
# 343 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avxintrin.h" 3 4
extern __inline __m256d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_sub_pd (__m256d __A, __m256d __B)
{
  return (__m256d) __builtin_ia32_subpd256 ((__v4df)__A, (__v4df)__B);
}

extern __inline __m256 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_sub_ps (__m256 __A, __m256 __B)
{
  return (__m256) __builtin_ia32_subps256 ((__v8sf)__A, (__v8sf)__B);
}

extern __inline __m256d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_xor_pd (__m256d __A, __m256d __B)
{
  return (__m256d) __builtin_ia32_xorpd256 ((__v4df)__A, (__v4df)__B);
}

extern __inline __m256 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_xor_ps (__m256 __A, __m256 __B)
{
  return (__m256) __builtin_ia32_xorps256 ((__v8sf)__A, (__v8sf)__B);
}
# 431 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avxintrin.h" 3 4
extern __inline __m256d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_cvtepi32_pd (__m128i __A)
{
  return (__m256d)__builtin_ia32_cvtdq2pd256 ((__v4si) __A);
}

extern __inline __m256 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_cvtepi32_ps (__m256i __A)
{
  return (__m256)__builtin_ia32_cvtdq2ps256 ((__v8si) __A);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_cvtpd_ps (__m256d __A)
{
  return (__m128)__builtin_ia32_cvtpd2ps256 ((__v4df) __A);
}

extern __inline __m256i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_cvtps_epi32 (__m256 __A)
{
  return (__m256i)__builtin_ia32_cvtps2dq256 ((__v8sf) __A);
}

extern __inline __m256d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_cvtps_pd (__m128 __A)
{
  return (__m256d)__builtin_ia32_cvtps2pd256 ((__v4sf) __A);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_cvttpd_epi32 (__m256d __A)
{
  return (__m128i)__builtin_ia32_cvttpd2dq256 ((__v4df) __A);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_cvtpd_epi32 (__m256d __A)
{
  return (__m128i)__builtin_ia32_cvtpd2dq256 ((__v4df) __A);
}

extern __inline __m256i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_cvttps_epi32 (__m256 __A)
{
  return (__m256i)__builtin_ia32_cvttps2dq256 ((__v8sf) __A);
}
# 571 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avxintrin.h" 3 4
extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_zeroall (void)
{
  __builtin_ia32_vzeroall ();
}

extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_zeroupper (void)
{
  __builtin_ia32_vzeroupper ();
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_permutevar_pd (__m128d __A, __m128i __C)
{
  return (__m128d) __builtin_ia32_vpermilvarpd ((__v2df)__A,
      (__v2di)__C);
}

extern __inline __m256d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_permutevar_pd (__m256d __A, __m256i __C)
{
  return (__m256d) __builtin_ia32_vpermilvarpd256 ((__v4df)__A,
         (__v4di)__C);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_permutevar_ps (__m128 __A, __m128i __C)
{
  return (__m128) __builtin_ia32_vpermilvarps ((__v4sf)__A,
            (__v4si)__C);
}

extern __inline __m256 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_permutevar_ps (__m256 __A, __m256i __C)
{
  return (__m256) __builtin_ia32_vpermilvarps256 ((__v8sf)__A,
        (__v8si)__C);
}
# 690 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avxintrin.h" 3 4
extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_broadcast_ss (float const *__X)
{
  return (__m128) __builtin_ia32_vbroadcastss (__X);
}

extern __inline __m256d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_broadcast_sd (double const *__X)
{
  return (__m256d) __builtin_ia32_vbroadcastsd256 (__X);
}

extern __inline __m256 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_broadcast_ss (float const *__X)
{
  return (__m256) __builtin_ia32_vbroadcastss256 (__X);
}

extern __inline __m256d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_broadcast_pd (__m128d const *__X)
{
  return (__m256d) __builtin_ia32_vbroadcastf128_pd256 (__X);
}

extern __inline __m256 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_broadcast_ps (__m128 const *__X)
{
  return (__m256) __builtin_ia32_vbroadcastf128_ps256 (__X);
}
# 829 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avxintrin.h" 3 4
extern __inline __m256d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_load_pd (double const *__P)
{
  return *(__m256d *)__P;
}

extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_store_pd (double *__P, __m256d __A)
{
  *(__m256d *)__P = __A;
}

extern __inline __m256 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_load_ps (float const *__P)
{
  return *(__m256 *)__P;
}

extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_store_ps (float *__P, __m256 __A)
{
  *(__m256 *)__P = __A;
}

extern __inline __m256d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_loadu_pd (double const *__P)
{
  return (__m256d) __builtin_ia32_loadupd256 (__P);
}

extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_storeu_pd (double *__P, __m256d __A)
{
  __builtin_ia32_storeupd256 (__P, (__v4df)__A);
}

extern __inline __m256 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_loadu_ps (float const *__P)
{
  return (__m256) __builtin_ia32_loadups256 (__P);
}

extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_storeu_ps (float *__P, __m256 __A)
{
  __builtin_ia32_storeups256 (__P, (__v8sf)__A);
}

extern __inline __m256i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_load_si256 (__m256i const *__P)
{
  return *__P;
}

extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_store_si256 (__m256i *__P, __m256i __A)
{
  *__P = __A;
}

extern __inline __m256i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_loadu_si256 (__m256i const *__P)
{
  return (__m256i) __builtin_ia32_loaddqu256 ((char const *)__P);
}

extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_storeu_si256 (__m256i *__P, __m256i __A)
{
  __builtin_ia32_storedqu256 ((char *)__P, (__v32qi)__A);
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_maskload_pd (double const *__P, __m128i __M)
{
  return (__m128d) __builtin_ia32_maskloadpd ((const __v2df *)__P,
           (__v2di)__M);
}

extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_maskstore_pd (double *__P, __m128i __M, __m128d __A)
{
  __builtin_ia32_maskstorepd ((__v2df *)__P, (__v2di)__M, (__v2df)__A);
}

extern __inline __m256d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_maskload_pd (double const *__P, __m256i __M)
{
  return (__m256d) __builtin_ia32_maskloadpd256 ((const __v4df *)__P,
       (__v4di)__M);
}

extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_maskstore_pd (double *__P, __m256i __M, __m256d __A)
{
  __builtin_ia32_maskstorepd256 ((__v4df *)__P, (__v4di)__M, (__v4df)__A);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_maskload_ps (float const *__P, __m128i __M)
{
  return (__m128) __builtin_ia32_maskloadps ((const __v4sf *)__P,
          (__v4si)__M);
}

extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_maskstore_ps (float *__P, __m128i __M, __m128 __A)
{
  __builtin_ia32_maskstoreps ((__v4sf *)__P, (__v4si)__M, (__v4sf)__A);
}

extern __inline __m256 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_maskload_ps (float const *__P, __m256i __M)
{
  return (__m256) __builtin_ia32_maskloadps256 ((const __v8sf *)__P,
      (__v8si)__M);
}

extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_maskstore_ps (float *__P, __m256i __M, __m256 __A)
{
  __builtin_ia32_maskstoreps256 ((__v8sf *)__P, (__v8si)__M, (__v8sf)__A);
}

extern __inline __m256 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_movehdup_ps (__m256 __X)
{
  return (__m256) __builtin_ia32_movshdup256 ((__v8sf)__X);
}

extern __inline __m256 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_moveldup_ps (__m256 __X)
{
  return (__m256) __builtin_ia32_movsldup256 ((__v8sf)__X);
}

extern __inline __m256d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_movedup_pd (__m256d __X)
{
  return (__m256d) __builtin_ia32_movddup256 ((__v4df)__X);
}

extern __inline __m256i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_lddqu_si256 (__m256i const *__P)
{
  return (__m256i) __builtin_ia32_lddqu256 ((char const *)__P);
}

extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_stream_si256 (__m256i *__A, __m256i __B)
{
  __builtin_ia32_movntdq256 ((__v4di *)__A, (__v4di)__B);
}

extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_stream_pd (double *__A, __m256d __B)
{
  __builtin_ia32_movntpd256 (__A, (__v4df)__B);
}

extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_stream_ps (float *__P, __m256 __A)
{
  __builtin_ia32_movntps256 (__P, (__v8sf)__A);
}

extern __inline __m256 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_rcp_ps (__m256 __A)
{
  return (__m256) __builtin_ia32_rcpps256 ((__v8sf)__A);
}

extern __inline __m256 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_rsqrt_ps (__m256 __A)
{
  return (__m256) __builtin_ia32_rsqrtps256 ((__v8sf)__A);
}

extern __inline __m256d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_sqrt_pd (__m256d __A)
{
  return (__m256d) __builtin_ia32_sqrtpd256 ((__v4df)__A);
}

extern __inline __m256 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_sqrt_ps (__m256 __A)
{
  return (__m256) __builtin_ia32_sqrtps256 ((__v8sf)__A);
}
# 1044 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avxintrin.h" 3 4
extern __inline __m256d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_unpackhi_pd (__m256d __A, __m256d __B)
{
  return (__m256d) __builtin_ia32_unpckhpd256 ((__v4df)__A, (__v4df)__B);
}

extern __inline __m256d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_unpacklo_pd (__m256d __A, __m256d __B)
{
  return (__m256d) __builtin_ia32_unpcklpd256 ((__v4df)__A, (__v4df)__B);
}

extern __inline __m256 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_unpackhi_ps (__m256 __A, __m256 __B)
{
  return (__m256) __builtin_ia32_unpckhps256 ((__v8sf)__A, (__v8sf)__B);
}

extern __inline __m256 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_unpacklo_ps (__m256 __A, __m256 __B)
{
  return (__m256) __builtin_ia32_unpcklps256 ((__v8sf)__A, (__v8sf)__B);
}

extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_testz_pd (__m128d __M, __m128d __V)
{
  return __builtin_ia32_vtestzpd ((__v2df)__M, (__v2df)__V);
}

extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_testc_pd (__m128d __M, __m128d __V)
{
  return __builtin_ia32_vtestcpd ((__v2df)__M, (__v2df)__V);
}

extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_testnzc_pd (__m128d __M, __m128d __V)
{
  return __builtin_ia32_vtestnzcpd ((__v2df)__M, (__v2df)__V);
}

extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_testz_ps (__m128 __M, __m128 __V)
{
  return __builtin_ia32_vtestzps ((__v4sf)__M, (__v4sf)__V);
}

extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_testc_ps (__m128 __M, __m128 __V)
{
  return __builtin_ia32_vtestcps ((__v4sf)__M, (__v4sf)__V);
}

extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_testnzc_ps (__m128 __M, __m128 __V)
{
  return __builtin_ia32_vtestnzcps ((__v4sf)__M, (__v4sf)__V);
}

extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_testz_pd (__m256d __M, __m256d __V)
{
  return __builtin_ia32_vtestzpd256 ((__v4df)__M, (__v4df)__V);
}

extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_testc_pd (__m256d __M, __m256d __V)
{
  return __builtin_ia32_vtestcpd256 ((__v4df)__M, (__v4df)__V);
}

extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_testnzc_pd (__m256d __M, __m256d __V)
{
  return __builtin_ia32_vtestnzcpd256 ((__v4df)__M, (__v4df)__V);
}

extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_testz_ps (__m256 __M, __m256 __V)
{
  return __builtin_ia32_vtestzps256 ((__v8sf)__M, (__v8sf)__V);
}

extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_testc_ps (__m256 __M, __m256 __V)
{
  return __builtin_ia32_vtestcps256 ((__v8sf)__M, (__v8sf)__V);
}

extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_testnzc_ps (__m256 __M, __m256 __V)
{
  return __builtin_ia32_vtestnzcps256 ((__v8sf)__M, (__v8sf)__V);
}

extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_testz_si256 (__m256i __M, __m256i __V)
{
  return __builtin_ia32_ptestz256 ((__v4di)__M, (__v4di)__V);
}

extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_testc_si256 (__m256i __M, __m256i __V)
{
  return __builtin_ia32_ptestc256 ((__v4di)__M, (__v4di)__V);
}

extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_testnzc_si256 (__m256i __M, __m256i __V)
{
  return __builtin_ia32_ptestnzc256 ((__v4di)__M, (__v4di)__V);
}

extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_movemask_pd (__m256d __A)
{
  return __builtin_ia32_movmskpd256 ((__v4df)__A);
}

extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_movemask_ps (__m256 __A)
{
  return __builtin_ia32_movmskps256 ((__v8sf)__A);
}

extern __inline __m256d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_undefined_pd (void)
{
  __m256d __Y = __Y;
  return __Y;
}

extern __inline __m256 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_undefined_ps (void)
{
  __m256 __Y = __Y;
  return __Y;
}

extern __inline __m256i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_undefined_si256 (void)
{
  __m256i __Y = __Y;
  return __Y;
}

extern __inline __m256d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_setzero_pd (void)
{
  return __extension__ (__m256d){ 0.0, 0.0, 0.0, 0.0 };
}

extern __inline __m256 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_setzero_ps (void)
{
  return __extension__ (__m256){ 0.0, 0.0, 0.0, 0.0,
     0.0, 0.0, 0.0, 0.0 };
}

extern __inline __m256i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_setzero_si256 (void)
{
  return __extension__ (__m256i)(__v4di){ 0, 0, 0, 0 };
}


extern __inline __m256d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_set_pd (double __A, double __B, double __C, double __D)
{
  return __extension__ (__m256d){ __D, __C, __B, __A };
}


extern __inline __m256 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_set_ps (float __A, float __B, float __C, float __D,
        float __E, float __F, float __G, float __H)
{
  return __extension__ (__m256){ __H, __G, __F, __E,
     __D, __C, __B, __A };
}


extern __inline __m256i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_set_epi32 (int __A, int __B, int __C, int __D,
    int __E, int __F, int __G, int __H)
{
  return __extension__ (__m256i)(__v8si){ __H, __G, __F, __E,
       __D, __C, __B, __A };
}

extern __inline __m256i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_set_epi16 (short __q15, short __q14, short __q13, short __q12,
    short __q11, short __q10, short __q09, short __q08,
    short __q07, short __q06, short __q05, short __q04,
    short __q03, short __q02, short __q01, short __q00)
{
  return __extension__ (__m256i)(__v16hi){
    __q00, __q01, __q02, __q03, __q04, __q05, __q06, __q07,
    __q08, __q09, __q10, __q11, __q12, __q13, __q14, __q15
  };
}

extern __inline __m256i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_set_epi8 (char __q31, char __q30, char __q29, char __q28,
    char __q27, char __q26, char __q25, char __q24,
    char __q23, char __q22, char __q21, char __q20,
    char __q19, char __q18, char __q17, char __q16,
    char __q15, char __q14, char __q13, char __q12,
    char __q11, char __q10, char __q09, char __q08,
    char __q07, char __q06, char __q05, char __q04,
    char __q03, char __q02, char __q01, char __q00)
{
  return __extension__ (__m256i)(__v32qi){
    __q00, __q01, __q02, __q03, __q04, __q05, __q06, __q07,
    __q08, __q09, __q10, __q11, __q12, __q13, __q14, __q15,
    __q16, __q17, __q18, __q19, __q20, __q21, __q22, __q23,
    __q24, __q25, __q26, __q27, __q28, __q29, __q30, __q31
  };
}

extern __inline __m256i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_set_epi64x (long long __A, long long __B, long long __C,
     long long __D)
{
  return __extension__ (__m256i)(__v4di){ __D, __C, __B, __A };
}


extern __inline __m256d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_set1_pd (double __A)
{
  return __extension__ (__m256d){ __A, __A, __A, __A };
}


extern __inline __m256 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_set1_ps (float __A)
{
  return __extension__ (__m256){ __A, __A, __A, __A,
     __A, __A, __A, __A };
}


extern __inline __m256i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_set1_epi32 (int __A)
{
  return __extension__ (__m256i)(__v8si){ __A, __A, __A, __A,
       __A, __A, __A, __A };
}

extern __inline __m256i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_set1_epi16 (short __A)
{
  return _mm256_set_epi16 (__A, __A, __A, __A, __A, __A, __A, __A,
      __A, __A, __A, __A, __A, __A, __A, __A);
}

extern __inline __m256i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_set1_epi8 (char __A)
{
  return _mm256_set_epi8 (__A, __A, __A, __A, __A, __A, __A, __A,
     __A, __A, __A, __A, __A, __A, __A, __A,
     __A, __A, __A, __A, __A, __A, __A, __A,
     __A, __A, __A, __A, __A, __A, __A, __A);
}

extern __inline __m256i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_set1_epi64x (long long __A)
{
  return __extension__ (__m256i)(__v4di){ __A, __A, __A, __A };
}




extern __inline __m256d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_setr_pd (double __A, double __B, double __C, double __D)
{
  return _mm256_set_pd (__D, __C, __B, __A);
}

extern __inline __m256 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_setr_ps (float __A, float __B, float __C, float __D,
  float __E, float __F, float __G, float __H)
{
  return _mm256_set_ps (__H, __G, __F, __E, __D, __C, __B, __A);
}

extern __inline __m256i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_setr_epi32 (int __A, int __B, int __C, int __D,
     int __E, int __F, int __G, int __H)
{
  return _mm256_set_epi32 (__H, __G, __F, __E, __D, __C, __B, __A);
}

extern __inline __m256i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_setr_epi16 (short __q15, short __q14, short __q13, short __q12,
     short __q11, short __q10, short __q09, short __q08,
     short __q07, short __q06, short __q05, short __q04,
     short __q03, short __q02, short __q01, short __q00)
{
  return _mm256_set_epi16 (__q00, __q01, __q02, __q03,
      __q04, __q05, __q06, __q07,
      __q08, __q09, __q10, __q11,
      __q12, __q13, __q14, __q15);
}

extern __inline __m256i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_setr_epi8 (char __q31, char __q30, char __q29, char __q28,
     char __q27, char __q26, char __q25, char __q24,
     char __q23, char __q22, char __q21, char __q20,
     char __q19, char __q18, char __q17, char __q16,
     char __q15, char __q14, char __q13, char __q12,
     char __q11, char __q10, char __q09, char __q08,
     char __q07, char __q06, char __q05, char __q04,
     char __q03, char __q02, char __q01, char __q00)
{
  return _mm256_set_epi8 (__q00, __q01, __q02, __q03,
     __q04, __q05, __q06, __q07,
     __q08, __q09, __q10, __q11,
     __q12, __q13, __q14, __q15,
     __q16, __q17, __q18, __q19,
     __q20, __q21, __q22, __q23,
     __q24, __q25, __q26, __q27,
     __q28, __q29, __q30, __q31);
}

extern __inline __m256i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_setr_epi64x (long long __A, long long __B, long long __C,
      long long __D)
{
  return _mm256_set_epi64x (__D, __C, __B, __A);
}



extern __inline __m256 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_castpd_ps (__m256d __A)
{
  return (__m256) __A;
}

extern __inline __m256i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_castpd_si256 (__m256d __A)
{
  return (__m256i) __A;
}

extern __inline __m256d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_castps_pd (__m256 __A)
{
  return (__m256d) __A;
}

extern __inline __m256i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_castps_si256(__m256 __A)
{
  return (__m256i) __A;
}

extern __inline __m256 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_castsi256_ps (__m256i __A)
{
  return (__m256) __A;
}

extern __inline __m256d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_castsi256_pd (__m256i __A)
{
  return (__m256d) __A;
}

extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_castpd256_pd128 (__m256d __A)
{
  return (__m128d) __builtin_ia32_pd_pd256 ((__v4df)__A);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_castps256_ps128 (__m256 __A)
{
  return (__m128) __builtin_ia32_ps_ps256 ((__v8sf)__A);
}

extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_castsi256_si128 (__m256i __A)
{
  return (__m128i) __builtin_ia32_si_si256 ((__v8si)__A);
}






extern __inline __m256d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_castpd128_pd256 (__m128d __A)
{
  return (__m256d) __builtin_ia32_pd256_pd ((__v2df)__A);
}

extern __inline __m256 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_castps128_ps256 (__m128 __A)
{
  return (__m256) __builtin_ia32_ps256_ps ((__v4sf)__A);
}

extern __inline __m256i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_castsi128_si256 (__m128i __A)
{
  return (__m256i) __builtin_ia32_si256_si ((__v4si)__A);
}



#pragma GCC pop_options
# 42 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/immintrin.h" 2 3 4

# 1 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx2intrin.h" 1 3 4
# 32 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx2intrin.h" 3 4
#pragma GCC push_options
#pragma GCC target("avx2")
# 54 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx2intrin.h" 3 4
extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_abs_epi8 (__m256i __A)
{
  return (__m256i)__builtin_ia32_pabsb256 ((__v32qi)__A);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_abs_epi16 (__m256i __A)
{
  return (__m256i)__builtin_ia32_pabsw256 ((__v16hi)__A);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_abs_epi32 (__m256i __A)
{
  return (__m256i)__builtin_ia32_pabsd256 ((__v8si)__A);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_packs_epi32 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_packssdw256 ((__v8si)__A, (__v8si)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_packs_epi16 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_packsswb256 ((__v16hi)__A, (__v16hi)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_packus_epi32 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_packusdw256 ((__v8si)__A, (__v8si)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_packus_epi16 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_packuswb256 ((__v16hi)__A, (__v16hi)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_add_epi8 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_paddb256 ((__v32qi)__A, (__v32qi)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_add_epi16 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_paddw256 ((__v16hi)__A, (__v16hi)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_add_epi32 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_paddd256 ((__v8si)__A, (__v8si)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_add_epi64 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_paddq256 ((__v4di)__A, (__v4di)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_adds_epi8 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_paddsb256 ((__v32qi)__A, (__v32qi)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_adds_epi16 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_paddsw256 ((__v16hi)__A, (__v16hi)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_adds_epu8 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_paddusb256 ((__v32qi)__A, (__v32qi)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_adds_epu16 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_paddusw256 ((__v16hi)__A, (__v16hi)__B);
}
# 177 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx2intrin.h" 3 4
extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_and_si256 (__m256i __A, __m256i __B)
{
  return (__m256i) __builtin_ia32_andsi256 ((__v4di)__A, (__v4di)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_andnot_si256 (__m256i __A, __m256i __B)
{
  return (__m256i) __builtin_ia32_andnotsi256 ((__v4di)__A, (__v4di)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_avg_epu8 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_pavgb256 ((__v32qi)__A, (__v32qi)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_avg_epu16 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_pavgw256 ((__v16hi)__A, (__v16hi)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_blendv_epi8 (__m256i __X, __m256i __Y, __m256i __M)
{
  return (__m256i) __builtin_ia32_pblendvb256 ((__v32qi)__X,
            (__v32qi)__Y,
            (__v32qi)__M);
}
# 229 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx2intrin.h" 3 4
extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_cmpeq_epi8 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_pcmpeqb256 ((__v32qi)__A, (__v32qi)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_cmpeq_epi16 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_pcmpeqw256 ((__v16hi)__A, (__v16hi)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_cmpeq_epi32 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_pcmpeqd256 ((__v8si)__A, (__v8si)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_cmpeq_epi64 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_pcmpeqq256 ((__v4di)__A, (__v4di)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_cmpgt_epi8 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_pcmpgtb256 ((__v32qi)__A,
          (__v32qi)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_cmpgt_epi16 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_pcmpgtw256 ((__v16hi)__A,
          (__v16hi)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_cmpgt_epi32 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_pcmpgtd256 ((__v8si)__A,
          (__v8si)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_cmpgt_epi64 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_pcmpgtq256 ((__v4di)__A, (__v4di)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_hadd_epi16 (__m256i __X, __m256i __Y)
{
  return (__m256i) __builtin_ia32_phaddw256 ((__v16hi)__X,
          (__v16hi)__Y);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_hadd_epi32 (__m256i __X, __m256i __Y)
{
  return (__m256i) __builtin_ia32_phaddd256 ((__v8si)__X, (__v8si)__Y);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_hadds_epi16 (__m256i __X, __m256i __Y)
{
  return (__m256i) __builtin_ia32_phaddsw256 ((__v16hi)__X,
           (__v16hi)__Y);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_hsub_epi16 (__m256i __X, __m256i __Y)
{
  return (__m256i) __builtin_ia32_phsubw256 ((__v16hi)__X,
          (__v16hi)__Y);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_hsub_epi32 (__m256i __X, __m256i __Y)
{
  return (__m256i) __builtin_ia32_phsubd256 ((__v8si)__X, (__v8si)__Y);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_hsubs_epi16 (__m256i __X, __m256i __Y)
{
  return (__m256i) __builtin_ia32_phsubsw256 ((__v16hi)__X,
           (__v16hi)__Y);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_maddubs_epi16 (__m256i __X, __m256i __Y)
{
  return (__m256i) __builtin_ia32_pmaddubsw256 ((__v32qi)__X,
      (__v32qi)__Y);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_madd_epi16 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_pmaddwd256 ((__v16hi)__A,
          (__v16hi)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_max_epi8 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_pmaxsb256 ((__v32qi)__A, (__v32qi)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_max_epi16 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_pmaxsw256 ((__v16hi)__A, (__v16hi)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_max_epi32 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_pmaxsd256 ((__v8si)__A, (__v8si)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_max_epu8 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_pmaxub256 ((__v32qi)__A, (__v32qi)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_max_epu16 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_pmaxuw256 ((__v16hi)__A, (__v16hi)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_max_epu32 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_pmaxud256 ((__v8si)__A, (__v8si)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_min_epi8 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_pminsb256 ((__v32qi)__A, (__v32qi)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_min_epi16 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_pminsw256 ((__v16hi)__A, (__v16hi)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_min_epi32 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_pminsd256 ((__v8si)__A, (__v8si)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_min_epu8 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_pminub256 ((__v32qi)__A, (__v32qi)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_min_epu16 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_pminuw256 ((__v16hi)__A, (__v16hi)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_min_epu32 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_pminud256 ((__v8si)__A, (__v8si)__B);
}

extern __inline int
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_movemask_epi8 (__m256i __A)
{
  return __builtin_ia32_pmovmskb256 ((__v32qi)__A);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_cvtepi8_epi16 (__m128i __X)
{
  return (__m256i) __builtin_ia32_pmovsxbw256 ((__v16qi)__X);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_cvtepi8_epi32 (__m128i __X)
{
  return (__m256i) __builtin_ia32_pmovsxbd256 ((__v16qi)__X);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_cvtepi8_epi64 (__m128i __X)
{
  return (__m256i) __builtin_ia32_pmovsxbq256 ((__v16qi)__X);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_cvtepi16_epi32 (__m128i __X)
{
  return (__m256i) __builtin_ia32_pmovsxwd256 ((__v8hi)__X);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_cvtepi16_epi64 (__m128i __X)
{
  return (__m256i) __builtin_ia32_pmovsxwq256 ((__v8hi)__X);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_cvtepi32_epi64 (__m128i __X)
{
  return (__m256i) __builtin_ia32_pmovsxdq256 ((__v4si)__X);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_cvtepu8_epi16 (__m128i __X)
{
  return (__m256i) __builtin_ia32_pmovzxbw256 ((__v16qi)__X);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_cvtepu8_epi32 (__m128i __X)
{
  return (__m256i) __builtin_ia32_pmovzxbd256 ((__v16qi)__X);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_cvtepu8_epi64 (__m128i __X)
{
  return (__m256i) __builtin_ia32_pmovzxbq256 ((__v16qi)__X);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_cvtepu16_epi32 (__m128i __X)
{
  return (__m256i) __builtin_ia32_pmovzxwd256 ((__v8hi)__X);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_cvtepu16_epi64 (__m128i __X)
{
  return (__m256i) __builtin_ia32_pmovzxwq256 ((__v8hi)__X);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_cvtepu32_epi64 (__m128i __X)
{
  return (__m256i) __builtin_ia32_pmovzxdq256 ((__v4si)__X);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_mul_epi32 (__m256i __X, __m256i __Y)
{
  return (__m256i) __builtin_ia32_pmuldq256 ((__v8si)__X, (__v8si)__Y);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_mulhrs_epi16 (__m256i __X, __m256i __Y)
{
  return (__m256i) __builtin_ia32_pmulhrsw256 ((__v16hi)__X,
            (__v16hi)__Y);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_mulhi_epu16 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_pmulhuw256 ((__v16hi)__A, (__v16hi)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_mulhi_epi16 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_pmulhw256 ((__v16hi)__A, (__v16hi)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_mullo_epi16 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_pmullw256 ((__v16hi)__A, (__v16hi)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_mullo_epi32 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_pmulld256 ((__v8si)__A, (__v8si)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_mul_epu32 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_pmuludq256 ((__v8si)__A, (__v8si)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_or_si256 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_por256 ((__v4di)__A, (__v4di)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_sad_epu8 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_psadbw256 ((__v32qi)__A, (__v32qi)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_shuffle_epi8 (__m256i __X, __m256i __Y)
{
  return (__m256i) __builtin_ia32_pshufb256 ((__v32qi)__X,
          (__v32qi)__Y);
}
# 627 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx2intrin.h" 3 4
extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_sign_epi8 (__m256i __X, __m256i __Y)
{
  return (__m256i) __builtin_ia32_psignb256 ((__v32qi)__X, (__v32qi)__Y);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_sign_epi16 (__m256i __X, __m256i __Y)
{
  return (__m256i) __builtin_ia32_psignw256 ((__v16hi)__X, (__v16hi)__Y);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_sign_epi32 (__m256i __X, __m256i __Y)
{
  return (__m256i) __builtin_ia32_psignd256 ((__v8si)__X, (__v8si)__Y);
}
# 660 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx2intrin.h" 3 4
extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_slli_epi16 (__m256i __A, int __B)
{
  return (__m256i)__builtin_ia32_psllwi256 ((__v16hi)__A, __B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_sll_epi16 (__m256i __A, __m128i __B)
{
  return (__m256i)__builtin_ia32_psllw256((__v16hi)__A, (__v8hi)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_slli_epi32 (__m256i __A, int __B)
{
  return (__m256i)__builtin_ia32_pslldi256 ((__v8si)__A, __B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_sll_epi32 (__m256i __A, __m128i __B)
{
  return (__m256i)__builtin_ia32_pslld256((__v8si)__A, (__v4si)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_slli_epi64 (__m256i __A, int __B)
{
  return (__m256i)__builtin_ia32_psllqi256 ((__v4di)__A, __B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_sll_epi64 (__m256i __A, __m128i __B)
{
  return (__m256i)__builtin_ia32_psllq256((__v4di)__A, (__v2di)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_srai_epi16 (__m256i __A, int __B)
{
  return (__m256i)__builtin_ia32_psrawi256 ((__v16hi)__A, __B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_sra_epi16 (__m256i __A, __m128i __B)
{
  return (__m256i)__builtin_ia32_psraw256 ((__v16hi)__A, (__v8hi)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_srai_epi32 (__m256i __A, int __B)
{
  return (__m256i)__builtin_ia32_psradi256 ((__v8si)__A, __B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_sra_epi32 (__m256i __A, __m128i __B)
{
  return (__m256i)__builtin_ia32_psrad256 ((__v8si)__A, (__v4si)__B);
}
# 742 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx2intrin.h" 3 4
extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_srli_epi16 (__m256i __A, int __B)
{
  return (__m256i)__builtin_ia32_psrlwi256 ((__v16hi)__A, __B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_srl_epi16 (__m256i __A, __m128i __B)
{
  return (__m256i)__builtin_ia32_psrlw256((__v16hi)__A, (__v8hi)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_srli_epi32 (__m256i __A, int __B)
{
  return (__m256i)__builtin_ia32_psrldi256 ((__v8si)__A, __B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_srl_epi32 (__m256i __A, __m128i __B)
{
  return (__m256i)__builtin_ia32_psrld256((__v8si)__A, (__v4si)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_srli_epi64 (__m256i __A, int __B)
{
  return (__m256i)__builtin_ia32_psrlqi256 ((__v4di)__A, __B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_srl_epi64 (__m256i __A, __m128i __B)
{
  return (__m256i)__builtin_ia32_psrlq256((__v4di)__A, (__v2di)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_sub_epi8 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_psubb256 ((__v32qi)__A, (__v32qi)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_sub_epi16 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_psubw256 ((__v16hi)__A, (__v16hi)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_sub_epi32 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_psubd256 ((__v8si)__A, (__v8si)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_sub_epi64 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_psubq256 ((__v4di)__A, (__v4di)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_subs_epi8 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_psubsb256 ((__v32qi)__A, (__v32qi)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_subs_epi16 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_psubsw256 ((__v16hi)__A, (__v16hi)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_subs_epu8 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_psubusb256 ((__v32qi)__A, (__v32qi)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_subs_epu16 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_psubusw256 ((__v16hi)__A, (__v16hi)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_unpackhi_epi8 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_punpckhbw256 ((__v32qi)__A, (__v32qi)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_unpackhi_epi16 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_punpckhwd256 ((__v16hi)__A, (__v16hi)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_unpackhi_epi32 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_punpckhdq256 ((__v8si)__A, (__v8si)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_unpackhi_epi64 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_punpckhqdq256 ((__v4di)__A, (__v4di)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_unpacklo_epi8 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_punpcklbw256 ((__v32qi)__A, (__v32qi)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_unpacklo_epi16 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_punpcklwd256 ((__v16hi)__A, (__v16hi)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_unpacklo_epi32 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_punpckldq256 ((__v8si)__A, (__v8si)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_unpacklo_epi64 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_punpcklqdq256 ((__v4di)__A, (__v4di)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_xor_si256 (__m256i __A, __m256i __B)
{
  return (__m256i)__builtin_ia32_pxor256 ((__v4di)__A, (__v4di)__B);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_stream_load_si256 (__m256i const *__X)
{
  return (__m256i) __builtin_ia32_movntdqa256 ((__v4di *) __X);
}

extern __inline __m128
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm_broadcastss_ps (__m128 __X)
{
  return (__m128) __builtin_ia32_vbroadcastss_ps ((__v4sf)__X);
}

extern __inline __m256
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_broadcastss_ps (__m128 __X)
{
  return (__m256) __builtin_ia32_vbroadcastss_ps256 ((__v4sf)__X);
}

extern __inline __m256d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_broadcastsd_pd (__m128d __X)
{
  return (__m256d) __builtin_ia32_vbroadcastsd_pd256 ((__v2df)__X);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_broadcastsi128_si256 (__m128i __X)
{
  return (__m256i) __builtin_ia32_vbroadcastsi256 ((__v2di)__X);
}
# 968 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx2intrin.h" 3 4
extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_broadcastb_epi8 (__m128i __X)
{
  return (__m256i) __builtin_ia32_pbroadcastb256 ((__v16qi)__X);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_broadcastw_epi16 (__m128i __X)
{
  return (__m256i) __builtin_ia32_pbroadcastw256 ((__v8hi)__X);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_broadcastd_epi32 (__m128i __X)
{
  return (__m256i) __builtin_ia32_pbroadcastd256 ((__v4si)__X);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_broadcastq_epi64 (__m128i __X)
{
  return (__m256i) __builtin_ia32_pbroadcastq256 ((__v2di)__X);
}

extern __inline __m128i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm_broadcastb_epi8 (__m128i __X)
{
  return (__m128i) __builtin_ia32_pbroadcastb128 ((__v16qi)__X);
}

extern __inline __m128i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm_broadcastw_epi16 (__m128i __X)
{
  return (__m128i) __builtin_ia32_pbroadcastw128 ((__v8hi)__X);
}

extern __inline __m128i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm_broadcastd_epi32 (__m128i __X)
{
  return (__m128i) __builtin_ia32_pbroadcastd128 ((__v4si)__X);
}

extern __inline __m128i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm_broadcastq_epi64 (__m128i __X)
{
  return (__m128i) __builtin_ia32_pbroadcastq128 ((__v2di)__X);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_permutevar8x32_epi32 (__m256i __X, __m256i __Y)
{
  return (__m256i) __builtin_ia32_permvarsi256 ((__v8si)__X, (__v8si)__Y);
}
# 1043 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx2intrin.h" 3 4
extern __inline __m256
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_permutevar8x32_ps (__m256 __X, __m256i __Y)
{
  return (__m256) __builtin_ia32_permvarsf256 ((__v8sf)__X, (__v8si)__Y);
}
# 1101 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx2intrin.h" 3 4
extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_maskload_epi32 (int const *__X, __m256i __M )
{
  return (__m256i) __builtin_ia32_maskloadd256 ((const __v8si *)__X,
      (__v8si)__M);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_maskload_epi64 (long long const *__X, __m256i __M )
{
  return (__m256i) __builtin_ia32_maskloadq256 ((const __v4di *)__X,
      (__v4di)__M);
}

extern __inline __m128i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm_maskload_epi32 (int const *__X, __m128i __M )
{
  return (__m128i) __builtin_ia32_maskloadd ((const __v4si *)__X,
          (__v4si)__M);
}

extern __inline __m128i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm_maskload_epi64 (long long const *__X, __m128i __M )
{
  return (__m128i) __builtin_ia32_maskloadq ((const __v2di *)__X,
          (__v2di)__M);
}

extern __inline void
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_maskstore_epi32 (int *__X, __m256i __M, __m256i __Y )
{
  __builtin_ia32_maskstored256 ((__v8si *)__X, (__v8si)__M, (__v8si)__Y);
}

extern __inline void
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_maskstore_epi64 (long long *__X, __m256i __M, __m256i __Y )
{
  __builtin_ia32_maskstoreq256 ((__v4di *)__X, (__v4di)__M, (__v4di)__Y);
}

extern __inline void
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm_maskstore_epi32 (int *__X, __m128i __M, __m128i __Y )
{
  __builtin_ia32_maskstored ((__v4si *)__X, (__v4si)__M, (__v4si)__Y);
}

extern __inline void
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm_maskstore_epi64 (long long *__X, __m128i __M, __m128i __Y )
{
  __builtin_ia32_maskstoreq (( __v2di *)__X, (__v2di)__M, (__v2di)__Y);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_sllv_epi32 (__m256i __X, __m256i __Y)
{
  return (__m256i) __builtin_ia32_psllv8si ((__v8si)__X, (__v8si)__Y);
}

extern __inline __m128i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm_sllv_epi32 (__m128i __X, __m128i __Y)
{
  return (__m128i) __builtin_ia32_psllv4si ((__v4si)__X, (__v4si)__Y);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_sllv_epi64 (__m256i __X, __m256i __Y)
{
  return (__m256i) __builtin_ia32_psllv4di ((__v4di)__X, (__v4di)__Y);
}

extern __inline __m128i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm_sllv_epi64 (__m128i __X, __m128i __Y)
{
  return (__m128i) __builtin_ia32_psllv2di ((__v2di)__X, (__v2di)__Y);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_srav_epi32 (__m256i __X, __m256i __Y)
{
  return (__m256i) __builtin_ia32_psrav8si ((__v8si)__X, (__v8si)__Y);
}

extern __inline __m128i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm_srav_epi32 (__m128i __X, __m128i __Y)
{
  return (__m128i) __builtin_ia32_psrav4si ((__v4si)__X, (__v4si)__Y);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_srlv_epi32 (__m256i __X, __m256i __Y)
{
  return (__m256i) __builtin_ia32_psrlv8si ((__v8si)__X, (__v8si)__Y);
}

extern __inline __m128i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm_srlv_epi32 (__m128i __X, __m128i __Y)
{
  return (__m128i) __builtin_ia32_psrlv4si ((__v4si)__X, (__v4si)__Y);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm256_srlv_epi64 (__m256i __X, __m256i __Y)
{
  return (__m256i) __builtin_ia32_psrlv4di ((__v4di)__X, (__v4di)__Y);
}

extern __inline __m128i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm_srlv_epi64 (__m128i __X, __m128i __Y)
{
  return (__m128i) __builtin_ia32_psrlv2di ((__v2di)__X, (__v2di)__Y);
}
# 1886 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx2intrin.h" 3 4
#pragma GCC pop_options
# 44 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/immintrin.h" 2 3 4

# 1 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx512fintrin.h" 1 3 4
# 32 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx512fintrin.h" 3 4
#pragma GCC push_options
#pragma GCC target("avx512f")




typedef double __v8df __attribute__ ((__vector_size__ (64)));
typedef float __v16sf __attribute__ ((__vector_size__ (64)));
typedef long long __v8di __attribute__ ((__vector_size__ (64)));
typedef int __v16si __attribute__ ((__vector_size__ (64)));
typedef short __v32hi __attribute__ ((__vector_size__ (64)));
typedef char __v64qi __attribute__ ((__vector_size__ (64)));



typedef float __m512 __attribute__ ((__vector_size__ (64), __may_alias__));
typedef long long __m512i __attribute__ ((__vector_size__ (64), __may_alias__));
typedef double __m512d __attribute__ ((__vector_size__ (64), __may_alias__));

typedef unsigned char __mmask8;
typedef unsigned short __mmask16;

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_set_epi64 (long long __A, long long __B, long long __C,
    long long __D, long long __E, long long __F,
    long long __G, long long __H)
{
  return __extension__ (__m512i) (__v8di)
  { __H, __G, __F, __E, __D, __C, __B, __A };
}


extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_set_epi32 (int __A, int __B, int __C, int __D,
    int __E, int __F, int __G, int __H,
    int __I, int __J, int __K, int __L,
    int __M, int __N, int __O, int __P)
{
  return __extension__ (__m512i)(__v16si)
  { __P, __O, __N, __M, __L, __K, __J, __I,
    __H, __G, __F, __E, __D, __C, __B, __A };
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_set_pd (double __A, double __B, double __C, double __D,
        double __E, double __F, double __G, double __H)
{
  return __extension__ (__m512d)
  { __H, __G, __F, __E, __D, __C, __B, __A };
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_set_ps (float __A, float __B, float __C, float __D,
        float __E, float __F, float __G, float __H,
        float __I, float __J, float __K, float __L,
        float __M, float __N, float __O, float __P)
{
  return __extension__ (__m512)
  { __P, __O, __N, __M, __L, __K, __J, __I,
    __H, __G, __F, __E, __D, __C, __B, __A };
}
# 111 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx512fintrin.h" 3 4
extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_undefined_ps (void)
{
  __m512 __Y = __Y;
  return __Y;
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_undefined_pd (void)
{
  __m512d __Y = __Y;
  return __Y;
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_undefined_si512 (void)
{
  __m512i __Y = __Y;
  return __Y;
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_set1_epi8 (char __A)
{
  return __extension__ (__m512i)(__v64qi)
  { __A, __A, __A, __A, __A, __A, __A, __A,
    __A, __A, __A, __A, __A, __A, __A, __A,
    __A, __A, __A, __A, __A, __A, __A, __A,
    __A, __A, __A, __A, __A, __A, __A, __A,
    __A, __A, __A, __A, __A, __A, __A, __A,
    __A, __A, __A, __A, __A, __A, __A, __A,
    __A, __A, __A, __A, __A, __A, __A, __A,
    __A, __A, __A, __A, __A, __A, __A, __A };
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_set1_epi16 (short __A)
{
  return __extension__ (__m512i)(__v32hi)
  { __A, __A, __A, __A, __A, __A, __A, __A,
    __A, __A, __A, __A, __A, __A, __A, __A,
    __A, __A, __A, __A, __A, __A, __A, __A,
    __A, __A, __A, __A, __A, __A, __A, __A };
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_set1_pd (double __A)
{
  return (__m512d) __builtin_ia32_broadcastsd512 (__extension__
        (__v2df) { __A, },
        (__v8df)
        _mm512_undefined_pd (),
        (__mmask8) -1);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_set1_ps (float __A)
{
  return (__m512) __builtin_ia32_broadcastss512 (__extension__
       (__v4sf) { __A, },
       (__v16sf)
       _mm512_undefined_ps (),
       (__mmask16) -1);
}


extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_set4_epi32 (int __A, int __B, int __C, int __D)
{
  return __extension__ (__m512i)(__v16si)
  { __D, __C, __B, __A, __D, __C, __B, __A,
    __D, __C, __B, __A, __D, __C, __B, __A };
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_set4_epi64 (long long __A, long long __B, long long __C,
     long long __D)
{
  return __extension__ (__m512i) (__v8di)
  { __D, __C, __B, __A, __D, __C, __B, __A };
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_set4_pd (double __A, double __B, double __C, double __D)
{
  return __extension__ (__m512d)
  { __D, __C, __B, __A, __D, __C, __B, __A };
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_set4_ps (float __A, float __B, float __C, float __D)
{
  return __extension__ (__m512)
  { __D, __C, __B, __A, __D, __C, __B, __A,
    __D, __C, __B, __A, __D, __C, __B, __A };
}
# 231 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx512fintrin.h" 3 4
extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_setzero_ps (void)
{
  return __extension__ (__m512){ 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
     0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 };
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_setzero_pd (void)
{
  return __extension__ (__m512d) { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 };
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_setzero_epi32 (void)
{
  return __extension__ (__m512i)(__v8di){ 0, 0, 0, 0, 0, 0, 0, 0 };
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_setzero_si512 (void)
{
  return __extension__ (__m512i)(__v8di){ 0, 0, 0, 0, 0, 0, 0, 0 };
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_mov_pd (__m512d __W, __mmask8 __U, __m512d __A)
{
  return (__m512d) __builtin_ia32_movapd512_mask ((__v8df) __A,
        (__v8df) __W,
        (__mmask8) __U);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_mov_pd (__mmask8 __U, __m512d __A)
{
  return (__m512d) __builtin_ia32_movapd512_mask ((__v8df) __A,
        (__v8df)
        _mm512_setzero_pd (),
        (__mmask8) __U);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_mov_ps (__m512 __W, __mmask16 __U, __m512 __A)
{
  return (__m512) __builtin_ia32_movaps512_mask ((__v16sf) __A,
       (__v16sf) __W,
       (__mmask16) __U);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_mov_ps (__mmask16 __U, __m512 __A)
{
  return (__m512) __builtin_ia32_movaps512_mask ((__v16sf) __A,
       (__v16sf)
       _mm512_setzero_ps (),
       (__mmask16) __U);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_load_pd (void const *__P)
{
  return *(__m512d *) __P;
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_load_pd (__m512d __W, __mmask8 __U, void const *__P)
{
  return (__m512d) __builtin_ia32_loadapd512_mask ((const __v8df *) __P,
         (__v8df) __W,
         (__mmask8) __U);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_load_pd (__mmask8 __U, void const *__P)
{
  return (__m512d) __builtin_ia32_loadapd512_mask ((const __v8df *) __P,
         (__v8df)
         _mm512_setzero_pd (),
         (__mmask8) __U);
}

extern __inline void
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_store_pd (void *__P, __m512d __A)
{
  *(__m512d *) __P = __A;
}

extern __inline void
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_store_pd (void *__P, __mmask8 __U, __m512d __A)
{
  __builtin_ia32_storeapd512_mask ((__v8df *) __P, (__v8df) __A,
       (__mmask8) __U);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_load_ps (void const *__P)
{
  return *(__m512 *) __P;
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_load_ps (__m512 __W, __mmask16 __U, void const *__P)
{
  return (__m512) __builtin_ia32_loadaps512_mask ((const __v16sf *) __P,
        (__v16sf) __W,
        (__mmask16) __U);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_load_ps (__mmask16 __U, void const *__P)
{
  return (__m512) __builtin_ia32_loadaps512_mask ((const __v16sf *) __P,
        (__v16sf)
        _mm512_setzero_ps (),
        (__mmask16) __U);
}

extern __inline void
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_store_ps (void *__P, __m512 __A)
{
  *(__m512 *) __P = __A;
}

extern __inline void
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_store_ps (void *__P, __mmask16 __U, __m512 __A)
{
  __builtin_ia32_storeaps512_mask ((__v16sf *) __P, (__v16sf) __A,
       (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_mov_epi64 (__m512i __W, __mmask8 __U, __m512i __A)
{
  return (__m512i) __builtin_ia32_movdqa64_512_mask ((__v8di) __A,
           (__v8di) __W,
           (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_mov_epi64 (__mmask8 __U, __m512i __A)
{
  return (__m512i) __builtin_ia32_movdqa64_512_mask ((__v8di) __A,
           (__v8di)
           _mm512_setzero_si512 (),
           (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_load_epi64 (void const *__P)
{
  return *(__m512i *) __P;
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_load_epi64 (__m512i __W, __mmask8 __U, void const *__P)
{
  return (__m512i) __builtin_ia32_movdqa64load512_mask ((const __v8di *) __P,
       (__v8di) __W,
       (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_load_epi64 (__mmask8 __U, void const *__P)
{
  return (__m512i) __builtin_ia32_movdqa64load512_mask ((const __v8di *) __P,
       (__v8di)
       _mm512_setzero_si512 (),
       (__mmask8) __U);
}

extern __inline void
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_store_epi64 (void *__P, __m512i __A)
{
  *(__m512i *) __P = __A;
}

extern __inline void
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_store_epi64 (void *__P, __mmask8 __U, __m512i __A)
{
  __builtin_ia32_movdqa64store512_mask ((__v8di *) __P, (__v8di) __A,
     (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_mov_epi32 (__m512i __W, __mmask16 __U, __m512i __A)
{
  return (__m512i) __builtin_ia32_movdqa32_512_mask ((__v16si) __A,
           (__v16si) __W,
           (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_mov_epi32 (__mmask16 __U, __m512i __A)
{
  return (__m512i) __builtin_ia32_movdqa32_512_mask ((__v16si) __A,
           (__v16si)
           _mm512_setzero_si512 (),
           (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_load_si512 (void const *__P)
{
  return *(__m512i *) __P;
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_load_epi32 (void const *__P)
{
  return *(__m512i *) __P;
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_load_epi32 (__m512i __W, __mmask16 __U, void const *__P)
{
  return (__m512i) __builtin_ia32_movdqa32load512_mask ((const __v16si *) __P,
       (__v16si) __W,
       (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_load_epi32 (__mmask16 __U, void const *__P)
{
  return (__m512i) __builtin_ia32_movdqa32load512_mask ((const __v16si *) __P,
       (__v16si)
       _mm512_setzero_si512 (),
       (__mmask16) __U);
}

extern __inline void
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_store_si512 (void *__P, __m512i __A)
{
  *(__m512i *) __P = __A;
}

extern __inline void
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_store_epi32 (void *__P, __m512i __A)
{
  *(__m512i *) __P = __A;
}

extern __inline void
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_store_epi32 (void *__P, __mmask16 __U, __m512i __A)
{
  __builtin_ia32_movdqa32store512_mask ((__v16si *) __P, (__v16si) __A,
     (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mullo_epi32 (__m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pmulld512_mask ((__v16si) __A,
        (__v16si) __B,
        (__v16si)
        _mm512_undefined_si512 (),
        (__mmask16) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_mullo_epi32 (__mmask16 __M, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pmulld512_mask ((__v16si) __A,
        (__v16si) __B,
        (__v16si)
        _mm512_setzero_si512 (),
        __M);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_mullo_epi32 (__m512i __W, __mmask16 __M, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pmulld512_mask ((__v16si) __A,
        (__v16si) __B,
        (__v16si) __W, __M);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_sllv_epi32 (__m512i __X, __m512i __Y)
{
  return (__m512i) __builtin_ia32_psllv16si_mask ((__v16si) __X,
        (__v16si) __Y,
        (__v16si)
        _mm512_undefined_si512 (),
        (__mmask16) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_sllv_epi32 (__m512i __W, __mmask16 __U, __m512i __X, __m512i __Y)
{
  return (__m512i) __builtin_ia32_psllv16si_mask ((__v16si) __X,
        (__v16si) __Y,
        (__v16si) __W,
        (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_sllv_epi32 (__mmask16 __U, __m512i __X, __m512i __Y)
{
  return (__m512i) __builtin_ia32_psllv16si_mask ((__v16si) __X,
        (__v16si) __Y,
        (__v16si)
        _mm512_setzero_si512 (),
        (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_srav_epi32 (__m512i __X, __m512i __Y)
{
  return (__m512i) __builtin_ia32_psrav16si_mask ((__v16si) __X,
        (__v16si) __Y,
        (__v16si)
        _mm512_undefined_si512 (),
        (__mmask16) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_srav_epi32 (__m512i __W, __mmask16 __U, __m512i __X, __m512i __Y)
{
  return (__m512i) __builtin_ia32_psrav16si_mask ((__v16si) __X,
        (__v16si) __Y,
        (__v16si) __W,
        (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_srav_epi32 (__mmask16 __U, __m512i __X, __m512i __Y)
{
  return (__m512i) __builtin_ia32_psrav16si_mask ((__v16si) __X,
        (__v16si) __Y,
        (__v16si)
        _mm512_setzero_si512 (),
        (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_srlv_epi32 (__m512i __X, __m512i __Y)
{
  return (__m512i) __builtin_ia32_psrlv16si_mask ((__v16si) __X,
        (__v16si) __Y,
        (__v16si)
        _mm512_undefined_si512 (),
        (__mmask16) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_srlv_epi32 (__m512i __W, __mmask16 __U, __m512i __X, __m512i __Y)
{
  return (__m512i) __builtin_ia32_psrlv16si_mask ((__v16si) __X,
        (__v16si) __Y,
        (__v16si) __W,
        (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_srlv_epi32 (__mmask16 __U, __m512i __X, __m512i __Y)
{
  return (__m512i) __builtin_ia32_psrlv16si_mask ((__v16si) __X,
        (__v16si) __Y,
        (__v16si)
        _mm512_setzero_si512 (),
        (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_add_epi64 (__m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
       (__v8di) __B,
       (__v8di)
       _mm512_undefined_si512 (),
       (__mmask8) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_add_epi64 (__m512i __W, __mmask8 __U, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
       (__v8di) __B,
       (__v8di) __W,
       (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_add_epi64 (__mmask8 __U, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_paddq512_mask ((__v8di) __A,
       (__v8di) __B,
       (__v8di)
       _mm512_setzero_si512 (),
       (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_sub_epi64 (__m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
       (__v8di) __B,
       (__v8di)
       _mm512_undefined_pd (),
       (__mmask8) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_sub_epi64 (__m512i __W, __mmask8 __U, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
       (__v8di) __B,
       (__v8di) __W,
       (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_sub_epi64 (__mmask8 __U, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_psubq512_mask ((__v8di) __A,
       (__v8di) __B,
       (__v8di)
       _mm512_setzero_si512 (),
       (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_sllv_epi64 (__m512i __X, __m512i __Y)
{
  return (__m512i) __builtin_ia32_psllv8di_mask ((__v8di) __X,
       (__v8di) __Y,
       (__v8di)
       _mm512_undefined_pd (),
       (__mmask8) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_sllv_epi64 (__m512i __W, __mmask8 __U, __m512i __X, __m512i __Y)
{
  return (__m512i) __builtin_ia32_psllv8di_mask ((__v8di) __X,
       (__v8di) __Y,
       (__v8di) __W,
       (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_sllv_epi64 (__mmask8 __U, __m512i __X, __m512i __Y)
{
  return (__m512i) __builtin_ia32_psllv8di_mask ((__v8di) __X,
       (__v8di) __Y,
       (__v8di)
       _mm512_setzero_si512 (),
       (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_srav_epi64 (__m512i __X, __m512i __Y)
{
  return (__m512i) __builtin_ia32_psrav8di_mask ((__v8di) __X,
       (__v8di) __Y,
       (__v8di)
       _mm512_undefined_si512 (),
       (__mmask8) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_srav_epi64 (__m512i __W, __mmask8 __U, __m512i __X, __m512i __Y)
{
  return (__m512i) __builtin_ia32_psrav8di_mask ((__v8di) __X,
       (__v8di) __Y,
       (__v8di) __W,
       (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_srav_epi64 (__mmask8 __U, __m512i __X, __m512i __Y)
{
  return (__m512i) __builtin_ia32_psrav8di_mask ((__v8di) __X,
       (__v8di) __Y,
       (__v8di)
       _mm512_setzero_si512 (),
       (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_srlv_epi64 (__m512i __X, __m512i __Y)
{
  return (__m512i) __builtin_ia32_psrlv8di_mask ((__v8di) __X,
       (__v8di) __Y,
       (__v8di)
       _mm512_undefined_si512 (),
       (__mmask8) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_srlv_epi64 (__m512i __W, __mmask8 __U, __m512i __X, __m512i __Y)
{
  return (__m512i) __builtin_ia32_psrlv8di_mask ((__v8di) __X,
       (__v8di) __Y,
       (__v8di) __W,
       (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_srlv_epi64 (__mmask8 __U, __m512i __X, __m512i __Y)
{
  return (__m512i) __builtin_ia32_psrlv8di_mask ((__v8di) __X,
       (__v8di) __Y,
       (__v8di)
       _mm512_setzero_si512 (),
       (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_add_epi32 (__m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_paddd512_mask ((__v16si) __A,
       (__v16si) __B,
       (__v16si)
       _mm512_undefined_si512 (),
       (__mmask16) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_add_epi32 (__m512i __W, __mmask16 __U, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_paddd512_mask ((__v16si) __A,
       (__v16si) __B,
       (__v16si) __W,
       (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_add_epi32 (__mmask16 __U, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_paddd512_mask ((__v16si) __A,
       (__v16si) __B,
       (__v16si)
       _mm512_setzero_si512 (),
       (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mul_epi32 (__m512i __X, __m512i __Y)
{
  return (__m512i) __builtin_ia32_pmuldq512_mask ((__v16si) __X,
        (__v16si) __Y,
        (__v8di)
        _mm512_undefined_si512 (),
        (__mmask8) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_mul_epi32 (__m512i __W, __mmask8 __M, __m512i __X, __m512i __Y)
{
  return (__m512i) __builtin_ia32_pmuldq512_mask ((__v16si) __X,
        (__v16si) __Y,
        (__v8di) __W, __M);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_mul_epi32 (__mmask8 __M, __m512i __X, __m512i __Y)
{
  return (__m512i) __builtin_ia32_pmuldq512_mask ((__v16si) __X,
        (__v16si) __Y,
        (__v8di)
        _mm512_setzero_si512 (),
        __M);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_sub_epi32 (__m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_psubd512_mask ((__v16si) __A,
       (__v16si) __B,
       (__v16si)
       _mm512_undefined_si512 (),
       (__mmask16) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_sub_epi32 (__m512i __W, __mmask16 __U, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_psubd512_mask ((__v16si) __A,
       (__v16si) __B,
       (__v16si) __W,
       (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_sub_epi32 (__mmask16 __U, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_psubd512_mask ((__v16si) __A,
       (__v16si) __B,
       (__v16si)
       _mm512_setzero_si512 (),
       (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mul_epu32 (__m512i __X, __m512i __Y)
{
  return (__m512i) __builtin_ia32_pmuludq512_mask ((__v16si) __X,
         (__v16si) __Y,
         (__v8di)
         _mm512_undefined_si512 (),
         (__mmask8) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_mul_epu32 (__m512i __W, __mmask8 __M, __m512i __X, __m512i __Y)
{
  return (__m512i) __builtin_ia32_pmuludq512_mask ((__v16si) __X,
         (__v16si) __Y,
         (__v8di) __W, __M);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_mul_epu32 (__mmask8 __M, __m512i __X, __m512i __Y)
{
  return (__m512i) __builtin_ia32_pmuludq512_mask ((__v16si) __X,
         (__v16si) __Y,
         (__v8di)
         _mm512_setzero_si512 (),
         __M);
}
# 974 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx512fintrin.h" 3 4
extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_sll_epi64 (__m512i __A, __m128i __B)
{
  return (__m512i) __builtin_ia32_psllq512_mask ((__v8di) __A,
       (__v2di) __B,
       (__v8di)
       _mm512_undefined_si512 (),
       (__mmask8) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_sll_epi64 (__m512i __W, __mmask8 __U, __m512i __A, __m128i __B)
{
  return (__m512i) __builtin_ia32_psllq512_mask ((__v8di) __A,
       (__v2di) __B,
       (__v8di) __W,
       (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_sll_epi64 (__mmask8 __U, __m512i __A, __m128i __B)
{
  return (__m512i) __builtin_ia32_psllq512_mask ((__v8di) __A,
       (__v2di) __B,
       (__v8di)
       _mm512_setzero_si512 (),
       (__mmask8) __U);
}
# 1053 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx512fintrin.h" 3 4
extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_srl_epi64 (__m512i __A, __m128i __B)
{
  return (__m512i) __builtin_ia32_psrlq512_mask ((__v8di) __A,
       (__v2di) __B,
       (__v8di)
       _mm512_undefined_si512 (),
       (__mmask8) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_srl_epi64 (__m512i __W, __mmask8 __U, __m512i __A, __m128i __B)
{
  return (__m512i) __builtin_ia32_psrlq512_mask ((__v8di) __A,
       (__v2di) __B,
       (__v8di) __W,
       (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_srl_epi64 (__mmask8 __U, __m512i __A, __m128i __B)
{
  return (__m512i) __builtin_ia32_psrlq512_mask ((__v8di) __A,
       (__v2di) __B,
       (__v8di)
       _mm512_setzero_si512 (),
       (__mmask8) __U);
}
# 1132 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx512fintrin.h" 3 4
extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_sra_epi64 (__m512i __A, __m128i __B)
{
  return (__m512i) __builtin_ia32_psraq512_mask ((__v8di) __A,
       (__v2di) __B,
       (__v8di)
       _mm512_undefined_si512 (),
       (__mmask8) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_sra_epi64 (__m512i __W, __mmask8 __U, __m512i __A, __m128i __B)
{
  return (__m512i) __builtin_ia32_psraq512_mask ((__v8di) __A,
       (__v2di) __B,
       (__v8di) __W,
       (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_sra_epi64 (__mmask8 __U, __m512i __A, __m128i __B)
{
  return (__m512i) __builtin_ia32_psraq512_mask ((__v8di) __A,
       (__v2di) __B,
       (__v8di)
       _mm512_setzero_si512 (),
       (__mmask8) __U);
}
# 1211 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx512fintrin.h" 3 4
extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_sll_epi32 (__m512i __A, __m128i __B)
{
  return (__m512i) __builtin_ia32_pslld512_mask ((__v16si) __A,
       (__v4si) __B,
       (__v16si)
       _mm512_undefined_si512 (),
       (__mmask16) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_sll_epi32 (__m512i __W, __mmask16 __U, __m512i __A, __m128i __B)
{
  return (__m512i) __builtin_ia32_pslld512_mask ((__v16si) __A,
       (__v4si) __B,
       (__v16si) __W,
       (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_sll_epi32 (__mmask16 __U, __m512i __A, __m128i __B)
{
  return (__m512i) __builtin_ia32_pslld512_mask ((__v16si) __A,
       (__v4si) __B,
       (__v16si)
       _mm512_setzero_si512 (),
       (__mmask16) __U);
}
# 1290 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx512fintrin.h" 3 4
extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_srl_epi32 (__m512i __A, __m128i __B)
{
  return (__m512i) __builtin_ia32_psrld512_mask ((__v16si) __A,
       (__v4si) __B,
       (__v16si)
       _mm512_undefined_si512 (),
       (__mmask16) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_srl_epi32 (__m512i __W, __mmask16 __U, __m512i __A, __m128i __B)
{
  return (__m512i) __builtin_ia32_psrld512_mask ((__v16si) __A,
       (__v4si) __B,
       (__v16si) __W,
       (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_srl_epi32 (__mmask16 __U, __m512i __A, __m128i __B)
{
  return (__m512i) __builtin_ia32_psrld512_mask ((__v16si) __A,
       (__v4si) __B,
       (__v16si)
       _mm512_setzero_si512 (),
       (__mmask16) __U);
}
# 1369 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx512fintrin.h" 3 4
extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_sra_epi32 (__m512i __A, __m128i __B)
{
  return (__m512i) __builtin_ia32_psrad512_mask ((__v16si) __A,
       (__v4si) __B,
       (__v16si)
       _mm512_undefined_si512 (),
       (__mmask16) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_sra_epi32 (__m512i __W, __mmask16 __U, __m512i __A, __m128i __B)
{
  return (__m512i) __builtin_ia32_psrad512_mask ((__v16si) __A,
       (__v4si) __B,
       (__v16si) __W,
       (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_sra_epi32 (__mmask16 __U, __m512i __A, __m128i __B)
{
  return (__m512i) __builtin_ia32_psrad512_mask ((__v16si) __A,
       (__v4si) __B,
       (__v16si)
       _mm512_setzero_si512 (),
       (__mmask16) __U);
}
# 1540 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx512fintrin.h" 3 4
extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_rcp14_pd (__m512d __A)
{
  return (__m512d) __builtin_ia32_rcp14pd512_mask ((__v8df) __A,
         (__v8df)
         _mm512_undefined_pd (),
         (__mmask8) -1);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_rcp14_pd (__m512d __W, __mmask8 __U, __m512d __A)
{
  return (__m512d) __builtin_ia32_rcp14pd512_mask ((__v8df) __A,
         (__v8df) __W,
         (__mmask8) __U);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_rcp14_pd (__mmask8 __U, __m512d __A)
{
  return (__m512d) __builtin_ia32_rcp14pd512_mask ((__v8df) __A,
         (__v8df)
         _mm512_setzero_pd (),
         (__mmask8) __U);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_rcp14_ps (__m512 __A)
{
  return (__m512) __builtin_ia32_rcp14ps512_mask ((__v16sf) __A,
        (__v16sf)
        _mm512_undefined_ps (),
        (__mmask16) -1);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_rcp14_ps (__m512 __W, __mmask16 __U, __m512 __A)
{
  return (__m512) __builtin_ia32_rcp14ps512_mask ((__v16sf) __A,
        (__v16sf) __W,
        (__mmask16) __U);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_rcp14_ps (__mmask16 __U, __m512 __A)
{
  return (__m512) __builtin_ia32_rcp14ps512_mask ((__v16sf) __A,
        (__v16sf)
        _mm512_setzero_ps (),
        (__mmask16) __U);
}

extern __inline __m128d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm_rcp14_sd (__m128d __A, __m128d __B)
{
  return (__m128d) __builtin_ia32_rcp14sd ((__v2df) __B,
        (__v2df) __A);
}

extern __inline __m128
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm_rcp14_ss (__m128 __A, __m128 __B)
{
  return (__m128) __builtin_ia32_rcp14ss ((__v4sf) __B,
       (__v4sf) __A);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_rsqrt14_pd (__m512d __A)
{
  return (__m512d) __builtin_ia32_rsqrt14pd512_mask ((__v8df) __A,
           (__v8df)
           _mm512_undefined_pd (),
           (__mmask8) -1);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_rsqrt14_pd (__m512d __W, __mmask8 __U, __m512d __A)
{
  return (__m512d) __builtin_ia32_rsqrt14pd512_mask ((__v8df) __A,
           (__v8df) __W,
           (__mmask8) __U);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_rsqrt14_pd (__mmask8 __U, __m512d __A)
{
  return (__m512d) __builtin_ia32_rsqrt14pd512_mask ((__v8df) __A,
           (__v8df)
           _mm512_setzero_pd (),
           (__mmask8) __U);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_rsqrt14_ps (__m512 __A)
{
  return (__m512) __builtin_ia32_rsqrt14ps512_mask ((__v16sf) __A,
          (__v16sf)
          _mm512_undefined_ps (),
          (__mmask16) -1);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_rsqrt14_ps (__m512 __W, __mmask16 __U, __m512 __A)
{
  return (__m512) __builtin_ia32_rsqrt14ps512_mask ((__v16sf) __A,
          (__v16sf) __W,
          (__mmask16) __U);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_rsqrt14_ps (__mmask16 __U, __m512 __A)
{
  return (__m512) __builtin_ia32_rsqrt14ps512_mask ((__v16sf) __A,
          (__v16sf)
          _mm512_setzero_ps (),
          (__mmask16) __U);
}

extern __inline __m128d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm_rsqrt14_sd (__m128d __A, __m128d __B)
{
  return (__m128d) __builtin_ia32_rsqrt14sd ((__v2df) __B,
          (__v2df) __A);
}

extern __inline __m128
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm_rsqrt14_ss (__m128 __A, __m128 __B)
{
  return (__m128) __builtin_ia32_rsqrt14ss ((__v4sf) __B,
         (__v4sf) __A);
}
# 1791 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx512fintrin.h" 3 4
extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cvtepi8_epi32 (__m128i __A)
{
  return (__m512i) __builtin_ia32_pmovsxbd512_mask ((__v16qi) __A,
          (__v16si)
          _mm512_undefined_si512 (),
          (__mmask16) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtepi8_epi32 (__m512i __W, __mmask16 __U, __m128i __A)
{
  return (__m512i) __builtin_ia32_pmovsxbd512_mask ((__v16qi) __A,
          (__v16si) __W,
          (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_cvtepi8_epi32 (__mmask16 __U, __m128i __A)
{
  return (__m512i) __builtin_ia32_pmovsxbd512_mask ((__v16qi) __A,
          (__v16si)
          _mm512_setzero_si512 (),
          (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cvtepi8_epi64 (__m128i __A)
{
  return (__m512i) __builtin_ia32_pmovsxbq512_mask ((__v16qi) __A,
          (__v8di)
          _mm512_undefined_si512 (),
          (__mmask8) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtepi8_epi64 (__m512i __W, __mmask8 __U, __m128i __A)
{
  return (__m512i) __builtin_ia32_pmovsxbq512_mask ((__v16qi) __A,
          (__v8di) __W,
          (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_cvtepi8_epi64 (__mmask8 __U, __m128i __A)
{
  return (__m512i) __builtin_ia32_pmovsxbq512_mask ((__v16qi) __A,
          (__v8di)
          _mm512_setzero_si512 (),
          (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cvtepi16_epi32 (__m256i __A)
{
  return (__m512i) __builtin_ia32_pmovsxwd512_mask ((__v16hi) __A,
          (__v16si)
          _mm512_undefined_si512 (),
          (__mmask16) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtepi16_epi32 (__m512i __W, __mmask16 __U, __m256i __A)
{
  return (__m512i) __builtin_ia32_pmovsxwd512_mask ((__v16hi) __A,
          (__v16si) __W,
          (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_cvtepi16_epi32 (__mmask16 __U, __m256i __A)
{
  return (__m512i) __builtin_ia32_pmovsxwd512_mask ((__v16hi) __A,
          (__v16si)
          _mm512_setzero_si512 (),
          (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cvtepi16_epi64 (__m128i __A)
{
  return (__m512i) __builtin_ia32_pmovsxwq512_mask ((__v8hi) __A,
          (__v8di)
          _mm512_undefined_si512 (),
          (__mmask8) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtepi16_epi64 (__m512i __W, __mmask8 __U, __m128i __A)
{
  return (__m512i) __builtin_ia32_pmovsxwq512_mask ((__v8hi) __A,
          (__v8di) __W,
          (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_cvtepi16_epi64 (__mmask8 __U, __m128i __A)
{
  return (__m512i) __builtin_ia32_pmovsxwq512_mask ((__v8hi) __A,
          (__v8di)
          _mm512_setzero_si512 (),
          (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cvtepi32_epi64 (__m256i __X)
{
  return (__m512i) __builtin_ia32_pmovsxdq512_mask ((__v8si) __X,
          (__v8di)
          _mm512_undefined_si512 (),
          (__mmask8) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtepi32_epi64 (__m512i __W, __mmask8 __U, __m256i __X)
{
  return (__m512i) __builtin_ia32_pmovsxdq512_mask ((__v8si) __X,
          (__v8di) __W,
          (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_cvtepi32_epi64 (__mmask8 __U, __m256i __X)
{
  return (__m512i) __builtin_ia32_pmovsxdq512_mask ((__v8si) __X,
          (__v8di)
          _mm512_setzero_si512 (),
          (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cvtepu8_epi32 (__m128i __A)
{
  return (__m512i) __builtin_ia32_pmovzxbd512_mask ((__v16qi) __A,
          (__v16si)
          _mm512_undefined_si512 (),
          (__mmask16) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtepu8_epi32 (__m512i __W, __mmask16 __U, __m128i __A)
{
  return (__m512i) __builtin_ia32_pmovzxbd512_mask ((__v16qi) __A,
          (__v16si) __W,
          (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_cvtepu8_epi32 (__mmask16 __U, __m128i __A)
{
  return (__m512i) __builtin_ia32_pmovzxbd512_mask ((__v16qi) __A,
          (__v16si)
          _mm512_setzero_si512 (),
          (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cvtepu8_epi64 (__m128i __A)
{
  return (__m512i) __builtin_ia32_pmovzxbq512_mask ((__v16qi) __A,
          (__v8di)
          _mm512_undefined_si512 (),
          (__mmask8) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtepu8_epi64 (__m512i __W, __mmask8 __U, __m128i __A)
{
  return (__m512i) __builtin_ia32_pmovzxbq512_mask ((__v16qi) __A,
          (__v8di) __W,
          (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_cvtepu8_epi64 (__mmask8 __U, __m128i __A)
{
  return (__m512i) __builtin_ia32_pmovzxbq512_mask ((__v16qi) __A,
          (__v8di)
          _mm512_setzero_si512 (),
          (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cvtepu16_epi32 (__m256i __A)
{
  return (__m512i) __builtin_ia32_pmovzxwd512_mask ((__v16hi) __A,
          (__v16si)
          _mm512_undefined_si512 (),
          (__mmask16) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtepu16_epi32 (__m512i __W, __mmask16 __U, __m256i __A)
{
  return (__m512i) __builtin_ia32_pmovzxwd512_mask ((__v16hi) __A,
          (__v16si) __W,
          (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_cvtepu16_epi32 (__mmask16 __U, __m256i __A)
{
  return (__m512i) __builtin_ia32_pmovzxwd512_mask ((__v16hi) __A,
          (__v16si)
          _mm512_setzero_si512 (),
          (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cvtepu16_epi64 (__m128i __A)
{
  return (__m512i) __builtin_ia32_pmovzxwq512_mask ((__v8hi) __A,
          (__v8di)
          _mm512_undefined_si512 (),
          (__mmask8) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtepu16_epi64 (__m512i __W, __mmask8 __U, __m128i __A)
{
  return (__m512i) __builtin_ia32_pmovzxwq512_mask ((__v8hi) __A,
          (__v8di) __W,
          (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_cvtepu16_epi64 (__mmask8 __U, __m128i __A)
{
  return (__m512i) __builtin_ia32_pmovzxwq512_mask ((__v8hi) __A,
          (__v8di)
          _mm512_setzero_si512 (),
          (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cvtepu32_epi64 (__m256i __X)
{
  return (__m512i) __builtin_ia32_pmovzxdq512_mask ((__v8si) __X,
          (__v8di)
          _mm512_undefined_si512 (),
          (__mmask8) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtepu32_epi64 (__m512i __W, __mmask8 __U, __m256i __X)
{
  return (__m512i) __builtin_ia32_pmovzxdq512_mask ((__v8si) __X,
          (__v8di) __W,
          (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_cvtepu32_epi64 (__mmask8 __U, __m256i __X)
{
  return (__m512i) __builtin_ia32_pmovzxdq512_mask ((__v8si) __X,
          (__v8di)
          _mm512_setzero_si512 (),
          (__mmask8) __U);
}
# 3420 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx512fintrin.h" 3 4
extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_abs_epi64 (__m512i __A)
{
  return (__m512i) __builtin_ia32_pabsq512_mask ((__v8di) __A,
       (__v8di)
       _mm512_undefined_si512 (),
       (__mmask8) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_abs_epi64 (__m512i __W, __mmask8 __U, __m512i __A)
{
  return (__m512i) __builtin_ia32_pabsq512_mask ((__v8di) __A,
       (__v8di) __W,
       (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_abs_epi64 (__mmask8 __U, __m512i __A)
{
  return (__m512i) __builtin_ia32_pabsq512_mask ((__v8di) __A,
       (__v8di)
       _mm512_setzero_si512 (),
       (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_abs_epi32 (__m512i __A)
{
  return (__m512i) __builtin_ia32_pabsd512_mask ((__v16si) __A,
       (__v16si)
       _mm512_undefined_si512 (),
       (__mmask16) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_abs_epi32 (__m512i __W, __mmask16 __U, __m512i __A)
{
  return (__m512i) __builtin_ia32_pabsd512_mask ((__v16si) __A,
       (__v16si) __W,
       (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_abs_epi32 (__mmask16 __U, __m512i __A)
{
  return (__m512i) __builtin_ia32_pabsd512_mask ((__v16si) __A,
       (__v16si)
       _mm512_setzero_si512 (),
       (__mmask16) __U);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_broadcastss_ps (__m128 __A)
{
  return (__m512) __builtin_ia32_broadcastss512 ((__v4sf) __A,
       (__v16sf)
       _mm512_undefined_ps (),
       (__mmask16) -1);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_broadcastss_ps (__m512 __O, __mmask16 __M, __m128 __A)
{
  return (__m512) __builtin_ia32_broadcastss512 ((__v4sf) __A,
       (__v16sf) __O, __M);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_broadcastss_ps (__mmask16 __M, __m128 __A)
{
  return (__m512) __builtin_ia32_broadcastss512 ((__v4sf) __A,
       (__v16sf)
       _mm512_setzero_ps (),
       __M);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_broadcastsd_pd (__m128d __A)
{
  return (__m512d) __builtin_ia32_broadcastsd512 ((__v2df) __A,
        (__v8df)
        _mm512_undefined_pd (),
        (__mmask8) -1);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_broadcastsd_pd (__m512d __O, __mmask8 __M, __m128d __A)
{
  return (__m512d) __builtin_ia32_broadcastsd512 ((__v2df) __A,
        (__v8df) __O, __M);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_broadcastsd_pd (__mmask8 __M, __m128d __A)
{
  return (__m512d) __builtin_ia32_broadcastsd512 ((__v2df) __A,
        (__v8df)
        _mm512_setzero_pd (),
        __M);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_broadcastd_epi32 (__m128i __A)
{
  return (__m512i) __builtin_ia32_pbroadcastd512 ((__v4si) __A,
        (__v16si)
        _mm512_undefined_si512 (),
        (__mmask16) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_broadcastd_epi32 (__m512i __O, __mmask16 __M, __m128i __A)
{
  return (__m512i) __builtin_ia32_pbroadcastd512 ((__v4si) __A,
        (__v16si) __O, __M);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_broadcastd_epi32 (__mmask16 __M, __m128i __A)
{
  return (__m512i) __builtin_ia32_pbroadcastd512 ((__v4si) __A,
        (__v16si)
        _mm512_setzero_si512 (),
        __M);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_set1_epi32 (int __A)
{
  return (__m512i) __builtin_ia32_pbroadcastd512_gpr_mask (__A,
          (__v16si)
          _mm512_undefined_si512 (),
          (__mmask16)(-1));
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_set1_epi32 (__m512i __O, __mmask16 __M, int __A)
{
  return (__m512i) __builtin_ia32_pbroadcastd512_gpr_mask (__A, (__v16si) __O,
          __M);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_set1_epi32 (__mmask16 __M, int __A)
{
  return (__m512i)
  __builtin_ia32_pbroadcastd512_gpr_mask (__A,
       (__v16si) _mm512_setzero_si512 (),
       __M);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_broadcastq_epi64 (__m128i __A)
{
  return (__m512i) __builtin_ia32_pbroadcastq512 ((__v2di) __A,
        (__v8di)
        _mm512_undefined_si512 (),
        (__mmask8) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_broadcastq_epi64 (__m512i __O, __mmask8 __M, __m128i __A)
{
  return (__m512i) __builtin_ia32_pbroadcastq512 ((__v2di) __A,
        (__v8di) __O, __M);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_broadcastq_epi64 (__mmask8 __M, __m128i __A)
{
  return (__m512i) __builtin_ia32_pbroadcastq512 ((__v2di) __A,
        (__v8di)
        _mm512_setzero_si512 (),
        __M);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_set1_epi64 (long long __A)
{






  return (__m512i) __builtin_ia32_pbroadcastq512_mem_mask (__A,
          (__v8di)
          _mm512_undefined_si512 (),
          (__mmask8)(-1));

}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_set1_epi64 (__m512i __O, __mmask8 __M, long long __A)
{




  return (__m512i) __builtin_ia32_pbroadcastq512_mem_mask (__A, (__v8di) __O,
          __M);

}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_set1_epi64 (__mmask8 __M, long long __A)
{






  return (__m512i)
  __builtin_ia32_pbroadcastq512_mem_mask (__A,
       (__v8di) _mm512_setzero_si512 (),
       __M);

}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_broadcast_f32x4 (__m128 __A)
{
  return (__m512) __builtin_ia32_broadcastf32x4_512 ((__v4sf) __A,
           (__v16sf)
           _mm512_undefined_ps (),
           (__mmask16) -1);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_broadcast_f32x4 (__m512 __O, __mmask16 __M, __m128 __A)
{
  return (__m512) __builtin_ia32_broadcastf32x4_512 ((__v4sf) __A,
           (__v16sf) __O,
           __M);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_broadcast_f32x4 (__mmask16 __M, __m128 __A)
{
  return (__m512) __builtin_ia32_broadcastf32x4_512 ((__v4sf) __A,
           (__v16sf)
           _mm512_setzero_ps (),
           __M);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_broadcast_i32x4 (__m128i __A)
{
  return (__m512i) __builtin_ia32_broadcasti32x4_512 ((__v4si) __A,
            (__v16si)
            _mm512_undefined_si512 (),
            (__mmask16) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_broadcast_i32x4 (__m512i __O, __mmask16 __M, __m128i __A)
{
  return (__m512i) __builtin_ia32_broadcasti32x4_512 ((__v4si) __A,
            (__v16si) __O,
            __M);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_broadcast_i32x4 (__mmask16 __M, __m128i __A)
{
  return (__m512i) __builtin_ia32_broadcasti32x4_512 ((__v4si) __A,
            (__v16si)
            _mm512_setzero_si512 (),
            __M);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_broadcast_f64x4 (__m256d __A)
{
  return (__m512d) __builtin_ia32_broadcastf64x4_512 ((__v4df) __A,
            (__v8df)
            _mm512_undefined_pd (),
            (__mmask8) -1);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_broadcast_f64x4 (__m512d __O, __mmask8 __M, __m256d __A)
{
  return (__m512d) __builtin_ia32_broadcastf64x4_512 ((__v4df) __A,
            (__v8df) __O,
            __M);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_broadcast_f64x4 (__mmask8 __M, __m256d __A)
{
  return (__m512d) __builtin_ia32_broadcastf64x4_512 ((__v4df) __A,
            (__v8df)
            _mm512_setzero_pd (),
            __M);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_broadcast_i64x4 (__m256i __A)
{
  return (__m512i) __builtin_ia32_broadcasti64x4_512 ((__v4di) __A,
            (__v8di)
            _mm512_undefined_si512 (),
            (__mmask8) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_broadcast_i64x4 (__m512i __O, __mmask8 __M, __m256i __A)
{
  return (__m512i) __builtin_ia32_broadcasti64x4_512 ((__v4di) __A,
            (__v8di) __O,
            __M);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_broadcast_i64x4 (__mmask8 __M, __m256i __A)
{
  return (__m512i) __builtin_ia32_broadcasti64x4_512 ((__v4di) __A,
            (__v8di)
            _mm512_setzero_si512 (),
            __M);
}

typedef enum
{
  _MM_PERM_AAAA = 0x00, _MM_PERM_AAAB = 0x01, _MM_PERM_AAAC = 0x02,
  _MM_PERM_AAAD = 0x03, _MM_PERM_AABA = 0x04, _MM_PERM_AABB = 0x05,
  _MM_PERM_AABC = 0x06, _MM_PERM_AABD = 0x07, _MM_PERM_AACA = 0x08,
  _MM_PERM_AACB = 0x09, _MM_PERM_AACC = 0x0A, _MM_PERM_AACD = 0x0B,
  _MM_PERM_AADA = 0x0C, _MM_PERM_AADB = 0x0D, _MM_PERM_AADC = 0x0E,
  _MM_PERM_AADD = 0x0F, _MM_PERM_ABAA = 0x10, _MM_PERM_ABAB = 0x11,
  _MM_PERM_ABAC = 0x12, _MM_PERM_ABAD = 0x13, _MM_PERM_ABBA = 0x14,
  _MM_PERM_ABBB = 0x15, _MM_PERM_ABBC = 0x16, _MM_PERM_ABBD = 0x17,
  _MM_PERM_ABCA = 0x18, _MM_PERM_ABCB = 0x19, _MM_PERM_ABCC = 0x1A,
  _MM_PERM_ABCD = 0x1B, _MM_PERM_ABDA = 0x1C, _MM_PERM_ABDB = 0x1D,
  _MM_PERM_ABDC = 0x1E, _MM_PERM_ABDD = 0x1F, _MM_PERM_ACAA = 0x20,
  _MM_PERM_ACAB = 0x21, _MM_PERM_ACAC = 0x22, _MM_PERM_ACAD = 0x23,
  _MM_PERM_ACBA = 0x24, _MM_PERM_ACBB = 0x25, _MM_PERM_ACBC = 0x26,
  _MM_PERM_ACBD = 0x27, _MM_PERM_ACCA = 0x28, _MM_PERM_ACCB = 0x29,
  _MM_PERM_ACCC = 0x2A, _MM_PERM_ACCD = 0x2B, _MM_PERM_ACDA = 0x2C,
  _MM_PERM_ACDB = 0x2D, _MM_PERM_ACDC = 0x2E, _MM_PERM_ACDD = 0x2F,
  _MM_PERM_ADAA = 0x30, _MM_PERM_ADAB = 0x31, _MM_PERM_ADAC = 0x32,
  _MM_PERM_ADAD = 0x33, _MM_PERM_ADBA = 0x34, _MM_PERM_ADBB = 0x35,
  _MM_PERM_ADBC = 0x36, _MM_PERM_ADBD = 0x37, _MM_PERM_ADCA = 0x38,
  _MM_PERM_ADCB = 0x39, _MM_PERM_ADCC = 0x3A, _MM_PERM_ADCD = 0x3B,
  _MM_PERM_ADDA = 0x3C, _MM_PERM_ADDB = 0x3D, _MM_PERM_ADDC = 0x3E,
  _MM_PERM_ADDD = 0x3F, _MM_PERM_BAAA = 0x40, _MM_PERM_BAAB = 0x41,
  _MM_PERM_BAAC = 0x42, _MM_PERM_BAAD = 0x43, _MM_PERM_BABA = 0x44,
  _MM_PERM_BABB = 0x45, _MM_PERM_BABC = 0x46, _MM_PERM_BABD = 0x47,
  _MM_PERM_BACA = 0x48, _MM_PERM_BACB = 0x49, _MM_PERM_BACC = 0x4A,
  _MM_PERM_BACD = 0x4B, _MM_PERM_BADA = 0x4C, _MM_PERM_BADB = 0x4D,
  _MM_PERM_BADC = 0x4E, _MM_PERM_BADD = 0x4F, _MM_PERM_BBAA = 0x50,
  _MM_PERM_BBAB = 0x51, _MM_PERM_BBAC = 0x52, _MM_PERM_BBAD = 0x53,
  _MM_PERM_BBBA = 0x54, _MM_PERM_BBBB = 0x55, _MM_PERM_BBBC = 0x56,
  _MM_PERM_BBBD = 0x57, _MM_PERM_BBCA = 0x58, _MM_PERM_BBCB = 0x59,
  _MM_PERM_BBCC = 0x5A, _MM_PERM_BBCD = 0x5B, _MM_PERM_BBDA = 0x5C,
  _MM_PERM_BBDB = 0x5D, _MM_PERM_BBDC = 0x5E, _MM_PERM_BBDD = 0x5F,
  _MM_PERM_BCAA = 0x60, _MM_PERM_BCAB = 0x61, _MM_PERM_BCAC = 0x62,
  _MM_PERM_BCAD = 0x63, _MM_PERM_BCBA = 0x64, _MM_PERM_BCBB = 0x65,
  _MM_PERM_BCBC = 0x66, _MM_PERM_BCBD = 0x67, _MM_PERM_BCCA = 0x68,
  _MM_PERM_BCCB = 0x69, _MM_PERM_BCCC = 0x6A, _MM_PERM_BCCD = 0x6B,
  _MM_PERM_BCDA = 0x6C, _MM_PERM_BCDB = 0x6D, _MM_PERM_BCDC = 0x6E,
  _MM_PERM_BCDD = 0x6F, _MM_PERM_BDAA = 0x70, _MM_PERM_BDAB = 0x71,
  _MM_PERM_BDAC = 0x72, _MM_PERM_BDAD = 0x73, _MM_PERM_BDBA = 0x74,
  _MM_PERM_BDBB = 0x75, _MM_PERM_BDBC = 0x76, _MM_PERM_BDBD = 0x77,
  _MM_PERM_BDCA = 0x78, _MM_PERM_BDCB = 0x79, _MM_PERM_BDCC = 0x7A,
  _MM_PERM_BDCD = 0x7B, _MM_PERM_BDDA = 0x7C, _MM_PERM_BDDB = 0x7D,
  _MM_PERM_BDDC = 0x7E, _MM_PERM_BDDD = 0x7F, _MM_PERM_CAAA = 0x80,
  _MM_PERM_CAAB = 0x81, _MM_PERM_CAAC = 0x82, _MM_PERM_CAAD = 0x83,
  _MM_PERM_CABA = 0x84, _MM_PERM_CABB = 0x85, _MM_PERM_CABC = 0x86,
  _MM_PERM_CABD = 0x87, _MM_PERM_CACA = 0x88, _MM_PERM_CACB = 0x89,
  _MM_PERM_CACC = 0x8A, _MM_PERM_CACD = 0x8B, _MM_PERM_CADA = 0x8C,
  _MM_PERM_CADB = 0x8D, _MM_PERM_CADC = 0x8E, _MM_PERM_CADD = 0x8F,
  _MM_PERM_CBAA = 0x90, _MM_PERM_CBAB = 0x91, _MM_PERM_CBAC = 0x92,
  _MM_PERM_CBAD = 0x93, _MM_PERM_CBBA = 0x94, _MM_PERM_CBBB = 0x95,
  _MM_PERM_CBBC = 0x96, _MM_PERM_CBBD = 0x97, _MM_PERM_CBCA = 0x98,
  _MM_PERM_CBCB = 0x99, _MM_PERM_CBCC = 0x9A, _MM_PERM_CBCD = 0x9B,
  _MM_PERM_CBDA = 0x9C, _MM_PERM_CBDB = 0x9D, _MM_PERM_CBDC = 0x9E,
  _MM_PERM_CBDD = 0x9F, _MM_PERM_CCAA = 0xA0, _MM_PERM_CCAB = 0xA1,
  _MM_PERM_CCAC = 0xA2, _MM_PERM_CCAD = 0xA3, _MM_PERM_CCBA = 0xA4,
  _MM_PERM_CCBB = 0xA5, _MM_PERM_CCBC = 0xA6, _MM_PERM_CCBD = 0xA7,
  _MM_PERM_CCCA = 0xA8, _MM_PERM_CCCB = 0xA9, _MM_PERM_CCCC = 0xAA,
  _MM_PERM_CCCD = 0xAB, _MM_PERM_CCDA = 0xAC, _MM_PERM_CCDB = 0xAD,
  _MM_PERM_CCDC = 0xAE, _MM_PERM_CCDD = 0xAF, _MM_PERM_CDAA = 0xB0,
  _MM_PERM_CDAB = 0xB1, _MM_PERM_CDAC = 0xB2, _MM_PERM_CDAD = 0xB3,
  _MM_PERM_CDBA = 0xB4, _MM_PERM_CDBB = 0xB5, _MM_PERM_CDBC = 0xB6,
  _MM_PERM_CDBD = 0xB7, _MM_PERM_CDCA = 0xB8, _MM_PERM_CDCB = 0xB9,
  _MM_PERM_CDCC = 0xBA, _MM_PERM_CDCD = 0xBB, _MM_PERM_CDDA = 0xBC,
  _MM_PERM_CDDB = 0xBD, _MM_PERM_CDDC = 0xBE, _MM_PERM_CDDD = 0xBF,
  _MM_PERM_DAAA = 0xC0, _MM_PERM_DAAB = 0xC1, _MM_PERM_DAAC = 0xC2,
  _MM_PERM_DAAD = 0xC3, _MM_PERM_DABA = 0xC4, _MM_PERM_DABB = 0xC5,
  _MM_PERM_DABC = 0xC6, _MM_PERM_DABD = 0xC7, _MM_PERM_DACA = 0xC8,
  _MM_PERM_DACB = 0xC9, _MM_PERM_DACC = 0xCA, _MM_PERM_DACD = 0xCB,
  _MM_PERM_DADA = 0xCC, _MM_PERM_DADB = 0xCD, _MM_PERM_DADC = 0xCE,
  _MM_PERM_DADD = 0xCF, _MM_PERM_DBAA = 0xD0, _MM_PERM_DBAB = 0xD1,
  _MM_PERM_DBAC = 0xD2, _MM_PERM_DBAD = 0xD3, _MM_PERM_DBBA = 0xD4,
  _MM_PERM_DBBB = 0xD5, _MM_PERM_DBBC = 0xD6, _MM_PERM_DBBD = 0xD7,
  _MM_PERM_DBCA = 0xD8, _MM_PERM_DBCB = 0xD9, _MM_PERM_DBCC = 0xDA,
  _MM_PERM_DBCD = 0xDB, _MM_PERM_DBDA = 0xDC, _MM_PERM_DBDB = 0xDD,
  _MM_PERM_DBDC = 0xDE, _MM_PERM_DBDD = 0xDF, _MM_PERM_DCAA = 0xE0,
  _MM_PERM_DCAB = 0xE1, _MM_PERM_DCAC = 0xE2, _MM_PERM_DCAD = 0xE3,
  _MM_PERM_DCBA = 0xE4, _MM_PERM_DCBB = 0xE5, _MM_PERM_DCBC = 0xE6,
  _MM_PERM_DCBD = 0xE7, _MM_PERM_DCCA = 0xE8, _MM_PERM_DCCB = 0xE9,
  _MM_PERM_DCCC = 0xEA, _MM_PERM_DCCD = 0xEB, _MM_PERM_DCDA = 0xEC,
  _MM_PERM_DCDB = 0xED, _MM_PERM_DCDC = 0xEE, _MM_PERM_DCDD = 0xEF,
  _MM_PERM_DDAA = 0xF0, _MM_PERM_DDAB = 0xF1, _MM_PERM_DDAC = 0xF2,
  _MM_PERM_DDAD = 0xF3, _MM_PERM_DDBA = 0xF4, _MM_PERM_DDBB = 0xF5,
  _MM_PERM_DDBC = 0xF6, _MM_PERM_DDBD = 0xF7, _MM_PERM_DDCA = 0xF8,
  _MM_PERM_DDCB = 0xF9, _MM_PERM_DDCC = 0xFA, _MM_PERM_DDCD = 0xFB,
  _MM_PERM_DDDA = 0xFC, _MM_PERM_DDDB = 0xFD, _MM_PERM_DDDC = 0xFE,
  _MM_PERM_DDDD = 0xFF
} _MM_PERM_ENUM;
# 4133 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx512fintrin.h" 3 4
extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_rolv_epi32 (__m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_prolvd512_mask ((__v16si) __A,
        (__v16si) __B,
        (__v16si)
        _mm512_undefined_si512 (),
        (__mmask16) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_rolv_epi32 (__m512i __W, __mmask16 __U, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_prolvd512_mask ((__v16si) __A,
        (__v16si) __B,
        (__v16si) __W,
        (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_rolv_epi32 (__mmask16 __U, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_prolvd512_mask ((__v16si) __A,
        (__v16si) __B,
        (__v16si)
        _mm512_setzero_si512 (),
        (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_rorv_epi32 (__m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_prorvd512_mask ((__v16si) __A,
        (__v16si) __B,
        (__v16si)
        _mm512_undefined_si512 (),
        (__mmask16) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_rorv_epi32 (__m512i __W, __mmask16 __U, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_prorvd512_mask ((__v16si) __A,
        (__v16si) __B,
        (__v16si) __W,
        (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_rorv_epi32 (__mmask16 __U, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_prorvd512_mask ((__v16si) __A,
        (__v16si) __B,
        (__v16si)
        _mm512_setzero_si512 (),
        (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_rolv_epi64 (__m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_prolvq512_mask ((__v8di) __A,
        (__v8di) __B,
        (__v8di)
        _mm512_undefined_si512 (),
        (__mmask8) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_rolv_epi64 (__m512i __W, __mmask8 __U, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_prolvq512_mask ((__v8di) __A,
        (__v8di) __B,
        (__v8di) __W,
        (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_rolv_epi64 (__mmask8 __U, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_prolvq512_mask ((__v8di) __A,
        (__v8di) __B,
        (__v8di)
        _mm512_setzero_si512 (),
        (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_rorv_epi64 (__m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_prorvq512_mask ((__v8di) __A,
        (__v8di) __B,
        (__v8di)
        _mm512_undefined_si512 (),
        (__mmask8) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_rorv_epi64 (__m512i __W, __mmask8 __U, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_prorvq512_mask ((__v8di) __A,
        (__v8di) __B,
        (__v8di) __W,
        (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_rorv_epi64 (__mmask8 __U, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_prorvq512_mask ((__v8di) __A,
        (__v8di) __B,
        (__v8di)
        _mm512_setzero_si512 (),
        (__mmask8) __U);
}
# 4581 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx512fintrin.h" 3 4
extern __inline __m128d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtu32_sd (__m128d __A, unsigned __B)
{
  return (__m128d) __builtin_ia32_cvtusi2sd32 ((__v2df) __A, __B);
}
# 4690 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx512fintrin.h" 3 4
extern __inline __m128i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cvtepi32_epi8 (__m512i __A)
{
  return (__m128i) __builtin_ia32_pmovdb512_mask ((__v16si) __A,
        (__v16qi)
        _mm_undefined_si128 (),
        (__mmask16) -1);
}

extern __inline void
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtepi32_storeu_epi8 (void * __P, __mmask16 __M, __m512i __A)
{
  __builtin_ia32_pmovdb512mem_mask ((__v16qi *) __P, (__v16si) __A, __M);
}

extern __inline __m128i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtepi32_epi8 (__m128i __O, __mmask16 __M, __m512i __A)
{
  return (__m128i) __builtin_ia32_pmovdb512_mask ((__v16si) __A,
        (__v16qi) __O, __M);
}

extern __inline __m128i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_cvtepi32_epi8 (__mmask16 __M, __m512i __A)
{
  return (__m128i) __builtin_ia32_pmovdb512_mask ((__v16si) __A,
        (__v16qi)
        _mm_setzero_si128 (),
        __M);
}

extern __inline __m128i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cvtsepi32_epi8 (__m512i __A)
{
  return (__m128i) __builtin_ia32_pmovsdb512_mask ((__v16si) __A,
         (__v16qi)
         _mm_undefined_si128 (),
         (__mmask16) -1);
}

extern __inline void
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtsepi32_storeu_epi8 (void * __P, __mmask16 __M, __m512i __A)
{
  __builtin_ia32_pmovsdb512mem_mask ((__v16qi *) __P, (__v16si) __A, __M);
}

extern __inline __m128i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtsepi32_epi8 (__m128i __O, __mmask16 __M, __m512i __A)
{
  return (__m128i) __builtin_ia32_pmovsdb512_mask ((__v16si) __A,
         (__v16qi) __O, __M);
}

extern __inline __m128i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_cvtsepi32_epi8 (__mmask16 __M, __m512i __A)
{
  return (__m128i) __builtin_ia32_pmovsdb512_mask ((__v16si) __A,
         (__v16qi)
         _mm_setzero_si128 (),
         __M);
}

extern __inline __m128i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cvtusepi32_epi8 (__m512i __A)
{
  return (__m128i) __builtin_ia32_pmovusdb512_mask ((__v16si) __A,
          (__v16qi)
          _mm_undefined_si128 (),
          (__mmask16) -1);
}

extern __inline void
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtusepi32_storeu_epi8 (void * __P, __mmask16 __M, __m512i __A)
{
  __builtin_ia32_pmovusdb512mem_mask ((__v16qi *) __P, (__v16si) __A, __M);
}

extern __inline __m128i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtusepi32_epi8 (__m128i __O, __mmask16 __M, __m512i __A)
{
  return (__m128i) __builtin_ia32_pmovusdb512_mask ((__v16si) __A,
          (__v16qi) __O,
          __M);
}

extern __inline __m128i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_cvtusepi32_epi8 (__mmask16 __M, __m512i __A)
{
  return (__m128i) __builtin_ia32_pmovusdb512_mask ((__v16si) __A,
          (__v16qi)
          _mm_setzero_si128 (),
          __M);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cvtepi32_epi16 (__m512i __A)
{
  return (__m256i) __builtin_ia32_pmovdw512_mask ((__v16si) __A,
        (__v16hi)
        _mm256_undefined_si256 (),
        (__mmask16) -1);
}

extern __inline void
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtepi32_storeu_epi16 (void * __P, __mmask16 __M, __m512i __A)
{
  __builtin_ia32_pmovdw512mem_mask ((__v16hi *) __P, (__v16si) __A, __M);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtepi32_epi16 (__m256i __O, __mmask16 __M, __m512i __A)
{
  return (__m256i) __builtin_ia32_pmovdw512_mask ((__v16si) __A,
        (__v16hi) __O, __M);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_cvtepi32_epi16 (__mmask16 __M, __m512i __A)
{
  return (__m256i) __builtin_ia32_pmovdw512_mask ((__v16si) __A,
        (__v16hi)
        _mm256_setzero_si256 (),
        __M);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cvtsepi32_epi16 (__m512i __A)
{
  return (__m256i) __builtin_ia32_pmovsdw512_mask ((__v16si) __A,
         (__v16hi)
         _mm256_undefined_si256 (),
         (__mmask16) -1);
}

extern __inline void
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtsepi32_storeu_epi16 (void *__P, __mmask16 __M, __m512i __A)
{
  __builtin_ia32_pmovsdw512mem_mask ((__v16hi*) __P, (__v16si) __A, __M);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtsepi32_epi16 (__m256i __O, __mmask16 __M, __m512i __A)
{
  return (__m256i) __builtin_ia32_pmovsdw512_mask ((__v16si) __A,
         (__v16hi) __O, __M);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_cvtsepi32_epi16 (__mmask16 __M, __m512i __A)
{
  return (__m256i) __builtin_ia32_pmovsdw512_mask ((__v16si) __A,
         (__v16hi)
         _mm256_setzero_si256 (),
         __M);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cvtusepi32_epi16 (__m512i __A)
{
  return (__m256i) __builtin_ia32_pmovusdw512_mask ((__v16si) __A,
          (__v16hi)
          _mm256_undefined_si256 (),
          (__mmask16) -1);
}

extern __inline void
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtusepi32_storeu_epi16 (void *__P, __mmask16 __M, __m512i __A)
{
  __builtin_ia32_pmovusdw512mem_mask ((__v16hi*) __P, (__v16si) __A, __M);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtusepi32_epi16 (__m256i __O, __mmask16 __M, __m512i __A)
{
  return (__m256i) __builtin_ia32_pmovusdw512_mask ((__v16si) __A,
          (__v16hi) __O,
          __M);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_cvtusepi32_epi16 (__mmask16 __M, __m512i __A)
{
  return (__m256i) __builtin_ia32_pmovusdw512_mask ((__v16si) __A,
          (__v16hi)
          _mm256_setzero_si256 (),
          __M);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cvtepi64_epi32 (__m512i __A)
{
  return (__m256i) __builtin_ia32_pmovqd512_mask ((__v8di) __A,
        (__v8si)
        _mm256_undefined_si256 (),
        (__mmask8) -1);
}

extern __inline void
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtepi64_storeu_epi32 (void* __P, __mmask8 __M, __m512i __A)
{
  __builtin_ia32_pmovqd512mem_mask ((__v8si *) __P, (__v8di) __A, __M);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtepi64_epi32 (__m256i __O, __mmask8 __M, __m512i __A)
{
  return (__m256i) __builtin_ia32_pmovqd512_mask ((__v8di) __A,
        (__v8si) __O, __M);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_cvtepi64_epi32 (__mmask8 __M, __m512i __A)
{
  return (__m256i) __builtin_ia32_pmovqd512_mask ((__v8di) __A,
        (__v8si)
        _mm256_setzero_si256 (),
        __M);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cvtsepi64_epi32 (__m512i __A)
{
  __v8si __O;
  return (__m256i) __builtin_ia32_pmovsqd512_mask ((__v8di) __A,
         (__v8si)
         _mm256_undefined_si256 (),
         (__mmask8) -1);
}

extern __inline void
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtsepi64_storeu_epi32 (void *__P, __mmask8 __M, __m512i __A)
{
  __builtin_ia32_pmovsqd512mem_mask ((__v8si *) __P, (__v8di) __A, __M);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtsepi64_epi32 (__m256i __O, __mmask8 __M, __m512i __A)
{
  return (__m256i) __builtin_ia32_pmovsqd512_mask ((__v8di) __A,
         (__v8si) __O, __M);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_cvtsepi64_epi32 (__mmask8 __M, __m512i __A)
{
  return (__m256i) __builtin_ia32_pmovsqd512_mask ((__v8di) __A,
         (__v8si)
         _mm256_setzero_si256 (),
         __M);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cvtusepi64_epi32 (__m512i __A)
{
  return (__m256i) __builtin_ia32_pmovusqd512_mask ((__v8di) __A,
          (__v8si)
          _mm256_undefined_si256 (),
          (__mmask8) -1);
}

extern __inline void
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtusepi64_storeu_epi32 (void* __P, __mmask8 __M, __m512i __A)
{
  __builtin_ia32_pmovusqd512mem_mask ((__v8si*) __P, (__v8di) __A, __M);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtusepi64_epi32 (__m256i __O, __mmask8 __M, __m512i __A)
{
  return (__m256i) __builtin_ia32_pmovusqd512_mask ((__v8di) __A,
          (__v8si) __O, __M);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_cvtusepi64_epi32 (__mmask8 __M, __m512i __A)
{
  return (__m256i) __builtin_ia32_pmovusqd512_mask ((__v8di) __A,
          (__v8si)
          _mm256_setzero_si256 (),
          __M);
}

extern __inline __m128i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cvtepi64_epi16 (__m512i __A)
{
  return (__m128i) __builtin_ia32_pmovqw512_mask ((__v8di) __A,
        (__v8hi)
        _mm_undefined_si128 (),
        (__mmask8) -1);
}

extern __inline void
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtepi64_storeu_epi16 (void *__P, __mmask8 __M, __m512i __A)
{
  __builtin_ia32_pmovqw512mem_mask ((__v8hi *) __P, (__v8di) __A, __M);
}

extern __inline __m128i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtepi64_epi16 (__m128i __O, __mmask8 __M, __m512i __A)
{
  return (__m128i) __builtin_ia32_pmovqw512_mask ((__v8di) __A,
        (__v8hi) __O, __M);
}

extern __inline __m128i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_cvtepi64_epi16 (__mmask8 __M, __m512i __A)
{
  return (__m128i) __builtin_ia32_pmovqw512_mask ((__v8di) __A,
        (__v8hi)
        _mm_setzero_si128 (),
        __M);
}

extern __inline __m128i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cvtsepi64_epi16 (__m512i __A)
{
  return (__m128i) __builtin_ia32_pmovsqw512_mask ((__v8di) __A,
         (__v8hi)
         _mm_undefined_si128 (),
         (__mmask8) -1);
}

extern __inline void
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtsepi64_storeu_epi16 (void * __P, __mmask8 __M, __m512i __A)
{
  __builtin_ia32_pmovsqw512mem_mask ((__v8hi *) __P, (__v8di) __A, __M);
}

extern __inline __m128i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtsepi64_epi16 (__m128i __O, __mmask8 __M, __m512i __A)
{
  return (__m128i) __builtin_ia32_pmovsqw512_mask ((__v8di) __A,
         (__v8hi) __O, __M);
}

extern __inline __m128i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_cvtsepi64_epi16 (__mmask8 __M, __m512i __A)
{
  return (__m128i) __builtin_ia32_pmovsqw512_mask ((__v8di) __A,
         (__v8hi)
         _mm_setzero_si128 (),
         __M);
}

extern __inline __m128i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cvtusepi64_epi16 (__m512i __A)
{
  return (__m128i) __builtin_ia32_pmovusqw512_mask ((__v8di) __A,
          (__v8hi)
          _mm_undefined_si128 (),
          (__mmask8) -1);
}

extern __inline void
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtusepi64_storeu_epi16 (void *__P, __mmask8 __M, __m512i __A)
{
  __builtin_ia32_pmovusqw512mem_mask ((__v8hi*) __P, (__v8di) __A, __M);
}

extern __inline __m128i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtusepi64_epi16 (__m128i __O, __mmask8 __M, __m512i __A)
{
  return (__m128i) __builtin_ia32_pmovusqw512_mask ((__v8di) __A,
          (__v8hi) __O, __M);
}

extern __inline __m128i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_cvtusepi64_epi16 (__mmask8 __M, __m512i __A)
{
  return (__m128i) __builtin_ia32_pmovusqw512_mask ((__v8di) __A,
          (__v8hi)
          _mm_setzero_si128 (),
          __M);
}

extern __inline __m128i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cvtepi64_epi8 (__m512i __A)
{
  return (__m128i) __builtin_ia32_pmovqb512_mask ((__v8di) __A,
        (__v16qi)
        _mm_undefined_si128 (),
        (__mmask8) -1);
}

extern __inline void
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtepi64_storeu_epi8 (void * __P, __mmask8 __M, __m512i __A)
{
  __builtin_ia32_pmovqb512mem_mask ((__v16qi *) __P, (__v8di) __A, __M);
}

extern __inline __m128i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtepi64_epi8 (__m128i __O, __mmask8 __M, __m512i __A)
{
  return (__m128i) __builtin_ia32_pmovqb512_mask ((__v8di) __A,
        (__v16qi) __O, __M);
}

extern __inline __m128i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_cvtepi64_epi8 (__mmask8 __M, __m512i __A)
{
  return (__m128i) __builtin_ia32_pmovqb512_mask ((__v8di) __A,
        (__v16qi)
        _mm_setzero_si128 (),
        __M);
}

extern __inline __m128i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cvtsepi64_epi8 (__m512i __A)
{
  return (__m128i) __builtin_ia32_pmovsqb512_mask ((__v8di) __A,
         (__v16qi)
         _mm_undefined_si128 (),
         (__mmask8) -1);
}

extern __inline void
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtsepi64_storeu_epi8 (void * __P, __mmask8 __M, __m512i __A)
{
  __builtin_ia32_pmovsqb512mem_mask ((__v16qi *) __P, (__v8di) __A, __M);
}

extern __inline __m128i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtsepi64_epi8 (__m128i __O, __mmask8 __M, __m512i __A)
{
  return (__m128i) __builtin_ia32_pmovsqb512_mask ((__v8di) __A,
         (__v16qi) __O, __M);
}

extern __inline __m128i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_cvtsepi64_epi8 (__mmask8 __M, __m512i __A)
{
  return (__m128i) __builtin_ia32_pmovsqb512_mask ((__v8di) __A,
         (__v16qi)
         _mm_setzero_si128 (),
         __M);
}

extern __inline __m128i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cvtusepi64_epi8 (__m512i __A)
{
  return (__m128i) __builtin_ia32_pmovusqb512_mask ((__v8di) __A,
          (__v16qi)
          _mm_undefined_si128 (),
          (__mmask8) -1);
}

extern __inline void
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtusepi64_storeu_epi8 (void * __P, __mmask8 __M, __m512i __A)
{
  __builtin_ia32_pmovusqb512mem_mask ((__v16qi *) __P, (__v8di) __A, __M);
}

extern __inline __m128i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtusepi64_epi8 (__m128i __O, __mmask8 __M, __m512i __A)
{
  return (__m128i) __builtin_ia32_pmovusqb512_mask ((__v8di) __A,
          (__v16qi) __O,
          __M);
}

extern __inline __m128i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_cvtusepi64_epi8 (__mmask8 __M, __m512i __A)
{
  return (__m128i) __builtin_ia32_pmovusqb512_mask ((__v8di) __A,
          (__v16qi)
          _mm_setzero_si128 (),
          __M);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cvtepi32_pd (__m256i __A)
{
  return (__m512d) __builtin_ia32_cvtdq2pd512_mask ((__v8si) __A,
          (__v8df)
          _mm512_undefined_pd (),
          (__mmask8) -1);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtepi32_pd (__m512d __W, __mmask8 __U, __m256i __A)
{
  return (__m512d) __builtin_ia32_cvtdq2pd512_mask ((__v8si) __A,
          (__v8df) __W,
          (__mmask8) __U);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_cvtepi32_pd (__mmask8 __U, __m256i __A)
{
  return (__m512d) __builtin_ia32_cvtdq2pd512_mask ((__v8si) __A,
          (__v8df)
          _mm512_setzero_pd (),
          (__mmask8) __U);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cvtepu32_pd (__m256i __A)
{
  return (__m512d) __builtin_ia32_cvtudq2pd512_mask ((__v8si) __A,
           (__v8df)
           _mm512_undefined_pd (),
           (__mmask8) -1);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtepu32_pd (__m512d __W, __mmask8 __U, __m256i __A)
{
  return (__m512d) __builtin_ia32_cvtudq2pd512_mask ((__v8si) __A,
           (__v8df) __W,
           (__mmask8) __U);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_cvtepu32_pd (__mmask8 __U, __m256i __A)
{
  return (__m512d) __builtin_ia32_cvtudq2pd512_mask ((__v8si) __A,
           (__v8df)
           _mm512_setzero_pd (),
           (__mmask8) __U);
}
# 5705 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx512fintrin.h" 3 4
extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_loadu_pd (void const *__P)
{
  return (__m512d) __builtin_ia32_loadupd512_mask ((const __v8df *) __P,
         (__v8df)
         _mm512_undefined_pd (),
         (__mmask8) -1);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_loadu_pd (__m512d __W, __mmask8 __U, void const *__P)
{
  return (__m512d) __builtin_ia32_loadupd512_mask ((const __v8df *) __P,
         (__v8df) __W,
         (__mmask8) __U);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_loadu_pd (__mmask8 __U, void const *__P)
{
  return (__m512d) __builtin_ia32_loadupd512_mask ((const __v8df *) __P,
         (__v8df)
         _mm512_setzero_pd (),
         (__mmask8) __U);
}

extern __inline void
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_storeu_pd (void *__P, __m512d __A)
{
  __builtin_ia32_storeupd512_mask ((__v8df *) __P, (__v8df) __A,
       (__mmask8) -1);
}

extern __inline void
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_storeu_pd (void *__P, __mmask8 __U, __m512d __A)
{
  __builtin_ia32_storeupd512_mask ((__v8df *) __P, (__v8df) __A,
       (__mmask8) __U);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_loadu_ps (void const *__P)
{
  return (__m512) __builtin_ia32_loadups512_mask ((const __v16sf *) __P,
        (__v16sf)
        _mm512_undefined_ps (),
        (__mmask16) -1);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_loadu_ps (__m512 __W, __mmask16 __U, void const *__P)
{
  return (__m512) __builtin_ia32_loadups512_mask ((const __v16sf *) __P,
        (__v16sf) __W,
        (__mmask16) __U);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_loadu_ps (__mmask16 __U, void const *__P)
{
  return (__m512) __builtin_ia32_loadups512_mask ((const __v16sf *) __P,
        (__v16sf)
        _mm512_setzero_ps (),
        (__mmask16) __U);
}

extern __inline void
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_storeu_ps (void *__P, __m512 __A)
{
  __builtin_ia32_storeups512_mask ((__v16sf *) __P, (__v16sf) __A,
       (__mmask16) -1);
}

extern __inline void
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_storeu_ps (void *__P, __mmask16 __U, __m512 __A)
{
  __builtin_ia32_storeups512_mask ((__v16sf *) __P, (__v16sf) __A,
       (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_loadu_epi64 (__m512i __W, __mmask8 __U, void const *__P)
{
  return (__m512i) __builtin_ia32_loaddqudi512_mask ((const __v8di *) __P,
           (__v8di) __W,
           (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_loadu_epi64 (__mmask8 __U, void const *__P)
{
  return (__m512i) __builtin_ia32_loaddqudi512_mask ((const __v8di *) __P,
           (__v8di)
           _mm512_setzero_si512 (),
           (__mmask8) __U);
}

extern __inline void
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_storeu_epi64 (void *__P, __mmask8 __U, __m512i __A)
{
  __builtin_ia32_storedqudi512_mask ((__v8di *) __P, (__v8di) __A,
         (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_loadu_si512 (void const *__P)
{
  return (__m512i) __builtin_ia32_loaddqusi512_mask ((const __v16si *) __P,
           (__v16si)
           _mm512_setzero_si512 (),
           (__mmask16) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_loadu_epi32 (__m512i __W, __mmask16 __U, void const *__P)
{
  return (__m512i) __builtin_ia32_loaddqusi512_mask ((const __v16si *) __P,
           (__v16si) __W,
           (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_loadu_epi32 (__mmask16 __U, void const *__P)
{
  return (__m512i) __builtin_ia32_loaddqusi512_mask ((const __v16si *) __P,
           (__v16si)
           _mm512_setzero_si512 (),
           (__mmask16) __U);
}

extern __inline void
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_storeu_si512 (void *__P, __m512i __A)
{
  __builtin_ia32_storedqusi512_mask ((__v16si *) __P, (__v16si) __A,
         (__mmask16) -1);
}

extern __inline void
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_storeu_epi32 (void *__P, __mmask16 __U, __m512i __A)
{
  __builtin_ia32_storedqusi512_mask ((__v16si *) __P, (__v16si) __A,
         (__mmask16) __U);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_permutevar_pd (__m512d __A, __m512i __C)
{
  return (__m512d) __builtin_ia32_vpermilvarpd512_mask ((__v8df) __A,
       (__v8di) __C,
       (__v8df)
       _mm512_undefined_pd (),
       (__mmask8) -1);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_permutevar_pd (__m512d __W, __mmask8 __U, __m512d __A, __m512i __C)
{
  return (__m512d) __builtin_ia32_vpermilvarpd512_mask ((__v8df) __A,
       (__v8di) __C,
       (__v8df) __W,
       (__mmask8) __U);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_permutevar_pd (__mmask8 __U, __m512d __A, __m512i __C)
{
  return (__m512d) __builtin_ia32_vpermilvarpd512_mask ((__v8df) __A,
       (__v8di) __C,
       (__v8df)
       _mm512_setzero_pd (),
       (__mmask8) __U);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_permutevar_ps (__m512 __A, __m512i __C)
{
  return (__m512) __builtin_ia32_vpermilvarps512_mask ((__v16sf) __A,
             (__v16si) __C,
             (__v16sf)
             _mm512_undefined_ps (),
             (__mmask16) -1);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_permutevar_ps (__m512 __W, __mmask16 __U, __m512 __A, __m512i __C)
{
  return (__m512) __builtin_ia32_vpermilvarps512_mask ((__v16sf) __A,
             (__v16si) __C,
             (__v16sf) __W,
             (__mmask16) __U);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_permutevar_ps (__mmask16 __U, __m512 __A, __m512i __C)
{
  return (__m512) __builtin_ia32_vpermilvarps512_mask ((__v16sf) __A,
             (__v16si) __C,
             (__v16sf)
             _mm512_setzero_ps (),
             (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_permutex2var_epi64 (__m512i __A, __m512i __I, __m512i __B)
{
  return (__m512i) __builtin_ia32_vpermt2varq512_mask ((__v8di) __I
                       ,
             (__v8di) __A,
             (__v8di) __B,
             (__mmask8) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_permutex2var_epi64 (__m512i __A, __mmask8 __U, __m512i __I,
    __m512i __B)
{
  return (__m512i) __builtin_ia32_vpermt2varq512_mask ((__v8di) __I
                       ,
             (__v8di) __A,
             (__v8di) __B,
             (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask2_permutex2var_epi64 (__m512i __A, __m512i __I,
     __mmask8 __U, __m512i __B)
{
  return (__m512i) __builtin_ia32_vpermi2varq512_mask ((__v8di) __A,
             (__v8di) __I
                       ,
             (__v8di) __B,
             (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_permutex2var_epi64 (__mmask8 __U, __m512i __A,
     __m512i __I, __m512i __B)
{
  return (__m512i) __builtin_ia32_vpermt2varq512_maskz ((__v8di) __I
                 ,
       (__v8di) __A,
       (__v8di) __B,
       (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_permutex2var_epi32 (__m512i __A, __m512i __I, __m512i __B)
{
  return (__m512i) __builtin_ia32_vpermt2vard512_mask ((__v16si) __I
                       ,
             (__v16si) __A,
             (__v16si) __B,
             (__mmask16) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_permutex2var_epi32 (__m512i __A, __mmask16 __U,
    __m512i __I, __m512i __B)
{
  return (__m512i) __builtin_ia32_vpermt2vard512_mask ((__v16si) __I
                       ,
             (__v16si) __A,
             (__v16si) __B,
             (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask2_permutex2var_epi32 (__m512i __A, __m512i __I,
     __mmask16 __U, __m512i __B)
{
  return (__m512i) __builtin_ia32_vpermi2vard512_mask ((__v16si) __A,
             (__v16si) __I
                       ,
             (__v16si) __B,
             (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_permutex2var_epi32 (__mmask16 __U, __m512i __A,
     __m512i __I, __m512i __B)
{
  return (__m512i) __builtin_ia32_vpermt2vard512_maskz ((__v16si) __I
                 ,
       (__v16si) __A,
       (__v16si) __B,
       (__mmask16) __U);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_permutex2var_pd (__m512d __A, __m512i __I, __m512d __B)
{
  return (__m512d) __builtin_ia32_vpermt2varpd512_mask ((__v8di) __I
                 ,
       (__v8df) __A,
       (__v8df) __B,
       (__mmask8) -1);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_permutex2var_pd (__m512d __A, __mmask8 __U, __m512i __I,
        __m512d __B)
{
  return (__m512d) __builtin_ia32_vpermt2varpd512_mask ((__v8di) __I
                 ,
       (__v8df) __A,
       (__v8df) __B,
       (__mmask8) __U);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask2_permutex2var_pd (__m512d __A, __m512i __I, __mmask8 __U,
         __m512d __B)
{
  return (__m512d) __builtin_ia32_vpermi2varpd512_mask ((__v8df) __A,
       (__v8di) __I
                 ,
       (__v8df) __B,
       (__mmask8) __U);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_permutex2var_pd (__mmask8 __U, __m512d __A, __m512i __I,
         __m512d __B)
{
  return (__m512d) __builtin_ia32_vpermt2varpd512_maskz ((__v8di) __I
                  ,
        (__v8df) __A,
        (__v8df) __B,
        (__mmask8) __U);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_permutex2var_ps (__m512 __A, __m512i __I, __m512 __B)
{
  return (__m512) __builtin_ia32_vpermt2varps512_mask ((__v16si) __I
                       ,
             (__v16sf) __A,
             (__v16sf) __B,
             (__mmask16) -1);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_permutex2var_ps (__m512 __A, __mmask16 __U, __m512i __I, __m512 __B)
{
  return (__m512) __builtin_ia32_vpermt2varps512_mask ((__v16si) __I
                       ,
             (__v16sf) __A,
             (__v16sf) __B,
             (__mmask16) __U);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask2_permutex2var_ps (__m512 __A, __m512i __I, __mmask16 __U,
         __m512 __B)
{
  return (__m512) __builtin_ia32_vpermi2varps512_mask ((__v16sf) __A,
             (__v16si) __I
                       ,
             (__v16sf) __B,
             (__mmask16) __U);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_permutex2var_ps (__mmask16 __U, __m512 __A, __m512i __I,
         __m512 __B)
{
  return (__m512) __builtin_ia32_vpermt2varps512_maskz ((__v16si) __I
                 ,
       (__v16sf) __A,
       (__v16sf) __B,
       (__mmask16) __U);
}
# 6303 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx512fintrin.h" 3 4
extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_permutexvar_epi64 (__mmask8 __M, __m512i __X, __m512i __Y)
{
  return (__m512i) __builtin_ia32_permvardi512_mask ((__v8di) __Y,
           (__v8di) __X,
           (__v8di)
           _mm512_setzero_si512 (),
           __M);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_permutexvar_epi64 (__m512i __X, __m512i __Y)
{
  return (__m512i) __builtin_ia32_permvardi512_mask ((__v8di) __Y,
           (__v8di) __X,
           (__v8di)
           _mm512_undefined_si512 (),
           (__mmask8) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_permutexvar_epi64 (__m512i __W, __mmask8 __M, __m512i __X,
          __m512i __Y)
{
  return (__m512i) __builtin_ia32_permvardi512_mask ((__v8di) __Y,
           (__v8di) __X,
           (__v8di) __W,
           __M);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_permutexvar_epi32 (__mmask16 __M, __m512i __X, __m512i __Y)
{
  return (__m512i) __builtin_ia32_permvarsi512_mask ((__v16si) __Y,
           (__v16si) __X,
           (__v16si)
           _mm512_setzero_si512 (),
           __M);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_permutexvar_epi32 (__m512i __X, __m512i __Y)
{
  return (__m512i) __builtin_ia32_permvarsi512_mask ((__v16si) __Y,
           (__v16si) __X,
           (__v16si)
           _mm512_undefined_si512 (),
           (__mmask16) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_permutexvar_epi32 (__m512i __W, __mmask16 __M, __m512i __X,
          __m512i __Y)
{
  return (__m512i) __builtin_ia32_permvarsi512_mask ((__v16si) __Y,
           (__v16si) __X,
           (__v16si) __W,
           __M);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_permutexvar_pd (__m512i __X, __m512d __Y)
{
  return (__m512d) __builtin_ia32_permvardf512_mask ((__v8df) __Y,
           (__v8di) __X,
           (__v8df)
           _mm512_undefined_pd (),
           (__mmask8) -1);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_permutexvar_pd (__m512d __W, __mmask8 __U, __m512i __X, __m512d __Y)
{
  return (__m512d) __builtin_ia32_permvardf512_mask ((__v8df) __Y,
           (__v8di) __X,
           (__v8df) __W,
           (__mmask8) __U);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_permutexvar_pd (__mmask8 __U, __m512i __X, __m512d __Y)
{
  return (__m512d) __builtin_ia32_permvardf512_mask ((__v8df) __Y,
           (__v8di) __X,
           (__v8df)
           _mm512_setzero_pd (),
           (__mmask8) __U);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_permutexvar_ps (__m512i __X, __m512 __Y)
{
  return (__m512) __builtin_ia32_permvarsf512_mask ((__v16sf) __Y,
          (__v16si) __X,
          (__v16sf)
          _mm512_undefined_ps (),
          (__mmask16) -1);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_permutexvar_ps (__m512 __W, __mmask16 __U, __m512i __X, __m512 __Y)
{
  return (__m512) __builtin_ia32_permvarsf512_mask ((__v16sf) __Y,
          (__v16si) __X,
          (__v16sf) __W,
          (__mmask16) __U);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_permutexvar_ps (__mmask16 __U, __m512i __X, __m512 __Y)
{
  return (__m512) __builtin_ia32_permvarsf512_mask ((__v16sf) __Y,
          (__v16si) __X,
          (__v16sf)
          _mm512_setzero_ps (),
          (__mmask16) __U);
}
# 6738 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx512fintrin.h" 3 4
extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_movehdup_ps (__m512 __A)
{
  return (__m512) __builtin_ia32_movshdup512_mask ((__v16sf) __A,
         (__v16sf)
         _mm512_undefined_ps (),
         (__mmask16) -1);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_movehdup_ps (__m512 __W, __mmask16 __U, __m512 __A)
{
  return (__m512) __builtin_ia32_movshdup512_mask ((__v16sf) __A,
         (__v16sf) __W,
         (__mmask16) __U);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_movehdup_ps (__mmask16 __U, __m512 __A)
{
  return (__m512) __builtin_ia32_movshdup512_mask ((__v16sf) __A,
         (__v16sf)
         _mm512_setzero_ps (),
         (__mmask16) __U);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_moveldup_ps (__m512 __A)
{
  return (__m512) __builtin_ia32_movsldup512_mask ((__v16sf) __A,
         (__v16sf)
         _mm512_undefined_ps (),
         (__mmask16) -1);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_moveldup_ps (__m512 __W, __mmask16 __U, __m512 __A)
{
  return (__m512) __builtin_ia32_movsldup512_mask ((__v16sf) __A,
         (__v16sf) __W,
         (__mmask16) __U);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_moveldup_ps (__mmask16 __U, __m512 __A)
{
  return (__m512) __builtin_ia32_movsldup512_mask ((__v16sf) __A,
         (__v16sf)
         _mm512_setzero_ps (),
         (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_or_si512 (__m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pord512_mask ((__v16si) __A,
      (__v16si) __B,
      (__v16si)
      _mm512_undefined_si512 (),
      (__mmask16) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_or_epi32 (__m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pord512_mask ((__v16si) __A,
      (__v16si) __B,
      (__v16si)
      _mm512_undefined_si512 (),
      (__mmask16) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_or_epi32 (__m512i __W, __mmask16 __U, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pord512_mask ((__v16si) __A,
      (__v16si) __B,
      (__v16si) __W,
      (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_or_epi32 (__mmask16 __U, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pord512_mask ((__v16si) __A,
      (__v16si) __B,
      (__v16si)
      _mm512_setzero_si512 (),
      (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_or_epi64 (__m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_porq512_mask ((__v8di) __A,
      (__v8di) __B,
      (__v8di)
      _mm512_undefined_si512 (),
      (__mmask8) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_or_epi64 (__m512i __W, __mmask8 __U, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_porq512_mask ((__v8di) __A,
      (__v8di) __B,
      (__v8di) __W,
      (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_or_epi64 (__mmask8 __U, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_porq512_mask ((__v8di) __A,
      (__v8di) __B,
      (__v8di)
      _mm512_setzero_si512 (),
      (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_xor_si512 (__m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pxord512_mask ((__v16si) __A,
       (__v16si) __B,
       (__v16si)
       _mm512_undefined_si512 (),
       (__mmask16) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_xor_epi32 (__m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pxord512_mask ((__v16si) __A,
       (__v16si) __B,
       (__v16si)
       _mm512_undefined_si512 (),
       (__mmask16) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_xor_epi32 (__m512i __W, __mmask16 __U, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pxord512_mask ((__v16si) __A,
       (__v16si) __B,
       (__v16si) __W,
       (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_xor_epi32 (__mmask16 __U, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pxord512_mask ((__v16si) __A,
       (__v16si) __B,
       (__v16si)
       _mm512_setzero_si512 (),
       (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_xor_epi64 (__m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pxorq512_mask ((__v8di) __A,
       (__v8di) __B,
       (__v8di)
       _mm512_undefined_si512 (),
       (__mmask8) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_xor_epi64 (__m512i __W, __mmask16 __U, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pxorq512_mask ((__v8di) __A,
       (__v8di) __B,
       (__v8di) __W,
       (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_xor_epi64 (__mmask16 __U, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pxorq512_mask ((__v8di) __A,
       (__v8di) __B,
       (__v8di)
       _mm512_setzero_si512 (),
       (__mmask8) __U);
}
# 7127 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx512fintrin.h" 3 4
extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_and_si512 (__m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pandd512_mask ((__v16si) __A,
       (__v16si) __B,
       (__v16si)
       _mm512_undefined_si512 (),
       (__mmask16) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_and_epi32 (__m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pandd512_mask ((__v16si) __A,
       (__v16si) __B,
       (__v16si)
       _mm512_undefined_si512 (),
       (__mmask16) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_and_epi32 (__m512i __W, __mmask16 __U, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pandd512_mask ((__v16si) __A,
       (__v16si) __B,
       (__v16si) __W,
       (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_and_epi32 (__mmask16 __U, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pandd512_mask ((__v16si) __A,
       (__v16si) __B,
       (__v16si)
       _mm512_setzero_si512 (),
       (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_and_epi64 (__m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pandq512_mask ((__v8di) __A,
       (__v8di) __B,
       (__v8di)
       _mm512_undefined_si512 (),
       (__mmask8) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_and_epi64 (__m512i __W, __mmask8 __U, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pandq512_mask ((__v8di) __A,
       (__v8di) __B,
       (__v8di) __W, __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_and_epi64 (__mmask8 __U, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pandq512_mask ((__v8di) __A,
       (__v8di) __B,
       (__v8di)
       _mm512_setzero_pd (),
       __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_andnot_si512 (__m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pandnd512_mask ((__v16si) __A,
        (__v16si) __B,
        (__v16si)
        _mm512_undefined_si512 (),
        (__mmask16) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_andnot_epi32 (__m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pandnd512_mask ((__v16si) __A,
        (__v16si) __B,
        (__v16si)
        _mm512_undefined_si512 (),
        (__mmask16) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_andnot_epi32 (__m512i __W, __mmask16 __U, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pandnd512_mask ((__v16si) __A,
        (__v16si) __B,
        (__v16si) __W,
        (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_andnot_epi32 (__mmask16 __U, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pandnd512_mask ((__v16si) __A,
        (__v16si) __B,
        (__v16si)
        _mm512_setzero_si512 (),
        (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_andnot_epi64 (__m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pandnq512_mask ((__v8di) __A,
        (__v8di) __B,
        (__v8di)
        _mm512_undefined_si512 (),
        (__mmask8) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_andnot_epi64 (__m512i __W, __mmask8 __U, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pandnq512_mask ((__v8di) __A,
        (__v8di) __B,
        (__v8di) __W, __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_andnot_epi64 (__mmask8 __U, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pandnq512_mask ((__v8di) __A,
        (__v8di) __B,
        (__v8di)
        _mm512_setzero_pd (),
        __U);
}

extern __inline __mmask16
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_test_epi32_mask (__m512i __A, __m512i __B)
{
  return (__mmask16) __builtin_ia32_ptestmd512 ((__v16si) __A,
      (__v16si) __B,
      (__mmask16) -1);
}

extern __inline __mmask16
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_test_epi32_mask (__mmask16 __U, __m512i __A, __m512i __B)
{
  return (__mmask16) __builtin_ia32_ptestmd512 ((__v16si) __A,
      (__v16si) __B, __U);
}

extern __inline __mmask8
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_test_epi64_mask (__m512i __A, __m512i __B)
{
  return (__mmask8) __builtin_ia32_ptestmq512 ((__v8di) __A,
            (__v8di) __B,
            (__mmask8) -1);
}

extern __inline __mmask8
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_test_epi64_mask (__mmask8 __U, __m512i __A, __m512i __B)
{
  return (__mmask8) __builtin_ia32_ptestmq512 ((__v8di) __A, (__v8di) __B, __U);
}

extern __inline __mmask16
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_testn_epi32_mask (__m512i __A, __m512i __B)
{
  return (__mmask16) __builtin_ia32_ptestnmd512 ((__v16si) __A,
       (__v16si) __B,
       (__mmask16) -1);
}

extern __inline __mmask16
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_testn_epi32_mask (__mmask16 __U, __m512i __A, __m512i __B)
{
  return (__mmask16) __builtin_ia32_ptestnmd512 ((__v16si) __A,
       (__v16si) __B, __U);
}

extern __inline __mmask8
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_testn_epi64_mask (__m512i __A, __m512i __B)
{
  return (__mmask8) __builtin_ia32_ptestnmq512 ((__v8di) __A,
      (__v8di) __B,
      (__mmask8) -1);
}

extern __inline __mmask8
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_testn_epi64_mask (__mmask8 __U, __m512i __A, __m512i __B)
{
  return (__mmask8) __builtin_ia32_ptestnmq512 ((__v8di) __A,
      (__v8di) __B, __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_unpackhi_epi32 (__m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_punpckhdq512_mask ((__v16si) __A,
           (__v16si) __B,
           (__v16si)
           _mm512_undefined_si512 (),
           (__mmask16) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_unpackhi_epi32 (__m512i __W, __mmask16 __U, __m512i __A,
       __m512i __B)
{
  return (__m512i) __builtin_ia32_punpckhdq512_mask ((__v16si) __A,
           (__v16si) __B,
           (__v16si) __W,
           (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_unpackhi_epi32 (__mmask16 __U, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_punpckhdq512_mask ((__v16si) __A,
           (__v16si) __B,
           (__v16si)
           _mm512_setzero_si512 (),
           (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_unpackhi_epi64 (__m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_punpckhqdq512_mask ((__v8di) __A,
            (__v8di) __B,
            (__v8di)
            _mm512_undefined_si512 (),
            (__mmask8) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_unpackhi_epi64 (__m512i __W, __mmask8 __U, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_punpckhqdq512_mask ((__v8di) __A,
            (__v8di) __B,
            (__v8di) __W,
            (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_unpackhi_epi64 (__mmask8 __U, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_punpckhqdq512_mask ((__v8di) __A,
            (__v8di) __B,
            (__v8di)
            _mm512_setzero_si512 (),
            (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_unpacklo_epi32 (__m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_punpckldq512_mask ((__v16si) __A,
           (__v16si) __B,
           (__v16si)
           _mm512_undefined_si512 (),
           (__mmask16) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_unpacklo_epi32 (__m512i __W, __mmask16 __U, __m512i __A,
       __m512i __B)
{
  return (__m512i) __builtin_ia32_punpckldq512_mask ((__v16si) __A,
           (__v16si) __B,
           (__v16si) __W,
           (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_unpacklo_epi32 (__mmask16 __U, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_punpckldq512_mask ((__v16si) __A,
           (__v16si) __B,
           (__v16si)
           _mm512_setzero_si512 (),
           (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_unpacklo_epi64 (__m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_punpcklqdq512_mask ((__v8di) __A,
            (__v8di) __B,
            (__v8di)
            _mm512_undefined_si512 (),
            (__mmask8) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_unpacklo_epi64 (__m512i __W, __mmask8 __U, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_punpcklqdq512_mask ((__v8di) __A,
            (__v8di) __B,
            (__v8di) __W,
            (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_unpacklo_epi64 (__mmask8 __U, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_punpcklqdq512_mask ((__v8di) __A,
            (__v8di) __B,
            (__v8di)
            _mm512_setzero_si512 (),
            (__mmask8) __U);
}
# 7724 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx512fintrin.h" 3 4
extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_movedup_pd (__m512d __A)
{
  return (__m512d) __builtin_ia32_movddup512_mask ((__v8df) __A,
         (__v8df)
         _mm512_undefined_pd (),
         (__mmask8) -1);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_movedup_pd (__m512d __W, __mmask8 __U, __m512d __A)
{
  return (__m512d) __builtin_ia32_movddup512_mask ((__v8df) __A,
         (__v8df) __W,
         (__mmask8) __U);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_movedup_pd (__mmask8 __U, __m512d __A)
{
  return (__m512d) __builtin_ia32_movddup512_mask ((__v8df) __A,
         (__v8df)
         _mm512_setzero_pd (),
         (__mmask8) __U);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_unpacklo_pd (__m512d __A, __m512d __B)
{
  return (__m512d) __builtin_ia32_unpcklpd512_mask ((__v8df) __A,
          (__v8df) __B,
          (__v8df)
          _mm512_undefined_pd (),
          (__mmask8) -1);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_unpacklo_pd (__m512d __W, __mmask8 __U, __m512d __A, __m512d __B)
{
  return (__m512d) __builtin_ia32_unpcklpd512_mask ((__v8df) __A,
          (__v8df) __B,
          (__v8df) __W,
          (__mmask8) __U);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_unpacklo_pd (__mmask8 __U, __m512d __A, __m512d __B)
{
  return (__m512d) __builtin_ia32_unpcklpd512_mask ((__v8df) __A,
          (__v8df) __B,
          (__v8df)
          _mm512_setzero_pd (),
          (__mmask8) __U);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_unpackhi_pd (__m512d __A, __m512d __B)
{
  return (__m512d) __builtin_ia32_unpckhpd512_mask ((__v8df) __A,
          (__v8df) __B,
          (__v8df)
          _mm512_undefined_pd (),
          (__mmask8) -1);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_unpackhi_pd (__m512d __W, __mmask8 __U, __m512d __A, __m512d __B)
{
  return (__m512d) __builtin_ia32_unpckhpd512_mask ((__v8df) __A,
          (__v8df) __B,
          (__v8df) __W,
          (__mmask8) __U);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_unpackhi_pd (__mmask8 __U, __m512d __A, __m512d __B)
{
  return (__m512d) __builtin_ia32_unpckhpd512_mask ((__v8df) __A,
          (__v8df) __B,
          (__v8df)
          _mm512_setzero_pd (),
          (__mmask8) __U);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_unpackhi_ps (__m512 __A, __m512 __B)
{
  return (__m512) __builtin_ia32_unpckhps512_mask ((__v16sf) __A,
         (__v16sf) __B,
         (__v16sf)
         _mm512_undefined_ps (),
         (__mmask16) -1);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_unpackhi_ps (__m512 __W, __mmask16 __U, __m512 __A, __m512 __B)
{
  return (__m512) __builtin_ia32_unpckhps512_mask ((__v16sf) __A,
         (__v16sf) __B,
         (__v16sf) __W,
         (__mmask16) __U);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_unpackhi_ps (__mmask16 __U, __m512 __A, __m512 __B)
{
  return (__m512) __builtin_ia32_unpckhps512_mask ((__v16sf) __A,
         (__v16sf) __B,
         (__v16sf)
         _mm512_setzero_ps (),
         (__mmask16) __U);
}
# 8078 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx512fintrin.h" 3 4
extern __inline void
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_stream_si512 (__m512i * __P, __m512i __A)
{
  __builtin_ia32_movntdq512 ((__v8di *) __P, (__v8di) __A);
}

extern __inline void
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_stream_ps (float *__P, __m512 __A)
{
  __builtin_ia32_movntps512 (__P, (__v16sf) __A);
}

extern __inline void
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_stream_pd (double *__P, __m512d __A)
{
  __builtin_ia32_movntpd512 (__P, (__v8df) __A);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_stream_load_si512 (void *__P)
{
  return __builtin_ia32_movntdqa512 ((__v8di *)__P);
}


typedef enum
{
  _MM_MANT_NORM_1_2,
  _MM_MANT_NORM_p5_2,
  _MM_MANT_NORM_p5_1,
  _MM_MANT_NORM_p75_1p5
} _MM_MANTISSA_NORM_ENUM;

typedef enum
{
  _MM_MANT_SIGN_src,
  _MM_MANT_SIGN_zero,
  _MM_MANT_SIGN_nan
} _MM_MANTISSA_SIGN_ENUM;
# 8498 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx512fintrin.h" 3 4
extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_floor_ps (__m512 __A)
{
  return (__m512) __builtin_ia32_rndscaleps_mask ((__v16sf) __A,
        (0x01 | 0x00),
        (__v16sf) __A, -1,
        0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_floor_pd (__m512d __A)
{
  return (__m512d) __builtin_ia32_rndscalepd_mask ((__v8df) __A,
         (0x01 | 0x00),
         (__v8df) __A, -1,
         0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_ceil_ps (__m512 __A)
{
  return (__m512) __builtin_ia32_rndscaleps_mask ((__v16sf) __A,
        (0x02 | 0x00),
        (__v16sf) __A, -1,
        0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_ceil_pd (__m512d __A)
{
  return (__m512d) __builtin_ia32_rndscalepd_mask ((__v8df) __A,
         (0x02 | 0x00),
         (__v8df) __A, -1,
         0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_floor_ps (__m512 __W, __mmask16 __U, __m512 __A)
{
  return (__m512) __builtin_ia32_rndscaleps_mask ((__v16sf) __A,
        (0x01 | 0x00),
        (__v16sf) __W, __U,
        0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_floor_pd (__m512d __W, __mmask8 __U, __m512d __A)
{
  return (__m512d) __builtin_ia32_rndscalepd_mask ((__v8df) __A,
         (0x01 | 0x00),
         (__v8df) __W, __U,
         0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_ceil_ps (__m512 __W, __mmask16 __U, __m512 __A)
{
  return (__m512) __builtin_ia32_rndscaleps_mask ((__v16sf) __A,
        (0x02 | 0x00),
        (__v16sf) __W, __U,
        0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_ceil_pd (__m512d __W, __mmask8 __U, __m512d __A)
{
  return (__m512d) __builtin_ia32_rndscalepd_mask ((__v8df) __A,
         (0x02 | 0x00),
         (__v8df) __W, __U,
         0x04);
}
# 8677 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx512fintrin.h" 3 4
extern __inline __mmask16
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cmpeq_epi32_mask (__m512i __A, __m512i __B)
{
  return (__mmask16) __builtin_ia32_pcmpeqd512_mask ((__v16si) __A,
           (__v16si) __B,
           (__mmask16) -1);
}

extern __inline __mmask16
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cmpeq_epi32_mask (__mmask16 __U, __m512i __A, __m512i __B)
{
  return (__mmask16) __builtin_ia32_pcmpeqd512_mask ((__v16si) __A,
           (__v16si) __B, __U);
}

extern __inline __mmask8
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cmpeq_epi64_mask (__mmask8 __U, __m512i __A, __m512i __B)
{
  return (__mmask8) __builtin_ia32_pcmpeqq512_mask ((__v8di) __A,
          (__v8di) __B, __U);
}

extern __inline __mmask8
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cmpeq_epi64_mask (__m512i __A, __m512i __B)
{
  return (__mmask8) __builtin_ia32_pcmpeqq512_mask ((__v8di) __A,
          (__v8di) __B,
          (__mmask8) -1);
}

extern __inline __mmask16
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cmpgt_epi32_mask (__m512i __A, __m512i __B)
{
  return (__mmask16) __builtin_ia32_pcmpgtd512_mask ((__v16si) __A,
           (__v16si) __B,
           (__mmask16) -1);
}

extern __inline __mmask16
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cmpgt_epi32_mask (__mmask16 __U, __m512i __A, __m512i __B)
{
  return (__mmask16) __builtin_ia32_pcmpgtd512_mask ((__v16si) __A,
           (__v16si) __B, __U);
}

extern __inline __mmask8
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cmpgt_epi64_mask (__mmask8 __U, __m512i __A, __m512i __B)
{
  return (__mmask8) __builtin_ia32_pcmpgtq512_mask ((__v8di) __A,
          (__v8di) __B, __U);
}

extern __inline __mmask8
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cmpgt_epi64_mask (__m512i __A, __m512i __B)
{
  return (__mmask8) __builtin_ia32_pcmpgtq512_mask ((__v8di) __A,
          (__v8di) __B,
          (__mmask8) -1);
}

extern __inline __mmask16
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cmpge_epi32_mask (__m512i __X, __m512i __Y)
{
  return (__mmask16) __builtin_ia32_cmpd512_mask ((__v16si) __X,
          (__v16si) __Y, 5,
          (__mmask16) -1);
}

extern __inline __mmask16
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cmpge_epu32_mask (__m512i __X, __m512i __Y)
{
  return (__mmask16) __builtin_ia32_ucmpd512_mask ((__v16si) __X,
          (__v16si) __Y, 5,
          (__mmask16) -1);
}

extern __inline __mmask8
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cmpge_epi64_mask (__m512i __X, __m512i __Y)
{
  return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
          (__v8di) __Y, 5,
          (__mmask8) -1);
}

extern __inline __mmask8
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cmpge_epu64_mask (__m512i __X, __m512i __Y)
{
  return (__mmask8) __builtin_ia32_ucmpq512_mask ((__v8di) __X,
          (__v8di) __Y, 5,
          (__mmask8) -1);
}

extern __inline __mmask16
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cmple_epi32_mask (__m512i __X, __m512i __Y)
{
  return (__mmask16) __builtin_ia32_cmpd512_mask ((__v16si) __X,
          (__v16si) __Y, 2,
          (__mmask16) -1);
}

extern __inline __mmask16
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cmple_epu32_mask (__m512i __X, __m512i __Y)
{
  return (__mmask16) __builtin_ia32_ucmpd512_mask ((__v16si) __X,
          (__v16si) __Y, 2,
          (__mmask16) -1);
}

extern __inline __mmask8
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cmple_epi64_mask (__m512i __X, __m512i __Y)
{
  return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
          (__v8di) __Y, 2,
          (__mmask8) -1);
}

extern __inline __mmask8
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cmple_epu64_mask (__m512i __X, __m512i __Y)
{
  return (__mmask8) __builtin_ia32_ucmpq512_mask ((__v8di) __X,
          (__v8di) __Y, 2,
          (__mmask8) -1);
}

extern __inline __mmask16
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cmplt_epi32_mask (__m512i __X, __m512i __Y)
{
  return (__mmask16) __builtin_ia32_cmpd512_mask ((__v16si) __X,
          (__v16si) __Y, 1,
          (__mmask16) -1);
}

extern __inline __mmask16
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cmplt_epu32_mask (__m512i __X, __m512i __Y)
{
  return (__mmask16) __builtin_ia32_ucmpd512_mask ((__v16si) __X,
          (__v16si) __Y, 1,
          (__mmask16) -1);
}

extern __inline __mmask8
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cmplt_epi64_mask (__m512i __X, __m512i __Y)
{
  return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
          (__v8di) __Y, 1,
          (__mmask8) -1);
}

extern __inline __mmask8
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cmplt_epu64_mask (__m512i __X, __m512i __Y)
{
  return (__mmask8) __builtin_ia32_ucmpq512_mask ((__v8di) __X,
          (__v8di) __Y, 1,
          (__mmask8) -1);
}

extern __inline __mmask16
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cmpneq_epi32_mask (__m512i __X, __m512i __Y)
{
  return (__mmask16) __builtin_ia32_cmpd512_mask ((__v16si) __X,
          (__v16si) __Y, 4,
          (__mmask16) -1);
}

extern __inline __mmask16
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cmpneq_epu32_mask (__m512i __X, __m512i __Y)
{
  return (__mmask16) __builtin_ia32_ucmpd512_mask ((__v16si) __X,
          (__v16si) __Y, 4,
          (__mmask16) -1);
}

extern __inline __mmask8
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cmpneq_epi64_mask (__m512i __X, __m512i __Y)
{
  return (__mmask8) __builtin_ia32_cmpq512_mask ((__v8di) __X,
          (__v8di) __Y, 4,
          (__mmask8) -1);
}

extern __inline __mmask8
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cmpneq_epu64_mask (__m512i __X, __m512i __Y)
{
  return (__mmask8) __builtin_ia32_ucmpq512_mask ((__v8di) __X,
          (__v8di) __Y, 4,
          (__mmask8) -1);
}
# 9649 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx512fintrin.h" 3 4
extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_compress_pd (__m512d __W, __mmask8 __U, __m512d __A)
{
  return (__m512d) __builtin_ia32_compressdf512_mask ((__v8df) __A,
            (__v8df) __W,
            (__mmask8) __U);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_compress_pd (__mmask8 __U, __m512d __A)
{
  return (__m512d) __builtin_ia32_compressdf512_mask ((__v8df) __A,
            (__v8df)
            _mm512_setzero_pd (),
            (__mmask8) __U);
}

extern __inline void
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_compressstoreu_pd (void *__P, __mmask8 __U, __m512d __A)
{
  __builtin_ia32_compressstoredf512_mask ((__v8df *) __P, (__v8df) __A,
       (__mmask8) __U);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_compress_ps (__m512 __W, __mmask16 __U, __m512 __A)
{
  return (__m512) __builtin_ia32_compresssf512_mask ((__v16sf) __A,
           (__v16sf) __W,
           (__mmask16) __U);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_compress_ps (__mmask16 __U, __m512 __A)
{
  return (__m512) __builtin_ia32_compresssf512_mask ((__v16sf) __A,
           (__v16sf)
           _mm512_setzero_ps (),
           (__mmask16) __U);
}

extern __inline void
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_compressstoreu_ps (void *__P, __mmask16 __U, __m512 __A)
{
  __builtin_ia32_compressstoresf512_mask ((__v16sf *) __P, (__v16sf) __A,
       (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_compress_epi64 (__m512i __W, __mmask8 __U, __m512i __A)
{
  return (__m512i) __builtin_ia32_compressdi512_mask ((__v8di) __A,
            (__v8di) __W,
            (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_compress_epi64 (__mmask8 __U, __m512i __A)
{
  return (__m512i) __builtin_ia32_compressdi512_mask ((__v8di) __A,
            (__v8di)
            _mm512_setzero_si512 (),
            (__mmask8) __U);
}

extern __inline void
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_compressstoreu_epi64 (void *__P, __mmask8 __U, __m512i __A)
{
  __builtin_ia32_compressstoredi512_mask ((__v8di *) __P, (__v8di) __A,
       (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_compress_epi32 (__m512i __W, __mmask16 __U, __m512i __A)
{
  return (__m512i) __builtin_ia32_compresssi512_mask ((__v16si) __A,
            (__v16si) __W,
            (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_compress_epi32 (__mmask16 __U, __m512i __A)
{
  return (__m512i) __builtin_ia32_compresssi512_mask ((__v16si) __A,
            (__v16si)
            _mm512_setzero_si512 (),
            (__mmask16) __U);
}

extern __inline void
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_compressstoreu_epi32 (void *__P, __mmask16 __U, __m512i __A)
{
  __builtin_ia32_compressstoresi512_mask ((__v16si *) __P, (__v16si) __A,
       (__mmask16) __U);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_expand_pd (__m512d __W, __mmask8 __U, __m512d __A)
{
  return (__m512d) __builtin_ia32_expanddf512_mask ((__v8df) __A,
          (__v8df) __W,
          (__mmask8) __U);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_expand_pd (__mmask8 __U, __m512d __A)
{
  return (__m512d) __builtin_ia32_expanddf512_maskz ((__v8df) __A,
           (__v8df)
           _mm512_setzero_pd (),
           (__mmask8) __U);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_expandloadu_pd (__m512d __W, __mmask8 __U, void const *__P)
{
  return (__m512d) __builtin_ia32_expandloaddf512_mask ((const __v8df *) __P,
       (__v8df) __W,
       (__mmask8) __U);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_expandloadu_pd (__mmask8 __U, void const *__P)
{
  return (__m512d) __builtin_ia32_expandloaddf512_maskz ((const __v8df *) __P,
        (__v8df)
        _mm512_setzero_pd (),
        (__mmask8) __U);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_expand_ps (__m512 __W, __mmask16 __U, __m512 __A)
{
  return (__m512) __builtin_ia32_expandsf512_mask ((__v16sf) __A,
         (__v16sf) __W,
         (__mmask16) __U);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_expand_ps (__mmask16 __U, __m512 __A)
{
  return (__m512) __builtin_ia32_expandsf512_maskz ((__v16sf) __A,
          (__v16sf)
          _mm512_setzero_ps (),
          (__mmask16) __U);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_expandloadu_ps (__m512 __W, __mmask16 __U, void const *__P)
{
  return (__m512) __builtin_ia32_expandloadsf512_mask ((const __v16sf *) __P,
             (__v16sf) __W,
             (__mmask16) __U);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_expandloadu_ps (__mmask16 __U, void const *__P)
{
  return (__m512) __builtin_ia32_expandloadsf512_maskz ((const __v16sf *) __P,
       (__v16sf)
       _mm512_setzero_ps (),
       (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_expand_epi64 (__m512i __W, __mmask8 __U, __m512i __A)
{
  return (__m512i) __builtin_ia32_expanddi512_mask ((__v8di) __A,
          (__v8di) __W,
          (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_expand_epi64 (__mmask8 __U, __m512i __A)
{
  return (__m512i) __builtin_ia32_expanddi512_maskz ((__v8di) __A,
           (__v8di)
           _mm512_setzero_si512 (),
           (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_expandloadu_epi64 (__m512i __W, __mmask8 __U, void const *__P)
{
  return (__m512i) __builtin_ia32_expandloaddi512_mask ((const __v8di *) __P,
       (__v8di) __W,
       (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_expandloadu_epi64 (__mmask8 __U, void const *__P)
{
  return (__m512i)
  __builtin_ia32_expandloaddi512_maskz ((const __v8di *) __P,
            (__v8di)
            _mm512_setzero_si512 (),
            (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_expand_epi32 (__m512i __W, __mmask16 __U, __m512i __A)
{
  return (__m512i) __builtin_ia32_expandsi512_mask ((__v16si) __A,
          (__v16si) __W,
          (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_expand_epi32 (__mmask16 __U, __m512i __A)
{
  return (__m512i) __builtin_ia32_expandsi512_maskz ((__v16si) __A,
           (__v16si)
           _mm512_setzero_si512 (),
           (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_expandloadu_epi32 (__m512i __W, __mmask16 __U, void const *__P)
{
  return (__m512i) __builtin_ia32_expandloadsi512_mask ((const __v16si *) __P,
       (__v16si) __W,
       (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_expandloadu_epi32 (__mmask16 __U, void const *__P)
{
  return (__m512i) __builtin_ia32_expandloadsi512_maskz ((const __v16si *) __P,
        (__v16si)
        _mm512_setzero_si512
        (), (__mmask16) __U);
}


extern __inline __mmask16
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_kand (__mmask16 __A, __mmask16 __B)
{
  return (__mmask16) __builtin_ia32_kandhi ((__mmask16) __A, (__mmask16) __B);
}

extern __inline __mmask16
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_kandn (__mmask16 __A, __mmask16 __B)
{
  return (__mmask16) __builtin_ia32_kandnhi ((__mmask16) __A, (__mmask16) __B);
}

extern __inline __mmask16
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_kor (__mmask16 __A, __mmask16 __B)
{
  return (__mmask16) __builtin_ia32_korhi ((__mmask16) __A, (__mmask16) __B);
}

extern __inline int
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_kortestz (__mmask16 __A, __mmask16 __B)
{
  return (__mmask16) __builtin_ia32_kortestzhi ((__mmask16) __A,
      (__mmask16) __B);
}

extern __inline int
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_kortestc (__mmask16 __A, __mmask16 __B)
{
  return (__mmask16) __builtin_ia32_kortestchi ((__mmask16) __A,
      (__mmask16) __B);
}

extern __inline __mmask16
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_kxnor (__mmask16 __A, __mmask16 __B)
{
  return (__mmask16) __builtin_ia32_kxnorhi ((__mmask16) __A, (__mmask16) __B);
}

extern __inline __mmask16
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_kxor (__mmask16 __A, __mmask16 __B)
{
  return (__mmask16) __builtin_ia32_kxorhi ((__mmask16) __A, (__mmask16) __B);
}

extern __inline __mmask16
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_knot (__mmask16 __A)
{
  return (__mmask16) __builtin_ia32_knothi ((__mmask16) __A);
}

extern __inline __mmask16
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_kunpackb (__mmask16 __A, __mmask16 __B)
{
  return (__mmask16) __builtin_ia32_kunpckhi ((__mmask16) __A, (__mmask16) __B);
}
# 10046 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx512fintrin.h" 3 4
extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_max_epi64 (__m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pmaxsq512_mask ((__v8di) __A,
        (__v8di) __B,
        (__v8di)
        _mm512_undefined_si512 (),
        (__mmask8) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_max_epi64 (__mmask8 __M, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pmaxsq512_mask ((__v8di) __A,
        (__v8di) __B,
        (__v8di)
        _mm512_setzero_si512 (),
        __M);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_max_epi64 (__m512i __W, __mmask8 __M, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pmaxsq512_mask ((__v8di) __A,
        (__v8di) __B,
        (__v8di) __W, __M);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_min_epi64 (__m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pminsq512_mask ((__v8di) __A,
        (__v8di) __B,
        (__v8di)
        _mm512_undefined_si512 (),
        (__mmask8) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_min_epi64 (__m512i __W, __mmask8 __M, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pminsq512_mask ((__v8di) __A,
        (__v8di) __B,
        (__v8di) __W, __M);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_min_epi64 (__mmask8 __M, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pminsq512_mask ((__v8di) __A,
        (__v8di) __B,
        (__v8di)
        _mm512_setzero_si512 (),
        __M);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_max_epu64 (__m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pmaxuq512_mask ((__v8di) __A,
        (__v8di) __B,
        (__v8di)
        _mm512_undefined_si512 (),
        (__mmask8) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_max_epu64 (__mmask8 __M, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pmaxuq512_mask ((__v8di) __A,
        (__v8di) __B,
        (__v8di)
        _mm512_setzero_si512 (),
        __M);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_max_epu64 (__m512i __W, __mmask8 __M, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pmaxuq512_mask ((__v8di) __A,
        (__v8di) __B,
        (__v8di) __W, __M);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_min_epu64 (__m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pminuq512_mask ((__v8di) __A,
        (__v8di) __B,
        (__v8di)
        _mm512_undefined_si512 (),
        (__mmask8) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_min_epu64 (__m512i __W, __mmask8 __M, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pminuq512_mask ((__v8di) __A,
        (__v8di) __B,
        (__v8di) __W, __M);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_min_epu64 (__mmask8 __M, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pminuq512_mask ((__v8di) __A,
        (__v8di) __B,
        (__v8di)
        _mm512_setzero_si512 (),
        __M);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_max_epi32 (__m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pmaxsd512_mask ((__v16si) __A,
        (__v16si) __B,
        (__v16si)
        _mm512_undefined_si512 (),
        (__mmask16) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_max_epi32 (__mmask16 __M, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pmaxsd512_mask ((__v16si) __A,
        (__v16si) __B,
        (__v16si)
        _mm512_setzero_si512 (),
        __M);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_max_epi32 (__m512i __W, __mmask16 __M, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pmaxsd512_mask ((__v16si) __A,
        (__v16si) __B,
        (__v16si) __W, __M);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_min_epi32 (__m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pminsd512_mask ((__v16si) __A,
        (__v16si) __B,
        (__v16si)
        _mm512_undefined_si512 (),
        (__mmask16) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_min_epi32 (__mmask16 __M, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pminsd512_mask ((__v16si) __A,
        (__v16si) __B,
        (__v16si)
        _mm512_setzero_si512 (),
        __M);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_min_epi32 (__m512i __W, __mmask16 __M, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pminsd512_mask ((__v16si) __A,
        (__v16si) __B,
        (__v16si) __W, __M);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_max_epu32 (__m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pmaxud512_mask ((__v16si) __A,
        (__v16si) __B,
        (__v16si)
        _mm512_undefined_si512 (),
        (__mmask16) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_max_epu32 (__mmask16 __M, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pmaxud512_mask ((__v16si) __A,
        (__v16si) __B,
        (__v16si)
        _mm512_setzero_si512 (),
        __M);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_max_epu32 (__m512i __W, __mmask16 __M, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pmaxud512_mask ((__v16si) __A,
        (__v16si) __B,
        (__v16si) __W, __M);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_min_epu32 (__m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pminud512_mask ((__v16si) __A,
        (__v16si) __B,
        (__v16si)
        _mm512_undefined_si512 (),
        (__mmask16) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_min_epu32 (__mmask16 __M, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pminud512_mask ((__v16si) __A,
        (__v16si) __B,
        (__v16si)
        _mm512_setzero_si512 (),
        __M);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_min_epu32 (__m512i __W, __mmask16 __M, __m512i __A, __m512i __B)
{
  return (__m512i) __builtin_ia32_pminud512_mask ((__v16si) __A,
        (__v16si) __B,
        (__v16si) __W, __M);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_unpacklo_ps (__m512 __A, __m512 __B)
{
  return (__m512) __builtin_ia32_unpcklps512_mask ((__v16sf) __A,
         (__v16sf) __B,
         (__v16sf)
         _mm512_undefined_ps (),
         (__mmask16) -1);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_unpacklo_ps (__m512 __W, __mmask16 __U, __m512 __A, __m512 __B)
{
  return (__m512) __builtin_ia32_unpcklps512_mask ((__v16sf) __A,
         (__v16sf) __B,
         (__v16sf) __W,
         (__mmask16) __U);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_unpacklo_ps (__mmask16 __U, __m512 __A, __m512 __B)
{
  return (__m512) __builtin_ia32_unpcklps512_mask ((__v16sf) __A,
         (__v16sf) __B,
         (__v16sf)
         _mm512_setzero_ps (),
         (__mmask16) __U);
}
# 10377 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx512fintrin.h" 3 4
extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_blend_pd (__mmask8 __U, __m512d __A, __m512d __W)
{
  return (__m512d) __builtin_ia32_blendmpd_512_mask ((__v8df) __A,
           (__v8df) __W,
           (__mmask8) __U);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_blend_ps (__mmask16 __U, __m512 __A, __m512 __W)
{
  return (__m512) __builtin_ia32_blendmps_512_mask ((__v16sf) __A,
          (__v16sf) __W,
          (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_blend_epi64 (__mmask8 __U, __m512i __A, __m512i __W)
{
  return (__m512i) __builtin_ia32_blendmq_512_mask ((__v8di) __A,
          (__v8di) __W,
          (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_blend_epi32 (__mmask16 __U, __m512i __A, __m512i __W)
{
  return (__m512i) __builtin_ia32_blendmd_512_mask ((__v16si) __A,
          (__v16si) __W,
          (__mmask16) __U);
}
# 10540 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx512fintrin.h" 3 4
extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_sqrt_pd (__m512d __A)
{
  return (__m512d) __builtin_ia32_sqrtpd512_mask ((__v8df) __A,
        (__v8df)
        _mm512_undefined_pd (),
        (__mmask8) -1,
        0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_sqrt_pd (__m512d __W, __mmask8 __U, __m512d __A)
{
  return (__m512d) __builtin_ia32_sqrtpd512_mask ((__v8df) __A,
        (__v8df) __W,
        (__mmask8) __U,
        0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_sqrt_pd (__mmask8 __U, __m512d __A)
{
  return (__m512d) __builtin_ia32_sqrtpd512_mask ((__v8df) __A,
        (__v8df)
        _mm512_setzero_pd (),
        (__mmask8) __U,
        0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_sqrt_ps (__m512 __A)
{
  return (__m512) __builtin_ia32_sqrtps512_mask ((__v16sf) __A,
       (__v16sf)
       _mm512_undefined_ps (),
       (__mmask16) -1,
       0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_sqrt_ps (__m512 __W, __mmask16 __U, __m512 __A)
{
  return (__m512) __builtin_ia32_sqrtps512_mask ((__v16sf) __A,
       (__v16sf) __W,
       (__mmask16) __U,
       0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_sqrt_ps (__mmask16 __U, __m512 __A)
{
  return (__m512) __builtin_ia32_sqrtps512_mask ((__v16sf) __A,
       (__v16sf)
       _mm512_setzero_ps (),
       (__mmask16) __U,
       0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_add_pd (__m512d __A, __m512d __B)
{
  return (__m512d) __builtin_ia32_addpd512_mask ((__v8df) __A,
       (__v8df) __B,
       (__v8df)
       _mm512_undefined_pd (),
       (__mmask8) -1,
       0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_add_pd (__m512d __W, __mmask8 __U, __m512d __A, __m512d __B)
{
  return (__m512d) __builtin_ia32_addpd512_mask ((__v8df) __A,
       (__v8df) __B,
       (__v8df) __W,
       (__mmask8) __U,
       0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_add_pd (__mmask8 __U, __m512d __A, __m512d __B)
{
  return (__m512d) __builtin_ia32_addpd512_mask ((__v8df) __A,
       (__v8df) __B,
       (__v8df)
       _mm512_setzero_pd (),
       (__mmask8) __U,
       0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_add_ps (__m512 __A, __m512 __B)
{
  return (__m512) __builtin_ia32_addps512_mask ((__v16sf) __A,
      (__v16sf) __B,
      (__v16sf)
      _mm512_undefined_ps (),
      (__mmask16) -1,
      0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_add_ps (__m512 __W, __mmask16 __U, __m512 __A, __m512 __B)
{
  return (__m512) __builtin_ia32_addps512_mask ((__v16sf) __A,
      (__v16sf) __B,
      (__v16sf) __W,
      (__mmask16) __U,
      0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_add_ps (__mmask16 __U, __m512 __A, __m512 __B)
{
  return (__m512) __builtin_ia32_addps512_mask ((__v16sf) __A,
      (__v16sf) __B,
      (__v16sf)
      _mm512_setzero_ps (),
      (__mmask16) __U,
      0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_sub_pd (__m512d __A, __m512d __B)
{
  return (__m512d) __builtin_ia32_subpd512_mask ((__v8df) __A,
       (__v8df) __B,
       (__v8df)
       _mm512_undefined_pd (),
       (__mmask8) -1,
       0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_sub_pd (__m512d __W, __mmask8 __U, __m512d __A, __m512d __B)
{
  return (__m512d) __builtin_ia32_subpd512_mask ((__v8df) __A,
       (__v8df) __B,
       (__v8df) __W,
       (__mmask8) __U,
       0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_sub_pd (__mmask8 __U, __m512d __A, __m512d __B)
{
  return (__m512d) __builtin_ia32_subpd512_mask ((__v8df) __A,
       (__v8df) __B,
       (__v8df)
       _mm512_setzero_pd (),
       (__mmask8) __U,
       0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_sub_ps (__m512 __A, __m512 __B)
{
  return (__m512) __builtin_ia32_subps512_mask ((__v16sf) __A,
      (__v16sf) __B,
      (__v16sf)
      _mm512_undefined_ps (),
      (__mmask16) -1,
      0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_sub_ps (__m512 __W, __mmask16 __U, __m512 __A, __m512 __B)
{
  return (__m512) __builtin_ia32_subps512_mask ((__v16sf) __A,
      (__v16sf) __B,
      (__v16sf) __W,
      (__mmask16) __U,
      0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_sub_ps (__mmask16 __U, __m512 __A, __m512 __B)
{
  return (__m512) __builtin_ia32_subps512_mask ((__v16sf) __A,
      (__v16sf) __B,
      (__v16sf)
      _mm512_setzero_ps (),
      (__mmask16) __U,
      0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mul_pd (__m512d __A, __m512d __B)
{
  return (__m512d) __builtin_ia32_mulpd512_mask ((__v8df) __A,
       (__v8df) __B,
       (__v8df)
       _mm512_undefined_pd (),
       (__mmask8) -1,
       0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_mul_pd (__m512d __W, __mmask8 __U, __m512d __A, __m512d __B)
{
  return (__m512d) __builtin_ia32_mulpd512_mask ((__v8df) __A,
       (__v8df) __B,
       (__v8df) __W,
       (__mmask8) __U,
       0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_mul_pd (__mmask8 __U, __m512d __A, __m512d __B)
{
  return (__m512d) __builtin_ia32_mulpd512_mask ((__v8df) __A,
       (__v8df) __B,
       (__v8df)
       _mm512_setzero_pd (),
       (__mmask8) __U,
       0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mul_ps (__m512 __A, __m512 __B)
{
  return (__m512) __builtin_ia32_mulps512_mask ((__v16sf) __A,
      (__v16sf) __B,
      (__v16sf)
      _mm512_undefined_ps (),
      (__mmask16) -1,
      0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_mul_ps (__m512 __W, __mmask16 __U, __m512 __A, __m512 __B)
{
  return (__m512) __builtin_ia32_mulps512_mask ((__v16sf) __A,
      (__v16sf) __B,
      (__v16sf) __W,
      (__mmask16) __U,
      0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_mul_ps (__mmask16 __U, __m512 __A, __m512 __B)
{
  return (__m512) __builtin_ia32_mulps512_mask ((__v16sf) __A,
      (__v16sf) __B,
      (__v16sf)
      _mm512_setzero_ps (),
      (__mmask16) __U,
      0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_div_pd (__m512d __M, __m512d __V)
{
  return (__m512d) __builtin_ia32_divpd512_mask ((__v8df) __M,
       (__v8df) __V,
       (__v8df)
       _mm512_undefined_pd (),
       (__mmask8) -1,
       0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_div_pd (__m512d __W, __mmask8 __U, __m512d __M, __m512d __V)
{
  return (__m512d) __builtin_ia32_divpd512_mask ((__v8df) __M,
       (__v8df) __V,
       (__v8df) __W,
       (__mmask8) __U,
       0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_div_pd (__mmask8 __U, __m512d __M, __m512d __V)
{
  return (__m512d) __builtin_ia32_divpd512_mask ((__v8df) __M,
       (__v8df) __V,
       (__v8df)
       _mm512_setzero_pd (),
       (__mmask8) __U,
       0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_div_ps (__m512 __A, __m512 __B)
{
  return (__m512) __builtin_ia32_divps512_mask ((__v16sf) __A,
      (__v16sf) __B,
      (__v16sf)
      _mm512_undefined_ps (),
      (__mmask16) -1,
      0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_div_ps (__m512 __W, __mmask16 __U, __m512 __A, __m512 __B)
{
  return (__m512) __builtin_ia32_divps512_mask ((__v16sf) __A,
      (__v16sf) __B,
      (__v16sf) __W,
      (__mmask16) __U,
      0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_div_ps (__mmask16 __U, __m512 __A, __m512 __B)
{
  return (__m512) __builtin_ia32_divps512_mask ((__v16sf) __A,
      (__v16sf) __B,
      (__v16sf)
      _mm512_setzero_ps (),
      (__mmask16) __U,
      0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_max_pd (__m512d __A, __m512d __B)
{
  return (__m512d) __builtin_ia32_maxpd512_mask ((__v8df) __A,
       (__v8df) __B,
       (__v8df)
       _mm512_undefined_pd (),
       (__mmask8) -1,
       0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_max_pd (__m512d __W, __mmask8 __U, __m512d __A, __m512d __B)
{
  return (__m512d) __builtin_ia32_maxpd512_mask ((__v8df) __A,
       (__v8df) __B,
       (__v8df) __W,
       (__mmask8) __U,
       0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_max_pd (__mmask8 __U, __m512d __A, __m512d __B)
{
  return (__m512d) __builtin_ia32_maxpd512_mask ((__v8df) __A,
       (__v8df) __B,
       (__v8df)
       _mm512_setzero_pd (),
       (__mmask8) __U,
       0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_max_ps (__m512 __A, __m512 __B)
{
  return (__m512) __builtin_ia32_maxps512_mask ((__v16sf) __A,
      (__v16sf) __B,
      (__v16sf)
      _mm512_undefined_ps (),
      (__mmask16) -1,
      0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_max_ps (__m512 __W, __mmask16 __U, __m512 __A, __m512 __B)
{
  return (__m512) __builtin_ia32_maxps512_mask ((__v16sf) __A,
      (__v16sf) __B,
      (__v16sf) __W,
      (__mmask16) __U,
      0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_max_ps (__mmask16 __U, __m512 __A, __m512 __B)
{
  return (__m512) __builtin_ia32_maxps512_mask ((__v16sf) __A,
      (__v16sf) __B,
      (__v16sf)
      _mm512_setzero_ps (),
      (__mmask16) __U,
      0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_min_pd (__m512d __A, __m512d __B)
{
  return (__m512d) __builtin_ia32_minpd512_mask ((__v8df) __A,
       (__v8df) __B,
       (__v8df)
       _mm512_undefined_pd (),
       (__mmask8) -1,
       0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_min_pd (__m512d __W, __mmask8 __U, __m512d __A, __m512d __B)
{
  return (__m512d) __builtin_ia32_minpd512_mask ((__v8df) __A,
       (__v8df) __B,
       (__v8df) __W,
       (__mmask8) __U,
       0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_min_pd (__mmask8 __U, __m512d __A, __m512d __B)
{
  return (__m512d) __builtin_ia32_minpd512_mask ((__v8df) __A,
       (__v8df) __B,
       (__v8df)
       _mm512_setzero_pd (),
       (__mmask8) __U,
       0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_min_ps (__m512 __A, __m512 __B)
{
  return (__m512) __builtin_ia32_minps512_mask ((__v16sf) __A,
      (__v16sf) __B,
      (__v16sf)
      _mm512_undefined_ps (),
      (__mmask16) -1,
      0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_min_ps (__m512 __W, __mmask16 __U, __m512 __A, __m512 __B)
{
  return (__m512) __builtin_ia32_minps512_mask ((__v16sf) __A,
      (__v16sf) __B,
      (__v16sf) __W,
      (__mmask16) __U,
      0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_min_ps (__mmask16 __U, __m512 __A, __m512 __B)
{
  return (__m512) __builtin_ia32_minps512_mask ((__v16sf) __A,
      (__v16sf) __B,
      (__v16sf)
      _mm512_setzero_ps (),
      (__mmask16) __U,
      0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_scalef_pd (__m512d __A, __m512d __B)
{
  return (__m512d) __builtin_ia32_scalefpd512_mask ((__v8df) __A,
          (__v8df) __B,
          (__v8df)
          _mm512_undefined_pd (),
          (__mmask8) -1,
          0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_scalef_pd (__m512d __W, __mmask8 __U, __m512d __A, __m512d __B)
{
  return (__m512d) __builtin_ia32_scalefpd512_mask ((__v8df) __A,
          (__v8df) __B,
          (__v8df) __W,
          (__mmask8) __U,
          0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_scalef_pd (__mmask8 __U, __m512d __A, __m512d __B)
{
  return (__m512d) __builtin_ia32_scalefpd512_mask ((__v8df) __A,
          (__v8df) __B,
          (__v8df)
          _mm512_setzero_pd (),
          (__mmask8) __U,
          0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_scalef_ps (__m512 __A, __m512 __B)
{
  return (__m512) __builtin_ia32_scalefps512_mask ((__v16sf) __A,
         (__v16sf) __B,
         (__v16sf)
         _mm512_undefined_ps (),
         (__mmask16) -1,
         0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_scalef_ps (__m512 __W, __mmask16 __U, __m512 __A, __m512 __B)
{
  return (__m512) __builtin_ia32_scalefps512_mask ((__v16sf) __A,
         (__v16sf) __B,
         (__v16sf) __W,
         (__mmask16) __U,
         0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_scalef_ps (__mmask16 __U, __m512 __A, __m512 __B)
{
  return (__m512) __builtin_ia32_scalefps512_mask ((__v16sf) __A,
         (__v16sf) __B,
         (__v16sf)
         _mm512_setzero_ps (),
         (__mmask16) __U,
         0x04);
}

extern __inline __m128d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm_scalef_sd (__m128d __A, __m128d __B)
{
  return (__m128d) __builtin_ia32_scalefsd_round ((__v2df) __A,
        (__v2df) __B,
        0x04);
}

extern __inline __m128
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm_scalef_ss (__m128 __A, __m128 __B)
{
  return (__m128) __builtin_ia32_scalefss_round ((__v4sf) __A,
       (__v4sf) __B,
       0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_fmadd_pd (__m512d __A, __m512d __B, __m512d __C)
{
  return (__m512d) __builtin_ia32_vfmaddpd512_mask ((__v8df) __A,
          (__v8df) __B,
          (__v8df) __C,
          (__mmask8) -1,
          0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_fmadd_pd (__m512d __A, __mmask8 __U, __m512d __B, __m512d __C)
{
  return (__m512d) __builtin_ia32_vfmaddpd512_mask ((__v8df) __A,
          (__v8df) __B,
          (__v8df) __C,
          (__mmask8) __U,
          0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask3_fmadd_pd (__m512d __A, __m512d __B, __m512d __C, __mmask8 __U)
{
  return (__m512d) __builtin_ia32_vfmaddpd512_mask3 ((__v8df) __A,
           (__v8df) __B,
           (__v8df) __C,
           (__mmask8) __U,
           0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_fmadd_pd (__mmask8 __U, __m512d __A, __m512d __B, __m512d __C)
{
  return (__m512d) __builtin_ia32_vfmaddpd512_maskz ((__v8df) __A,
           (__v8df) __B,
           (__v8df) __C,
           (__mmask8) __U,
           0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_fmadd_ps (__m512 __A, __m512 __B, __m512 __C)
{
  return (__m512) __builtin_ia32_vfmaddps512_mask ((__v16sf) __A,
         (__v16sf) __B,
         (__v16sf) __C,
         (__mmask16) -1,
         0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_fmadd_ps (__m512 __A, __mmask16 __U, __m512 __B, __m512 __C)
{
  return (__m512) __builtin_ia32_vfmaddps512_mask ((__v16sf) __A,
         (__v16sf) __B,
         (__v16sf) __C,
         (__mmask16) __U,
         0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask3_fmadd_ps (__m512 __A, __m512 __B, __m512 __C, __mmask16 __U)
{
  return (__m512) __builtin_ia32_vfmaddps512_mask3 ((__v16sf) __A,
          (__v16sf) __B,
          (__v16sf) __C,
          (__mmask16) __U,
          0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_fmadd_ps (__mmask16 __U, __m512 __A, __m512 __B, __m512 __C)
{
  return (__m512) __builtin_ia32_vfmaddps512_maskz ((__v16sf) __A,
          (__v16sf) __B,
          (__v16sf) __C,
          (__mmask16) __U,
          0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_fmsub_pd (__m512d __A, __m512d __B, __m512d __C)
{
  return (__m512d) __builtin_ia32_vfmaddpd512_mask ((__v8df) __A,
          (__v8df) __B,
          -(__v8df) __C,
          (__mmask8) -1,
          0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_fmsub_pd (__m512d __A, __mmask8 __U, __m512d __B, __m512d __C)
{
  return (__m512d) __builtin_ia32_vfmaddpd512_mask ((__v8df) __A,
          (__v8df) __B,
          -(__v8df) __C,
          (__mmask8) __U,
          0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask3_fmsub_pd (__m512d __A, __m512d __B, __m512d __C, __mmask8 __U)
{
  return (__m512d) __builtin_ia32_vfmsubpd512_mask3 ((__v8df) __A,
           (__v8df) __B,
           (__v8df) __C,
           (__mmask8) __U,
           0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_fmsub_pd (__mmask8 __U, __m512d __A, __m512d __B, __m512d __C)
{
  return (__m512d) __builtin_ia32_vfmaddpd512_maskz ((__v8df) __A,
           (__v8df) __B,
           -(__v8df) __C,
           (__mmask8) __U,
           0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_fmsub_ps (__m512 __A, __m512 __B, __m512 __C)
{
  return (__m512) __builtin_ia32_vfmaddps512_mask ((__v16sf) __A,
         (__v16sf) __B,
         -(__v16sf) __C,
         (__mmask16) -1,
         0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_fmsub_ps (__m512 __A, __mmask16 __U, __m512 __B, __m512 __C)
{
  return (__m512) __builtin_ia32_vfmaddps512_mask ((__v16sf) __A,
         (__v16sf) __B,
         -(__v16sf) __C,
         (__mmask16) __U,
         0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask3_fmsub_ps (__m512 __A, __m512 __B, __m512 __C, __mmask16 __U)
{
  return (__m512) __builtin_ia32_vfmsubps512_mask3 ((__v16sf) __A,
          (__v16sf) __B,
          (__v16sf) __C,
          (__mmask16) __U,
          0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_fmsub_ps (__mmask16 __U, __m512 __A, __m512 __B, __m512 __C)
{
  return (__m512) __builtin_ia32_vfmaddps512_maskz ((__v16sf) __A,
          (__v16sf) __B,
          -(__v16sf) __C,
          (__mmask16) __U,
          0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_fmaddsub_pd (__m512d __A, __m512d __B, __m512d __C)
{
  return (__m512d) __builtin_ia32_vfmaddsubpd512_mask ((__v8df) __A,
             (__v8df) __B,
             (__v8df) __C,
             (__mmask8) -1,
             0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_fmaddsub_pd (__m512d __A, __mmask8 __U, __m512d __B, __m512d __C)
{
  return (__m512d) __builtin_ia32_vfmaddsubpd512_mask ((__v8df) __A,
             (__v8df) __B,
             (__v8df) __C,
             (__mmask8) __U,
             0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask3_fmaddsub_pd (__m512d __A, __m512d __B, __m512d __C, __mmask8 __U)
{
  return (__m512d) __builtin_ia32_vfmaddsubpd512_mask3 ((__v8df) __A,
       (__v8df) __B,
       (__v8df) __C,
       (__mmask8) __U,
       0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_fmaddsub_pd (__mmask8 __U, __m512d __A, __m512d __B, __m512d __C)
{
  return (__m512d) __builtin_ia32_vfmaddsubpd512_maskz ((__v8df) __A,
       (__v8df) __B,
       (__v8df) __C,
       (__mmask8) __U,
       0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_fmaddsub_ps (__m512 __A, __m512 __B, __m512 __C)
{
  return (__m512) __builtin_ia32_vfmaddsubps512_mask ((__v16sf) __A,
            (__v16sf) __B,
            (__v16sf) __C,
            (__mmask16) -1,
            0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_fmaddsub_ps (__m512 __A, __mmask16 __U, __m512 __B, __m512 __C)
{
  return (__m512) __builtin_ia32_vfmaddsubps512_mask ((__v16sf) __A,
            (__v16sf) __B,
            (__v16sf) __C,
            (__mmask16) __U,
            0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask3_fmaddsub_ps (__m512 __A, __m512 __B, __m512 __C, __mmask16 __U)
{
  return (__m512) __builtin_ia32_vfmaddsubps512_mask3 ((__v16sf) __A,
             (__v16sf) __B,
             (__v16sf) __C,
             (__mmask16) __U,
             0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_fmaddsub_ps (__mmask16 __U, __m512 __A, __m512 __B, __m512 __C)
{
  return (__m512) __builtin_ia32_vfmaddsubps512_maskz ((__v16sf) __A,
             (__v16sf) __B,
             (__v16sf) __C,
             (__mmask16) __U,
             0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_fmsubadd_pd (__m512d __A, __m512d __B, __m512d __C)
{
  return (__m512d) __builtin_ia32_vfmaddsubpd512_mask ((__v8df) __A,
             (__v8df) __B,
             -(__v8df) __C,
             (__mmask8) -1,
             0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_fmsubadd_pd (__m512d __A, __mmask8 __U, __m512d __B, __m512d __C)
{
  return (__m512d) __builtin_ia32_vfmaddsubpd512_mask ((__v8df) __A,
             (__v8df) __B,
             -(__v8df) __C,
             (__mmask8) __U,
             0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask3_fmsubadd_pd (__m512d __A, __m512d __B, __m512d __C, __mmask8 __U)
{
  return (__m512d) __builtin_ia32_vfmsubaddpd512_mask3 ((__v8df) __A,
       (__v8df) __B,
       (__v8df) __C,
       (__mmask8) __U,
       0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_fmsubadd_pd (__mmask8 __U, __m512d __A, __m512d __B, __m512d __C)
{
  return (__m512d) __builtin_ia32_vfmaddsubpd512_maskz ((__v8df) __A,
       (__v8df) __B,
       -(__v8df) __C,
       (__mmask8) __U,
       0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_fmsubadd_ps (__m512 __A, __m512 __B, __m512 __C)
{
  return (__m512) __builtin_ia32_vfmaddsubps512_mask ((__v16sf) __A,
            (__v16sf) __B,
            -(__v16sf) __C,
            (__mmask16) -1,
            0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_fmsubadd_ps (__m512 __A, __mmask16 __U, __m512 __B, __m512 __C)
{
  return (__m512) __builtin_ia32_vfmaddsubps512_mask ((__v16sf) __A,
            (__v16sf) __B,
            -(__v16sf) __C,
            (__mmask16) __U,
            0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask3_fmsubadd_ps (__m512 __A, __m512 __B, __m512 __C, __mmask16 __U)
{
  return (__m512) __builtin_ia32_vfmsubaddps512_mask3 ((__v16sf) __A,
             (__v16sf) __B,
             (__v16sf) __C,
             (__mmask16) __U,
             0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_fmsubadd_ps (__mmask16 __U, __m512 __A, __m512 __B, __m512 __C)
{
  return (__m512) __builtin_ia32_vfmaddsubps512_maskz ((__v16sf) __A,
             (__v16sf) __B,
             -(__v16sf) __C,
             (__mmask16) __U,
             0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_fnmadd_pd (__m512d __A, __m512d __B, __m512d __C)
{
  return (__m512d) __builtin_ia32_vfmaddpd512_mask (-(__v8df) __A,
          (__v8df) __B,
          (__v8df) __C,
          (__mmask8) -1,
          0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_fnmadd_pd (__m512d __A, __mmask8 __U, __m512d __B, __m512d __C)
{
  return (__m512d) __builtin_ia32_vfnmaddpd512_mask ((__v8df) __A,
           (__v8df) __B,
           (__v8df) __C,
           (__mmask8) __U,
           0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask3_fnmadd_pd (__m512d __A, __m512d __B, __m512d __C, __mmask8 __U)
{
  return (__m512d) __builtin_ia32_vfmaddpd512_mask3 (-(__v8df) __A,
           (__v8df) __B,
           (__v8df) __C,
           (__mmask8) __U,
           0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_fnmadd_pd (__mmask8 __U, __m512d __A, __m512d __B, __m512d __C)
{
  return (__m512d) __builtin_ia32_vfmaddpd512_maskz (-(__v8df) __A,
           (__v8df) __B,
           (__v8df) __C,
           (__mmask8) __U,
           0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_fnmadd_ps (__m512 __A, __m512 __B, __m512 __C)
{
  return (__m512) __builtin_ia32_vfmaddps512_mask (-(__v16sf) __A,
         (__v16sf) __B,
         (__v16sf) __C,
         (__mmask16) -1,
         0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_fnmadd_ps (__m512 __A, __mmask16 __U, __m512 __B, __m512 __C)
{
  return (__m512) __builtin_ia32_vfnmaddps512_mask ((__v16sf) __A,
          (__v16sf) __B,
          (__v16sf) __C,
          (__mmask16) __U,
          0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask3_fnmadd_ps (__m512 __A, __m512 __B, __m512 __C, __mmask16 __U)
{
  return (__m512) __builtin_ia32_vfmaddps512_mask3 (-(__v16sf) __A,
          (__v16sf) __B,
          (__v16sf) __C,
          (__mmask16) __U,
          0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_fnmadd_ps (__mmask16 __U, __m512 __A, __m512 __B, __m512 __C)
{
  return (__m512) __builtin_ia32_vfmaddps512_maskz (-(__v16sf) __A,
          (__v16sf) __B,
          (__v16sf) __C,
          (__mmask16) __U,
          0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_fnmsub_pd (__m512d __A, __m512d __B, __m512d __C)
{
  return (__m512d) __builtin_ia32_vfmaddpd512_mask (-(__v8df) __A,
          (__v8df) __B,
          -(__v8df) __C,
          (__mmask8) -1,
          0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_fnmsub_pd (__m512d __A, __mmask8 __U, __m512d __B, __m512d __C)
{
  return (__m512d) __builtin_ia32_vfnmsubpd512_mask ((__v8df) __A,
           (__v8df) __B,
           (__v8df) __C,
           (__mmask8) __U,
           0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask3_fnmsub_pd (__m512d __A, __m512d __B, __m512d __C, __mmask8 __U)
{
  return (__m512d) __builtin_ia32_vfnmsubpd512_mask3 ((__v8df) __A,
            (__v8df) __B,
            (__v8df) __C,
            (__mmask8) __U,
            0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_fnmsub_pd (__mmask8 __U, __m512d __A, __m512d __B, __m512d __C)
{
  return (__m512d) __builtin_ia32_vfmaddpd512_maskz (-(__v8df) __A,
           (__v8df) __B,
           -(__v8df) __C,
           (__mmask8) __U,
           0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_fnmsub_ps (__m512 __A, __m512 __B, __m512 __C)
{
  return (__m512) __builtin_ia32_vfmaddps512_mask (-(__v16sf) __A,
         (__v16sf) __B,
         -(__v16sf) __C,
         (__mmask16) -1,
         0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_fnmsub_ps (__m512 __A, __mmask16 __U, __m512 __B, __m512 __C)
{
  return (__m512) __builtin_ia32_vfnmsubps512_mask ((__v16sf) __A,
          (__v16sf) __B,
          (__v16sf) __C,
          (__mmask16) __U,
          0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask3_fnmsub_ps (__m512 __A, __m512 __B, __m512 __C, __mmask16 __U)
{
  return (__m512) __builtin_ia32_vfnmsubps512_mask3 ((__v16sf) __A,
           (__v16sf) __B,
           (__v16sf) __C,
           (__mmask16) __U,
           0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_fnmsub_ps (__mmask16 __U, __m512 __A, __m512 __B, __m512 __C)
{
  return (__m512) __builtin_ia32_vfmaddps512_maskz (-(__v16sf) __A,
          (__v16sf) __B,
          -(__v16sf) __C,
          (__mmask16) __U,
          0x04);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cvttpd_epi32 (__m512d __A)
{
  return (__m256i) __builtin_ia32_cvttpd2dq512_mask ((__v8df) __A,
           (__v8si)
           _mm256_undefined_si256 (),
           (__mmask8) -1,
           0x04);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvttpd_epi32 (__m256i __W, __mmask8 __U, __m512d __A)
{
  return (__m256i) __builtin_ia32_cvttpd2dq512_mask ((__v8df) __A,
           (__v8si) __W,
           (__mmask8) __U,
           0x04);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_cvttpd_epi32 (__mmask8 __U, __m512d __A)
{
  return (__m256i) __builtin_ia32_cvttpd2dq512_mask ((__v8df) __A,
           (__v8si)
           _mm256_setzero_si256 (),
           (__mmask8) __U,
           0x04);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cvttpd_epu32 (__m512d __A)
{
  return (__m256i) __builtin_ia32_cvttpd2udq512_mask ((__v8df) __A,
            (__v8si)
            _mm256_undefined_si256 (),
            (__mmask8) -1,
            0x04);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvttpd_epu32 (__m256i __W, __mmask8 __U, __m512d __A)
{
  return (__m256i) __builtin_ia32_cvttpd2udq512_mask ((__v8df) __A,
            (__v8si) __W,
            (__mmask8) __U,
            0x04);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_cvttpd_epu32 (__mmask8 __U, __m512d __A)
{
  return (__m256i) __builtin_ia32_cvttpd2udq512_mask ((__v8df) __A,
            (__v8si)
            _mm256_setzero_si256 (),
            (__mmask8) __U,
            0x04);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cvtpd_epi32 (__m512d __A)
{
  return (__m256i) __builtin_ia32_cvtpd2dq512_mask ((__v8df) __A,
          (__v8si)
          _mm256_undefined_si256 (),
          (__mmask8) -1,
          0x04);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtpd_epi32 (__m256i __W, __mmask8 __U, __m512d __A)
{
  return (__m256i) __builtin_ia32_cvtpd2dq512_mask ((__v8df) __A,
          (__v8si) __W,
          (__mmask8) __U,
          0x04);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_cvtpd_epi32 (__mmask8 __U, __m512d __A)
{
  return (__m256i) __builtin_ia32_cvtpd2dq512_mask ((__v8df) __A,
          (__v8si)
          _mm256_setzero_si256 (),
          (__mmask8) __U,
          0x04);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cvtpd_epu32 (__m512d __A)
{
  return (__m256i) __builtin_ia32_cvtpd2udq512_mask ((__v8df) __A,
           (__v8si)
           _mm256_undefined_si256 (),
           (__mmask8) -1,
           0x04);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtpd_epu32 (__m256i __W, __mmask8 __U, __m512d __A)
{
  return (__m256i) __builtin_ia32_cvtpd2udq512_mask ((__v8df) __A,
           (__v8si) __W,
           (__mmask8) __U,
           0x04);
}

extern __inline __m256i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_cvtpd_epu32 (__mmask8 __U, __m512d __A)
{
  return (__m256i) __builtin_ia32_cvtpd2udq512_mask ((__v8df) __A,
           (__v8si)
           _mm256_setzero_si256 (),
           (__mmask8) __U,
           0x04);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cvttps_epi32 (__m512 __A)
{
  return (__m512i) __builtin_ia32_cvttps2dq512_mask ((__v16sf) __A,
           (__v16si)
           _mm512_undefined_si512 (),
           (__mmask16) -1,
           0x04);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvttps_epi32 (__m512i __W, __mmask16 __U, __m512 __A)
{
  return (__m512i) __builtin_ia32_cvttps2dq512_mask ((__v16sf) __A,
           (__v16si) __W,
           (__mmask16) __U,
           0x04);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_cvttps_epi32 (__mmask16 __U, __m512 __A)
{
  return (__m512i) __builtin_ia32_cvttps2dq512_mask ((__v16sf) __A,
           (__v16si)
           _mm512_setzero_si512 (),
           (__mmask16) __U,
           0x04);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cvttps_epu32 (__m512 __A)
{
  return (__m512i) __builtin_ia32_cvttps2udq512_mask ((__v16sf) __A,
            (__v16si)
            _mm512_undefined_si512 (),
            (__mmask16) -1,
            0x04);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvttps_epu32 (__m512i __W, __mmask16 __U, __m512 __A)
{
  return (__m512i) __builtin_ia32_cvttps2udq512_mask ((__v16sf) __A,
            (__v16si) __W,
            (__mmask16) __U,
            0x04);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_cvttps_epu32 (__mmask16 __U, __m512 __A)
{
  return (__m512i) __builtin_ia32_cvttps2udq512_mask ((__v16sf) __A,
            (__v16si)
            _mm512_setzero_si512 (),
            (__mmask16) __U,
            0x04);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cvtps_epi32 (__m512 __A)
{
  return (__m512i) __builtin_ia32_cvtps2dq512_mask ((__v16sf) __A,
          (__v16si)
          _mm512_undefined_si512 (),
          (__mmask16) -1,
          0x04);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtps_epi32 (__m512i __W, __mmask16 __U, __m512 __A)
{
  return (__m512i) __builtin_ia32_cvtps2dq512_mask ((__v16sf) __A,
          (__v16si) __W,
          (__mmask16) __U,
          0x04);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_cvtps_epi32 (__mmask16 __U, __m512 __A)
{
  return (__m512i) __builtin_ia32_cvtps2dq512_mask ((__v16sf) __A,
          (__v16si)
          _mm512_setzero_si512 (),
          (__mmask16) __U,
          0x04);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cvtps_epu32 (__m512 __A)
{
  return (__m512i) __builtin_ia32_cvtps2udq512_mask ((__v16sf) __A,
           (__v16si)
           _mm512_undefined_si512 (),
           (__mmask16) -1,
           0x04);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtps_epu32 (__m512i __W, __mmask16 __U, __m512 __A)
{
  return (__m512i) __builtin_ia32_cvtps2udq512_mask ((__v16sf) __A,
           (__v16si) __W,
           (__mmask16) __U,
           0x04);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_cvtps_epu32 (__mmask16 __U, __m512 __A)
{
  return (__m512i) __builtin_ia32_cvtps2udq512_mask ((__v16sf) __A,
           (__v16si)
           _mm512_setzero_si512 (),
           (__mmask16) __U,
           0x04);
}


extern __inline __m128
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtu64_ss (__m128 __A, unsigned long long __B)
{
  return (__m128) __builtin_ia32_cvtusi2ss64 ((__v4sf) __A, __B,
           0x04);
}

extern __inline __m128d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtu64_sd (__m128d __A, unsigned long long __B)
{
  return (__m128d) __builtin_ia32_cvtusi2sd64 ((__v2df) __A, __B,
            0x04);
}


extern __inline __m128
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtu32_ss (__m128 __A, unsigned __B)
{
  return (__m128) __builtin_ia32_cvtusi2ss32 ((__v4sf) __A, __B,
           0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cvtepi32_ps (__m512i __A)
{
  return (__m512) __builtin_ia32_cvtdq2ps512_mask ((__v16si) __A,
         (__v16sf)
         _mm512_undefined_ps (),
         (__mmask16) -1,
         0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtepi32_ps (__m512 __W, __mmask16 __U, __m512i __A)
{
  return (__m512) __builtin_ia32_cvtdq2ps512_mask ((__v16si) __A,
         (__v16sf) __W,
         (__mmask16) __U,
         0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_cvtepi32_ps (__mmask16 __U, __m512i __A)
{
  return (__m512) __builtin_ia32_cvtdq2ps512_mask ((__v16si) __A,
         (__v16sf)
         _mm512_setzero_ps (),
         (__mmask16) __U,
         0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cvtepu32_ps (__m512i __A)
{
  return (__m512) __builtin_ia32_cvtudq2ps512_mask ((__v16si) __A,
          (__v16sf)
          _mm512_undefined_ps (),
          (__mmask16) -1,
          0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtepu32_ps (__m512 __W, __mmask16 __U, __m512i __A)
{
  return (__m512) __builtin_ia32_cvtudq2ps512_mask ((__v16si) __A,
          (__v16sf) __W,
          (__mmask16) __U,
          0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_cvtepu32_ps (__mmask16 __U, __m512i __A)
{
  return (__m512) __builtin_ia32_cvtudq2ps512_mask ((__v16si) __A,
          (__v16sf)
          _mm512_setzero_ps (),
          (__mmask16) __U,
          0x04);
}
# 12196 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx512fintrin.h" 3 4
extern __inline unsigned long long
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtss_u64 (__m128 __A)
{
  return (unsigned long long) __builtin_ia32_vcvtss2usi64 ((__v4sf)
          __A,
          0x04);
}

extern __inline unsigned long long
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvttss_u64 (__m128 __A)
{
  return (unsigned long long) __builtin_ia32_vcvttss2usi64 ((__v4sf)
           __A,
           0x04);
}

extern __inline long long
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvttss_i64 (__m128 __A)
{
  return (long long) __builtin_ia32_vcvttss2si64 ((__v4sf) __A,
        0x04);
}


extern __inline unsigned
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtss_u32 (__m128 __A)
{
  return (unsigned) __builtin_ia32_vcvtss2usi32 ((__v4sf) __A,
       0x04);
}

extern __inline unsigned
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvttss_u32 (__m128 __A)
{
  return (unsigned) __builtin_ia32_vcvttss2usi32 ((__v4sf) __A,
        0x04);
}

extern __inline int
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvttss_i32 (__m128 __A)
{
  return (int) __builtin_ia32_vcvttss2si32 ((__v4sf) __A,
         0x04);
}


extern __inline unsigned long long
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtsd_u64 (__m128d __A)
{
  return (unsigned long long) __builtin_ia32_vcvtsd2usi64 ((__v2df)
          __A,
          0x04);
}

extern __inline unsigned long long
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvttsd_u64 (__m128d __A)
{
  return (unsigned long long) __builtin_ia32_vcvttsd2usi64 ((__v2df)
           __A,
           0x04);
}

extern __inline long long
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvttsd_i64 (__m128d __A)
{
  return (long long) __builtin_ia32_vcvttsd2si64 ((__v2df) __A,
        0x04);
}


extern __inline unsigned
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtsd_u32 (__m128d __A)
{
  return (unsigned) __builtin_ia32_vcvtsd2usi32 ((__v2df) __A,
       0x04);
}

extern __inline unsigned
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvttsd_u32 (__m128d __A)
{
  return (unsigned) __builtin_ia32_vcvttsd2usi32 ((__v2df) __A,
        0x04);
}

extern __inline int
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvttsd_i32 (__m128d __A)
{
  return (int) __builtin_ia32_vcvttsd2si32 ((__v2df) __A,
         0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cvtps_pd (__m256 __A)
{
  return (__m512d) __builtin_ia32_cvtps2pd512_mask ((__v8sf) __A,
          (__v8df)
          _mm512_undefined_pd (),
          (__mmask8) -1,
          0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtps_pd (__m512d __W, __mmask8 __U, __m256 __A)
{
  return (__m512d) __builtin_ia32_cvtps2pd512_mask ((__v8sf) __A,
          (__v8df) __W,
          (__mmask8) __U,
          0x04);
}

extern __inline __m512d
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_cvtps_pd (__mmask8 __U, __m256 __A)
{
  return (__m512d) __builtin_ia32_cvtps2pd512_mask ((__v8sf) __A,
          (__v8df)
          _mm512_setzero_pd (),
          (__mmask8) __U,
          0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cvtph_ps (__m256i __A)
{
  return (__m512) __builtin_ia32_vcvtph2ps512_mask ((__v16hi) __A,
          (__v16sf)
          _mm512_undefined_ps (),
          (__mmask16) -1,
          0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtph_ps (__m512 __W, __mmask16 __U, __m256i __A)
{
  return (__m512) __builtin_ia32_vcvtph2ps512_mask ((__v16hi) __A,
          (__v16sf) __W,
          (__mmask16) __U,
          0x04);
}

extern __inline __m512
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_cvtph_ps (__mmask16 __U, __m256i __A)
{
  return (__m512) __builtin_ia32_vcvtph2ps512_mask ((__v16hi) __A,
          (__v16sf)
          _mm512_setzero_ps (),
          (__mmask16) __U,
          0x04);
}

extern __inline __m256
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_cvtpd_ps (__m512d __A)
{
  return (__m256) __builtin_ia32_cvtpd2ps512_mask ((__v8df) __A,
         (__v8sf)
         _mm256_undefined_ps (),
         (__mmask8) -1,
         0x04);
}

extern __inline __m256
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_cvtpd_ps (__m256 __W, __mmask8 __U, __m512d __A)
{
  return (__m256) __builtin_ia32_cvtpd2ps512_mask ((__v8df) __A,
         (__v8sf) __W,
         (__mmask8) __U,
         0x04);
}

extern __inline __m256
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_cvtpd_ps (__mmask8 __U, __m512d __A)
{
  return (__m256) __builtin_ia32_cvtpd2ps512_mask ((__v8df) __A,
         (__v8sf)
         _mm256_setzero_ps (),
         (__mmask8) __U,
         0x04);
}
# 12903 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx512fintrin.h" 3 4
extern __inline __mmask16
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_kmov (__mmask16 __A)
{
  return __builtin_ia32_kmov16 (__A);
}



#pragma GCC pop_options
# 46 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/immintrin.h" 2 3 4

# 1 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx512erintrin.h" 1 3 4
# 32 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx512erintrin.h" 3 4
#pragma GCC push_options
#pragma GCC target("avx512er")




typedef double __v8df __attribute__ ((__vector_size__ (64)));
typedef float __v16sf __attribute__ ((__vector_size__ (64)));



typedef float __m512 __attribute__ ((__vector_size__ (64), __may_alias__));
typedef double __m512d __attribute__ ((__vector_size__ (64), __may_alias__));

typedef unsigned char __mmask8;
typedef unsigned short __mmask16;
# 391 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx512erintrin.h" 3 4
#pragma GCC pop_options
# 48 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/immintrin.h" 2 3 4

# 1 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx512pfintrin.h" 1 3 4
# 32 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx512pfintrin.h" 3 4
#pragma GCC push_options
#pragma GCC target("avx512pf")




typedef long long __v8di __attribute__ ((__vector_size__ (64)));
typedef int __v16si __attribute__ ((__vector_size__ (64)));



typedef long long __m512i __attribute__ ((__vector_size__ (64), __may_alias__));

typedef unsigned char __mmask8;
typedef unsigned short __mmask16;
# 209 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx512pfintrin.h" 3 4
#pragma GCC pop_options
# 50 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/immintrin.h" 2 3 4

# 1 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx512cdintrin.h" 1 3 4
# 32 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/avx512cdintrin.h" 3 4
#pragma GCC push_options
#pragma GCC target("avx512cd")




typedef long long __v8di __attribute__ ((__vector_size__ (64)));
typedef int __v16si __attribute__ ((__vector_size__ (64)));



typedef long long __m512i __attribute__ ((__vector_size__ (64), __may_alias__));
typedef double __m512d __attribute__ ((__vector_size__ (64), __may_alias__));

typedef unsigned char __mmask8;
typedef unsigned short __mmask16;

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_conflict_epi32 (__m512i __A)
{
  return (__m512i)
  __builtin_ia32_vpconflictsi_512_mask ((__v16si) __A,
            (__v16si) _mm512_setzero_si512 (),
            (__mmask16) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_conflict_epi32 (__m512i __W, __mmask16 __U, __m512i __A)
{
  return (__m512i) __builtin_ia32_vpconflictsi_512_mask ((__v16si) __A,
        (__v16si) __W,
        (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_conflict_epi32 (__mmask16 __U, __m512i __A)
{
  return (__m512i)
  __builtin_ia32_vpconflictsi_512_mask ((__v16si) __A,
            (__v16si) _mm512_setzero_si512 (),
            (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_conflict_epi64 (__m512i __A)
{
  return (__m512i)
  __builtin_ia32_vpconflictdi_512_mask ((__v8di) __A,
            (__v8di) _mm512_setzero_si512 (),
            (__mmask8) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_conflict_epi64 (__m512i __W, __mmask8 __U, __m512i __A)
{
  return (__m512i) __builtin_ia32_vpconflictdi_512_mask ((__v8di) __A,
        (__v8di) __W,
        (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_conflict_epi64 (__mmask8 __U, __m512i __A)
{
  return (__m512i)
  __builtin_ia32_vpconflictdi_512_mask ((__v8di) __A,
            (__v8di) _mm512_setzero_si512 (),
            (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_lzcnt_epi64 (__m512i __A)
{
  return (__m512i)
  __builtin_ia32_vplzcntq_512_mask ((__v8di) __A,
        (__v8di) _mm512_setzero_si512 (),
        (__mmask8) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_lzcnt_epi64 (__m512i __W, __mmask8 __U, __m512i __A)
{
  return (__m512i) __builtin_ia32_vplzcntq_512_mask ((__v8di) __A,
           (__v8di) __W,
           (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_lzcnt_epi64 (__mmask8 __U, __m512i __A)
{
  return (__m512i)
  __builtin_ia32_vplzcntq_512_mask ((__v8di) __A,
        (__v8di) _mm512_setzero_si512 (),
        (__mmask8) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_lzcnt_epi32 (__m512i __A)
{
  return (__m512i)
  __builtin_ia32_vplzcntd_512_mask ((__v16si) __A,
        (__v16si) _mm512_setzero_si512 (),
        (__mmask16) -1);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_mask_lzcnt_epi32 (__m512i __W, __mmask16 __U, __m512i __A)
{
  return (__m512i) __builtin_ia32_vplzcntd_512_mask ((__v16si) __A,
           (__v16si) __W,
           (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_maskz_lzcnt_epi32 (__mmask16 __U, __m512i __A)
{
  return (__m512i)
  __builtin_ia32_vplzcntd_512_mask ((__v16si) __A,
        (__v16si) _mm512_setzero_si512 (),
        (__mmask16) __U);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_broadcastmb_epi64 (__mmask8 __A)
{
  return (__m512i) __builtin_ia32_broadcastmb512 (__A);
}

extern __inline __m512i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm512_broadcastmw_epi32 (__mmask16 __A)
{
  return (__m512i) __builtin_ia32_broadcastmw512 (__A);
}



#pragma GCC pop_options
# 52 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/immintrin.h" 2 3 4

# 1 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/shaintrin.h" 1 3 4
# 32 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/shaintrin.h" 3 4
#pragma GCC push_options
#pragma GCC target("sha")



extern __inline __m128i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm_sha1msg1_epu32 (__m128i __A, __m128i __B)
{
  return (__m128i) __builtin_ia32_sha1msg1 ((__v4si) __A, (__v4si) __B);
}

extern __inline __m128i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm_sha1msg2_epu32 (__m128i __A, __m128i __B)
{
  return (__m128i) __builtin_ia32_sha1msg2 ((__v4si) __A, (__v4si) __B);
}

extern __inline __m128i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm_sha1nexte_epu32 (__m128i __A, __m128i __B)
{
  return (__m128i) __builtin_ia32_sha1nexte ((__v4si) __A, (__v4si) __B);
}
# 71 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/shaintrin.h" 3 4
extern __inline __m128i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm_sha256msg1_epu32 (__m128i __A, __m128i __B)
{
  return (__m128i) __builtin_ia32_sha256msg1 ((__v4si) __A, (__v4si) __B);
}

extern __inline __m128i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm_sha256msg2_epu32 (__m128i __A, __m128i __B)
{
  return (__m128i) __builtin_ia32_sha256msg2 ((__v4si) __A, (__v4si) __B);
}

extern __inline __m128i
__attribute__ ((__gnu_inline__, __always_inline__, __artificial__))
_mm_sha256rnds2_epu32 (__m128i __A, __m128i __B, __m128i __C)
{
  return (__m128i) __builtin_ia32_sha256rnds2 ((__v4si) __A, (__v4si) __B,
            (__v4si) __C);
}



#pragma GCC pop_options
# 54 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/immintrin.h" 2 3 4

# 1 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/lzcntintrin.h" 1 3 4
# 33 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/lzcntintrin.h" 3 4
#pragma GCC push_options
#pragma GCC target("lzcnt")



extern __inline unsigned short __attribute__((__gnu_inline__, __always_inline__, __artificial__))
__lzcnt16 (unsigned short __X)
{
  return __builtin_clzs (__X);
}

extern __inline unsigned int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
__lzcnt32 (unsigned int __X)
{
  return __builtin_clz (__X);
}

extern __inline unsigned int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_lzcnt_u32 (unsigned int __X)
{
  return __builtin_clz (__X);
}


extern __inline unsigned long long __attribute__((__gnu_inline__, __always_inline__, __artificial__))
__lzcnt64 (unsigned long long __X)
{
  return __builtin_clzll (__X);
}

extern __inline unsigned long long __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_lzcnt_u64 (unsigned long long __X)
{
  return __builtin_clzll (__X);
}




#pragma GCC pop_options
# 56 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/immintrin.h" 2 3 4

# 1 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/bmiintrin.h" 1 3 4
# 32 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/bmiintrin.h" 3 4
#pragma GCC push_options
#pragma GCC target("bmi")



extern __inline unsigned short __attribute__((__gnu_inline__, __always_inline__, __artificial__))
__tzcnt_u16 (unsigned short __X)
{
  return __builtin_ctzs (__X);
}

extern __inline unsigned int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
__andn_u32 (unsigned int __X, unsigned int __Y)
{
  return ~__X & __Y;
}

extern __inline unsigned int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
__bextr_u32 (unsigned int __X, unsigned int __Y)
{
  return __builtin_ia32_bextr_u32 (__X, __Y);
}

extern __inline unsigned int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_bextr_u32 (unsigned int __X, unsigned int __Y, unsigned __Z)
{
  return __builtin_ia32_bextr_u32 (__X, ((__Y & 0xff) | ((__Z & 0xff) << 8)));
}

extern __inline unsigned int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
__blsi_u32 (unsigned int __X)
{
  return __X & -__X;
}

extern __inline unsigned int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_blsi_u32 (unsigned int __X)
{
  return __blsi_u32 (__X);
}

extern __inline unsigned int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
__blsmsk_u32 (unsigned int __X)
{
  return __X ^ (__X - 1);
}

extern __inline unsigned int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_blsmsk_u32 (unsigned int __X)
{
  return __blsmsk_u32 (__X);
}

extern __inline unsigned int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
__blsr_u32 (unsigned int __X)
{
  return __X & (__X - 1);
}

extern __inline unsigned int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_blsr_u32 (unsigned int __X)
{
  return __blsr_u32 (__X);
}

extern __inline unsigned int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
__tzcnt_u32 (unsigned int __X)
{
  return __builtin_ctz (__X);
}

extern __inline unsigned int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_tzcnt_u32 (unsigned int __X)
{
  return __builtin_ctz (__X);
}



extern __inline unsigned long long __attribute__((__gnu_inline__, __always_inline__, __artificial__))
__andn_u64 (unsigned long long __X, unsigned long long __Y)
{
  return ~__X & __Y;
}

extern __inline unsigned long long __attribute__((__gnu_inline__, __always_inline__, __artificial__))
__bextr_u64 (unsigned long long __X, unsigned long long __Y)
{
  return __builtin_ia32_bextr_u64 (__X, __Y);
}

extern __inline unsigned long long __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_bextr_u64 (unsigned long long __X, unsigned int __Y, unsigned int __Z)
{
  return __builtin_ia32_bextr_u64 (__X, ((__Y & 0xff) | ((__Z & 0xff) << 8)));
}

extern __inline unsigned long long __attribute__((__gnu_inline__, __always_inline__, __artificial__))
__blsi_u64 (unsigned long long __X)
{
  return __X & -__X;
}

extern __inline unsigned long long __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_blsi_u64 (unsigned long long __X)
{
  return __blsi_u64 (__X);
}

extern __inline unsigned long long __attribute__((__gnu_inline__, __always_inline__, __artificial__))
__blsmsk_u64 (unsigned long long __X)
{
  return __X ^ (__X - 1);
}

extern __inline unsigned long long __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_blsmsk_u64 (unsigned long long __X)
{
  return __blsmsk_u64 (__X);
}

extern __inline unsigned long long __attribute__((__gnu_inline__, __always_inline__, __artificial__))
__blsr_u64 (unsigned long long __X)
{
  return __X & (__X - 1);
}

extern __inline unsigned long long __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_blsr_u64 (unsigned long long __X)
{
  return __blsr_u64 (__X);
}

extern __inline unsigned long long __attribute__((__gnu_inline__, __always_inline__, __artificial__))
__tzcnt_u64 (unsigned long long __X)
{
  return __builtin_ctzll (__X);
}

extern __inline unsigned long long __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_tzcnt_u64 (unsigned long long __X)
{
  return __builtin_ctzll (__X);
}





#pragma GCC pop_options
# 58 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/immintrin.h" 2 3 4

# 1 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/bmi2intrin.h" 1 3 4
# 32 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/bmi2intrin.h" 3 4
#pragma GCC push_options
#pragma GCC target("bmi2")



extern __inline unsigned int
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_bzhi_u32 (unsigned int __X, unsigned int __Y)
{
  return __builtin_ia32_bzhi_si (__X, __Y);
}

extern __inline unsigned int
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_pdep_u32 (unsigned int __X, unsigned int __Y)
{
  return __builtin_ia32_pdep_si (__X, __Y);
}

extern __inline unsigned int
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_pext_u32 (unsigned int __X, unsigned int __Y)
{
  return __builtin_ia32_pext_si (__X, __Y);
}



extern __inline unsigned long long
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_bzhi_u64 (unsigned long long __X, unsigned long long __Y)
{
  return __builtin_ia32_bzhi_di (__X, __Y);
}

extern __inline unsigned long long
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_pdep_u64 (unsigned long long __X, unsigned long long __Y)
{
  return __builtin_ia32_pdep_di (__X, __Y);
}

extern __inline unsigned long long
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_pext_u64 (unsigned long long __X, unsigned long long __Y)
{
  return __builtin_ia32_pext_di (__X, __Y);
}

extern __inline unsigned long long
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mulx_u64 (unsigned long long __X, unsigned long long __Y,
    unsigned long long *__P)
{
  unsigned __int128 __res = (unsigned __int128) __X * __Y;
  *__P = (unsigned long long) (__res >> 64);
  return (unsigned long long) __res;
}
# 106 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/bmi2intrin.h" 3 4
#pragma GCC pop_options
# 60 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/immintrin.h" 2 3 4

# 1 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/fmaintrin.h" 1 3 4
# 32 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/fmaintrin.h" 3 4
#pragma GCC push_options
#pragma GCC target("fma")



extern __inline __m128d
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_fmadd_pd (__m128d __A, __m128d __B, __m128d __C)
{
  return (__m128d)__builtin_ia32_vfmaddpd ((__v2df)__A, (__v2df)__B,
                                           (__v2df)__C);
}

extern __inline __m256d
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_fmadd_pd (__m256d __A, __m256d __B, __m256d __C)
{
  return (__m256d)__builtin_ia32_vfmaddpd256 ((__v4df)__A, (__v4df)__B,
                                              (__v4df)__C);
}

extern __inline __m128
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_fmadd_ps (__m128 __A, __m128 __B, __m128 __C)
{
  return (__m128)__builtin_ia32_vfmaddps ((__v4sf)__A, (__v4sf)__B,
                                          (__v4sf)__C);
}

extern __inline __m256
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_fmadd_ps (__m256 __A, __m256 __B, __m256 __C)
{
  return (__m256)__builtin_ia32_vfmaddps256 ((__v8sf)__A, (__v8sf)__B,
                                             (__v8sf)__C);
}

extern __inline __m128d
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_fmadd_sd (__m128d __A, __m128d __B, __m128d __C)
{
  return (__m128d) __builtin_ia32_vfmaddsd3 ((__v2df)__A, (__v2df)__B,
                                             (__v2df)__C);
}

extern __inline __m128
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_fmadd_ss (__m128 __A, __m128 __B, __m128 __C)
{
  return (__m128) __builtin_ia32_vfmaddss3 ((__v4sf)__A, (__v4sf)__B,
                                            (__v4sf)__C);
}

extern __inline __m128d
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_fmsub_pd (__m128d __A, __m128d __B, __m128d __C)
{
  return (__m128d)__builtin_ia32_vfmaddpd ((__v2df)__A, (__v2df)__B,
                                           -(__v2df)__C);
}

extern __inline __m256d
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_fmsub_pd (__m256d __A, __m256d __B, __m256d __C)
{
  return (__m256d)__builtin_ia32_vfmaddpd256 ((__v4df)__A, (__v4df)__B,
                                              -(__v4df)__C);
}

extern __inline __m128
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_fmsub_ps (__m128 __A, __m128 __B, __m128 __C)
{
  return (__m128)__builtin_ia32_vfmaddps ((__v4sf)__A, (__v4sf)__B,
                                          -(__v4sf)__C);
}

extern __inline __m256
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_fmsub_ps (__m256 __A, __m256 __B, __m256 __C)
{
  return (__m256)__builtin_ia32_vfmaddps256 ((__v8sf)__A, (__v8sf)__B,
                                             -(__v8sf)__C);
}

extern __inline __m128d
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_fmsub_sd (__m128d __A, __m128d __B, __m128d __C)
{
  return (__m128d)__builtin_ia32_vfmaddsd3 ((__v2df)__A, (__v2df)__B,
                                            -(__v2df)__C);
}

extern __inline __m128
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_fmsub_ss (__m128 __A, __m128 __B, __m128 __C)
{
  return (__m128)__builtin_ia32_vfmaddss3 ((__v4sf)__A, (__v4sf)__B,
                                           -(__v4sf)__C);
}

extern __inline __m128d
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_fnmadd_pd (__m128d __A, __m128d __B, __m128d __C)
{
  return (__m128d)__builtin_ia32_vfmaddpd (-(__v2df)__A, (__v2df)__B,
                                           (__v2df)__C);
}

extern __inline __m256d
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_fnmadd_pd (__m256d __A, __m256d __B, __m256d __C)
{
  return (__m256d)__builtin_ia32_vfmaddpd256 (-(__v4df)__A, (__v4df)__B,
                                              (__v4df)__C);
}

extern __inline __m128
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_fnmadd_ps (__m128 __A, __m128 __B, __m128 __C)
{
  return (__m128)__builtin_ia32_vfmaddps (-(__v4sf)__A, (__v4sf)__B,
                                          (__v4sf)__C);
}

extern __inline __m256
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_fnmadd_ps (__m256 __A, __m256 __B, __m256 __C)
{
  return (__m256)__builtin_ia32_vfmaddps256 (-(__v8sf)__A, (__v8sf)__B,
                                             (__v8sf)__C);
}

extern __inline __m128d
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_fnmadd_sd (__m128d __A, __m128d __B, __m128d __C)
{
  return (__m128d)__builtin_ia32_vfmaddsd3 ((__v2df)__A, -(__v2df)__B,
                                            (__v2df)__C);
}

extern __inline __m128
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_fnmadd_ss (__m128 __A, __m128 __B, __m128 __C)
{
  return (__m128)__builtin_ia32_vfmaddss3 ((__v4sf)__A, -(__v4sf)__B,
                                           (__v4sf)__C);
}

extern __inline __m128d
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_fnmsub_pd (__m128d __A, __m128d __B, __m128d __C)
{
  return (__m128d)__builtin_ia32_vfmaddpd (-(__v2df)__A, (__v2df)__B,
                                           -(__v2df)__C);
}

extern __inline __m256d
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_fnmsub_pd (__m256d __A, __m256d __B, __m256d __C)
{
  return (__m256d)__builtin_ia32_vfmaddpd256 (-(__v4df)__A, (__v4df)__B,
                                              -(__v4df)__C);
}

extern __inline __m128
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_fnmsub_ps (__m128 __A, __m128 __B, __m128 __C)
{
  return (__m128)__builtin_ia32_vfmaddps (-(__v4sf)__A, (__v4sf)__B,
                                          -(__v4sf)__C);
}

extern __inline __m256
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_fnmsub_ps (__m256 __A, __m256 __B, __m256 __C)
{
  return (__m256)__builtin_ia32_vfmaddps256 (-(__v8sf)__A, (__v8sf)__B,
                                             -(__v8sf)__C);
}

extern __inline __m128d
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_fnmsub_sd (__m128d __A, __m128d __B, __m128d __C)
{
  return (__m128d)__builtin_ia32_vfmaddsd3 ((__v2df)__A, -(__v2df)__B,
                                            -(__v2df)__C);
}

extern __inline __m128
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_fnmsub_ss (__m128 __A, __m128 __B, __m128 __C)
{
  return (__m128)__builtin_ia32_vfmaddss3 ((__v4sf)__A, -(__v4sf)__B,
                                           -(__v4sf)__C);
}

extern __inline __m128d
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_fmaddsub_pd (__m128d __A, __m128d __B, __m128d __C)
{
  return (__m128d)__builtin_ia32_vfmaddsubpd ((__v2df)__A, (__v2df)__B,
                                              (__v2df)__C);
}

extern __inline __m256d
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_fmaddsub_pd (__m256d __A, __m256d __B, __m256d __C)
{
  return (__m256d)__builtin_ia32_vfmaddsubpd256 ((__v4df)__A,
                                                 (__v4df)__B,
                                                 (__v4df)__C);
}

extern __inline __m128
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_fmaddsub_ps (__m128 __A, __m128 __B, __m128 __C)
{
  return (__m128)__builtin_ia32_vfmaddsubps ((__v4sf)__A, (__v4sf)__B,
                                             (__v4sf)__C);
}

extern __inline __m256
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_fmaddsub_ps (__m256 __A, __m256 __B, __m256 __C)
{
  return (__m256)__builtin_ia32_vfmaddsubps256 ((__v8sf)__A,
                                                (__v8sf)__B,
                                                (__v8sf)__C);
}

extern __inline __m128d
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_fmsubadd_pd (__m128d __A, __m128d __B, __m128d __C)
{
  return (__m128d)__builtin_ia32_vfmaddsubpd ((__v2df)__A, (__v2df)__B,
                                              -(__v2df)__C);
}

extern __inline __m256d
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_fmsubadd_pd (__m256d __A, __m256d __B, __m256d __C)
{
  return (__m256d)__builtin_ia32_vfmaddsubpd256 ((__v4df)__A,
                                                 (__v4df)__B,
                                                 -(__v4df)__C);
}

extern __inline __m128
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_fmsubadd_ps (__m128 __A, __m128 __B, __m128 __C)
{
  return (__m128)__builtin_ia32_vfmaddsubps ((__v4sf)__A, (__v4sf)__B,
                                             -(__v4sf)__C);
}

extern __inline __m256
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_fmsubadd_ps (__m256 __A, __m256 __B, __m256 __C)
{
  return (__m256)__builtin_ia32_vfmaddsubps256 ((__v8sf)__A,
                                                (__v8sf)__B,
                                                -(__v8sf)__C);
}



#pragma GCC pop_options
# 62 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/immintrin.h" 2 3 4

# 1 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/f16cintrin.h" 1 3 4
# 32 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/f16cintrin.h" 3 4
#pragma GCC push_options
#pragma GCC target("f16c")



extern __inline float __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_cvtsh_ss (unsigned short __S)
{
  __v8hi __H = __extension__ (__v8hi){ (short) __S, 0, 0, 0, 0, 0, 0, 0 };
  __v4sf __A = __builtin_ia32_vcvtph2ps (__H);
  return __builtin_ia32_vec_ext_v4sf (__A, 0);
}

extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm_cvtph_ps (__m128i __A)
{
  return (__m128) __builtin_ia32_vcvtph2ps ((__v8hi) __A);
}

extern __inline __m256 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
_mm256_cvtph_ps (__m128i __A)
{
  return (__m256) __builtin_ia32_vcvtph2ps256 ((__v8hi) __A);
}
# 95 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/f16cintrin.h" 3 4
#pragma GCC pop_options
# 64 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/immintrin.h" 2 3 4

# 1 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/rtmintrin.h" 1 3 4
# 32 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/rtmintrin.h" 3 4
#pragma GCC push_options
#pragma GCC target("rtm")
# 48 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/rtmintrin.h" 3 4
extern __inline unsigned int
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_xbegin (void)
{
  return __builtin_ia32_xbegin ();
}





extern __inline void
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_xend (void)
{
  __builtin_ia32_xend ();
}
# 81 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/rtmintrin.h" 3 4
#pragma GCC pop_options
# 66 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/immintrin.h" 2 3 4

# 1 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/xtestintrin.h" 1 3 4
# 32 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/xtestintrin.h" 3 4
#pragma GCC push_options
#pragma GCC target("rtm")





extern __inline int
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_xtest (void)
{
  return __builtin_ia32_xtest ();
}



#pragma GCC pop_options
# 68 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/immintrin.h" 2 3 4


#pragma GCC push_options
#pragma GCC target("rdrnd")


extern __inline int
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_rdrand16_step (unsigned short *__P)
{
  return __builtin_ia32_rdrand16_step (__P);
}

extern __inline int
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_rdrand32_step (unsigned int *__P)
{
  return __builtin_ia32_rdrand32_step (__P);
}


#pragma GCC pop_options





#pragma GCC push_options
#pragma GCC target("fsgsbase")


extern __inline unsigned int
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_readfsbase_u32 (void)
{
  return __builtin_ia32_rdfsbase32 ();
}

extern __inline unsigned long long
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_readfsbase_u64 (void)
{
  return __builtin_ia32_rdfsbase64 ();
}

extern __inline unsigned int
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_readgsbase_u32 (void)
{
  return __builtin_ia32_rdgsbase32 ();
}

extern __inline unsigned long long
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_readgsbase_u64 (void)
{
  return __builtin_ia32_rdgsbase64 ();
}

extern __inline void
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_writefsbase_u32 (unsigned int __B)
{
  __builtin_ia32_wrfsbase32 (__B);
}

extern __inline void
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_writefsbase_u64 (unsigned long long __B)
{
  __builtin_ia32_wrfsbase64 (__B);
}

extern __inline void
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_writegsbase_u32 (unsigned int __B)
{
  __builtin_ia32_wrgsbase32 (__B);
}

extern __inline void
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_writegsbase_u64 (unsigned long long __B)
{
  __builtin_ia32_wrgsbase64 (__B);
}


#pragma GCC pop_options



#pragma GCC push_options
#pragma GCC target("rdrnd")


extern __inline int
__attribute__((__gnu_inline__, __always_inline__, __artificial__))
_rdrand64_step (unsigned long long *__P)
{
  return __builtin_ia32_rdrand64_step (__P);
}


#pragma GCC pop_options
# 63 "x86intrin.c" 2
