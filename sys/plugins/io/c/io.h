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
#include <errno.h>

#define text_file_read_open(p) (fopen(((char*)(p)),"r"))
#define text_file_write_open(p) (fopen(((char*)(p)),"w"))
#define text_file_write_append(p) (fopen(((char*)(p)),"a"))
#define text_file_read_write_open(p) (fopen(((char*)(p)),"r+"))
#define text_file_read_write_append(p) (fopen(((char*)(p)),"a+"))
#define binary_file_read_open(p) (fopen(((char*)(p)),"rb"))
#define binary_file_write_open(p) (fopen(((char*)(p)),"wb"))
#define binary_file_write_append(p) (fopen(((char*)(p)),"ab"))
#define io_fclose(p) (fclose((FILE*)(p)))
#define io_flush(p) (fflush((FILE*)(p)))
#define io_getc(f) (getc(((FILE*)(f))))
#define io_putc(b, f) (putc((b),((FILE*)(f))))
#define io_ungetc(b, f) (ungetc((b), (FILE*)(f)))
#define io_fread(b, n, f) (fread((void *)(b),(size_t)(1), (size_t)(n),(FILE*)(f)))
#define io_fwrite(b, n, f) (fwrite((void *)(b),(size_t)(1), (size_t)(n),(FILE*)(f)))
#define io_feof(f) (feof(((FILE*)(f))))
#define io_rename(o, n) (rename(((char*)(o)),((char*)(n))) == 0)
#define io_remove(f) (remove(((char*)(f))) == 0)
#define io_fseek(f, o) (fseek((FILE*)(f),(o),SEEK_SET))
#define io_ftell(f) ((EIF_INTEGER_64)ftell((FILE*)(f)))

#if defined __USE_POSIX || defined __unix__ || defined _POSIX_C_SOURCE || (defined __APPLE__ && defined __MACH__)
#  define read_stdin(b, s) (read(STDIN_FILENO, b, s))
#else
   extern int read_stdin(EIF_CHARACTER *buffer, int size);
#endif

extern int io_copy(char*source, char*target);
extern int io_file_exists(char*source);
extern int io_same_physical_file(char*path1,char*path2);
