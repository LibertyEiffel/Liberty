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
#include <time.h>

#define basic_time ((EIF_INTEGER_64)time(NULL))
EIF_REAL_64 time_difftime(time_t t2, time_t t1);
EIF_INTEGER time_getyear(time_t t, EIF_INTEGER m);
EIF_INTEGER time_getmonth(time_t t, EIF_INTEGER m);
EIF_INTEGER time_getday(time_t t, EIF_INTEGER m);
EIF_INTEGER time_gethour(time_t t, EIF_INTEGER m);
EIF_INTEGER time_getminute(time_t t, EIF_INTEGER m);
EIF_INTEGER time_getsecond(time_t t, EIF_INTEGER m);
EIF_INTEGER time_getyday(time_t t, EIF_INTEGER m);
EIF_INTEGER time_getwday(time_t t, EIF_INTEGER m);
EIF_BOOLEAN time_is_summer_time_used(time_t t);
EIF_INTEGER_64 time_mktime(EIF_INTEGER year, EIF_INTEGER mon,
                           EIF_INTEGER mday, EIF_INTEGER hour,
                           EIF_INTEGER min,  EIF_INTEGER sec);
void time_add_second(EIF_INTEGER_64 *t, EIF_INTEGER s);
