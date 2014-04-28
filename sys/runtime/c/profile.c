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
  This file (SmartEiffel/sys/runtime/c/profile.c) is automatically included when
  profiling (option -profile)
*/

#define SE_DEBUG_PROFILE 0

#define MICRO_SEC INT64_C(1000000) /* 1 second is that many microseconds */
#define MICRO_2_SEC INT64_C(2000000) /* 2 seconds */

#define DRIFT_LOOP 1000

/*
 * We start by the definition of the current_time() function. It is the only
 * one that is OS-dependant. If your OS does not appear in the list, please be
 * kind and try to implement current_time() for your OS, and send a patch to
 * smarteiffel@loria.fr.
 *
 * Currently supported OSes:
 *
 *  - POSIX (UNIX, Linux and the like; also surely MacOS X and WinNT)
 *
 *  - Windows (any 32-bit flavour)
 */

static TLS(long) current_time_counter = 0L;

/* -- [ Particular cases ] ---------------------------------------------- */
#if defined (__GNUC__)
#if defined(__i386__)

static inline uint64_t get_cycles(void){
  uint64_t cycles;
  __asm__ __volatile__("rdtsc" : "=A" (cycles));
  return cycles;
}

#define _ACCEL_PROFILE "i386"

#elif defined (__ia64__)

static inline uint64_t get_cycles(void) {
  uint64_t cycles;
  __asm__ __volatile__ ("mov %0=ar.itc" : "=r" (cycles));
  return cycles;
}

#define _ACCEL_PROFILE "ia64"

#elif defined (__ppc64__)

static inline uint64_t get_cycles (void) {
  uint32_t cycles_lo, cycles_hi;
  __asm__ __volatile__("mftb %0,268\n" : "=r" (cycles_lo));
  __asm__ __volatile__("mftb %0,269\n" : "=r" (cycles_hi));
  return (((uint64_t)cycles_hi<<32)|cycles_lo);
}

#define _ACCEL_PROFILE "ppc64"

#endif
#endif

#ifdef _ACCEL_PROFILE

#include <sys/time.h>
#include <time.h>

static inline uint64_t getusec(void){
  struct timeval tv;
  gettimeofday(&tv, NULL);
  return (tv.tv_usec+tv.tv_sec*1000000ULL);
}

static TLS(uint64_t) cyclesPerUsec = 0;

static inline void cycles2date(se_time_t* time) {
  uint64_t cycles = time->cycles;
  uint64_t usec = cycles / cyclesPerUsec;
  time->date.sec  = (uint32_t)(usec / 1000000);
  time->date.usec = (uint32_t)(usec - time->date.sec * 1000000);
/*   fprintf(SE_ERR, "%" PRId64" / %" PRId64 " = %" PRId32 ".%.6" PRId32 "s (%p) \n", cycles, cyclesPerUsec, time->date.sec, time->date.usec, time); */
}

static inline int current_time(se_time_t* result) {
  result->cycles = get_cycles();
  current_time_counter++;
  return 1;
}

#else

/* -- [ POSIX ] --------------------------------------------------------- */
#if defined _POSIX_VERSION

#include <sys/time.h>
#include <time.h>

static int posix_current_time(se_time_t* result) {
  struct timeval res;
  int r = !gettimeofday(&res, NULL);
  if (r) {
    result->date.sec  = (uint32_t)res.tv_sec;
    result->date.usec = (uint32_t)res.tv_usec;
    current_time_counter++;
  }
  if (!r) fprintf(SE_ERR, "*** WARNING: current_time() failed\n");
  return r;
}

/* *** to be fixed
#  if defined CLOCK_THREAD_CPUTIME_ID
#    define PROFILE_CLOCK CLOCK_THREAD_CPUTIME_ID
#  elif defined CLOCK_PROCESS_CPUTIME_ID
#    define PROFILE_CLOCK CLOCK_PROCESS_CPUTIME_ID
#  elif defined CLOCK_MONITONIC
#    define PROFILE_CALOCK CLOCK_MONOTONIC
#  elif defined CLOCK_REALTIME
#    define PROFILE_CLOCK CLOCK_REALTIME
#  endif
*/
#  if defined CLOCK_REALTIME
#    define PROFILE_CLOCK CLOCK_REALTIME
#  endif

#  ifdef PROFILE_CLOCK

static int current_time(se_time_t* result) {
  struct timespec res;
  int r = !clock_gettime(PROFILE_CLOCK, &res);
  if (r) {
    result->date.sec  = (uint32_t)res.tv_sec;
    result->date.usec = (uint32_t)(res.tv_nsec / 1000);
    current_time_counter++;
  }
  else {
    r = posix_current_time(result);
  }

  return r;
}

#  else

/* POSIX, but no real-time timers: use gettimeofday() */

#    define current_time posix_current_time

#  endif

/* -- [ Windows ] ------------------------------------------------------- */
#elif defined WIN32

/*#include <windows.h> done in base.h */

static int current_time(se_time_t* result) {
  int64_t freq, ticks;
  int r = QueryPerformanceFrequency(&freq);
  if (r) {
    if (freq <= 0) {
      r = 0;
    } else {
      r = QueryPerformanceCounter(&ticks);
      if (r) {
        result->date.sec = ticks / freq;
        result->date.usec = (int32_t)((MICRO_SEC*(ticks % freq)) / freq);
        current_time_counter++;
      }
    }
  }
  if (!r) fprintf(SE_ERR, "*** WARNING: current_time() failed\n");
  return r;
}

/* -- [ Others ] -------------------------------------------------------- */
#else

/* No known time function; times will stay null. */
static int current_time(se_time_t* result) {
  result->date.sec  = INT32_C(0);
  result->date.usec = INT32_C(0);
  current_time_counter++;
  return 1;
}

#endif

#endif

/* ---------------------------------------------------------------------- */

static int divide_time(se_time_t* time, int divisor) {
  int r = 0;

#ifdef _ACCEL_PROFILE
  if (divisor != 0) {
    time->cycles /= divisor;
    r = 1;
  }
#else
  uint32_t s = time->date.sec;
  uint32_t u = time->date.usec;

  if (divisor != 0) {
    s /= divisor;
    u /= divisor;
    time->date.sec  = s;
    time->date.usec = u;
    r = 1;
  }

  if (!r) {
    fprintf(SE_ERR, "*** WARNING: could not divide time (%" PRId32 ".%.6" PRId32 ") by %i\n", s, u, divisor);
  }
#endif

  return r;
}

/*
static int multiply_time(se_time_t* time, int mult) {
  int r = 0;

#ifdef _ACCEL_PROFILE
  time->cycles *= mult;
#else
  int64_t s = (int64_t)time->date.sec;
  int64_t u = (int64_t)time->date.usec;

  s *= mult;
  u *= mult;

  if (u > -(MICRO_SEC*2) && u < (MICRO_SEC*2)) {
    while (u < INT32_C(0) && s > INT32_C(0)) {
      --s;
      u += MICRO_SEC;
    }
    while (u >= MICRO_SEC) {
      ++s;
      u -= MICRO_SEC;
    }
  }

  if (s >= INT32_C(0) && u >= INT32_C(0) && u < MICRO_SEC) {
    time->date.sec  = (uint32_t)s;
    time->date.usec = (uint32_t)u;
    r = 1;
  }

  if (!r) {
    fprintf(SE_ERR, "*** WARNING: could not multiply time (%" PRId64 ".%.6" PRId64 ") by %i\n", s, u, mult);
  }
#endif

  return r;
}
*/

static int subtract_time(se_time_t* start, se_time_t* stop, se_time_t* result) {
  int r = 0;

#ifdef _ACCEL_PROFILE
  result->cycles = stop->cycles - start->cycles;
  r = (result->cycles > INT64_C(0));
#else
  int64_t s;
  int64_t u;

  if (stop->date.usec < start->date.usec) {
     u = (int64_t)(stop->date.usec) + MICRO_SEC - (int64_t)(start->date.usec);
     s = (int64_t)(stop->date.sec ) - (int64_t)(start->date.sec ) - 1;
  }
  else {
     u = (int64_t)(stop->date.usec) - (int64_t)(start->date.usec);
     s = (int64_t)(stop->date.sec ) - (int64_t)(start->date.sec );
  }

  if (s >= INT32_C(0) && u >= INT32_C(0) && u < MICRO_SEC) {
    result->date.sec  = (uint32_t)s;
    result->date.usec = (uint32_t)u;
    r = 1;
  }

  if (!r) {
    fprintf(SE_ERR, "*** WARNING: subtract_time failed (%" PRId64 ".%.6" PRId64 ")\n", s, u);
    fprintf(SE_ERR, "                            (start %" PRId32 ".%.6" PRId32 ")\n", start->date.sec, start->date.usec);
    fprintf(SE_ERR, "                            (stop  %" PRId32 ".%.6" PRId32 ")\n", stop->date.sec, stop->date.usec);
  }
#endif

  return r;
}

static int add_time(se_time_t* first, se_time_t* second, se_time_t* result) {
  int r = 0;

#ifdef _ACCEL_PROFILE
  result->cycles = first->cycles + second->cycles;
  r = 1;
#else
  int64_t s = (int64_t)(first->date.sec  + second->date.sec);
  int64_t u = (int64_t)(first->date.usec + second->date.usec);

  if (u > -(MICRO_SEC*2) && u < (MICRO_SEC*2)) {
    while (u < INT32_C(0) && s > INT32_C(0)) {
      --s;
      u += MICRO_SEC;
    }
    while (u >= MICRO_SEC) {
      ++s;
      u -= MICRO_SEC;
    }
  }

  if (s >= INT32_C(0) && u >= INT32_C(0) && u < MICRO_SEC) {
    result->date.sec  = (uint32_t)s;
    result->date.usec = (uint32_t)u;
    r = 1;
  }

  if (!r) {
    fprintf(SE_ERR, "*** WARNING: add_time failed (%" PRId64 ".%.6" PRId64 ")\n", s, u);
  }
#endif

  return r;
}

/* ------------------------------------------------------------------------ */

static se_profile_access_t* _profile_access(se_profile_access_t* access, se_profile_t* profile) {
  se_profile_access_t* result = NULL;
  se_profile_access_t* point = access;

  if (point != NULL) {
    if (point->access == profile) {
      result = point;
    }
    else {
      do {
        point = point->next;
        if (point->access == profile) {
          result = point;
        }
      } while (result == NULL && point != access);
    }
  }

  return result;
}

/* --*** The two following functions are quite similar. Some C wizard
 * is welcome here to further factorize the code.
 */

static se_profile_source_access_t* profile_source_access(se_profile_source_access_t** access_list, se_profile_t* profile) {
  se_profile_source_access_t* access = *access_list;
  se_profile_source_access_t* prev;
  se_profile_source_access_t* result = (se_profile_source_access_t*)_profile_access((se_profile_access_t*)access, profile);

  if (result != NULL) {
    prev = (se_profile_source_access_t*)result->prev;
    if ((result != access) && (result != prev) &&
        ((result->count > (INT32_C(1) + prev->count)))) {
      /* kinda sorting using the number of calls (heuristics to find
         most quickly the most used features */
      result->prev = prev->prev;
      prev->next = result->next;
      result->next = prev;
      prev->prev = result;
      result->prev->next = result;
      prev->next->prev = prev;
      if (prev == access) {
        *access_list = result;
      }
    }
  }
  else {
    result = (se_profile_source_access_t*)se_malloc(sizeof(se_profile_source_access_t));
    result->access = profile;
    result->count = INT32_C(0);

    if (access == NULL) {
      *access_list = result->next = result->prev = result;
    }
    else {
      prev = access->prev;
      result->next = access;
      access->prev = result;
      result->prev = prev;
      prev->next   = result;
    }
  }

  return result;
}

static se_profile_target_access_t* profile_target_access(se_profile_target_access_t** access_list, se_profile_t* profile) {
  se_profile_target_access_t* access = *access_list;
  se_profile_target_access_t* prev;
  se_profile_target_access_t* result = (se_profile_target_access_t*)_profile_access((se_profile_access_t*)access, profile);

  if (result != NULL) {
    prev = (se_profile_target_access_t*)result->prev;
    if ((result != access) && (result != prev) &&
        ((result->count > (INT32_C(1) + prev->count)))) {
      /* kinda sorting using the number of calls (heuristics to find
         most quickly the most used features */
      result->prev = prev->prev;
      prev->next = result->next;
      result->next = prev;
      prev->prev = result;
      result->prev->next = result;
      prev->next->prev = prev;
      if (prev == access) {
        *access_list = result;
      }
    }
  }
  else {
    result = (se_profile_target_access_t*)se_malloc(sizeof(se_profile_target_access_t));
    result->access         = profile;
    result->count          = INT32_C(0);
#ifdef _ACCEL_PROFILE
    result->time.cycles    = INT64_C(0);
#else
    result->time.date.sec  = INT32_C(0);
    result->time.date.usec = INT32_C(0);
#endif

    if (access == NULL) {
      *access_list = result->next = result->prev = result;
    }
    else {
      prev = access->prev;
      result->next = access;
      access->prev = result;
      result->prev = prev;
      prev->next   = result;
    }
  }

  return result;
}

#ifdef _ACCEL_PROFILE
#define time_comparison(left, right) (((left)->cycles == (right)->cycles) ? 0 : ((left)->cycles > (right)->cycles) ? 1 : -1)
#else
#define time_comparison(left, right) (  ((left)->date.sec==(right)->date.sec)    \
                                     ? ((left)->date.usec - (right)->date.usec) \
                                     : ((left)->date.sec - (right)->date.sec))
#endif

/* ------------------------------------------------------------------------ */

static TLS(se_profile_t) profiler_profile;
static TLS(se_time_t) measure_drift;

static TLS(se_local_profile_t**) open_profiles = NULL;
static TLS(int                 ) open_profiles_capacity = 0;
static TLS(int                 ) open_profiles_count = 0;

static void show_profile_stack(void) {
  int i = open_profiles_count;
  while (i --> 0) {
    fprintf(SE_ERR, "\t%d: %s\n", i, open_profiles[i]->profile->name);
  }
}

static TLS(int*) profile_exceptions = NULL;
static TLS(int ) profile_exceptions_capacity = 0;
static TLS(int ) profile_exceptions_count = 0;

static void profile_exception_set(void) {
  if (profile_exceptions_count == profile_exceptions_capacity) {
    if (profile_exceptions_capacity == 0) {
      profile_exceptions_capacity = 2;
      profile_exceptions = (int*)malloc(profile_exceptions_capacity * sizeof(int));
    }
    else {
      profile_exceptions_capacity *= 2;
      profile_exceptions = (int*)realloc(profile_exceptions, profile_exceptions_capacity * sizeof(int));
    }
  }
  profile_exceptions[profile_exceptions_count++] = open_profiles_count;
}

static void profile_exception_clear(void) {
  profile_exceptions_count--;
}

static void profile_exception_thrown(void) {
  int count = profile_exceptions[--profile_exceptions_count];
#if SE_DEBUG_PROFILE
  fprintf(SE_ERR, "profile_exception_thrown called, back to open_profiles_count = %d\n", count);
#endif
  while (open_profiles_count > count) {
    open_profiles[open_profiles_count-1]->profile->exceptions++;
    stop_profile(open_profiles_count==1 ? NULL : open_profiles[open_profiles_count-2], open_profiles[open_profiles_count-1]);
  }
}

static TLS(se_profile_t) gc_profile={0,};
TLS(se_local_profile_t) gc_local_profile={0,};

static void profile_enter_gc(void) {
  se_local_profile_t*parent_profile = open_profiles_count==0 ? NULL : open_profiles[open_profiles_count-1];
  gc_local_profile.profile = &gc_profile;
  start_profile(parent_profile, &gc_local_profile);
}

static void profile_exit_gc(void) {
  se_local_profile_t*parent_profile = open_profiles_count==1 ? NULL : open_profiles[open_profiles_count-2];
  stop_profile(parent_profile, &gc_local_profile);
}

static TLS(se_profile_t) printstack_profile={0,};
TLS(se_local_profile_t) printstack_local_profile={0,};

static void profile_enter_printstack(void) {
  se_local_profile_t*parent_profile = open_profiles_count==0 ? NULL : open_profiles[open_profiles_count-1];
  printstack_local_profile.profile = &printstack_profile;
  start_profile(parent_profile, &printstack_local_profile);
}

static void profile_exit_printstack(void) {
  se_local_profile_t*parent_profile = open_profiles_count==1 ? NULL : open_profiles[open_profiles_count-2];
  stop_profile(parent_profile, &printstack_local_profile);
}

static TLS(se_profile_t      ) sedb_profile={0,};
static TLS(se_local_profile_t) sedb_local_profile={0,};
static TLS(int               ) sedb_stopped=0;

static void profile_sedb_break(void) {
  se_local_profile_t*parent_profile = open_profiles_count==0 ? NULL : open_profiles[open_profiles_count-1];
  sedb_local_profile.profile = &sedb_profile;
  start_profile(parent_profile, &sedb_local_profile);
  sedb_stopped = 1;
}

static void profile_sedb_continue(void) {
  se_local_profile_t*parent_profile;
  if (sedb_stopped) {
    parent_profile = open_profiles_count==1 ? NULL : open_profiles[open_profiles_count-2];
    stop_profile(parent_profile, &sedb_local_profile);
    sedb_stopped = 0;
  }
}

static void profile_handler(se_handler_action_t action, void*data) {
  switch(action) {
  case SE_HANDLE_EXCEPTION_SET:
    profile_exception_set();
    break;
  case SE_HANDLE_EXCEPTION_CLEAR:
    profile_exception_clear();
    break;
  case SE_HANDLE_EXCEPTION_THROWN:
    profile_exception_thrown();
    break;
  case SE_HANDLE_ENTER_GC:
    profile_enter_gc();
    break;
  case SE_HANDLE_EXIT_GC:
    profile_exit_gc();
    break;
  case SE_HANDLE_ENTER_PRINT_STACK:
    profile_enter_printstack();
    break;
  case SE_HANDLE_EXIT_PRINT_STACK:
    profile_exit_printstack();
    break;
  case SE_HANDLE_SEDB_BREAK:
    profile_sedb_break();
    break;
  case SE_HANDLE_SEDB_CONTINUE:
    profile_sedb_continue();
    break;
  case SE_HANDLE_NO_MORE_MEMORY:
  case SE_HANDLE_RUNTIME_ERROR:
  case SE_HANDLE_DIE_WITH_CODE:
  case SE_HANDLE_NORMAL_EXIT:
    /* nothing to do... the program will stop anyway */
    break;
  default:
    fprintf(SE_ERR, "*** WARNING: action not handled: %d\n", action);
  }
}

static void open_profile(se_local_profile_t* source, se_local_profile_t* target) {
#if SE_DEBUG_PROFILE
  fprintf(SE_ERR, "open %s to %s\n",
          source==NULL ? "no source" : source->profile->name,
          target->profile->name);
#endif
  if (open_profiles_capacity == 0) {
    open_profiles_capacity = 4;
    open_profiles = (se_local_profile_t**)malloc(open_profiles_capacity*sizeof(void*));
  }
  else if (open_profiles_capacity == open_profiles_count) {
    open_profiles_capacity *= 2;
    open_profiles = (se_local_profile_t**)realloc(open_profiles, open_profiles_capacity*sizeof(void*));
  }
  if (source != NULL && (open_profiles_count > 1) && (open_profiles[open_profiles_count-1] != source)) {
    fprintf(SE_ERR, "*** WARNING open: open_profiles_count = %d, target %s does not follow source %s\n",
            open_profiles_count, target->profile->name, source->profile->name);
    show_profile_stack();
  }
  open_profiles[open_profiles_count++] = target;
}

static void close_profile(se_local_profile_t* source, se_local_profile_t* target) {
#if SE_DEBUG_PROFILE
  fprintf(SE_ERR, "back to %s from %s\n",
          source==NULL ? "no source" : source->profile->name,
          target->profile->name);
#endif
  if (open_profiles_count == 0) {
    fprintf(SE_ERR, "*** WARNING close: open_profiles_count = 0 while closing yet another profile\n");
    show_profile_stack();
  }
  else {
    if (open_profiles[open_profiles_count-1] != target) {
      fprintf(SE_ERR, "*** WARNING close: open_profiles_count = %d, expecting target %s but got %s\n",
              open_profiles_count, target->profile->name, open_profiles[open_profiles_count]->profile->name);
      show_profile_stack();
    }
    open_profiles[--open_profiles_count] = NULL;
    if (source != NULL && (open_profiles_count > 1) && (open_profiles[open_profiles_count-1] != source)) {
      fprintf(SE_ERR, "*** WARNING close: open_profiles_count = %d, expecting source %s but got %s\n",
              open_profiles_count, source->profile->name, open_profiles[open_profiles_count-1]->profile->name);
      show_profile_stack();
    }
  }
}

/* ====================================================================== */

/*
 * Below are some functions used by the Eiffel runtime to profile the system.
 */

void init_profile(se_profile_t* profile, char* name) {
  profile->name            = name;
  profile->call_count      = INT32_C(0);
  profile->sources         = NULL;
  profile->targets         = NULL;
#ifdef _ACCEL_PROFILE
  profile->own.cycles      = INT64_C(0);
  profile->cumul.cycles    = INT64_C(0);
#else
  profile->own.date.sec    = INT32_C(0);
  profile->own.date.usec   = INT32_C(0);
  profile->cumul.date.sec  = INT32_C(0);
  profile->cumul.date.usec = INT32_C(0);
#endif
  profile->depth           = INT32_C(0);
}

void get_profiler_started(se_local_profile_t* master) {

  se_profile_access_t* master_access;
  se_profile_t* master_profile = master->profile;

#ifdef _ACCEL_PROFILE
  /* Calculate the time cycles2date factor
   */
  uint64_t val1, val2;
  uint64_t uval = 0;

  uval -= getusec();
  val1 = get_cycles();
  while (getusec() < (-uval+DRIFT_LOOP)); /* sleep for delta usecs */
  val2 = get_cycles();
  uval += getusec();

  cyclesPerUsec = (val2-val1)/(double)uval;

  measure_drift.cycles = INT64_C(0);

#if SE_DEBUG_PROFILE
  fprintf(SE_ERR, "Using time accelerator\n");
#endif

#else
  /* Reckon the measure drift
   */
  se_time_t t1, t2;
  int i;
  current_time(&t1);
  for (i = 0; i < DRIFT_LOOP; i++){
    current_time(&t2);
  }
  subtract_time(&t1, &t2, &measure_drift);
  divide_time(&measure_drift, DRIFT_LOOP);
#endif

  current_time_counter = 0L;

  /* Prepare the "master" profile structure (not measured; just to have
   * uniform access to start_profile())
   */
  current_time(&(master->start));
  master_profile = &profiler_profile;
  master->profile = master_profile;
#ifdef _ACCEL_PROFILE
  master->cumul.cycles    = INT64_C(0);
#else
  master->cumul.date.sec  = INT32_C(0);
  master->cumul.date.usec = INT32_C(0);
#endif
  init_profile(master_profile, "<master>");

  /*
   * Register the module handler
   */
  register_handler(profile_handler);

  /*
   * Some remaining initialisations
   */
  init_profile(&gc_profile, "<gc>");
  init_profile(&printstack_profile, "<print stack>");
  init_profile(&sedb_profile, "<sedb>");
}

void start_profile(se_local_profile_t* source, se_local_profile_t* target) {

  se_profile_source_access_t* source_access;
  se_profile_target_access_t* target_access;
  se_profile_t* source_profile;
  se_profile_t* target_profile;
  int r;

  open_profile(source, target);
  if (source != NULL) {
    source_profile = source->profile;
    target_profile = target->profile;

    target_profile->depth++;

    /* make sure the cumul counter is set to 0 */
#ifdef _ACCEL_PROFILE
    target->cumul.cycles    = INT64_C(0);
#else
    target->cumul.date.sec  = INT32_C(0);
    target->cumul.date.usec = INT32_C(0);
#endif

    /* now count that new link source->target in the source profile */
    source_access = profile_source_access(&(target_profile->sources), source_profile);
    source_access->count++;
    /* ... and in the target profile */
    target_access = profile_target_access(&(source_profile->targets), target_profile);
    target_access->count++;

    /* count the call */
    target_profile->call_count++;

    /* remember the number of times current_time() was called */
    target->current_time_counter = current_time_counter;

    /* set the start time for the target */
    current_time(&(target->start));
  }
}

void stop_profile(se_local_profile_t* source, se_local_profile_t* target) {

  se_profile_t* target_profile;
  se_time_t stop, cumul, own, drift;
  int r;
  int current_time_counter_memory;
  se_profile_target_access_t* target_access;
  int out_of_recursive;

  if (source != NULL) {
    /* set the stop time for the target */
    current_time(&stop);

    /* initialize variables */
    target_profile = target->profile;
    current_time_counter_memory = target->current_time_counter;
    target_access = profile_target_access(&(source->profile->targets), target_profile);
    target_profile->depth--;
    out_of_recursive = target_profile->depth == INT32_C(0);

    /* count the elapsed time
     *
     * cumul = stop - start
     *
     */
    r = subtract_time(&(target->start), &stop, &cumul);
    if (!r) fprintf(SE_ERR, "(stop-start < 0) %s <<< %s\n", source->profile->name, target->profile->name);

    /* take into account the measure drift
     *
     * cumul -= measure_drift * (number of times current_time() was called)
     *
     */
    drift = measure_drift;
    /*
      --*** CAD does not work! Why?

      r = multiply_time(&drift, current_time_counter - current_time_counter_memory);
      if (!r) fprintf(SE_ERR, "(could not calculate drift) %s <<< %s\n", source->profile->name, target->profile->name);
    */
    if (time_comparison(&cumul, &drift) > 0) {
      r = subtract_time(&drift, &cumul, &cumul);
      if (!r) fprintf(SE_ERR, "(could not subtract drift) %s <<< %s\n", source->profile->name, target->profile->name);
    }
    else {
      /*
       * It seems there is nothing we can do about it. It means that the
       * function took too small a time to run, and is under the
       * resolution of the timer. So be it: 0, then.
       */
#ifdef _ACCEL_PROFILE
      cumul.cycles    = INT64_C(0);
#else
      cumul.date.sec  = INT32_C(0);
      cumul.date.usec = INT32_C(0);
#endif
    }

    /* advertise the source
     *
     * local source cumul += cumul
     *
     */
    r = add_time(&(source->cumul), &cumul, &(source->cumul));
    if (!r) fprintf(SE_ERR, "(cannot add time to parent's cumul) %s <<< %s\n", source->profile->name, target->profile->name);

    /* now compute the target feature cumulative time
     *
     * global target cumul += cumul
     *
     */
    if (out_of_recursive) {
      r = add_time(&(target_profile->cumul), &cumul, &(target_profile->cumul));
      if (!r) fprintf(SE_ERR, "(cannot add cumul time to target) %s <<< %s\n", source->profile->name, target->profile->name);
    }

    /* ... and the target feature own time
     *
     * own = cumul - local target cumul
     * global target own += cumul
     *
     */
    r = subtract_time(&(target->cumul), &cumul, &own);
    if (!r) fprintf(SE_ERR, "(cumul less than time accumulated by children) %s <<< %s\n",
                    source->profile->name, target->profile->name);
    r = add_time(&(target_profile->own), &own, &(target_profile->own));
    if (!r) fprintf(SE_ERR, "(cannot add own time to target) %s <<< %s\n", source->profile->name, target->profile->name);

    /* at last, reckon the cumul time on this access
     *
     * target_access->time += cumul
     */
    if (target_profile->depth <= INT32_C(1)) {
      r = add_time(&(target_access->time), &cumul, &(target_access->time));
      if (!r) fprintf(SE_ERR, "(cannot add cumul time to target access) %s <<< %s\n", source->profile->name, target->profile->name);
    }
  }

  close_profile(source, target);
}

/* ====================================================================== */

/*
 * Finally, the functions below are used to generate the profile output.
 */

#define TIME_STRING_SIZE 32

#define time_in_string(time, string, divisor) do { \
  sprintf((string), "%" PRId32 ".%.6" PRId32 " s", (time).date.sec/(divisor), (((time).date.sec%(divisor))*INT32_C(1000000) + (time).date.usec)/(divisor)); \
} while(0)

static void print_or_sumup(FILE* file, int sumup) {
}

void start_sumup_profile(FILE* file) {
 /* The order of calls of start_sumup_profile and start_print_profile
  * can change independently from this code. Hence the call.
  */
  if (open_profiles_count > 0) {
    /* It happens if the program is suddenly broken (^C or such) */
    fprintf(SE_ERR, "*** WARNING: open_profiles_count=%d\n", open_profiles_count);
    show_profile_stack();
    open_profiles_count = 0;
  }
#ifdef _ACCEL_PROFILE
  fprintf(file, "\nThis profile used the %s accelerator, so the times are quite reliable\nand near to the real performance (without profile).\n", _ACCEL_PROFILE);
#endif
  fprintf(file, "Count          Own         *Cumul*       Name\n");
  fprintf(file, "-------------------------------------------------------------------------------\n");
}

void sumup_profile(FILE* file, se_profile_t* profile) {
  if (profile->call_count > INT32_C(0)) {
    char own[TIME_STRING_SIZE];
    char cumul[TIME_STRING_SIZE];
#ifdef _ACCEL_PROFILE
    cycles2date(&(profile->own));
    cycles2date(&(profile->cumul));
#endif
    time_in_string(profile->own,   own,       INT32_C(1));
    time_in_string(profile->cumul, cumul,     INT32_C(1));
    fprintf(file, "%-12" PRId32 " %12s  %12s  %s\n", profile->call_count, own, cumul, profile->name);
  }
}

void start_print_profile(FILE* file) {
#ifdef SE_GC_LIB
    print_profile(file, &gc_profile);
#endif
#ifdef SE_SEDB
    print_profile(file, &sedb_profile);
#endif
    fprintf(file, "\nFrames are sorted by cumulated times.\n");
}

void print_profile(FILE* file, se_profile_t* profile) {
  if (profile->call_count > INT32_C(0)) {
    /*
     * We print the profile report only if the function was really called.
     */
    char own[TIME_STRING_SIZE];
    char cumul[TIME_STRING_SIZE];
    char avg_own[TIME_STRING_SIZE];
    char avg_cumul[TIME_STRING_SIZE];
    char target_time[TIME_STRING_SIZE];
    se_profile_source_access_t* source = profile->sources;
    se_profile_source_access_t* source_head = source;
    se_profile_target_access_t* target = profile->targets;
    se_profile_target_access_t* target_head = target;
#ifdef _ACCEL_PROFILE
    cycles2date(&(profile->own));
    cycles2date(&(profile->cumul));
#endif
    time_in_string(profile->own,   own,       INT32_C(1));
    time_in_string(profile->cumul, cumul,     INT32_C(1));
    time_in_string(profile->own,   avg_own,   profile->call_count);
    time_in_string(profile->cumul, avg_cumul, profile->call_count);
    fprintf(file,
            "\n%s: %" PRId32 " call%s\n\tSelf time: %s (average: %s)\n\tCumulative time: %s (average: %s)\n\tExceptions: %d\n",
            profile->name,
            profile->call_count,
            (profile->call_count > INT32_C(1)) ? "s" : "",
            own, avg_own,
            cumul, avg_cumul,
            profile->exceptions);
    if (source != NULL) {
      do {
        fprintf(file,
                "\tFrom %s: %" PRId32 " call%s (%.2f%%)\n",
                source->access->name,
                source->count,
                (source->count > INT32_C(1)) ? "s" : "",
                100.0 * source->count / profile->call_count);
        source=source->next;
      } while (source != source_head);
    }
    if (target != NULL) {
      do {
#ifdef _ACCEL_PROFILE
        cycles2date(&(target->time));
#endif
        time_in_string(target->time, target_time, INT32_C(1));
        fprintf(file,
                "\tTo %s: %" PRId32 " call%s, %s\n",
                target->access->name,
                target->count,
                (target->count > INT32_C(1)) ? "s" : "",
                target_time);
        target=target->next;
      } while (target != target_head);
    }
  }
}

int profile_comparator(const void* left, const void* right) {
  /* We compare by cumulative time in order to have high level information */
  se_profile_t* left_profile = (se_profile_t*)left;
  se_profile_t* right_profile = (se_profile_t*)right;
  int64_t r;
  r = time_comparison(&(left_profile->cumul), &(right_profile->cumul));
  if (r == 0) {
    r = (left_profile->call_count - right_profile->call_count);
  }
  return r;
}
