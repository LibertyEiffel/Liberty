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
/*#  include <windows.h> done in base.h */
#  ifndef _MSC_VER
#    include <winsock2.h>
#  endif
   extern int win32_msg;
   extern int win32_msg_ready;
   extern HANDLE sem_msg_ready;
#else
#  include <sys/time.h>
/*#  include <unistd.h> done in base.h */
/*#  include <sys/types.h> done in base.h */
#endif

#ifdef WIN32
#  define sequencer_watch(set, fd) do { \
  if ((fd)==-1) win32_msg=1; else FD_SET((SOCKET)fd, (fd_set*)(set)); \
} while(0)
#else
#  define sequencer_watch(set, fd) FD_SET(fd, (fd_set*)(set))
#endif


#ifdef WIN32
/****TODO: fd evaluated twice. */
#  define sequencer_is_ready(set, fd) (EIF_BOOLEAN)(((fd)==-1)?win32_msg_ready:FD_ISSET(fd, (fd_set*)(set)))
#else
#  define sequencer_is_ready(set, fd) FD_ISSET(fd, (fd_set*)(set))
#endif


#ifdef WIN32
#  define sequencer_reset(set) do{win32_msg=0;win32_msg_ready=FALSE;FD_ZERO((fd_set*)(set));}while(0)
#else
#  define sequencer_reset(set) FD_ZERO((fd_set*)(set))
#endif

#define sequencer_create_set (_sequencer_create_set())
EIF_POINTER _sequencer_create_set(void);
int sequencer_wait(int n, fd_set *read_set, int read_size, int read_more, fd_set *write_set, int write_size, int write_more, fd_set *exception_set, int exception_size, int exception_more, int s, int us);

#define sequencer_descriptor(file) (fileno((FILE *)(file)))
