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
#if basic_exec_system == basic_exec_system_posix
static char** envp(void) {
  static char* result[] = {"PATH=/sbin:/usr/sbin:/bin:/usr/bin", NULL};
  return result;
}

static int arr_size(char** arr){
  int size = 0;
  while(arr[size] != NULL) {
    size++;
  }
  return size;
}

static int find_variable(char** env, char* var){
  int location;
  int src_size;
  if(var == NULL || env == NULL)
    return -1;
  src_size = strchr(var, '=') - var + 1;
  for(location = 0; env[location] != NULL; location++){
    if(strncasecmp(env[location], var, src_size) == 0){
      return location;
    }
  }
  return -1;
}

static void check_write(int expected, int actual) {
   if (actual != expected) {
    handle(SE_HANDLE_RUNTIME_ERROR, NULL);
#ifdef SE_EXCEPTIONS
    internal_exception_handler(Routine_failure);
#elif !defined(SE_BOOST)
    error0("Routine failure: could not write.", NULL);
#else
    fprintf(SE_ERR,"Routine failure (write returned %d but expected %d).\n", actual, expected);
    exit(EXIT_FAILURE);
#endif
  }
}

EIF_BOOLEAN basic_exec_posix_execute(se_exec_data_t*data, char*prog, char**args, EIF_BOOLEAN keep_env, char**add_env, int* in_fd, int* out_fd, int* err_fd) {
  int id = fork();
  if (id == 0) {
    /* child */

    if(in_fd) {
      dup2(in_fd[0], 0);
      close(in_fd[1]);
    }

    if(out_fd) {
      dup2(out_fd[1], 1);
      close(out_fd[0]);
    }

    if(err_fd) {
      dup2(err_fd[1], 2);
      close(err_fd[0]);
    }

    if (prog == NULL && args == NULL) {
      data->running = 1;
      data->child = 1;
#ifdef SE_SEDB
      sedb_duplicate();
#endif
      return 1;
    } else {
      if (add_env == NULL && keep_env) {
        execvp(prog, args); /* NO RETURN in child */
        se_print_run_time_stack();
        exit(1);
      }else{
        char** new_env;
        char** old_env;
        int old_size, add_size;
        int src, dest = 0;
        if(keep_env){
          old_env = environ;
        }else{
          old_env = envp();
        }
        old_size = arr_size(old_env);
        add_size = arr_size(add_env);
        new_env = malloc(sizeof(void*) * (old_size + add_size));

        /* we first copy the pointers from the old env */
        for(src = 0; src < old_size; src++){
          new_env[dest++] = old_env[src];
        }

        /* now the ones from add_env */
        for(src = 0; src < add_size; src++){
          int override = find_variable(old_env, add_env[src]);
          if (override >= 0){
            new_env[override] = add_env[src];
          }else{
            new_env[dest++] = add_env[src];
          }
        }

        execve(prog, args, new_env); /* NO RETURN in child */
        se_print_run_time_stack();
        exit(1);
      }
    }
  }
  else if (id > 0) {
    /* father */
    data->id = id;
    data->running = 1;
    data->child = 0;
    if(in_fd) close(in_fd[0]);
    if(out_fd) close(out_fd[1]);
    if(err_fd) close(err_fd[1]);
    return 1;
  } else {
    return 0; /* ... in father only */
  }
}

EIF_BOOLEAN basic_exec_is_finished(se_exec_data_t*data) {
  EIF_BOOLEAN result = (EIF_BOOLEAN)0;
  int status;
  if (data->running) {
    int id = waitpid(data->id, &status, WNOHANG);
    if (id == data->id) {
      /* child is finished */
      result = (EIF_BOOLEAN)(id == data->id);
      basic_exec_cleanup(data, status);
    }
  }
  else{
    result = (EIF_BOOLEAN)1;
  }
  return result;
}

void basic_exec_wait(se_exec_data_t*data) {
  int status;
  if (data->running) {
    int id = waitpid(data->id, &status, 0);
    if (id == data->id) {
      basic_exec_cleanup(data, status);
    }
  }
}

void basic_exec_cleanup(se_exec_data_t*data, int status) {
  data->status = WEXITSTATUS(status);
  data->running = 0;
}

EIF_INTEGER basic_exec_posix_get_character (EIF_INTEGER fd) {
  EIF_INTEGER result = -1;
  char buf[1];
  ssize_t r = read(fd, buf, 1);
  if (r > 0) {
    result = 0xff & ((EIF_INTEGER)(buf[0]));
  }
  return result;
}

void basic_exec_posix_put_character(EIF_INTEGER fd, EIF_CHARACTER c) {
  check_write(1, write(fd, &c, 1));
}

void basic_exec_posix_wait_any(se_exec_data_t*data) {
  data->id = wait(&data->status);
}

void basic_exec_posix_any_finished(se_exec_data_t*data) {
  data->id = waitpid(-1, &data->status, WNOHANG);
}

/*
 * See http://stackoverflow.com/questions/282176/waitpid-equivalent-with-timeout
 *
 * (with specific adaptation to Liberty Eiffel)
 */
static int waitpid_selfpipe[2];
static EIF_OBJECT waitpid_input;

static void waitpid_sigh(int n) {
   check_write(1, write(waitpid_selfpipe[1], "", 1));
}

void basic_exec_waitpid_init(EIF_OBJECT obj) {
   waitpid_input = obj;
}

EIF_INTEGER basic_exec_waitpid_fd(void) {
   static int init = 0;
   static struct sigaction act;
   if (!init) {
      init = 1;
      if (pipe(waitpid_selfpipe) == -1) {
         waitpid_selfpipe[0] = -1;
      }
      else {
         fcntl(waitpid_selfpipe[0], F_SETFL, fcntl(waitpid_selfpipe[0], F_GETFL) | O_NONBLOCK);
         fcntl(waitpid_selfpipe[1], F_SETFL, fcntl(waitpid_selfpipe[1], F_GETFL) | O_NONBLOCK);
         memset(&act, 0, sizeof(act));
         act.sa_handler = waitpid_sigh;
         sigaction(SIGCHLD, &act, NULL);
      }
   }
   return waitpid_selfpipe[0];
}

EIF_INTEGER basic_exec_waitpid_read_buffer(void*data) {
   static char dummy[4096];
   char *buffer = (char*)data;
   int pid, status;

   while (read(waitpid_selfpipe[0], dummy, sizeof(dummy)) > 0);

   while ((pid = waitpid(-1, &status, WNOHANG)) > 0) {
      oob_info(waitpid_input, pid, status);
   }

   buffer[0] = 0;
   return 1;
}
#else
EIF_INTEGER basic_exec_posix_get_character (EIF_INTEGER fd) {
  return 0;
}

void basic_exec_posix_put_character(EIF_INTEGER fd, EIF_CHARACTER c) {
}

void basic_exec_posix_wait_any(se_exec_data_t*data) {
}

void basic_exec_posix_any_finished(se_exec_data_t*data) {
}

EIF_BOOLEAN basic_exec_posix_execute(se_exec_data_t*data, char*prog, char**args, EIF_BOOLEAN keep_env, char**add_env, int* in_fd, int* out_fd, int* err_fd) {
  return 0;
}
#endif
