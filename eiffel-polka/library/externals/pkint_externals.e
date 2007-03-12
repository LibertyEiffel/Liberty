indexing
	description: "Externals calls for PKINT"
	copyright: "[
					Copyright (C) 2001 Natalia B. Bidart
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
				]"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$Revision:$"

deferred class PKINT_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- Externals

	pkint_init (handle: POINTER) is
		external "C use <polka/pkint.h>"
		end

--/*% $Id: pkint.h,v 1.1 2006-06-17 23:02:31 nbidart Exp $ */
--
--/* This header file defines the type of integer the library will use. The
--   generic type is \verb-pkint_t- and the operations on such numbers are all
--   prefixed with \verb-pkint_-. The real type of \verb -pkint_t- is selected
--   according to flags \verb-POLKA_NUM-. */
--
--#ifndef __POLKA_PKINT_H__
--#define __POLKA_PKINT_H__
--
--#include <stdlib.h>
--/*#include <stdio.h>*/
--#include <string.h>
--
--#ifdef POLKA_NUM
--
--/* %========================================================================= */
--/* \section{Interface for \texttt{pkint\_t = long int}} */
--/* %========================================================================= */
--
--#if POLKA_NUM==1
--
--typedef struct pkint_t {
--  long int rep;
--} pkint_t;
--
--#define pkint_init(a) (a).rep=0
--#define pkint_init_set(a,b) (a).rep=(b).rep
--#define pkint_init_set_ui(a,b) (a).rep=(b)
--#define pkint_init_set_si(a,b) (a).rep=(b)
--#define pkint_clear(a)
--#define pkint_set(a,b) (a).rep=(b).rep
--#define pkint_set_ui(a,b) (a).rep=(b)
--#define pkint_set_si(a,b) (a).rep=(b)
--#define pkint_add(a,b,c) (a).rep=(b).rep+(c).rep
--#define pkint_sub(a,b,c) (a).rep=(b).rep-(c).rep
--#define pkint_neg(a,b) (a).rep=-(b).rep
--#define pkint_mul(a,b,c) (a).rep=(b).rep*(c).rep
--#define pkint_div(a,b,c) (a).rep=(b).rep/(c).rep
--#define pkint_mod(a,b,c) (a).rep=(b).rep%(c).rep
--#define pkint_abs(a,b) (a).rep=labs((b).rep)
--
--static inline long int _gcd_aux2(long int a, long int b)
--{ /* a is supposed to be greater than b */
--  long int t;
--  while (b!=0 && a!=b) {
--    t = b;
--    b = a % b;
--    a = t;
--  }
--  return a;
--}
--
--static inline long int _gcd_aux(long int a, long int b)
--{
--  a = labs(a);
--  b = labs(b);
--  return (a>=b) ? _gcd_aux2(a,b) : _gcd_aux2(b,a);
--}
--
--#define pkint_gcd(a,b,c) (a).rep=_gcd_aux((b).rep,(c).rep)
--
--#define pkint_divexact(a,b,c) (a).rep=(b).rep/(c).rep
--#define pkint_sgn(a) ((a).rep>0L ? 1L : ((a).rep<0L ? (-1) : 0))
--#define pkint_cmp(a,b) ((a).rep>(b).rep ? 1 : ((a).rep==(b).rep ? 0 : -1))
--#define pkint_cmp_si(a,b) ((a).rep>(b) ? 1 : ((a).rep==(b) ? 0 : -1))
--#define pkint_cmp_ui(a,b) ((a).rep>(b) ? 1 : ((a).rep==(b) ? 0 : -1))
--#define pkint_print(a) printf("% 3ld",(a).rep)
--#define pkint_get_si(a) (a).rep
--#define pkint_get_ui(a) (unsigned long int)((a).rep)
--#define pkint_set_str10(a,b) (a).rep=atol(b)
--#define pkint_sizeinbase10(a) (3*sizeof(pkint_t)+2)
--static inline char* pkint_get_str10(char* str, pkint_t x)
--{
--  if (str==0){
--    str = malloc(3*sizeof(pkint_t)+2);
--  }
--  sprintf(str,"%ld",x.rep);
--  return str;
--}
--
--/* %========================================================================= */
--/* \section{Interface for \texttt{pkint\_t = long long int}} */
--/* %========================================================================= */
--
--#elif POLKA_NUM==2
--
--/* problem in compilation !? so we redefine it */
--#define llabs(a) ((a)<0LL ? -(a) : (a))
--
--typedef struct pkint_t {
--  long long int rep;
--} pkint_t;
--
--#define pkint_init(a) (a).rep=0
--#define pkint_init_set(a,b) (a).rep=(b).rep
--#define pkint_init_set_ui(a,b) (a).rep=b
--#define pkint_init_set_si(a,b) (a).rep=b
--#define pkint_clear(a)
--#define pkint_set(a,b) (a).rep=(b).rep
--#define pkint_set_ui(a,b) (a).rep=b
--#define pkint_set_si(a,b) (a).rep=b
--#define pkint_add(a,b,c) (a).rep=(b).rep+(c).rep
--#define pkint_sub(a,b,c) (a).rep=(b).rep-(c).rep
--#define pkint_neg(a,b) (a).rep=-(b).rep
--#define pkint_mul(a,b,c) (a).rep=(b).rep*(c).rep
--#define pkint_div(a,b,c) (a).rep=(b).rep/(c).rep
--#define pkint_mod(a,b,c) (a).rep=(b).rep%(c).rep
--#define pkint_abs(a,b) (a).rep=llabs((b).rep)
--
--static inline long long int _gcd_aux2(long long int a, long long int b)
--{ /* a is supposed to be greater than b */
--  long long int t;
--  while (b!=0 && a!=b) {
--    t = b;
--    b = a % b;
--    a = t;
--  }
--  return a;
--}
--static inline long long int _gcd_aux(long long int a, long long int b)
--{
--  a = llabs(a);
--  b = llabs(b);
--  return (a>=b) ? _gcd_aux2(a,b) : _gcd_aux2(b,a);
--}
--#define pkint_gcd(a,b,c) (a).rep=_gcd_aux((b).rep,(c).rep)
--
--#define pkint_divexact(a,b,c) (a).rep=(b).rep/(c).rep
--#define pkint_sgn(a) ((a).rep>0LL ? 1 : ((a).rep<0LL ? (-1) : 0))
--#define pkint_cmp(a,b) ((a).rep>(b).rep ? 1 : ((a).rep==(b).rep ? 0 : -1))
--#define pkint_cmp_si(a,b) ((a).rep>(b) ? 1 : ((a).rep==(b) ? 0 : -1))
--#define pkint_cmp_ui(a,b) ((a).rep>(b) ? 1 : ((a).rep==(b) ? 0 : -1))
--#define pkint_print(a) printf("% 3lld",(a).rep)
--#define pkint_get_si(a) (signed long int)((a).rep)
--#define pkint_get_ui(a) (unsigned long int)((a).rep)
--#define pkint_set_str10(a,b) (a).rep=atoll(b)
--#define pkint_sizeinbase10(a) (3*sizeof(pkint_t)+2)
--static inline char* pkint_get_str10(char* str, pkint_t x)
--{
--  if (str==0){
--    str = malloc(3*sizeof(pkint_t)+2);
--  }
--  sprintf(str,"%lld",x.rep);
--  return str;
--}
--
--/* %========================================================================= */
--/* \section{Interface for \texttt{pkint\_t = mpz\_t}} */
--/* %========================================================================= */
--
--#elif POLKA_NUM==3
--
--#include "gmp.h"
--
--typedef struct pkint_t {
--  mpz_t rep;
--} pkint_t;
--
--#define pkint_init(a) mpz_init((a).rep)
--#define pkint_init_set(a,b) mpz_init_set((a).rep,(b).rep)
--#define pkint_init_set_ui(a,b) mpz_init_set_ui((a).rep,(b))
--#define pkint_init_set_si(a,b) mpz_init_set_si((a).rep,(b))
--#define pkint_clear(a) mpz_clear((a).rep)
--#define pkint_set(a,b) mpz_set((a).rep,(b).rep)
--#define pkint_set_ui(a,b) mpz_set_ui((a).rep,(b))
--#define pkint_set_si(a,b) mpz_set_si((a).rep,(b))
--#define pkint_add(a,b,c) mpz_add((a).rep,(b).rep,(c).rep)
--#define pkint_sub(a,b,c) mpz_sub((a).rep,(b).rep,(c).rep)
--#define pkint_neg(a,b) mpz_neg((a).rep,(b).rep)
--#define pkint_mul(a,b,c) mpz_mul((a).rep,(b).rep,(c).rep)
--#define pkint_div(a,b,c) mpz_tdiv_q((a).rep,(b).rep,(c).rep)
--#define pkint_mod(a,b,c) mpz_tdiv_r((a).rep,(b).rep,(c).rep)
--#define pkint_abs(a,b) mpz_abs((a).rep,(b).rep)
--#define pkint_gcd(a,b,c) mpz_gcd((a).rep,(b).rep,(c).rep)
--#define pkint_divexact(a,b,c) mpz_divexact((a).rep,(b).rep,(c).rep)
--#define pkint_sgn(a) mpz_sgn((a).rep)
--#define pkint_cmp(a,b) mpz_cmp((a).rep,(b).rep)
--#define pkint_cmp_ui(a,b) mpz_cmp_ui((a).rep,(b))
--#define pkint_cmp_si(a,b) mpz_cmp_si((a).rep,(b))
--#define pkint_get_ui(a) mpz_get_ui((a).rep)
--#define pkint_get_si(a) mpz_get_si((a).rep)
--#define pkint_set_str10(a,b) mpz_set_str((a).rep,(b),10)
--#define pkint_sizeinbase10(a) mpz_sizeinbase((a).rep,10)
--#define pkint_get_str10(str,a) mpz_get_str((str),10,(a).rep)
--
--/*static inline void pkint_print(pkint_t a)
--{
--  int n;
--  char* s = mpz_get_str(0,10,a.rep);
--  n = 3-strlen(s);
--  while(n>0){
--    fputc(' ',stdout);
--    n--;
--  }
--  fputs(s,stdout);
--}*/
--
--#else
--#error "symbol POLKA_NUM not properly defined: neither LONG, LONGLONG, GMP"
--#endif
--#else
--#error "symbol POLKA_NUM not defined"
--#endif
--
--#endif

end -- class PKINT_EXTERNALS
