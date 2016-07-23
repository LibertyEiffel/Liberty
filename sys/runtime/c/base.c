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
  This file (SmartEiffel/sys/runtime/base.c) is included for _all_ modes of
  compilation (-boost, -no_check, ... -all_check).
*/

/*
  Byte swapping function
*/
void copy_swap_16(const uint16_t *src, uint16_t *dest, int count){
  while (count--) {
    *dest++ = (*src << 8) | (*src >> 8);
    src++;
  }
}


void se_check_malloc(const void*result, const char*format, ...) {
  if (result == NULL) {
    handle(SE_HANDLE_NO_MORE_MEMORY, NULL);
#ifdef SE_EXCEPTIONS
    internal_exception_handler(No_more_memory);
#elif !defined(SE_BOOST)
    error0("No more memory.", NULL);
#else
    va_list arg;
    va_start(arg, format);
    vfprintf(SE_ERR,format, arg);
    va_end(arg);
    exit(EXIT_FAILURE);
#endif
  }
}

/*
  The wrapper for `malloc' (generated C code is supposed to use
  only `se_malloc' instead of direct `malloc').
*/
void* se_malloc(size_t size) {
   return se_malloc_(size, malloc);
}

void* se_malloc_(size_t size, void*(*alloc)(size_t)) {
  void *result = malloc(size);
  se_check_malloc(result, "No more memory (malloc failed).\n");
  return result;
}

/*
  The wrapper for `calloc' (generated C code is supposed to use
  only `se_calloc' instead of direct `calloc').
*/
void* se_calloc(size_t nmemb, size_t size) {
   return se_calloc_(nmemb, size, calloc);
}

void* se_calloc_(size_t nmemb, size_t size, void*(*alloc)(size_t,size_t)) {
  void *result = calloc(nmemb,size);
  se_check_malloc(result, "No more memory (calloc failed: %lu x %lu).\n", nmemb, size);
  return result;
}

/*
  The wrapper for `realloc' (generated C code is supposed to use
  only `se_realloc' instead of direct `realloc').
*/
void* se_realloc(void* src, size_t size) {
  void *result = realloc(src, size);
  se_check_malloc(result, "No more memory (realloc failed).\n");
  return result;
}

/* ---------------------------------------------------------------------- */

void se_die (int code) {
  handle(SE_HANDLE_DIE_WITH_CODE, &code);
  exit(code);
}

/*
   Runtime hooks
 */

static se_runtime_handler_t** handlers = NULL;
int handlers_count=0;

void register_handler(se_runtime_handler_t*handler) {
  int new_count = handlers_count + 1;
  handlers = (se_runtime_handler_t**)se_realloc(handlers, (new_count) * sizeof(void*));
  handlers[handlers_count] = handler;
  handlers_count = new_count;
}

void _handle(se_handler_action_t action, void*data) {
  int i;
  for (i = 0; i < handlers_count; i++) {
    handlers[i](action, data);
    /* *** Check type of this array. Function pointer may have different size from data pointer. (PH 17/07/08) */
  }
}
