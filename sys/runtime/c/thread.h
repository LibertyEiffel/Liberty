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
  This file (SmartEiffel/sys/runtime/thread.h) contains the threading
  declarations.
*/

#ifndef _THREAD_H
#define _THREAD_H

#define SE_THREAD 1

extern void*se_thread_run(void (*thread)(EIF_OBJECT,void(*)(void*),void*),EIF_OBJECT C);
extern void se_thread_wait(void*data);
extern void se_thread_register(void);
extern void se_thread_barrier(void(*on_crossing)(void));
extern void se_thread_checkpoint(void);
extern void se_thread_stop(void);

extern void* se_thread_lock_alloc(void);
extern void se_thread_lock_free(void*lock);
extern EIF_BOOLEAN se_thread_lock_is_locked(void*lock);
extern void se_thread_lock_lock(void*lock);
extern void se_thread_lock_unlock(void*lock);
extern EIF_BOOLEAN se_thread_lock_timed_wait(void*lock,int tm);
extern void se_thread_lock_wait(void*lock);
extern void se_thread_lock_notify(void*lock);
extern void se_thread_lock_notify_all(void*lock);

#endif /* #ifndef _THREAD_H */
