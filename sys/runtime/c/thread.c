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

#ifdef WIN32
#error "Threads are not supported under Windows! If you want to help, please drop an email to liberty-eiffel@gnu.org"
#endif

#include <pthread.h>
#include <time.h>

typedef struct se_thread_pool se_thread_pool_t;
typedef struct se_thread se_thread_t;
typedef struct se_thread_lock se_thread_lock_t;
typedef struct se_thread_run_data se_thread_run_data_t;

/* ---------------------------------------------------------------- */

struct se_thread_pool {
   se_thread_t*threads;
   size_t capacity;
   size_t running;
   pthread_mutex_t lock;
};

struct se_thread {
   pthread_t id;
   pthread_mutex_t run_lock;
   pthread_cond_t run_cond;
   int running;
   se_thread_run_data_t*queue_first;
   se_thread_run_data_t*queue_last;
   pthread_mutex_t queue_lock;
   pthread_cond_t queue_cond;
   size_t queue_length;
};

typedef struct se_thread_run_data {
   void (*thread_run)(EIF_OBJECT,void(*)(void*),void*);
   EIF_OBJECT C;
   pthread_mutex_t lock;
   pthread_cond_t cond;
   int started;
   int done;
   se_thread_run_data_t*next;
} se_thread_run_data_t;

/* ---------------------------------------------------------------- */

static se_thread_pool_t THREAD_POOL = {NULL,0,0,PTHREAD_MUTEX_INITIALIZER};

static void thread_pool_extend(void) {
   /* REQUIRE: the THREAD_POOL lock must be taken */

   size_t new_capacity;
   se_thread_t*new_threads;

   new_capacity = THREAD_POOL.capacity == 0 ? 16 : THREAD_POOL.capacity * 2;
   new_threads = se_malloc(sizeof(se_thread_t) * new_capacity);
   if (THREAD_POOL.capacity) {
      memcpy(new_threads, THREAD_POOL.threads, sizeof(se_thread_t)* THREAD_POOL.capacity);
      free(THREAD_POOL.threads);
   }
   memset(new_threads + THREAD_POOL.capacity, 0, new_capacity - THREAD_POOL.capacity);

   THREAD_POOL.capacity = new_capacity;
   THREAD_POOL.threads = new_threads;
}

static void thread_pool_thread_signal(se_thread_run_data_t*data) {
   data->started = 1;

   if (pthread_cond_signal(&(data->cond))) {
      perror("thread_pool_thread_signal:pthread_cond_signal");
      exit(7);
   }

   if (pthread_mutex_unlock(&(data->lock))) {
      perror("thread_pool_thread_signal:pthread_mutex_unlock");
      exit(7);
   }
}

static int thread_pool_thread_unqueue(se_thread_t *thread) {
   int result = 0; // continue -- must be non-zero to stop the thread
   se_thread_run_data_t*data = NULL;

   if (pthread_mutex_lock(&(thread->queue_lock))) {
      perror("thread_pool_thread_unqueue:pthread_mutex_lock");
      exit(7);
   }

   while (thread->queue_first == NULL) {
      if (pthread_cond_wait(&(thread->queue_cond), &(thread->queue_lock))) {
         perror("thread_pool_thread_unqueue:pthread_cond_wait");
         exit(7);
      }
   }

   data = thread->queue_first;
   thread->queue_first = data->next;
   if (data->next == NULL) {
      thread->queue_last = NULL;
   }

   if (pthread_mutex_unlock(&(thread->queue_lock))) {
      perror("thread_pool_thread_unqueue:pthread_mutex_unlock");
      exit(7);
   }

   if (pthread_mutex_lock(&(data->lock))) {
      perror("thread_pool_thread_unqueue:pthread_mutex_lock");
      exit(7);
   }

   data->thread_run(data->C,(void(*)(void*))thread_pool_thread_signal,data);

   if (pthread_mutex_lock(&(data->lock))) {
      perror("thread_pool_thread_unqueue:pthread_mutex_lock");
      exit(7);
   }

   data->done = 1;

   if (pthread_cond_signal(&(data->cond))) {
      perror("thread_pool_thread_unqueue:pthread_mutex_unlock");
      exit(7);
   }

   if (pthread_mutex_unlock(&(data->lock))) {
      perror("thread_pool_thread_unqueue:pthread_mutex_unlock");
      exit(7);
   }

   return result;
}

static void*thread_pool_thread_root_fn(se_thread_t *thread) {
   char *error = NULL;
   int stop = 0;
   if (pthread_mutex_lock(&(thread->run_lock))) {
      perror("thread_pool_thread_root_fn:pthread_mutex_lock");
      exit(7);
   }

   thread->running = 2;

   if (pthread_cond_signal(&(thread->run_cond))) {
      perror("thread_pool_thread_root_fn:pthread_cond_signal");
      exit(7);
   }
   if (pthread_mutex_unlock(&(thread->run_lock))) {
      perror("thread_pool_thread_root_fn:pthread_mutex_unlock");
      exit(7);
   }

   while (!stop) { /* TODO end condition */
      stop = thread_pool_thread_unqueue(thread);
   }

   return NULL;
}

static void thread_pool_start(se_thread_t*thread) {
   thread->running = 1;

   if (pthread_mutex_init(&(thread->run_lock), NULL)) {
      perror("thread_pool_start:pthread_mutex_init");
      exit(7);
   }
   if (pthread_cond_init(&(thread->run_cond), NULL)) {
      perror("thread_pool_start:pthread_cond_init");
      exit(7);
   }
   if (pthread_mutex_init(&(thread->queue_lock), NULL)) {
      perror("thread_pool_start:pthread_mutex_init");
      exit(7);
   }
   if (pthread_cond_init(&(thread->queue_cond), NULL)) {
      perror("thread_pool_start:pthread_cond_init");
      exit(7);
   }

   if (pthread_mutex_lock(&(thread->run_lock))) {
      perror("thread_pool_start:pthread_mutex_lock");
      exit(7);
   }

   if (pthread_create(&(thread->id), NULL, (void*(*)(void*))thread_pool_thread_root_fn, thread)) {
      perror("thread_pool_start:pthread_create");
      exit(7);
   }

   while (thread->running < 2) {
      if (pthread_cond_wait(&(thread->run_cond), &(thread->run_lock))) {
         perror("thread_pool_start:pthread_cond_wait");
         exit(7);
      }
   }

   if (pthread_mutex_unlock(&(thread->run_lock))) {
      perror("thread_pool_start:pthread_mutex_unlock");
      exit(7);
   }
}

static se_thread_run_data_t*thread_pool_run(void (*thread_run)(EIF_OBJECT,void(*)(void*),void*), EIF_OBJECT C) {
   se_thread_run_data_t*data;
   unsigned int i, s=1;
   se_thread_t *thread=NULL;

   if (pthread_mutex_lock(&(THREAD_POOL.lock))) {
      perror("thread_pool_run:pthread_mutex_lock");
      exit(7);
   }

   data = se_malloc(sizeof(se_thread_run_data_t));
   data->thread_run = thread_run;
   data->C = C;
   if (pthread_mutex_init(&(data->lock),NULL)) {
      perror("thread_pool_run:pthread_mutex_init");
      exit(7);
   }
   if (pthread_cond_init(&(data->cond),NULL)) {
      perror("thread_pool_run:pthread_mutex_init");
      exit(7);
   }
   data->started = 0;
   data->done = 0;
   data->next = NULL;

   do {
      for (i = 0; i < THREAD_POOL.capacity && s > 0; i++) {
         if (THREAD_POOL.threads[i].running == 0) {
            thread = &(THREAD_POOL.threads[i]);
            s = 0;
            thread_pool_start(thread);
         } else {
            if (pthread_mutex_lock(&(THREAD_POOL.threads[i].queue_lock))) {
               perror("thread_pool_run:pthread_mutex_lock");
               exit(7);
            }
            if (THREAD_POOL.threads[i].queue_length < s) {
               thread = &(THREAD_POOL.threads[i]);
               s = thread->queue_length;
            }
            if (pthread_mutex_lock(&(THREAD_POOL.threads[i].queue_lock))) {
               perror("thread_pool_run:pthread_mutex_lock");
               exit(7);
            }
         }
      }
      if (thread == NULL) {
         thread_pool_extend();
      }
   } while (thread == NULL);

   if (pthread_mutex_unlock(&(THREAD_POOL.lock))) {
      perror("thread_pool_run:pthread_mutex_unlock");
      exit(7);
   }

   if (pthread_mutex_lock(&(thread->queue_lock))) {
      perror("thread_pool_run:pthread_mutex_lock");
      exit(7);
   }

   if (thread->queue_last == NULL) {
      thread->queue_first = thread->queue_last = data;
   } else {
      thread->queue_last->next = data;
      thread->queue_last = data;
   }

   if (pthread_cond_signal(&(thread->queue_cond))) {
      perror("thread_pool_run:pthread_cond_signal");
      exit(7);
   }

   if (pthread_mutex_unlock(&(thread->queue_lock))) {
      perror("thread_pool_run:pthread_mutex_unlock");
      exit(7);
   }

   return data;
}

/* ---------------------------------------------------------------- */

void*se_thread_run(void (*thread_run)(EIF_OBJECT,void(*)(void*),void*),EIF_OBJECT C) {
   se_thread_run_data_t*data=thread_pool_run(thread_run, C);

   if (pthread_mutex_lock(&(data->lock))) {
      perror("se_thread_run:pthread_mutex_lock");
      exit(7);
   }

   while (!data->started) {
      if (pthread_cond_wait(&(data->cond), &(data->lock))) {
         perror("se_thread_run:pthread_cond_wait");
         exit(7);
      }
   }

   if (pthread_mutex_unlock(&(data->lock))) {
      perror("se_thread_run:pthread_mutex_unlock");
      exit(7);
   }

   return data;
}

void se_thread_wait(void *data_) {
   se_thread_run_data_t*data = (se_thread_run_data_t*)data_;

   if (pthread_mutex_lock(&(data->lock))) {
      perror("se_thread_wait:pthread_mutex_lock");
      exit(7);
   }

   while (!data->done) {
      if (pthread_cond_wait(&(data->cond), &(data->lock))) {
         perror("se_thread_wait:pthread_cond_wait");
         exit(7);
      }
   }

   if (pthread_mutex_unlock(&(data->lock))) {
      perror("se_thread_wait:pthread_mutex_unlock");
      exit(7);
   }

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
