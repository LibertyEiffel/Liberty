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

se_pipe_data_t* basic_exec_pipe_create(void) {
  se_pipe_data_t* result = NULL;
  int fd[2];
  if (pipe(fd) == 0) {
    result = (se_pipe_data_t*)se_malloc(sizeof(se_pipe_data_t));
    if (result != NULL) {
      result->fd_in = fd[0];
      result->fd_out = fd[1];
    }
  }
  return result;
}

se_pipe_data_t* basic_exec_pipe_in_named(void*p) {
  se_pipe_data_t* result = NULL;
  char*path = (char*)p;
  int fd = open(path, O_RDONLY);
  if (fd != -1) {
    result = (se_pipe_data_t*)se_malloc(sizeof(se_pipe_data_t));
    if (result != NULL) {
      result->fd_in = fd;
    }
  }
  return result;
}

se_pipe_data_t* basic_exec_pipe_out_named(void*p) {
  se_pipe_data_t* result = NULL;
  char*path = (char*)p;
  int fd = open(path, O_WRONLY);
  if (fd != -1) {
    result = (se_pipe_data_t*)se_malloc(sizeof(se_pipe_data_t));
    if (result != NULL) {
      result->fd_out = fd;
    }
  }
  return result;
}

int basic_exec_pipe_read(se_pipe_data_t*data,int sync) {
  int result;
  if (!sync) {
    fcntl(data->fd_in, F_SETFL, O_NONBLOCK);
  }
  result = read(data->fd_in, &(data->last), 1);
  if (result < 0) {
    data->errnum = errno;
  } else {
    data->errnum = 0;
  }
  if (!sync) {
    fcntl(data->fd_in, F_SETFL, 0);
  }
  return result;
}

int basic_exec_pipe_write(se_pipe_data_t*data,char c,int sync) {
  int result;
  if (!sync) {
    fcntl(data->fd_out, F_SETFL, O_NONBLOCK);
  }
  result = write(data->fd_out, &c, 1);
  if (result < 0) {
    data->errnum = errno;
  } else {
    data->errnum = 0;
  }
  if (!sync) {
    fcntl(data->fd_out, F_SETFL, 0);
  }
  return result;
}

#define SE_PIPES_ERROR_BUFFER_SIZE 4096

char* basic_exec_pipe_error(se_pipe_data_t*data) {
  static char result[SE_PIPES_ERROR_BUFFER_SIZE];
  if (data->errnum == 0) {
    return NULL;
  }
  snprintf(result, SE_PIPES_ERROR_BUFFER_SIZE, "%s", strerror(data->errnum));
  return result;
}

#else
#error "pipes not implemented. Drop a mail to liberty-eiffel@gnu.org"
#endif
