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
  This file (SmartEiffel/sys/runtime/c/profile.h) is automatically included when
  doing profiling (option -profile)
*/

/*
 * HOW DOES PROFILING WORK:
 *
 * When compile_to_c is called with the -profile option, each C function corresponding to an Eiffel feature is
 * instrumented (see PITFALLS below).
 *
 * Each function is equipped with two time pairs (start/stop): "own" which counts the elapsed time in the
 * function itself, and "cumul" which also counts the time elapsed in nested calls.
 *
 * The mechanics of the "cumul" time are easily understood: just note the current time at the beginning of the
 * function, the one at the end, subtract, and add to the function "cumul" counter.
 *
 * The gears of the "own" time are quite as simple. When a function finished, it just tells its caller how
 * much time passed since it started. Recording the "own" time of a function is then just a matter of
 * subtracting the cumulative times of the called routines.
 *
 * We also have to deal with call cycles; the simplest ones being recursive functions. The profiling structure
 * is split in two parts: a static part, containing the total counters, and local parts (technically: on the
 * stack) which record the start/stop times.
 *
 * The profiling framework allows for a precision to the microsecond. POSIX demands nanos, though I'm not
 * aware of any OS having such a precision.
 *
 * See "profile.c" for the implementation of start_profile() and stop_profile() which do all the interesting
 * work.
 *
 * Also, see "profile.c" if you find you have naughty times. It may be that there is no implementation (yet)
 * for your OS.
 *
 *
 * PITFALLS:
 *
 * - when compile_to_c is also called with the -boost option, some Eiffel features may get inlined. In that
 * case, they are not instrumented.
 *
 * - external features are not instrumented either. Their elapsed time is counted as being part of their
 * Eiffel caller.
 */

#define SE_PROFILE 1

/* ---------------------------------------------------------------------- */

/*
 * This type represents the time as the profiler subsystem sees it. It is a couple of int64_t: the seconds and
 * the nanoseconds.
 */
typedef union se_time se_time_t;

/*
 * This type represents a function call, along with the number of times the function was called.
 */
typedef struct se_profile_access se_profile_access_t;
typedef struct se_profile_source_access se_profile_source_access_t;
typedef struct se_profile_target_access se_profile_target_access_t;

/*
 * This type represents a function: number of calls, total "own" and "cumul" elapsed times, the calling
 * functions and the called ones.
 */
typedef struct se_profile se_profile_t;

/*
 * This type is used within an Eiffel function; it saves the start/stop times used to count the elapsed times.
 */
typedef struct se_local_profile se_local_profile_t;

/* ---------------------------------------------------------------------- */

/* That's time */
union se_time {
  struct {
    uint32_t sec;        /* seconds */
    uint32_t usec;       /* microseconds */
  } date;
  uint64_t cycles;       /* ... or cycles */
};

/* Common structure for both se_profile_source_access and se_profile_target_access */
struct se_profile_access {
  se_profile_access_t* next;
  se_profile_access_t* prev;
  se_profile_t* access;
};

/* A source access: how many times this function was called from somewhere */
struct se_profile_source_access {
  /* THOSE FIELDS MUST BE THE SAME AS se_profile_access */
  se_profile_source_access_t* next;
  se_profile_source_access_t* prev;
  se_profile_t* access;

  int32_t count;                 /* number of times the function represented by "access" was called "from
                                    here" */
};

/* A target access: how many times the function called another one, and how much time it cost */
struct se_profile_target_access {
  /* THOSE FIELDS MUST BE THE SAME AS se_profile_access */
  se_profile_target_access_t* next;
  se_profile_target_access_t* prev;
  se_profile_t* access;

  int32_t count;                 /* number of times the function represented by "access" called "there" */
  se_time_t time;                /* cumulative time passed "there" */
};

struct se_profile {
  char* name;                    /* the name of the function, for lookup and display purposes */
  int32_t call_count;            /* the total number of times this function was called */
  se_time_t own;                 /* the total "own" time (not counting nested calls) */
  se_time_t cumul;               /* the total "cumul" time (counting nested calls) */
  int exceptions;                /* the number of times this function did not finish properly because of an
                                    exception */
  se_profile_source_access_t* sources;  /* the functions that called this one, and how many times. The total
                                           of their calls must be equal to "call_count". */
  se_profile_target_access_t* targets;  /* the functions this one called, and how many times. */
  int32_t depth;                 /* for recursive functions, the depth of the recursion. */
};

struct se_local_profile {
  se_profile_t* profile;         /* the profiled function */
  se_time_t     start;           /* the time this function was called at */
  se_time_t     cumul;           /* the cumulative times of the function's children */
  int current_time_counter;      /* number of times the current_time() function was called at the start of the
                                    function */
};

/* ---------------------------------------------------------------------- */

extern TLS(se_local_profile_t) gc_local_profile;

/*
 * initializes and starts profiling
 */
void get_profiler_started(se_local_profile_t* master);

/*
 * Initializes a profile structure by giving it good default values, and a name.
 */
void init_profile(se_profile_t* profile, char* name);

/*
 * Starts profiling the function designed by "target", which was called by the function designed by "source".
 */
void start_profile(se_local_profile_t* source, se_local_profile_t* target);

/*
 * Stops profiling the function designed by "target", which was called by the function designed by "source".
 */
void stop_profile(se_local_profile_t* source, se_local_profile_t* target);

/*
 * Start printing detailed profile
 */
void start_print_profile(FILE* file);

/*
 * Start printing sumarized profile
 */
void start_sumup_profile(FILE* file);

/*
 * Prints sumarized information about the given profile in the given file.
 */
void sumup_profile(FILE* file, se_profile_t* profile);

/*
 * Prints detailed information about the given profile in the given file.
 */
void print_profile(FILE* file, se_profile_t* profile);

/*
 * A qsort(3) comparator. The entries are sorted by the Eiffel runtime before being displayed.
 *
 * "left" and "right" must be se_profile_t*.
 */
int profile_comparator(const void* left, const void* right);
