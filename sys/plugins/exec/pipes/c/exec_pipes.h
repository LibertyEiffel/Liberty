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
#if defined __USE_POSIX || defined __unix__ || defined _POSIX_C_SOURCE || (defined __APPLE__ && defined __MACH__)
/*#  include <unistd.h> done in base.h */
/*#  include <sys/types.h> done in base.h */

typedef struct se_pipe_data se_pipe_data_t;
struct se_pipe_data {
  int fd_in; /* read from the pipe */
  int fd_out; /* write to the pipe */
  char last; /* last character read */
  int errnum; /* if an error occurs, 0 otherwise */
};

se_pipe_data_t* basic_exec_pipe_create(void);
se_pipe_data_t* basic_exec_pipe_in_named(void*);
se_pipe_data_t* basic_exec_pipe_out_named(void*);

#define basic_exec_pipe_in_disconnect(data) do { close(((se_pipe_data_t*)(data))->fd_in); } while(0)
int basic_exec_pipe_read(se_pipe_data_t*,int);
#define basic_exec_pipe_read_character(data) (((se_pipe_data_t*)(data))->last)
#define basic_exec_pipe_in_fd(data) (((se_pipe_data_t*)(data))->fd_in)

#define basic_exec_pipe_out_disconnect(data) do { close(((se_pipe_data_t*)(data))->fd_out); } while(0)
int basic_exec_pipe_write(se_pipe_data_t*,char,int);
#define basic_exec_pipe_flush(data) do { fsync(((se_pipe_data_t*)(data))->fd_out); } while(0)
#define basic_exec_pipe_out_fd(data) (((se_pipe_data_t*)(data))->fd_out)

#define basic_exec_pipe_again(data) (((se_pipe_data_t*)(data))->errnum == EAGAIN)
char* basic_exec_pipe_error(se_pipe_data_t*);

#else
#error "pipes not implemented. Drop a mail to liberty-eiffel@gnu.org"
#endif
