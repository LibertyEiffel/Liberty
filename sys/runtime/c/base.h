/*
-- ------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2005: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
-- documentation files (the "Software"), to deal in the Software without restriction, including without
-- limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
-- the Software, and to permit persons to whom the Software is furnished to do so, subject to the following
-- conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
-- AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
-- OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------
*/
/*
  This file (Liberty/sys/runtime/base.h) contains all basic Eiffel
  type definitions.
  This file is automatically included in the header for all modes of
  compilation: -boost, -no_check, -require_check, -ensure_check, ...
  This file is also included in the header of any cecil file (when the
  -cecil option is used).
  This file is also included in the header file of C++ wrappers (when
  using the external "C++" clause).
*/

#ifndef _BASE_H
#define _BASE_H

#if defined(_MSC_VER) && (_MSC_VER >= 1400)       /* VC8+ */
# ifndef _CRT_SECURE_NO_DEPRECATE
#  define _CRT_SECURE_NO_DEPRECATE
# endif
# ifndef _CRT_NONSTDC_NO_DEPRECATE
#  define _CRT_NONSTDC_NO_DEPRECATE
# endif
#endif   /* VC8+ */

#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>
#include <signal.h>
#include <stddef.h>
#include <stdarg.h>
#include <limits.h>
#include <float.h>
#include <setjmp.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#if defined __USE_POSIX || defined __unix__ || defined _POSIX_C_SOURCE
#  include <unistd.h>
#endif
#if !defined(WIN32) && \
           (defined(WINVER) || defined(_WIN32_WINNT) || defined(_WIN32) || \
                defined(__WIN32__) || defined(__TOS_WIN__) || defined(_MSC_VER))
#  define WIN32 1
#endif
#ifdef WIN32
#  include <windows.h>
#endif
#ifdef SE_THREAD
#ifdef WIN32
#  define TLS(type) __declspec(thread) type
#else
#  ifndef O_RDONLY
#    include <sys/file.h>
#  endif
#  ifndef O_RDONLY
#    define O_RDONLY 0000
#  endif
#  define TLS(type) __thread type
#endif
#else
#define TLS(type) type
#endif

#if defined(_MSC_VER) && (_MSC_VER < 1600) /* MSVC older than v10 */
typedef signed char int8_t;
typedef signed short int16_t;
typedef signed int int32_t;
typedef signed __int64 int64_t;
typedef unsigned char uint8_t;
typedef unsigned short uint16_t;
typedef unsigned int uint32_t;
typedef unsigned __int64 uint64_t;
#  define PRId8 "d"
#  define PRId16 "d"
#  define PRId32 "d"
#  define PRId64 "I64d"
#  define INT8_C(c) c
#  define INT16_C(c) c
#  define INT32_C(c) c
#  define INT64_C(c) c ## i64
#  define UINT8_C(c) c ## u
#  define UINT16_C(c) c ## u
#  define UINT32_C(c) c ## u
#  define UINT64_C(c) c ## ui64
#elif defined(__WATCOMC__) && (__WATCOMC__ <= 1220) /* WATCOM 12.2 or lower */
typedef signed char int8_t;
typedef signed short int16_t;
typedef signed long int int32_t;
typedef signed __int64 int64_t;
typedef unsigned char uint8_t;
typedef unsigned short uint16_t;
typedef unsigned long int uint32_t;
typedef unsigned __int64 uint64_t;
#  define PRId8 "d"
#  define PRId16 "d"
#  define PRId32 "d"
#  define PRId64 "Ld"
#  define INT8_C(c) c
#  define INT16_C(c) c
#  define INT32_C(c) c ## L
#  define INT64_C(c) c ## i64
#  define UINT8_C(c) c ## u
#  define UINT16_C(c) c ## u
#  define UINT32_C(c) c ## UL
#  define UINT64_C(c) c ## ui64
#elif defined(__BORLANDC__) && (__BORLANDC__ < 0x600) /* Borland before 6.0 */
typedef signed char int8_t;
typedef signed short int16_t;
typedef signed long int int32_t;
typedef signed __int64 int64_t;
typedef unsigned char uint8_t;
typedef unsigned short uint16_t;
typedef unsigned long int uint32_t;
typedef unsigned __int64 uint64_t;
#  define PRId8 "d"
#  define PRId16 "d"
#  define PRId32 "ld"
#  define PRId64 "I64Ld"
#  define INT8_C(c) c
#  define INT16_C(c) c
#  define INT32_C(c) c ## L
#  define INT64_C(c) c ## i64
#  define UINT8_C(c) c ## u
#  define UINT16_C(c) c ## u
#  define UINT32_C(c) c ## UL
#  define UINT64_C(c) c ## ui64
#elif defined(__FreeBSD__) && (__FreeBSD__ < 5) /* FreeBSD before 5.0 */ && !defined (_SYS_INTTYPES_H_)
typedef signed char int8_t;
typedef signed short int16_t;
typedef signed long int int32_t;
typedef signed long long int int64_t;
typedef unsigned char uint8_t;
typedef unsigned short uint16_t;
typedef unsigned long int uint32_t;
typedef unsigned long long int uint64_t;
#elif defined(__CYGWIN__) && defined(__BIT_TYPES_DEFINED__) /* Cygwin defines intxx_t in sys/types.h instead of inttypes.h */
#  include <cygwin/version.h>
#  if defined(CYGWIN_VERSION_DLL_MAJOR) && (CYGWIN_VERSION_DLL_MAJOR<1005)
typedef unsigned char uint8_t;
typedef __uint16_t uint16_t;
typedef __uint32_t uint32_t;
typedef __uint64_t uint64_t;
#  endif

#else

#  include <inttypes.h>
#  if !defined(INT8_MAX) && defined(INT16_MAX)
/* int8_t is not mandatory */
typedef int_least8_t int8_t;
#  endif
#endif

#if !defined(PRId16)
#  define PRId8 "d"
#  define PRId16 "d"
#  define PRId32 "ld"
#  define PRId64 "lld"
#elif !defined(PRId8)
#  define PRId8 "d"
#endif
#if !defined(INT16_C)
#  define INT8_C(c) c
#  define INT16_C(c) c
#  define INT32_C(c) c ## L
#  define INT64_C(c) c ## LL
#  define UINT8_C(c) c ## u
#  define UINT16_C(c) c ## u
#  define UINT32_C(c) c ## UL
#  define UINT64_C(c) c ## ULL
#elif !defined(INT8_C)
#  define INT8_C(c) c
#  define UINT8_C(c) c ## u
#endif
#if !defined(INT16_MIN)
#  define INT8_MIN (-INT8_C(127)-1)
#  define INT8_MAX (INT8_C(127))
#  define INT16_MIN (-INT16_C(32767)-1)
#  define INT16_MAX (INT16_C(32767))
#  define INT32_MIN (-INT32_C(2147483647)-1)
#  define INT32_MAX (INT32_C(2147483647))
#  define INT64_MIN (-INT64_C(9223372036854775807)-1)
#  define INT64_MAX (INT64_C(9223372036854775807))
#elif !defined(INT8_MIN)
#  define INT8_MIN (-INT8_C(127)-1)
#endif

/*
 C compiler specific declaration for non-returning functions. Use
 NO_RETURN void foo(int bar);
 to declare a function prototype for function that doesn't return.
 */
#if defined __GNUC__
#  define NO_RETURN __attribute__ ((noreturn))
#elif defined __POCC__ || defined __BORLANDC__ || defined _MSC_VER
#  define NO_RETURN __declspec(noreturn)
#else
#  define NO_RETURN
/* maybe some warning occur unless NO_RETURN is defined for your compiler */
#endif

/*
  Endian stuff
*/
#if defined(BSD) && (BSD >= 199103)
#  include <machine/endian.h>
#elif defined(linux)
#  include <endian.h>
#endif



#if !defined(BYTE_ORDER) && defined(__BYTE_ORDER)
#  define BYTE_ORDER      __BYTE_ORDER
#endif

#if !defined(LITTLE_ENDIAN) && defined(__LITTLE_ENDIAN)
#  define LITTLE_ENDIAN      __LITTLE_ENDIAN
#endif

#if !defined(BIG_ENDIAN) && defined(__BIG_ENDIAN)
#  define BIG_ENDIAN      __BIG_ENDIAN
#endif

#if !defined(LITTLE_ENDIAN)
#  define LITTLE_ENDIAN   1234    /* LSB first (vax, pc) */
#endif
#if !defined(BIG_ENDIAN)
#  define BIG_ENDIAN      4321    /* MSB first (IBM, net) */
#endif
#if !defined(PDP_ENDIAN)
#  define PDP_ENDIAN      3412    /* LSB first in word, MSW first in long */
#endif

#if !defined(BYTE_ORDER) && defined(BIT_ZERO_ON_RIGHT)
#  define BYTE_ORDER      LITTLE_ENDIAN
#elif !defined(BYTE_ORDER) && defined(BIT_ZERO_ON_LEFT)
#  define BYTE_ORDER      BIG_ENDIAN
#elif !defined(BYTE_ORDER)

/* ARM */
#  if defined(__ARMEL__)
#    define BYTE_ORDER      LITTLE_ENDIAN
#  elif defined(__ARMEB__)
#    define BYTE_ORDER      BIG_ENDIAN
#  elif defined(__arm__)
#    error "ARMs are bi-endian processors. Endianness is unknown for this system, please drop an e-mail to liberty-eiffel@gnu.org"
#  endif

/* Intel x86 */
#  if defined(i386) || defined(__i386__) || defined(__i386) || \
          defined(_M_IX86) || defined(_X86_) || defined(__THW_INTEL) || \
          defined(sun386)
#    define BYTE_ORDER      LITTLE_ENDIAN
#  endif

/* Intel Itanium */
#  if defined(__ia64__) || defined(_IA64) || defined(__IA64__) || \
          defined(_M_IA64) || defined(_M_AMD64) || defined(_M_IX86) || defined(_AMD64_)
#    define BYTE_ORDER      LITTLE_ENDIAN
#  endif

  
/* Power PC */
/* this processor is bi-endian, how to know if little-endian is set? */
#  if defined(__powerpc) || defined(__powerpc__) || defined(__POWERPC__) || \
          defined(__ppc__) || defined(__ppc) || defined(_M_PPC) || \
          defined(__PPC) || defined(__PPC__)
#    define BYTE_ORDER      BIG_ENDIAN
#  endif

/* Miscellaneous little endian */
#  if defined(wrltitan)
#    define BYTE_ORDER      LITTLE_ENDIAN
#  endif
#endif

#if !defined(BYTE_ORDER)
#  error "Unknown byte order. Add your system in above macros once you know your system type. Please drop an e-mail to liberty-eiffel@gnu.org"
#endif
#if (BYTE_ORDER != BIG_ENDIAN && BYTE_ORDER != LITTLE_ENDIAN)
#  error "Only little-endian and big-endian are valid at this time. Please drop an e-mail to liberty-eiffel@gnu.org"
#endif


/*
  Byte swapping stuff
*/
extern void copy_swap_16(const uint16_t *src, uint16_t *dest, int count);


/* Because ANSI C EXIT_* are not always defined: */
#ifndef EXIT_FAILURE
#  define EXIT_FAILURE 1
#endif
#ifndef EXIT_SUCCESS
#  define EXIT_SUCCESS 0
#endif

/*
   On Linux glibc systems, we need to use sig.* versions of jmp_buf,
   setjmp and longjmp to preserve the signal handling context.
   Currently, the way I figured to detect this is if _SIGSET_H_types has
   been defined in /usr/include/setjmp.h.

   NOTE: with gcc, -ansi is used for SmartEiffel generated files EXCEPT in
   -no_split mode. ANSI only recognizes the non-sig versions.
*/
#if (defined(_SIGSET_H_types) && !defined(__STRICT_ANSI__))
#  define JMP_BUF    sigjmp_buf
#  define SETJMP(x)  sigsetjmp( (x), 1)
#  define LONGJMP    siglongjmp
#else
#  define JMP_BUF    jmp_buf
#  define SETJMP(x)  setjmp( (x) )
#  define LONGJMP    longjmp
#endif

/*
   Type to store reference objects Id:
 */
typedef int Tid;
typedef struct S0 T0;
struct S0{Tid id;};

/*
   The default channel used to print runtime error messages:
*/
#define SE_ERR stderr

/*
   Eiffel type INTEGER_8 is #1:
*/
typedef int8_t T1;
#define EIF_INTEGER_8 T1
#define M1 (INT8_C(0))
#define EIF_INTEGER_8_BITS (CHAR_BIT)
#define EIF_MINIMUM_INTEGER_8 (INT8_MIN)
#define EIF_MAXIMUM_INTEGER_8 (INT8_MAX)

/*
  Eiffel type INTEGER_16 is #10:
*/
typedef int16_t T10;
#define EIF_INTEGER_16 T10
#define M10 (INT16_C(0))
#define EIF_INTEGER_16_BITS (CHAR_BIT*sizeof(T10t))
#define EIF_MINIMUM_INTEGER_16 (INT16_MIN) /*-32768*/
#define EIF_MAXIMUM_INTEGER_16 (INT16_MAX) /*+32767*/

/*
  Eiffel type INTEGER or INTEGER_32 is #2:
*/
typedef int32_t T2;
#define EIF_INTEGER T2
#define EIF_INTEGER_32 T2
#define M2 (INT32_C(0))
#define EIF_INTEGER_BITS ((T2)(CHAR_BIT*sizeof(T2)))
#define EIF_INTEGER_32_BITS EIF_INTEGER_BITS
#define EIF_MINIMUM_INTEGER (INT32_MIN)
#define EIF_MAXIMUM_INTEGER (INT32_MAX)

/*
  Eiffel type INTEGER_64 is #11:
*/
typedef int64_t T11;
#define EIF_INTEGER_64 T11
#define M11 (INT64_C(0))
#define EIF_INTEGER_64_BITS (CHAR_BIT*sizeof(T11))
#define EIF_MINIMUM_INTEGER_64 (INT64_MIN)
#define EIF_MAXIMUM_INTEGER_64 (INT64_MAX)

/*
  Eiffel type CHARACTER is #3:
*/
typedef unsigned char T3;
#define EIF_CHARACTER T3
#define M3 (0)
#define EIF_CHARACTER_BITS (CHAR_BIT)
#define EIF_MINIMUM_CHARACTER_CODE (0)
#define EIF_MAXIMUM_CHARACTER_CODE (255)
#define T3code(x) ((T10)(x))
#define T3to_integer(x) ((signed char)(x))
#define T3to_integer_8(x) ((signed char)(x))
#define T3to_bit(x) (x)

/*
  Eiffel type REAL_32 is #4:
*/
typedef float T4;
typedef T4 real32_t;
#define EIF_REAL_32 T4
#define M4 (0.0)
#define EIF_MINIMUM_REAL_32 (-(FLT_MAX))
#define EIF_MAXIMUM_REAL_32 (FLT_MAX)

/*
  Eiffel type REAL or REAL_64 is #5:
*/
typedef double T5;
typedef T5 real64_t;
#define EIF_REAL T5
#define EIF_REAL_64 T5
#define M5 (0.0)
#define EIF_MINIMUM_REAL_64 (-(DBL_MAX))
#define EIF_MINIMUM_REAL (EIF_MINIMUM_REAL_64)
#define EIF_MAXIMUM_REAL_64 (DBL_MAX)
#define EIF_MAXIMUM_REAL (EIF_MAXIMUM_REAL_64)

/*
  Eiffel type REAL_EXTENDED is #12:
*/
typedef long double T12;
typedef T12 real_extended_t;
#define EIF_REAL_EXTENDED T12
#define EIF_REAL_128 T12
#define M12 (0.0)
#define EIF_MINIMUM_REAL_EXTENDED (-(DBL_MAX))
#define EIF_MAXIMUM_REAL_EXTENDED (DBL_MAX)

/*
  Eiffel type BOOLEAN is #6:
*/
typedef char T6;
#define EIF_BOOLEAN T6
#define M6 (0)
#define EIF_BOOLEAN_BITS (CHAR_BIT)

/*
   Eiffel type POINTER is #8:
*/
typedef void* T8;
#define EIF_POINTER T8
/* Sometimes, NULL is defined as 0 */
#define M8 ((void*)NULL)
#define EIF_POINTER_BITS (CHAR_BIT*sizeof(void*))

/*
  To use type STRING on the C side:
*/
#define EIF_STRING T7*

/*
  Some Other EIF_* defined in ETL:
*/
#define eif_access(x) ((char*)(x))
#define EIF_REFERENCE T0*
#define EIF_OBJ T0*
#define EIF_OBJECT EIF_OBJ
#define EIF_ANY EIF_OBJ

/*
   Wrappers for `malloc' and `calloc':
*/
void se_check_malloc(const void*result, const char*format, ...);
void* se_malloc(size_t size);
void* se_calloc(size_t nmemb, size_t size);
void* se_realloc(void* src, size_t size);
void* se_malloc_(size_t size, void*(*alloc)(size_t));
void* se_calloc_(size_t nmemb, size_t size, void*(*alloc)(size_t,size_t));

/*
   die method.
 */
void se_die(int code);

/*
        Runtime hooks. They allow different runtime modules to be quite independant. In time, they will also allow
        thread-safe operations.

        Currently known modules:
          - boost
          - no_check
          - sedb
          - gc
          - print stack
          - profile
          - plugins

        However, currently only profile uses this method. It will be extended to other modules later.

        The currently defined hooks are described in the enum below (the names should be self-explanatory).
 */
typedef enum {
  SE_HANDLE_EXCEPTION_SET, /* called when an exception handler is set, prior to SETJMP */
  SE_HANDLE_EXCEPTION_CLEAR, /* called when a feature with an exception handler normally returns */
  SE_HANDLE_EXCEPTION_THROWN, /* called when an exception is thrown, prior to the LONGJMP */
  SE_HANDLE_ENTER_GC, /* called when gc_start() begins */
  SE_HANDLE_EXIT_GC, /* called when gc_start() ends */
  SE_HANDLE_ENTER_PRINT_STACK, /* called when se_print_run_time_stack() begins */
  SE_HANDLE_EXIT_PRINT_STACK, /* called when se_print_run_time_stack() ends */
  SE_HANDLE_NO_MORE_MEMORY, /* called by se_alloc() and co */
  SE_HANDLE_SEDB_BREAK, /* called when sedb stops the program */
  SE_HANDLE_SEDB_CONTINUE, /* called when sedb continues the program */
  SE_HANDLE_RUNTIME_ERROR, /* called when a runtime error is raised and not caught by an exception. Cannot be raised in boost mode. */
  SE_HANDLE_DIE_WITH_CODE, /* called when the program is stopped by the die_with_code feature. The data points to the int code. */
  SE_HANDLE_NORMAL_EXIT /* called when the program correctly terminates. The data is null. */
} se_handler_action_t;

extern int handlers_count;
typedef void se_runtime_handler_t(se_handler_action_t action, void*data);
void register_handler(se_runtime_handler_t*handler);
void _handle(se_handler_action_t action, void*data);

#define handle(action,data) do{if(handlers_count>0)_handle(action,data);}while(0)

#endif /* #ifndef _BASE_H */
