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
#define basic_exec_system_none  0
#define basic_exec_system_posix 1
#define basic_exec_system_win32 2

#include "eiffel_exec.h"

/***************************
 * Common macros and types *
 * basic_exec_xxx          *
 ***************************/

#if defined __USE_POSIX || defined __unix__ || defined _POSIX_C_SOURCE || (defined(__APPLE__) && defined(__MACH__))

/*#  include <unistd.h> done in base.h */
/*#  include <sys/types.h> done in base.h */
#include <sys/wait.h>

typedef struct se_exec_data se_exec_data_t;
struct se_exec_data {
  pid_t id; /* the launched child process id */
  int running; /* true if the process is running */
  int child; /* true if the process is the child itself (useful for duplicate) */
  int status; /* the status of the child process if finished */
};

extern char** environ;

#define basic_exec_id(data) (((se_exec_data_t*)data)->id)
#define basic_exec_is_child(data) (((se_exec_data_t*)data)->child)
#define basic_exec_status(data) (((se_exec_data_t*)data)->status)
#define basic_exec_alloc_pipe() (calloc(2, sizeof(int)))
#define basic_exec_free_pipe(p) (free(p))
#define basic_exec_alloc_data() ((se_exec_data_t*)se_malloc(sizeof(se_exec_data_t)))
#define basic_exec_free_data(p) (free(p))
#define basic_exec_init_pipe(p) ((EIF_BOOLEAN)(pipe(p)>=0))
#define basic_exec_system basic_exec_system_posix

#elif defined WIN32
/*#  include <windows.h> done in base.h */

typedef struct se_exec_data se_exec_data_t;
struct se_exec_data {
  PROCESS_INFORMATION process_information;
  int running;
  DWORD status;
};

#define basic_exec_id(data) (((se_exec_data_t*)data)->process_information.dwProcessId)
#define basic_exec_is_child(data) (0)
#define basic_exec_status(data) (((se_exec_data_t*)data)->status)

#define basic_exec_alloc_pipe() (calloc(2, sizeof(HANDLE)))
#define basic_exec_free_pipe(p) (free(p))
#define basic_exec_alloc_data() ((se_exec_data_t*)se_malloc(sizeof(se_exec_data_t)))
#define basic_exec_free_data(p) (free(p))
#define basic_exec_system basic_exec_system_win32

extern EIF_BOOLEAN basic_exec_init_pipe(HANDLE*p);

#else
/* Dummy implementation that always reports an error back to the Eiffel side */
typedef int se_exec_data_t;

#define basic_exec_id(data) (-1)
#define basic_exec_is_child(data) (0)
#define basic_exec_status(data) (0)

#define basic_exec_alloc_pipe() (NULL)
#define basic_exec_free_pipe(p) /* dummy */
#define basic_exec_alloc_data() ((se_exec_data_t*)NULL)
#define basic_exec_free_data(p) /* dummy */
#define basic_exec_init_pipe(p) ((EIF_BOOLEAN)0)
#define basic_exec_system basic_exec_system_none

#endif

/***********************************
 * Prototypes for common functions *
 * basic_exec_xxx                  *
 ***********************************/

extern EIF_BOOLEAN basic_exec_is_finished(se_exec_data_t*data);
extern void basic_exec_wait(se_exec_data_t*data);
extern void basic_exec_cleanup(se_exec_data_t*data, int status);

/*************************************************
 * Posix-specific function prototypes and macros *
 * basic_exec_posix_xxx                          *
 *************************************************/

extern EIF_BOOLEAN basic_exec_posix_execute(se_exec_data_t*data, char*prog, char**args, EIF_BOOLEAN keep_env, char**add_env, int*in_fd, int*out_fd, int*err_fd);
extern EIF_INTEGER basic_exec_posix_get_character (EIF_INTEGER fd);
extern void basic_exec_posix_put_character(EIF_INTEGER fd, EIF_CHARACTER c);
extern void basic_exec_posix_wait_any(se_exec_data_t*data);
extern void basic_exec_posix_any_finished(se_exec_data_t*data);

#if basic_exec_system == basic_exec_system_posix
#define basic_exec_posix_flush(fd) (fsync(fd))
#define basic_exec_posix_close(fd) (close(fd))
#define basic_exec_posix_kill(data, sig) (kill((data)->id, (sig)))
#define basic_exec_posix_get_in_descriptor(pipe) (((int*)pipe)[0])
#define basic_exec_posix_get_out_descriptor(pipe) (((int*)pipe)[1])
#else
#define basic_exec_posix_flush(fd) /* dummy */
#define basic_exec_posix_close(fd) /* dummy */
#define basic_exec_posix_kill(data, sig) /* dummy */
#define basic_exec_posix_get_in_descriptor(pipe) 0
#define basic_exec_posix_get_out_descriptor(pipe) 0
#endif

/*************************************************
 * Win32-specific function prototypes and macros *
 * basic_exec_win32_xxx                          *
 *************************************************/

#if basic_exec_system == basic_exec_system_win32
#define basic_exec_win32_flush(h) FlushFileBuffers((HANDLE)h)
#define basic_exec_win32_close(h) CloseHandle((HANDLE)h)
#define basic_exec_win32_handle(data) ((int)((se_exec_data_t*)data)->process_information.hProcess)
#define basic_exec_win32_maximum_wait (MAXIMUM_WAIT_OBJECTS)
extern EIF_BOOLEAN basic_exec_win32_execute(se_exec_data_t*data, char*args, EIF_BOOLEAN keep_env, char*add_env, HANDLE*in_h, HANDLE*out_h, HANDLE*err_h);
extern EIF_BOOLEAN basic_exec_win32_wait_any(HANDLE*handles, DWORD count, se_exec_data_t*data);
extern EIF_BOOLEAN basic_exec_win32_any_finished(HANDLE*handles, DWORD count, se_exec_data_t*data);
extern void basic_exec_win32_put_character(HANDLE h, EIF_CHARACTER c);
extern EIF_INTEGER basic_exec_win32_get_character (HANDLE h);
#define basic_exec_win32_get_in_handle(pipe) (((HANDLE*)pipe)[0])
#define basic_exec_win32_get_out_handle(pipe) (((HANDLE*)pipe)[1])
#else
#define basic_exec_win32_flush(h) /* dummy */
#define basic_exec_win32_close(h) /* dummy */
#define basic_exec_win32_handle(data) (0)
#define basic_exec_win32_maximum_wait (0)
extern EIF_BOOLEAN basic_exec_win32_execute(se_exec_data_t*data, char*args, EIF_BOOLEAN keep_env, char*add_env, void*in_h, void*out_h, void*err_h);
extern EIF_BOOLEAN basic_exec_win32_wait_any(void*handles, int count, se_exec_data_t*data);
extern EIF_BOOLEAN basic_exec_win32_any_finished(void*handles, int count, se_exec_data_t*data);
extern void basic_exec_win32_put_character(void*h, EIF_CHARACTER c);
extern EIF_INTEGER basic_exec_win32_get_character (void*h);
#define basic_exec_win32_get_in_handle(pipe) NULL
#define basic_exec_win32_get_out_handle(pipe) NULL
#endif

extern void basic_exec_waitpid_init(EIF_OBJECT);
extern EIF_INTEGER basic_exec_waitpid_fd(void);
extern EIF_INTEGER basic_exec_waitpid_read_buffer(void*);
