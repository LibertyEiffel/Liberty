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
  This file (SmartEiffel/sys/runtime/sedb.h) is automatically included when
  `run_control.no_check' is true (ie. all modes except -boost).
  This file comes after no_check.[hc] to implements the -sedb flag.
*/
#define SE_SEDB 1

#ifdef SEDB_NAMED_PIPES
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#endif

/*
   List of possible values for the `sedb_status' variable:

   SEDB_RUNNING_STATUS: we are in running mode.
   SEDB_STEP_BY_STEP: we are in step-by-step mode.
   SEDB_START_STATUS: to start with on-line-help.
   SEDB_WAITING_KBD: waiting for keyboard input.
   SEDB_EXIT_MODE: to be sure to exit (atexit may be called).
   SEDB_TRACE_FILE: when profiling on the "trace.se" file.
   SEDB_FINISH_CMD: waiting the end of the routine ('f' command).
   SEDB_NEXT_CMD: single step at the same level ('n' command).

 */
enum sedb_status_values {
  SEDB_RUNNING_STATUS= 1,
  SEDB_RUNNING_IGNORE_BREAKPOINTS,
  SEDB_STEP_BY_STEP,
  SEDB_START_STATUS,
  SEDB_WAITING_KBD,
  SEDB_EXIT_MODE,
  SEDB_TRACE_FILE,
  SEDB_FINISH_CMD,
  SEDB_NEXT_CMD
};

extern enum sedb_status_values sedb_status;

void sedb(se_dump_stack*ds,se_position position, char info_code);
void sedb_breakpoint(se_dump_stack*ds,se_position position);
void sedb_break(se_dump_stack*ds,se_position position);
void sedb_signal_handler(int sig);
void sedb_duplicate(void);
