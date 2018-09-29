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
  Miscellaneous Notes:
  We are currently using the old signal() system call instead of
  the preferred sigaction() call.

  On Linux systems at least, signal() is implemented using sigaction()
  so it doesn't really matter.  Need to investigate this on other
  Unix systems.

  James Graves (ansible@xnet.com)
*/

/*
   Top of the rescue context stack (or NULL if there is no current
   context) :
*/
TLS(struct rescue_context*) rescue_context_top = NULL;

/*
   Set to nonzero if the exception was internally generated, as with an
   assertion violation.  It is Os_signal (11) for an OS signal.
*/
TLS(int) internal_exception_number = 0;
TLS(int) original_internal_exception_number = 0;

/*
   Set to nonzero if the exception was a signal (external).  It is 0
   for an internal exception.
*/
TLS(int) signal_exception_number = 0;

/*
   Used by some internal exceptions to print additional debugging
   information when the exception is not handled and a dump is done.
*/
TLS(char*) additional_error_message = NULL;

static void critical_error_exit(void) {
/* This is called whenever a critical error in Liberty Eiffel
   is encountered.  This kind of error cannot be handled by the
   exception handler.

   For instance, this routine is called if there is an error in the
   operation of the exception handler routines themselves.
*/
  fprintf(SE_ERR, "There was a critical error in the SmartEiffel runtime.\n");
  exit(EXIT_FAILURE);
}

void setup_signal_handler() {
/*
  Sets up the reception of signals.  If exception handling is enabled
  (by the existance of a rescue clause somewhere), then all OS signals
  now go to exception_handler instead of se_print_run_time_stack().
*/
#ifdef SIG_ERR
/* Check signal() call for errors.  Posix compliant systems should
   define SIG_ERR which is returned by signal() on an error. All Unix
   signals are included except SIGABRT, SIGKILL and SIGSTOP.

   The other signals SmartEiffel traps for
   other OSs (like SIGBREAK) are not included here, but are below
   in the #else part, for non-Posix systems.
*/

#ifdef SIGHUP
   if ( SIG_ERR == signal( SIGHUP, signal_exception_handler ) ) {
      fprintf(SE_ERR, "Error setting up signal handler for SIGHUP.\n");
      critical_error_exit();
      }
#endif

#ifdef SIGINT
   if ( SIG_ERR == signal( SIGINT, signal_exception_handler ) ) {
      fprintf(SE_ERR, "Error setting up signal handler for SIGINT.\n");
      critical_error_exit();
      }
#endif

#ifdef SIGQUIT
   if ( SIG_ERR == signal( SIGQUIT, signal_exception_handler ) ) {
      fprintf(SE_ERR, "Error setting up signal handler for SIGQUIT.\n");
      critical_error_exit();
      }
#endif

#ifdef SIGILL
   if ( SIG_ERR == signal( SIGILL, signal_exception_handler ) ) {
      fprintf(SE_ERR, "Error setting up signal handler for SIGILL.\n");
      critical_error_exit();
      }
#endif

#ifdef SIGTRAP
   if ( SIG_ERR == signal( SIGTRAP, signal_exception_handler ) ) {
      fprintf(SE_ERR, "Error setting up signal handler for SIGTRAP.\n");
      critical_error_exit();
      }
#endif

#ifdef SIGIOT
   if ( SIG_ERR == signal( SIGIOT, signal_exception_handler ) ) {
      fprintf(SE_ERR, "Error setting up signal handler for SIGIOT.\n");
      critical_error_exit();
      }
#endif

#ifdef SIGBUS
   if ( SIG_ERR == signal( SIGBUS, signal_exception_handler ) ) {
      fprintf(SE_ERR, "Error setting up signal handler for SIGBUS.\n");
      critical_error_exit();
      }
#endif

#ifdef SIGFPE
   if ( SIG_ERR == signal( SIGFPE, signal_exception_handler ) ) {
      fprintf(SE_ERR, "Error setting up signal handler for SIGFPE.\n");
      critical_error_exit();
      }
#endif

#ifdef SIGUSR1
   if ( SIG_ERR == signal( SIGUSR1, signal_exception_handler ) ) {
      fprintf(SE_ERR, "Error setting up signal handler for SIGUSR1.\n");
      critical_error_exit();
      }
#endif

#ifdef SIGSEGV
   if ( SIG_ERR == signal( SIGSEGV, signal_exception_handler ) ) {
      fprintf(SE_ERR, "Error setting up signal handler for SIGSEGV.\n");
      critical_error_exit();
      }
#endif

#ifdef SIGUSR2
   if ( SIG_ERR == signal( SIGUSR2, signal_exception_handler ) ) {
      fprintf(SE_ERR, "Error setting up signal handler for SIGUSR2.\n");
      critical_error_exit();
      }
#endif

#ifdef SIGALRM
   if ( SIG_ERR == signal( SIGALRM, signal_exception_handler ) ) {
      fprintf(SE_ERR, "Error setting up signal handler for SIGALRM.\n");
      critical_error_exit();
      }
#endif

#ifdef SIGTERM
   if ( SIG_ERR == signal( SIGTERM, signal_exception_handler ) ) {
      fprintf(SE_ERR, "Error setting up signal handler for SIGTERM.\n");
      critical_error_exit();
      }
#endif

/* SIGCHLD is ignored */

/* SIGPIPE is ignored */

/* SIGCONT is ignored */

/* SIGTSTP is ignored */

/* SIGTTIN is ignored */

/* SIGTTOU is ignored */

/* SIGURG is ignored */

#ifdef SIGXCPU
   if ( SIG_ERR == signal( SIGXCPU, signal_exception_handler ) ) {
      fprintf(SE_ERR, "Error setting up signal handler for SIGXCPU.\n");
      critical_error_exit();
      }
#endif

#ifdef SIGXFSZ
   if ( SIG_ERR == signal( SIGXFSZ, signal_exception_handler ) ) {
      fprintf(SE_ERR, "Error setting up signal handler for SIGXFSZ.\n");
      critical_error_exit();
      }
#endif

/* SIGVTALRM is ignored */

/* SIGPROF is ignored */

/* SIGWINCH is ignored */

/* SIGIO is ignored */

/* SIGPWR is ignored */

#else   /* SIG_ERR is ignored */

/* These don't check return code for the signal() OS call.  Bad practice,
   but what can be done?  */

#ifdef SIGBREAK
   /* This signal does not exist on Unix systems. */
   signal( SIGBREAK, signal_exception_handler );
#endif

#ifdef SIGHUP
   signal( SIGHUP, signal_exception_handler );
#endif

#ifdef SIGINT
   signal( SIGINT, signal_exception_handler );
#endif

#ifdef SIGQUIT
   signal( SIGQUIT, signal_exception_handler );
#endif

#ifdef SIGILL
   signal( SIGILL, signal_exception_handler );
#endif

#ifdef SIGTRAP
   signal( SIGTRAP, signal_exception_handler );
#endif

#ifdef SIGIOT
   signal( SIGIOT, signal_exception_handler );
#endif

#ifdef SIGBUS
   signal( SIGBUS, signal_exception_handler );
#endif

#ifdef SIGFPE
   signal( SIGFPE, signal_exception_handler );
#endif

#ifdef SIGUSR1
   signal( SIGUSR1, signal_exception_handler );
#endif

#ifdef SIGSEGV
   signal( SIGSEGV, signal_exception_handler );
#endif

#ifdef SIGUSR2
   signal( SIGUSR2, signal_exception_handler );
#endif

/* SIGPIPE is ignored */

#ifdef SIGALRM
   signal( SIGALRM, signal_exception_handler );
#endif

#ifdef SIGTERM
   signal( SIGTERM, signal_exception_handler );
#endif

/* SIGCHLD is ignored */

/* SIGCONT is ignored */

#ifdef SIGSTOP
   /* This should also silently fail on all Unix systems, but it may
      be effective on other OSs. */
   signal( SIGSTOP, signal_exception_handler );
#endif

/* SIGTSTP is ignored */

/* SIGTTIN is ignored */

/* SIGTTOU is ignored */

/* SIGURG is ignored */

#ifdef SIGXCPU
   signal( SIGXCPU, signal_exception_handler );
#endif

#ifdef SIGXFSZ
   signal( SIGXFSZ, signal_exception_handler );
#endif

/* SIGTALRM is ignored */

/* SIGPROF is ignored */

/* SIGWINCH is ignored */

/* SIGIO is ignored */

/* SIGPWR is ignored */

#endif  /* ifdef SIG_ERR */

}

#ifndef SE_BOOST
static void _free_exception_frames(se_dump_stack** p_ds) {
  se_dump_stack* ds = *p_ds;
  se_dump_stack* next;
  se_dump_stack* exc;
  while (ds != NULL) {
    next = ds->caller;
    exc = ds->exception_origin;
    if (exc != NULL) {
      _free_exception_frames(&exc);
    }
    se_delete_dump_stack(ds);
    ds=next;
  }
  *p_ds=NULL;
}

void free_exception_frames(void) {
  if (se_dst != NULL) {
    _free_exception_frames(&(se_dst->exception_origin));
  }
}

static se_dump_stack* clone_se_dst(int *can_allocate, se_dump_stack* ds) {
  se_dump_stack* result = NULL;

  if (*can_allocate) {
    result = se_new_dump_stack(se_dst);
    if (result == NULL) {
      *can_allocate = 0;
    }
    else if (ds != NULL) {
      ds->caller = result;
    }
  }

  return result;
}

static void reset_assertion_checking(struct rescue_context * current_context) {
  /* Unwind the dump stack, resetting assertion checking when a rescue
     clause is invoked.
     This function must be called just before the LONGJMP to the
     enclosing rescue context.
  */
  se_dump_stack* ds     = se_dst->exception_origin;
  se_dump_stack* x_ds   = NULL;
  se_dump_stack* dst    = current_context->top_of_ds;
  int can_allocate = 1;

  if ( internal_exception_number == Routine_failure ) {
    if (original_internal_exception_number == No_more_memory) can_allocate = 0;
  }
  else {
    if (internal_exception_number == No_more_memory) can_allocate = 0;
  }
  if (!can_allocate) {
    fprintf(SE_ERR, "No more memory: the stack trace may be truncated.\n");
  }

  x_ds = ds = clone_se_dst(&can_allocate, ds);
  while (se_dst != dst) {
    if (se_dst->fd != NULL) se_dst->fd->assertion_flag=1;
    se_dst = se_dst->caller;
    _free_exception_frames(&(se_dst->exception_origin));

    /* Done last, to be sure to also keep a clone of the current
       se_dst because the rescue clause may change the position and
       locals of se_dst: */
    ds = clone_se_dst(&can_allocate, ds);
  }

  se_dst->exception_origin = x_ds;
}
#endif

void signal_exception_handler(int signal_number) {
  /* Set up to be called whenever an OS signal has been received.
     Checks to see if there is a rescue clause active (somewhere on the
     call stack), and if so, transfer control to that.
  */
  struct rescue_context *current_context;

#ifdef SIG_ERR
  /* some OS implementations automatically block a signal while
   * executing the signal handler, but some do not. */
  if ( SIG_ERR == signal( signal_number, SIG_IGN ) ) {
    fprintf(SE_ERR, "In signal_exception_handler: ");
    fprintf(SE_ERR, "Error turning off signal %d.\n", signal_number );
    critical_error_exit();
  }
#else
  signal( signal_number, SIG_IGN );
#endif

  internal_exception_number = Os_signal;
  original_internal_exception_number = 0;
  signal_exception_number = signal_number;

  if ( rescue_context_top != NULL ) {
    current_context = rescue_context_top;
    rescue_context_top = rescue_context_top->next;

    /* now re-enable that signal */
#ifdef SIG_ERR
    if ( SIG_ERR == signal( signal_number, signal_exception_handler ) ) {
      fprintf(SE_ERR, "In signal_exception_handler: ");
      fprintf(SE_ERR, "Error turning on signal %d.\n", signal_number );
      critical_error_exit();
    }
#else
    signal( signal_number, signal_exception_handler );
#endif

#ifndef SE_BOOST
    /* Unwind dump_stack structures PRIOR to jumping :
     */
    reset_assertion_checking(current_context) ;
#endif

    handle(SE_HANDLE_EXCEPTION_THROWN, current_context);
    LONGJMP( current_context->jb, internal_exception_number );
  }

  /* No current rescue clause, exit with a dump or debug: */
  handle(SE_HANDLE_EXCEPTION_THROWN, current_context);
#ifdef SE_SEDB
  print_exception();
  error0("Exception not handled",0);
#else
  print_exception();
  se_print_run_time_stack();
  print_exception();
  exit(EXIT_FAILURE);
#endif
}

void internal_exception_handler(int exception_number) {
  /* Called whenever an internal (to SmartEiffel) exception is to
     be raised (`raise' feature, assertion violation, etc.).

     Checks to see if there is a current rescue clause (somewhere
     in the call stack), and transfers control to it.
     Else exit with a stack trace (if enabled).
  */
  struct rescue_context *current_context;

  /* UNCOMMENT THIS PART TO DEBUG WITH EXCEPTION:
     print_exception(); se_print_run_time_stack();
  */



  /* If this is not a routine failure, clear out old exception
   * information. */
  if ( exception_number != Routine_failure ) {
    internal_exception_number = exception_number;
    original_internal_exception_number = 0;
    signal_exception_number = 0;
  }
  else {
    original_internal_exception_number = internal_exception_number;
  }

  if ( rescue_context_top != NULL ) {
    current_context = rescue_context_top;
    rescue_context_top = rescue_context_top->next;
#ifndef SE_BOOST
    /* Unwind dump_stack structures PRIOR to jumping :
     */
    reset_assertion_checking(current_context) ;
#endif

    handle(SE_HANDLE_EXCEPTION_THROWN, current_context);
    LONGJMP( current_context->jb, exception_number );
  }

  /* No current rescue clause, exit with a dump : */
  handle(SE_HANDLE_EXCEPTION_THROWN, current_context);
#ifdef SE_SEDB
  print_exception();
  error0("Exception not handled",0);
#else
  print_exception();
  se_print_run_time_stack();
  print_exception();
  exit(EXIT_FAILURE);
#endif
}

#ifndef SE_BOOST
static void print_exception_case( int ex_num ) {
  switch( ex_num ) {
  case Check_instruction:
    fprintf(SE_ERR, "Check instruction failed.\n");
    break;
  case Class_invariant:
    fprintf(SE_ERR, "Class invariant not maintained.\n");
    break;
  case Developer_exception:
    fprintf(SE_ERR, "Developer exception:\n");
    break;
  case Incorrect_inspect_value:
    fprintf(SE_ERR, "Incorrect inspect value.\n");
    break;
  case Loop_invariant:
    fprintf(SE_ERR, "Loop invariant failed.\n");
    break;
  case Loop_variant:
    fprintf(SE_ERR, "Loop variant failed to decrease.\n");
    break;
  case No_more_memory:
    fprintf(SE_ERR, "Failed to allocate additional memory.\n");
    break;
  case Postcondition:
    fprintf(SE_ERR, "Postcondition (ensure clause) failed.\n");
    break;
  case Precondition:
    fprintf(SE_ERR, "Precondition (require clause) failed.\n");
    break;
  case Routine_failure:
    fprintf(SE_ERR, "Routine failure.\n");
    break;
  case Os_signal:
    fprintf(SE_ERR, "OS Signal (%d) received.\n",
            signal_exception_number );
    break;
  case Void_attached_to_expanded:
    fprintf(SE_ERR, "A Void became attached to an expanded object.\n");
    fprintf(SE_ERR, "Please report this problem to the Liberty Eiffel team.\n");
    break;
  case Void_call_target:
    fprintf(SE_ERR, "Feature call attempted on a Void reference.\n");
    break;
  case System_level_type_error:
    fprintf(SE_ERR, "System-level type error (probably a bad covariant call).\n");
    break;
  default:
    fprintf(SE_ERR, "There was an unknown exception.\n");
    fprintf(SE_ERR, "Please report this problem to the Liberty Eiffel team.\n");
  }
}
#endif

void print_exception(void) {
  /* Display some information about last not handled exception. */
#ifndef SE_BOOST
  fprintf(SE_ERR,"Exception number %d not handled.\n",internal_exception_number);
  if ( internal_exception_number == Routine_failure ) {
    fprintf(SE_ERR, "Routine failure.  Original exception: \n");
    print_exception_case( original_internal_exception_number );
  }
  else {
    print_exception_case( internal_exception_number );
  }
  if ( additional_error_message != NULL ) {
    fprintf(SE_ERR, "%s\n", additional_error_message );
  }
#endif
}
