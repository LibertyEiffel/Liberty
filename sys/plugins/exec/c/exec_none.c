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
#if basic_exec_system == basic_exec_system_none
/* Dummy implementation that always reports an error back to the Eiffel side */

EIF_BOOLEAN basic_exec_execute(se_exec_data_t*data, char*prog, char**args, EIF_BOOLEAN keep_env, char**add_env, int* in_fd, int* out_fd, int* err_fd) {
  return 0;
}

EIF_BOOLEAN basic_exec_is_finished(se_exec_data_t*data) {
  return (EIF_BOOLEAN)0;
}

void basic_exec_wait(se_exec_data_t*data) {
}

EIF_INTEGER basic_exec_get_character (EIF_INTEGER fd) {
  return (EIF_INTEGER)0;
}

void basic_exec_put_character(EIF_INTEGER fd, EIF_CHARACTER c) {
}

void basic_exec_cleanup(se_exec_data_t*data, int status) {
}

void basic_exec_waitpid_init(EIF_OBJECT obj) {
}

EIF_INTEGER basic_exec_waitpid_fd(void) {
   return -1;
}

EIF_INTEGER basic_exec_waitpid_read_buffer(void*data) {
   return -1;
}
#else
#endif
