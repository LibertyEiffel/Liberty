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
  This file (SmartEiffel/sys/runtime/no_check.h) is automatically included
  when `ace.no_check' is true (ie. all modes except mode -boost).
*/

void se_prinT0(FILE* file,T0** o);
void se_prinT1(FILE* file,EIF_INTEGER_8* o);
void se_prinT2(FILE* file,EIF_INTEGER* o);
void se_prinT3(FILE* file,EIF_CHARACTER* o);
void se_prinT4(FILE* file,EIF_REAL_32* o);
void se_prinT5(FILE* file,EIF_REAL_64* o);
void se_prinT12(FILE* file,EIF_REAL_EXTENDED* o);
void se_prinT6(FILE* file,EIF_BOOLEAN* o);
void se_prinT7(FILE* file,EIF_STRING* o);
void se_prinT8(FILE* file,EIF_POINTER* o);
void se_prinT10(FILE* file,EIF_INTEGER_16* o);
void se_prinT11(FILE* file,EIF_INTEGER_64* o);

/*
   This type is used to store a position in some Eiffel source file.
   It must be compatible with the implementation of class POSITION.
*/
typedef unsigned int se_position;

#define se_position2line(position) (((position) & 1) \
  ? ((EIF_INTEGER)(((position) >> 1) & 0x7FFF)) \
  : ((EIF_INTEGER)(((position) >> 8) & 0x1FFF)))

#define se_position2column(position) (((position) & 1) \
  ? 0 \
  : ((EIF_INTEGER)(((position) >> 1) & 0x7F)))

#define se_position2path_id(position) (((position) & 1) \
  ? ((position) >> 17) \
  : ((position) >> 21))

/*
  To be able to print a stack frame in a human readable format :
*/
typedef struct _se_frame_descriptor se_frame_descriptor;
struct _se_frame_descriptor {
  char* name; /* Eiffel name of the routine. */
  int use_current; /* Flag is 1 when this routine use Current. */
  int local_count; /* Number of C variables to print. */
  char* local_format; /* Format/type information. */
  int assertion_flag; /* 1 when assertions can be checked. */
};

/* For flat_check opion */
extern TLS(int) assertion_depth;

/*
  To keep the track of execution in order to be able to print a
  dump when things goes wrong :
*/
typedef struct _se_dump_stack se_dump_stack;
struct _se_dump_stack {
  se_frame_descriptor* fd;
  void* current; /* NULL when not used. */
  se_position p; /* The current position. */
  se_dump_stack* caller; /* Back to the caller. */
  se_dump_stack* exception_origin; /* The exception origin if we are handling an exception. That object was malloc'ed */
  void*** locals;
  int depth;
};

extern TLS(se_dump_stack*) se_dst;
#define set_se_dst(ds) do { if (!se_dst) (ds)->depth = 1; else if (se_dst->caller != (ds)) (ds)->depth = se_dst->depth+1; se_dst=(ds); } while (0)

int se_stack_size(se_dump_stack* ds);
void se_print_run_time_stack(void);
void se_print_run_time_stack_in(FILE* file, se_dump_stack* top, se_dump_stack* cur, int is_compact);
int se_print_one_frame(se_dump_stack*ds);
int se_print_one_frame_in(FILE* file, se_dump_stack*ds, se_dump_stack* cur, int is_compact);

int se_rci(se_dump_stack*caller,void*C);
void error0(char*m,char*vv);
#ifndef SE_SEDB
NO_RETURN
#endif
void error1(char*m,se_position position);
void error2(T0* o,se_position position);
T0* vc(T0* o, se_position position);
T0* se_string_inspect_check(T0* o, se_position position);
T0* ci(int id, T0* o, se_position position);
void ac_req(int v, char* vv);
void ac_ens(int v, char* vv);
void ac_inv(int v, char* vv);
void ac_liv(int v, char* vv);
void ac_insp(int v);
int ac_lvc(int lc,int lv1,int lv2);
void ac_civ(int v,char*vv);
T0* se_evobt(T0* o,se_position position);
void se_signal_handler(int sig);
void se_gc_check_id(void*o,int id);

/* The two following instructions are used by the exceptions system to keep
   the stack trace when jumping back to the retry clause */
se_dump_stack* se_new_dump_stack(se_dump_stack* copy);
void se_delete_dump_stack(se_dump_stack* ds);

#define set_dump_stack_top(ds) do {                 \
    se_dump_stack *ds0 = (ds);                      \
    if (ds0) set_se_dst(ds0); else se_dst=(void*)0; \
  } while(0)
