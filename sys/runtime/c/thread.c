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
  This file (SmartEiffel/sys/runtime/thread.c) contains the threading
  definitions.
*/

#include <pthread.h>
#include <time.h>

/* ---------------------------------------------------------------- */

struct se_thread {
   pthread_t id;
   pthread_mutex_t run_lock;
   pthread_cond_t  run_cond;
   int started;
};

void* se_thread_alloc(void) {
   return se_malloc(sizeof(se_thread_t));
}

typedef struct se_thread_root_data {
   void*(*thread_run)(EIF_OBJECT,void(*)(void*),void*);
   EIF_OBJECT C;
   se_thread_t*thread;
} se_thread_root_data_t;

static void se_thread_start_unlock(void*data) {
   se_thread_t *thread = (se_thread_t*)data;
   thread->started = 1;
   pthread_cond_signal(&(thread->run_cond));
   pthread_mutex_unlock(&(thread->run_lock));
}

static void* se_thread_root(se_thread_root_data_t *data) {
   void *result = NULL;
   char *error = NULL;
   if (pthread_mutex_lock(&(data->thread->run_lock))) {
      error = "pthread_mutex_lock";
   } else {
      result = data->thread_run(data->C,se_thread_start_unlock,data->thread);
   }
   return result;
}

void se_thread_run(void*(*thread_run)(EIF_OBJECT,void(*)(void*),void*),EIF_OBJECT C,void*data) {
   se_thread_t *thread = (se_thread_t*)data;
   char *error = NULL;
   se_thread_root_data_t *root_data = (se_thread_root_data_t*)se_malloc(sizeof(se_thread_root_data_t));
   thread->started = 0;
   if (root_data) {
      root_data->thread_run=thread_run;
      root_data->C=C;
      root_data->thread=thread;
      if (pthread_mutex_init(&(thread->run_lock), NULL)) {
         error = "pthread_mutex_init";
         free(root_data);
      } else if (pthread_cond_init(&(thread->run_cond), NULL)) {
         error = "pthread_cond_init";
         pthread_mutex_destroy(&(thread->run_lock));
         free(root_data);
      } else if (pthread_mutex_lock(&(thread->run_lock))) {
         error = "pthread_mutex_lock";
         pthread_mutex_destroy(&(thread->run_lock));
         pthread_cond_destroy(&(thread->run_cond));
         free(root_data);
      } else {
         if (pthread_create(&(thread->id), NULL, (void*(*)(void*))se_thread_root, (void*)root_data)) {
            error = "pthread_create";
         } else while (!error && !thread->started && pthread_cond_wait(&(thread->run_cond), &(thread->run_lock))) {
            error = "pthread_cond_wait";
         }
         pthread_mutex_unlock(&(thread->run_lock));
      }
   }
}

void se_thread_wait(void *data) {
   se_thread_t *thread = (se_thread_t*)data;
   void *res = NULL;
   pthread_join(thread->id, &res);

   pthread_mutex_destroy(&(thread->run_lock));
   pthread_cond_destroy(&(thread->run_cond));
   free(data);
}

/* ---------------------------------------------------------------- */

struct se_thread_lock {
   pthread_mutex_t check;
   pthread_mutex_t lock;
   pthread_cond_t  cond;
   pthread_t *locker;
   pthread_t  locker_;
};

void* se_thread_lock_alloc(void) {
   se_thread_lock_t *result = se_malloc(sizeof(se_thread_lock_t));
   if (pthread_mutex_init(&(result->check), NULL))
      perror("se_thread_lock_alloc");
   if (pthread_mutex_init(&(result->lock), NULL))
      perror("se_thread_lock_alloc");
   if (pthread_cond_init(&(result->cond), NULL))
      perror("se_thread_lock_alloc");
   result->locker = NULL;
   return result;
}

void se_thread_lock_free(void*data) {
   se_thread_lock_t*lock = (se_thread_lock_t*)data;
   pthread_cond_destroy(&(lock->cond));
   pthread_mutex_destroy(&(lock->lock));
   pthread_mutex_destroy(&(lock->check));
   free(lock);
}

EIF_BOOLEAN se_thread_lock_is_locked(void*data) {
   EIF_BOOLEAN result = 0;
   se_thread_lock_t*lock = (se_thread_lock_t*)data;
   pthread_t *locker;
   if (pthread_mutex_lock(&(lock->check)))
      perror("se_thread_lock_is_locked");
   else {
      locker = lock->locker;
      result = locker != NULL && pthread_equal(*locker, pthread_self());
      if (pthread_mutex_unlock(&(lock->check)))
         perror("se_thread_lock_is_locked");
   }
   return result;
}

void se_thread_lock_lock(void*data) {
   se_thread_lock_t*lock = (se_thread_lock_t*)data;
   if (pthread_mutex_lock(&(lock->lock)))
      perror("se_thread_lock_lock");
   else if (pthread_mutex_lock(&(lock->check)))
      perror("se_thread_lock_lock");
   else {
      lock->locker = &(lock->locker_);
      lock->locker_ = pthread_self();
      if (pthread_mutex_unlock(&(lock->check)))
         perror("se_thread_lock_lock");
   }
}

void se_thread_lock_unlock(void*data) {
   se_thread_lock_t*lock = (se_thread_lock_t*)data;
   if (pthread_mutex_lock(&(lock->check)))
      perror("se_thread_lock_unlock");
   else {
      lock->locker = NULL;
      if (pthread_mutex_unlock(&(lock->check)))
         perror("se_thread_lock_unlock");
   }
   if (pthread_mutex_unlock(&(lock->lock)))
       perror("se_thread_lock_unlock");
}

EIF_BOOLEAN se_thread_lock_timed_wait(void*data,int tm) {
   se_thread_lock_t*lock = (se_thread_lock_t*)data;
   int res;
   EIF_BOOLEAN result = 1;
   struct timespec tmout = { tm / 1000, (tm % 1000) * 1000000 };
   if (pthread_mutex_lock(&(lock->check)))
      perror("se_thread_lock_timed_wait");
   else {
      lock->locker = NULL;
      if (pthread_mutex_unlock(&(lock->check)))
         perror("se_thread_lock_timed_wait");
   }
   res = pthread_cond_timedwait(&(lock->cond), &(lock->lock), &tmout);
   if (res == ETIMEDOUT) {
      result = 0;
   } else if (res)
      perror("se_thread_lock_timed_wait");
   if (pthread_mutex_lock(&(lock->check)))
      perror("se_thread_lock_timed_wait");
   else {
      lock->locker = &(lock->locker_);
      lock->locker_ = pthread_self();
      if (pthread_mutex_unlock(&(lock->check)))
         perror("se_thread_lock_timed_wait");
   }
   return result;
}

void se_thread_lock_wait(void*data) {
   se_thread_lock_t*lock = (se_thread_lock_t*)data;
   if (pthread_mutex_lock(&(lock->check)))
      perror("se_thread_lock_wait");
   else {
      lock->locker = NULL;
      if (pthread_mutex_unlock(&(lock->check)))
         perror("se_thread_lock_wait");
   }
   if (pthread_cond_wait(&(lock->cond), &(lock->lock)))
      perror("se_thread_lock_wait");
   if (pthread_mutex_lock(&(lock->check)))
      perror("se_thread_lock_wait");
   else {
      lock->locker = &(lock->locker_);
      lock->locker_ = pthread_self();
      if (pthread_mutex_unlock(&(lock->check)))
         perror("se_thread_lock_wait");
   }
}

void se_thread_lock_notify(void*data) {
   se_thread_lock_t*lock = (se_thread_lock_t*)data;
   pthread_cond_signal(&(lock->cond));
}

void se_thread_lock_notify_all(void*data) {
   se_thread_lock_t*lock = (se_thread_lock_t*)data;
   pthread_cond_broadcast(&(lock->cond));
}
