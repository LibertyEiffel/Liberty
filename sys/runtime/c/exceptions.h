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
#define SE_EXCEPTIONS 1

/*
  Constants from Eiffel class EXCEPTIONS :
*/
#define Check_instruction         1
#define Class_invariant           2
#define Developer_exception       3
#define Incorrect_inspect_value   4
#define Loop_invariant            5
#define Loop_variant              6
#define No_more_memory            7
#define Postcondition             8
#define Precondition              9
#define Routine_failure           10
#define Os_signal                 11
#define Void_attached_to_expanded 12
#define Void_call_target          13
#define System_level_type_error   14

/*
   This will be the structure of rescue contexts.  A rescue context
   will be declared for every routine that has a rescue clause.

   The `next' pointer is the address of the next rescue context if there
   is one higher up the call chain, or NULL if there is no other
   context.
*/
struct rescue_context {
  JMP_BUF jb;
#ifndef SE_BOOST
    /* To keep track of dump stack to unwind it safely
       before the LONGJMP :
    */
    struct _se_dump_stack * top_of_ds ;
#endif
  struct rescue_context *next;
};

extern TLS(struct rescue_context*) rescue_context_top;
extern TLS(int                   ) internal_exception_number;
extern TLS(int                   ) original_internal_exception_number;
extern TLS(int                   ) signal_exception_number;
extern TLS(char*                 ) additional_error_message;

void setup_signal_handler(void);
void signal_exception_handler(int);
void internal_exception_handler(int);
void print_exception(void);

#ifndef SE_BOOST
void free_exception_frames(void);
#endif
