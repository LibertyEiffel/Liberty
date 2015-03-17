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
#ifdef WIN32
int win32_msg=0;
int win32_msg_ready=FALSE;
HANDLE sem_msg_ready;
#endif

EIF_POINTER _sequencer_create_set(void) {
  return se_malloc(sizeof(fd_set));
}

int sequencer_wait(int n, fd_set *read_set, int read_size, int read_more, fd_set *write_set, int write_size, int write_more, fd_set *exception_set, int exception_size, int exception_more, int s, int us){
  struct timeval tv;
  int ret=0;

  tv.tv_sec = s;
  tv.tv_usec = us;
#ifndef WIN32
  if (select(n, read_set, write_set, exception_set, &tv) == -1)
    ret = -1;
#else
  if (win32_msg == 0) {
    if (n==0)
      Sleep(s*1000+us/1000);
    else {
      if (select(n, ((read_size||read_more)?read_set:NULL), ((write_size||write_more)?write_set:NULL), ((exception_size||exception_more)?exception_set:NULL), &tv) == -1)
        ret = -1;
    }
  } else {
    if (WaitForSingleObject(sem_msg_ready, 0) == WAIT_OBJECT_0) {
      ReleaseSemaphore(sem_msg_ready, 1, NULL);
      win32_msg_ready = TRUE;
    } else {
      if ((s != 0) || (us != 0)) {
        HANDLE pHandles[MAXIMUM_WAIT_OBJECTS];
        int nCount = 0;
        int to;
        int i;

        if (s>2) {
          /* Never wait more than 2 seconds in case race condition occured */
          to = 2000;
        } else {
          to = 1000*s + us/1000;
        }
        pHandles[nCount++] = sem_msg_ready;
        for (i = read_set->fd_count-1; i >= 0; i--)
          pHandles[nCount++] = (HANDLE)read_set->fd_array[i];
        for (i = write_set->fd_count-1; i >= 0; i--)
          pHandles[nCount++] = (HANDLE)write_set->fd_array[i];
        ret = WaitForMultipleObjects(nCount, pHandles, FALSE, to);
        if (ret == WAIT_OBJECT_0) {
          ReleaseSemaphore(sem_msg_ready, 1, NULL);
          win32_msg_ready = TRUE;
        }
        if (ret != WAIT_TIMEOUT) {
          ret -= WAIT_OBJECT_0;
          if (ret < 0 || ret >= nCount) {
            fprintf(stderr, "Error in WaitForMultipleObjects\n");
            ret = -1;
          }
        }
      }
      if (n) {
        struct timeval nowait={0,0};
        /* use read_size-1 because win32_msg was counted as read fd */
        if (select(n, ((read_size-1||read_more)?read_set:NULL), ((write_size||write_more)?write_set:NULL), ((exception_size||exception_more)?exception_set:NULL),&nowait) == -1)
          ret = -1;
      }
    }
  }
#endif
  return ret;
}
