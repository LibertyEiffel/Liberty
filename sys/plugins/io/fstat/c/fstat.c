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

EIF_INTEGER fstat_st_size(EIF_POINTER path) {

  struct stat buf;
  int test;

  test = stat(path, &buf);
  return (test == 0 ? buf.st_size : -1);

}

EIF_INTEGER_64 fstat_st_mtime(EIF_POINTER path) {

  struct stat buf;
  int test;

  test = stat(path, &buf);
  return (test == 0 ? buf.st_mtime : -1);

}

EIF_BOOLEAN fstat_st_is_file(EIF_POINTER path) {
#if defined S_ISREG
  struct stat buf;

  return stat((const char *)path, &buf)?0:!!S_ISREG(buf.st_mode);
#elif defined WIN32
  EIF_BOOLEAN result;
  HANDLE h=CreateFile((LPCTSTR)path, GENERIC_READ, FILE_SHARE_READ | FILE_SHARE_WRITE,
                      NULL, OPEN_EXISTING, 0, NULL);

  if(INVALID_HANDLE_VALUE == h) {
    return 0;
  }
  result = (GetFileType(h) == FILE_TYPE_DISK)
    && !(GetFileAttributes((LPCTSTR) path) & FILE_ATTRIBUTE_DIRECTORY);
  CloseHandle(h);
  return result;
#else
  printf("fstat_st_is_file (in SmartEiffel/sys/io/c/fstat.c)\nnot yet implemented for this architecture.\n");
  se_print_run_time_stack();
  exit(EXIT_FAILURE);
#endif
}

EIF_BOOLEAN fstat_st_is_dir(EIF_POINTER path) {
#if defined S_ISDIR
  struct stat buf;

  return stat((const char *)path, &buf)?0:!!S_ISDIR(buf.st_mode);
#elif defined WIN32
  DWORD attr =GetFileAttributes((LPCTSTR) path);
  return (attr != INVALID_FILE_ATTRIBUTES)  && (attr & FILE_ATTRIBUTE_DIRECTORY);
#else
  printf("fstat_st_is_dir (in SmartEiffel/sys/io/c/fstat.c)\nnot yet implemented for this architecture.\n");
  se_print_run_time_stack();
  exit(EXIT_FAILURE);
#endif
}
