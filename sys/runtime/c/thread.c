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
typedef struct se_thread_barrier se_thread_barrier_t;

#define SYSCALL(call) do{if(call){perror(__FILE__ ": " #call);exit(7);}}while(0)

/* ---------------------------------------------------------------- */

struct se_thread_pool {
   se_thread_t*threads;
   size_t capacity;
   size_t running;
   pthread_mutex_t lock;
   pthread_cond_t cond;
   se_thread_barrier_t*barrier;
   int stop;
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

struct se_thread_run_data {
   void (*thread_run)(EIF_OBJECT,void(*)(void*),void*);
   EIF_OBJECT C;
   pthread_mutex_t lock;
   pthread_cond_t cond;
   int started;
   int done;
   se_thread_run_data_t*next;
};

struct se_thread_barrier {
   pthread_barrier_t barrier;
   void (*on_crossing)(void);
};

/* ---------------------------------------------------------------- */

static se_thread_pool_t global_thread_pool = {NULL,0,0,PTHREAD_MUTEX_INITIALIZER,PTHREAD_COND_INITIALIZER,NULL,0};

static void thread_pool_barrier(void) {
   /* REQUIRE: the global_thread_pool lock must be taken */

   se_thread_barrier_t*barrier;
   do {
      barrier = global_thread_pool.barrier;
      if (barrier) {
         SYSCALL(pthread_mutex_unlock(&(global_thread_pool.lock)));
         pthread_barrier_wait(&(barrier->barrier));
         if (barrier->on_crossing) {
            barrier->on_crossing();
         }
         SYSCALL(pthread_mutex_lock(&(global_thread_pool.lock)));
      }
   } while (barrier);
}

static void thread_pool_extend(void) {
   /* REQUIRE: the global_thread_pool lock must be taken */

   size_t new_capacity;
   se_thread_t*new_threads;

   new_capacity = global_thread_pool.capacity == 0 ? 16 : global_thread_pool.capacity * 2;
   new_threads = se_malloc(sizeof(se_thread_t) * new_capacity);
   if (global_thread_pool.capacity) {
      memcpy(new_threads, global_thread_pool.threads, sizeof(se_thread_t)* global_thread_pool.capacity);
      free(global_thread_pool.threads);
   }
   memset(new_threads + global_thread_pool.capacity, 0, new_capacity - global_thread_pool.capacity);

   global_thread_pool.capacity = new_capacity;
   global_thread_pool.threads = new_threads;
}

static void thread_pool_abort() {
   //pthread_exit(NULL); // NO!! locks must be released!!
}

static void thread_pool_join(void) {
   /* REQUIRE: the global_thread_pool lock must be taken */

   size_t i;
   for (i = 0; i < global_thread_pool.running; i++) {
      if (global_thread_pool.threads[i].running == 2) { /* don't join on main :-) */
         pthread_join(global_thread_pool.threads[i].id, NULL);
      }
   }
}

static void thread_pool_thread_signal(se_thread_run_data_t*data) {
   data->started = 1;
   SYSCALL(pthread_cond_signal(&(data->cond)));
   SYSCALL(pthread_mutex_unlock(&(data->lock)));
}

static int thread_pool_thread_unqueue(se_thread_t *thread) {
   int stop=0, res;
   se_thread_run_data_t*data = NULL;
   struct timespec abstime;

   clock_gettime(CLOCK_REALTIME, &abstime);

   SYSCALL(pthread_mutex_lock(&(thread->queue_lock)));
   while (!stop && thread->queue_first == NULL) {
      stop=*(volatile int*)&(global_thread_pool.stop);
      if (!stop) {
         se_thread_checkpoint();
         abstime.tv_sec++;

         res = pthread_cond_timedwait(&(thread->queue_cond), &(thread->queue_lock), &abstime);
         if (res == ETIMEDOUT) {
            // timeout
         } else if (res) {
            perror("se_thread_lock_timed_wait");
            exit(7);
         }
      }
   }
   data = thread->queue_first;
   SYSCALL(pthread_mutex_unlock(&(thread->queue_lock)));

   if (!stop) {
      SYSCALL(pthread_mutex_lock(&(data->lock))); // unlocked by start callback: thread_pool_thread_signal
      data->thread_run(data->C,(void(*)(void*))thread_pool_thread_signal,data);

      SYSCALL(pthread_mutex_lock(&(data->lock)));
      data->done = 1;
      SYSCALL(pthread_cond_signal(&(data->cond)));
      SYSCALL(pthread_mutex_unlock(&(data->lock)));

      SYSCALL(pthread_mutex_lock(&(thread->queue_lock)));
      thread->queue_first = data->next;
      if (data->next == NULL) {
         thread->queue_last = NULL;
      }
      thread->queue_length--;
      SYSCALL(pthread_mutex_unlock(&(thread->queue_lock)));
   }

   return stop;
}

static void*thread_pool_thread_root_fn(se_thread_t *thread) {
   char *error = NULL;
   int stop = 0;
   SYSCALL(pthread_mutex_lock(&(thread->run_lock)));

   thread->running = 2;

   SYSCALL(pthread_cond_signal(&(thread->run_cond)));
   SYSCALL(pthread_mutex_unlock(&(thread->run_lock)));

   while (!stop) {
      stop = thread_pool_thread_unqueue(thread);
   }

   return NULL;
}

static void thread_pool_init(se_thread_t*thread) {
   SYSCALL(pthread_mutex_init(&(thread->run_lock), NULL));
   SYSCALL(pthread_cond_init(&(thread->run_cond), NULL));
   SYSCALL(pthread_mutex_init(&(thread->queue_lock), NULL));
   SYSCALL(pthread_cond_init(&(thread->queue_cond), NULL));
}

static void thread_pool_start(se_thread_t*thread) {
   thread->running = 1;

   thread_pool_init(thread);

   SYSCALL(pthread_mutex_lock(&(thread->run_lock)));

   SYSCALL(pthread_create(&(thread->id), NULL, (void*(*)(void*))thread_pool_thread_root_fn, thread));

   while (thread->running < 2) {
      SYSCALL(pthread_cond_wait(&(thread->run_cond), &(thread->run_lock)));
   }

   SYSCALL(pthread_mutex_unlock(&(thread->run_lock)));
}

static se_thread_t*thread_pool_find(void(*start)(se_thread_t*)) {
   se_thread_t*result = NULL;
   size_t i, s=1;

   SYSCALL(pthread_mutex_lock(&(global_thread_pool.lock)));

   thread_pool_barrier();

   do {
      for (i = 0; i < global_thread_pool.capacity && s > 0; i++) {
         if (global_thread_pool.threads[i].running == 0) {
            result = &(global_thread_pool.threads[i]);
            s = 0;
            start(result);
            global_thread_pool.running++;
         } else {
            SYSCALL(pthread_mutex_lock(&(global_thread_pool.threads[i].queue_lock)));
            if (global_thread_pool.threads[i].queue_length < s) {
               result = &(global_thread_pool.threads[i]);
               s = result->queue_length;
            }
            SYSCALL(pthread_mutex_unlock(&(global_thread_pool.threads[i].queue_lock)));
         }
      }
      if (result == NULL) {
         thread_pool_extend();
      }
   } while (result == NULL);

   SYSCALL(pthread_mutex_unlock(&(global_thread_pool.lock)));

   return result;
}

static se_thread_run_data_t*thread_pool_run(void(*start)(se_thread_t*), void (*thread_run)(EIF_OBJECT,void(*)(void*),void*), EIF_OBJECT C) {
   se_thread_run_data_t*data;
   se_thread_t *thread=thread_pool_find(start);

   data = se_malloc(sizeof(se_thread_run_data_t));
   data->thread_run = thread_run;
   data->C = C;
   SYSCALL(pthread_mutex_init(&(data->lock),NULL));
   SYSCALL(pthread_cond_init(&(data->cond),NULL));
   data->started = 0;
   data->done = 0;
   data->next = NULL;

   SYSCALL(pthread_mutex_lock(&(thread->queue_lock)));

   if (thread->queue_last == NULL) {
      thread->queue_first = thread->queue_last = data;
   } else {
      thread->queue_last->next = data;
      thread->queue_last = data;
   }
   thread->queue_length++;

   SYSCALL(pthread_cond_signal(&(thread->queue_cond)));
   SYSCALL(pthread_mutex_unlock(&(thread->queue_lock)));

   return data;
}

/* ---------------------------------------------------------------- */

void*se_thread_run(void (*thread_run)(EIF_OBJECT,void(*)(void*),void*),EIF_OBJECT C) {
   se_thread_run_data_t*data=thread_pool_run(thread_pool_start, thread_run, C);

   SYSCALL(pthread_mutex_lock(&(data->lock)));
   while (!data->started) {
      SYSCALL(pthread_cond_wait(&(data->cond), &(data->lock)));
   }
   SYSCALL(pthread_mutex_unlock(&(data->lock)));

   return data;
}

void se_thread_wait(void *data_) {
   se_thread_run_data_t*data = (se_thread_run_data_t*)data_;

   SYSCALL(pthread_mutex_lock(&(data->lock)));
   while (!data->done) {
      SYSCALL(pthread_cond_wait(&(data->cond), &(data->lock)));
   }
   SYSCALL(pthread_mutex_unlock(&(data->lock)));

   free(data);
}

void se_thread_register(void) {
   se_thread_t*thread=thread_pool_find(thread_pool_init);

   SYSCALL(pthread_mutex_lock(&(thread->run_lock)));

   thread->running = 3;
   thread->id = pthread_self();
   thread->queue_length = (size_t)~0;

   SYSCALL(pthread_mutex_unlock(&(thread->run_lock)));
}

void se_thread_barrier(void(*on_crossing)(void)) {
   se_thread_barrier_t barrier;

   SYSCALL(pthread_mutex_lock(&(global_thread_pool.lock)));

   thread_pool_barrier();

   SYSCALL(pthread_barrier_init(&(barrier.barrier), NULL, global_thread_pool.running));
   barrier.on_crossing = on_crossing;
   global_thread_pool.barrier = &barrier;

   SYSCALL(pthread_mutex_unlock(&(global_thread_pool.lock)));
   pthread_barrier_wait(&(barrier.barrier));
   SYSCALL(pthread_mutex_lock(&(global_thread_pool.lock)));

   if (global_thread_pool.barrier != &barrier) {
      fprintf(stderr, "unexpected barrier value %p != %p", global_thread_pool.barrier, &barrier);
      exit(7);
   }
   global_thread_pool.barrier = NULL;

   SYSCALL(pthread_mutex_unlock(&(global_thread_pool.lock)));

   SYSCALL(pthread_barrier_destroy(&(barrier.barrier)));
   if (on_crossing) {
      on_crossing();
   }
}

void se_thread_checkpoint(void) {
   if (*(volatile pthread_barrier_t**)&(global_thread_pool.barrier)) {
      SYSCALL(pthread_mutex_lock(&(global_thread_pool.lock)));
      thread_pool_barrier();
      SYSCALL(pthread_mutex_unlock(&(global_thread_pool.lock)));
   }
}

void se_thread_stop(void) {
   SYSCALL(pthread_mutex_lock(&(global_thread_pool.lock)));
   global_thread_pool.stop = 1;
   se_thread_barrier(thread_pool_abort);
   thread_pool_join();
   SYSCALL(pthread_mutex_unlock(&(global_thread_pool.lock)));
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
   SYSCALL(pthread_mutex_init(&(result->check), NULL));
   SYSCALL(pthread_mutex_init(&(result->lock), NULL));
   SYSCALL(pthread_cond_init(&(result->cond), NULL));
   result->locker = NULL;
   return result;
}

void se_thread_lock_free(void*data) {
   se_thread_lock_t*lock = (se_thread_lock_t*)data;
   SYSCALL(pthread_cond_destroy(&(lock->cond)));
   SYSCALL(pthread_mutex_destroy(&(lock->lock)));
   SYSCALL(pthread_mutex_destroy(&(lock->check)));
   free(lock);
}

EIF_BOOLEAN se_thread_lock_is_locked(void*data) {
   EIF_BOOLEAN result = 0;
   se_thread_lock_t*lock = (se_thread_lock_t*)data;
   pthread_t *locker;

   SYSCALL(pthread_mutex_lock(&(lock->check)));

   locker = lock->locker;
   result = locker != NULL && pthread_equal(*locker, pthread_self());

   SYSCALL(pthread_mutex_unlock(&(lock->check)));

   return result;
}

void se_thread_lock_lock(void*data) {
   se_thread_lock_t*lock = (se_thread_lock_t*)data;
   SYSCALL(pthread_mutex_lock(&(lock->lock)));
   SYSCALL(pthread_mutex_lock(&(lock->check)));

   lock->locker = &(lock->locker_);
   lock->locker_ = pthread_self();

   SYSCALL(pthread_mutex_unlock(&(lock->check)));
}

void se_thread_lock_unlock(void*data) {
   se_thread_lock_t*lock = (se_thread_lock_t*)data;

   SYSCALL(pthread_mutex_lock(&(lock->check)));

   lock->locker = NULL;

   SYSCALL(pthread_mutex_unlock(&(lock->check)));
   SYSCALL(pthread_mutex_unlock(&(lock->lock)));
}

EIF_BOOLEAN se_thread_lock_timed_wait(void*data,int tm) {
   se_thread_lock_t*lock = (se_thread_lock_t*)data;
   int res;
   EIF_BOOLEAN result = 1;
   struct timespec tmout = { tm / 1000, (tm % 1000) * 1000000 };
   SYSCALL(pthread_mutex_lock(&(lock->check)));

   lock->locker = NULL;
   SYSCALL(pthread_mutex_unlock(&(lock->check)));

   res = pthread_cond_timedwait(&(lock->cond), &(lock->lock), &tmout);
   if (res == ETIMEDOUT) {
      result = 0;
   } else if (res) {
      perror("se_thread_lock_timed_wait");
      exit(7);
   }

   SYSCALL(pthread_mutex_lock(&(lock->check)));

   lock->locker = &(lock->locker_);
   lock->locker_ = pthread_self();

   SYSCALL(pthread_mutex_unlock(&(lock->check)));
   return result;
}

void se_thread_lock_wait(void*data) {
   se_thread_lock_t*lock = (se_thread_lock_t*)data;
   SYSCALL(pthread_mutex_lock(&(lock->check)));

   lock->locker = NULL;

   SYSCALL(pthread_mutex_unlock(&(lock->check)));

   SYSCALL(pthread_cond_wait(&(lock->cond), &(lock->lock)));
   SYSCALL(pthread_mutex_lock(&(lock->check)));

   lock->locker = &(lock->locker_);
   lock->locker_ = pthread_self();

   SYSCALL(pthread_mutex_unlock(&(lock->check)));
}

void se_thread_lock_notify(void*data) {
   se_thread_lock_t*lock = (se_thread_lock_t*)data;
   SYSCALL(pthread_cond_signal(&(lock->cond)));
}

void se_thread_lock_notify_all(void*data) {
   se_thread_lock_t*lock = (se_thread_lock_t*)data;
   SYSCALL(pthread_cond_broadcast(&(lock->cond)));
}
