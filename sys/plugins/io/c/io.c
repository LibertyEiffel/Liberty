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
/* macro read is used of read_stdin */

int io_copy (char*source, char*target) {
     /* We use the low-level descriptor functions rather than stream-oriented functions.
      * This allows us to copy the file's permissions. */

     int src;
     int tgt;
     struct stat info;
     static char *buffer = NULL;
     static int bufsize = 0;
     int read_count, write_count, written;

     src = open(source, O_RDONLY);
     if (fstat (src, &info))
          return 0; /* Ooops */
     if (bufsize < info.st_blksize)
          buffer = se_realloc (buffer, info.st_blksize);
     tgt = creat(target, info.st_mode);
     do {
          read_count = read(src, buffer, info.st_blksize);
          write_count = 0; written = 0;
          while ((write_count < read_count) && (written >= 0)) {
               written = write(tgt, buffer + write_count, read_count - write_count);
               write_count += written;
          }
     } while ((read_count > 0) && (written >= 0));
     close (src);
     close (tgt);

     return written >= 0;
}

int io_same_physical_file(char*path1,char*path2) {
  struct stat info1, info2;
  if (stat(path1, &info1))
    return 0; /* oops */
  if (stat(path2, &info2))
    return 0; /* oops */
  return (info1.st_dev == info2.st_dev) && (info1.st_ino == info2.st_ino);
}

#else
#define IO_COPY_BUFSIZE 4096

int read_stdin(EIF_CHARACTER *buffer, int size) {
  int c;
  c = getc(stdin);
  if (c==EOF)
    return 0;
  *buffer = (EIF_CHARACTER)c;
  return 1;
}

int io_copy(char*source, char*target) {
     static char *buffer = NULL;
     int read_count;
     FILE*src = fopen(source, "rb");
     FILE*tgt = fopen(target, "wb");

     if (!buffer)
          buffer = (char*)se_malloc(IO_COPY_BUFSIZE);

     while ((read_count = fread(buffer, 1, IO_COPY_BUFSIZE, src)), read_count) {
          size_t dummy = fwrite(buffer, 1, read_count, tgt);
          if (errno)
               return 0;
     }
     fclose(src);
     fclose(tgt);

     return 1;
}

int io_same_physical_file(char*path1,char*path2) {
  /* default implementation returns true only if the paths are the same */
  return !strcmp(path1, path2);
}
#endif

int io_file_exists(char*source) {
  FILE*src=fopen(source, "rb");
  if (src!=NULL) {
    fclose(src);
    return 1;
  }
  else {
    return (errno != ENOENT);
  }
}
