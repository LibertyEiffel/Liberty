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
  This file (SmartEiffel/sys/runtime/c_plus_plus.h) is included in the
  header of C++ wrappers (when some external "C++" is in the live code).
*/

/*
  Following definitions MUST remain compatible with definitions
  of SmartEiffel/sys/runtime/base.h.
*/
#ifndef _SE_C_PLUS_PLUS
#  define _SE_C_PLUS_PLUS 1
  typedef int Tid;
  typedef struct S0 T0;
  struct S0{Tid id;};
  typedef int T2;
  typedef unsigned char T3;
  typedef float T4;
  typedef double T5;
  typedef char T6;
  typedef void* T8;

  /*
    Some EIF_* defined in ETL :
  */
#  define EIF_BOOLEAN T6
#  define EIF_CHARACTER T3
#  define EIF_INTEGER T2
#  define EIF_REAL T4
#  define EIF_DOUBLE T5
#  define EIF_POINTER T8
#  define EIF_REFERENCE T0*
#  define EIF_OBJ T0*
#  define EIF_OBJECT EIF_OBJ
#endif
