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
TLS(EIF_INTEGER) basic_microsecond_microsecond = 0;
TLS(EIF_INTEGER_64) basic_microsecond_time = 0;

void _basic_microsecond_update(void) {
#ifndef WIN32
  struct timeval t;

  gettimeofday (&t, NULL);
  basic_microsecond_time = t.tv_sec;
  basic_microsecond_microsecond = t.tv_usec;
#else
  static DWORD ref_uptime = -1; /* max value as ref_uptime is unsigned */
  static time_t ref_time;
  DWORD uptime;

  /*  uptime = timeGetTime();*/
  uptime = GetTickCount();

  if (uptime < ref_uptime) {
    /* !!! this test manages first call AND 50th day ;-)  */
    ref_uptime = uptime;
    time(&ref_time);
  }

  basic_microsecond_time = ref_time + (uptime - ref_uptime)/1000;
  basic_microsecond_microsecond = ((uptime - ref_uptime) % 1000) * 1000;
#endif
}
