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
#if basic_exec_system == basic_exec_system_win32
static char* envp(void) {
  static char* result = "\0";/* *** Maybe call GetFullPathName to set =C: and friends */
  return result;
}

EIF_BOOLEAN basic_exec_win32_execute(se_exec_data_t*data, char*args, EIF_BOOLEAN keep_env, char*add_env, HANDLE*in_h, HANDLE*out_h, HANDLE*err_h) {
  STARTUPINFO start_info;
  EIF_BOOLEAN result = 0;

  ZeroMemory( &start_info, sizeof(STARTUPINFO) );

  start_info.cb = sizeof(STARTUPINFO);
  if(in_h) {
    start_info.hStdInput = in_h[0];
    SetHandleInformation(in_h[1], HANDLE_FLAG_INHERIT, 0);
  } else {
    start_info.hStdInput = GetStdHandle(STD_INPUT_HANDLE);
  }
  if(INVALID_HANDLE_VALUE == start_info.hStdInput) goto leave;
  if(out_h) {
    start_info.hStdOutput = out_h[1];
    SetHandleInformation(out_h[0], HANDLE_FLAG_INHERIT, 0);
  } else {
    start_info.hStdOutput = GetStdHandle(STD_OUTPUT_HANDLE);
  }
  if(INVALID_HANDLE_VALUE == start_info.hStdOutput) goto leave;
  if(err_h) {
    start_info.hStdError = err_h[1];
    SetHandleInformation(err_h[0], HANDLE_FLAG_INHERIT, 0);
  } else {
    start_info.hStdError = GetStdHandle(STD_ERROR_HANDLE);
  }
  if(INVALID_HANDLE_VALUE == start_info.hStdError) goto leave;
  start_info.dwFlags |= STARTF_USESTDHANDLES;

  if(CreateProcess(NULL, args,
                   NULL,                                /* process security attributes          */
                   NULL,                                /* primary thread security attributes   */
                   TRUE,                                /* handles are inherited                */
                   0,                                   /* creation flags                       */
                   keep_env?NULL:envp(),
                   NULL,                                /* use parent's current directory       */
                   &start_info,                         /* STARTUPINFO pointer                  */
                   &data->process_information)) {       /* receives PROCESS_INFORMATION         */
    CloseHandle(data->process_information.hThread);
    data->running = 1;
    result = 1;
  }
 leave:
  if(in_h) CloseHandle(in_h[0]);
  if(out_h) CloseHandle(out_h[1]);
  if(err_h) CloseHandle(err_h[1]);
  return result;
}

EIF_BOOLEAN basic_exec_init_pipe(HANDLE*pipe) {
  SECURITY_ATTRIBUTES security_attributes;

  // Set the bInheritHandle flag so pipe handles are inherited.

  security_attributes.nLength = sizeof(SECURITY_ATTRIBUTES);
  security_attributes.bInheritHandle = TRUE;
  security_attributes.lpSecurityDescriptor = NULL;

  return CreatePipe(pipe, pipe+1, &security_attributes, 0);
}

EIF_BOOLEAN basic_exec_is_finished(se_exec_data_t*data) {
  EIF_BOOLEAN result = (EIF_BOOLEAN)0;
  if (data->running) {
    result = (WaitForSingleObject(data->process_information.hProcess, 0) == WAIT_OBJECT_0);
    if (result) {
      /* child is finished */
      DWORD status;
      GetExitCodeProcess(data->process_information.hProcess, &status);
      /* *** Could have failed */
      basic_exec_cleanup(data, status);
    }
  }
  else{
    result = (EIF_BOOLEAN)1;
  }
  return result;
}

void basic_exec_wait(se_exec_data_t*data) {
  if (data->running) {
    DWORD status;
    WaitForSingleObject(data->process_information.hProcess, INFINITE);
    GetExitCodeProcess(data->process_information.hProcess, &status);
    /* *** Any of these calls could have failed, right? */
    basic_exec_cleanup(data, status);
  }
}

EIF_INTEGER basic_exec_win32_get_character (HANDLE h) {
  char result;
  DWORD num_read;

  ReadFile(h, &result, 1, &num_read, NULL);
  if(!num_read) return -1;
  return result;
}

void basic_exec_win32_put_character(HANDLE h, EIF_CHARACTER c) {
  DWORD num_written;

  WriteFile(h, &c, 1, &num_written, NULL);
  /* *** Do something if num_written!=1 or WriteFile returned 0. */
}

void basic_exec_cleanup(se_exec_data_t*data, int status) {
  data->status = status;
  data->running = 0;
  CloseHandle(data->process_information.hProcess);
}

EIF_BOOLEAN basic_exec_win32_wait_any(HANDLE*handles, DWORD count, se_exec_data_t*data) {
  DWORD result = WaitForMultipleObjects(count, handles, FALSE, INFINITE);
  EIF_BOOLEAN success = (result < (WAIT_OBJECT_0 + count));
  if(success) {
    int index = result - WAIT_OBJECT_0;
    HANDLE handle = handles[index];
    GetExitCodeProcess(handle, &data->status);
    data->process_information.hProcess = handle;
  }
  return success;
}

EIF_BOOLEAN basic_exec_win32_any_finished(HANDLE*handles, DWORD count, se_exec_data_t*data ) {
  DWORD result = WaitForMultipleObjects(count, handles, FALSE, 0);
  EIF_BOOLEAN success = (result < (WAIT_OBJECT_0 + count));
  if(success) {
    int index = result - WAIT_OBJECT_0;
    HANDLE handle = handles[index];
    GetExitCodeProcess(handle, &data->status);
    data->process_information.hProcess = handle;
  }
  return success;
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
EIF_INTEGER basic_exec_win32_get_character (void *h) {
  return 0;
}

void basic_exec_win32_put_character(void *h, EIF_CHARACTER c) {
}

EIF_BOOLEAN basic_exec_win32_wait_any(void*handles, int count, se_exec_data_t*data) {
  return 0;
}

EIF_BOOLEAN basic_exec_win32_any_finished(void*handles, int count, se_exec_data_t*data) {
  return 0;
}

EIF_BOOLEAN basic_exec_win32_execute(se_exec_data_t*data, char*args, EIF_BOOLEAN keep_env, char*add_env, void*in_h, void*out_h, void*err_h) {
  return 0;
}
#endif
