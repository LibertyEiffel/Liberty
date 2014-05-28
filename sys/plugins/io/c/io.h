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

#if defined __USE_POSIX || defined __unix__ || defined _POSIX_C_SOURCE
 #include <termios.h>
#endif

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
#define io_rename(o, n) (rename(((char*)(o)),((char*)(n))))
#define io_remove(f) (remove(((char*)(f))))
#define io_fseek(f, o) (fseek((FILE*)(f),(o),SEEK_SET))
#define io_ftell(f) ((EIF_INTEGER_64)ftell((FILE*)(f)))

#if defined __USE_POSIX || defined __unix__ || defined _POSIX_C_SOURCE
#  define read_stdin(b, s) (read(STDIN_FILENO, b, s))
#else
   extern int read_stdin(EIF_CHARACTER *buffer, int size);
#endif

extern void io_copy(char*source, char*target);
extern int io_file_exists(char*source);
extern int io_same_physical_file(char*path1,char*path2);

#if defined __USE_POSIX || defined __unix__ || defined _POSIX_C_SOURCE
 #define termios_fd(FILE_p) fileno(FILE_p)
 #define termios_tcdrain(FILE_p) ((tcdrain(termios_fd(FILE_p))) == 0 ? 0 : errno)
 #define termios_cfgetispeed(s_termios) (cfgetispeed(s_termios))
 #define termios_cfgetospeed(s_termios) (cfgetospeed(s_termios))
 #define termios_cfsetispeed(s_termios, speed) (cfsetispeed(s_termios, speed))
 #define termios_cfsetospeed(s_termios, speed) (cfsetospeed(s_termios, speed))
 #define termios_tcgetattr(fp, s_termios) (tcgetattr(termios_fd(fp), s_termios) == 0 ? 0 : errno)
 #define termios_tcsetattr(fp, s_termios) (tcsetattr(termios_fd(fp), TCSADRAIN, s_termios) == 0 ? 0 : errno)
 #define termios_allocate() ((EIF_POINTER) se_malloc(sizeof(struct termios)))
 #define termios_free(s_termios_p) (free(s_termios_p))
 #define termios_strerror(err) (strerror(err))
#else
 #error TERMINAL_SETTINGS currently not implemented on this platform (please port termios.h)
#endif
