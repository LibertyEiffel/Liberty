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
#define SIMULATED_MODE
/* The simulated mode for WIN32.
*/
typedef struct _SIMULATED_DIR {
  HANDLE handle;
  WIN32_FIND_DATA data;
  int entry_used;
  char * pattern;
} SIMULATED_DIR;

static SIMULATED_DIR* simulated_opendir(char* path) {
  int len = strlen((char*)path);
  char* pattern = se_malloc(len + 5);
  SIMULATED_DIR* result = se_malloc(sizeof(SIMULATED_DIR));

  pattern = strcpy(pattern,(char*)path);
  if (pattern[len - 1] != '\\') pattern[len++] = '\\';
  pattern[len++] = '*';
  pattern[len++] = '.';
  pattern[len++] = '*';
  pattern[len++] = 0;
  result->handle = FindFirstFile(pattern,&(result->data));
  if (result->handle == INVALID_HANDLE_VALUE) {
    free(pattern);
    free(result);
    return NULL;
  } else {
    result->pattern = pattern;
  }
  result->entry_used = 0;
  return result;
}

static void* simulated_readdir(SIMULATED_DIR* dirstream) {
  if (dirstream->entry_used) {
    if (FindNextFile(dirstream->handle,&(dirstream->data))) {
      dirstream->entry_used = 1;
      return dirstream;
    }
    else {
      return NULL;
    }
  }
  else {
    dirstream->entry_used = 1;
    return dirstream;
  }
}

#define simulated_get_entry_name(x) ((x)->data.cFileName)

static int simulated_closedir(SIMULATED_DIR* dirstream) {
  FindClose(dirstream->handle);
  free(dirstream->pattern);
  free(dirstream);
  return 0;
}


/* GCC(MingW32) doesn't need these prototypes; whereas, LCC needs them. */
char * getcwd(char* buffer, int maxlen);
int chdir(const char* buffer);
int mkdir(const char* directory_path);
int rmdir(const char* directory_path);


#define simulated_getcwd(x, y) getcwd(x, y)
#define simulated_chdir(x) chdir(x)
#define simulated_rmdir(x) rmdir(x)

int simulated_mkdir(const char* directory_path, int perm) {

  mkdir(directory_path);
  return 0;
}

#endif  /* WIN32 */

#ifdef AMIGA
#define SIMULATED_MODE
/* The simulated mode for AmigaOS 2.04+
   Author: Thomas Aglassinger <agi@rieska.oulu.fi>

   Normally this shouldn't be necessary as all compilers include a
   simulation of the Un*x directory API. However, they differ in
   certain details, often resulting into compiler errors. Thus a
   implementation using native AmigaDOS calls seems preferable.

   Note that many of the happenings below have to deal with the
   various idiosyncracies of the "dos.library", which are not all
   documented clearly in the Autodocs. The biggest surprises should
   be reflected in comments. But consider reading chapter 17 of
   Ralph Babel's "Amiga Guru Book" before changing anything.
*/
#include <exec/types.h>
#include <dos/dos.h>
#include <dos/dostags.h>

#include <proto/exec.h>
#include <proto/dos.h>

typedef struct _SIMULATED_DIR {
  struct FileInfoBlock *info;
  BPTR lock;
} SIMULATED_DIR;


/* Release all resources allocated during `simulated_opendir'; also
   works correctly if structure was only partially initialized.
*/
static void free_simulated_dir(SIMULATED_DIR * dir) {
  if (dir != NULL) {
    if (dir->lock != NULL) {
      UnLock(dir->lock);
    }
    if (dir->info != NULL) {
      FreeDosObject(DOS_FIB, dir->info);
    }
    free(dir);
  }
}

static SIMULATED_DIR * simulated_opendir(char *path) {
  BOOL ok = FALSE;
  SIMULATED_DIR *result = se_malloc(sizeof(SIMULATED_DIR));

  if (result != NULL) {
    result->lock = NULL;
    result->info = (struct FileInfoBlock *) AllocDosObject(DOS_FIB, NULL);
    if (result->info != NULL) {
      result->lock = Lock(path, ACCESS_READ);
      if (result->lock != NULL) {
	ok = (Examine(result->lock, result->info) != DOSFALSE);
	if (ok) {
	  /* Ensure we are scanning a directory, not a file */
	  ok = (result->info->fib_DirEntryType >= 0)
	    && (result->info->fib_DirEntryType != ST_SOFTLINK);
	}
      }
    }
  }
  if (!ok) {
    free_simulated_dir(result);
    result = NULL;
  }
  return result;
}

static void * simulated_readdir(SIMULATED_DIR * dirstream) {
  BOOL ok;
  SIMULATED_DIR *result = NULL;

  ok = (ExNext(dirstream->lock, dirstream->info) != DOSFALSE);

  if (ok) {
    result = dirstream;
  }
  return (void *) result;
}

#define simulated_get_entry_name(entry) ((entry)->info->fib_FileName)

static int simulated_closedir(SIMULATED_DIR * dirstream) {
  free_simulated_dir(dirstream);
  return 0;
}


static EIF_POINTER simulated_getcwd(char *buffer, size_t maximum_length) {
     EIF_POINTER result = NULL;
     BPTR lock = Lock("", ACCESS_READ);
     if (lock != NULL) {
       if (NameFromLock(lock, buffer, maximum_length) != DOSFALSE) {
         result = (EIF_POINTER) buffer;
       }
       UnLock(lock);
     }
     return result;
   }

static int simulated_chdir(char *name) {
  int result = -1;
  BPTR lock = Lock(name, ACCESS_READ);
  if (lock != NULL) {
    /* Change the current working directory (CWD) of the task
     */
    BPTR old_lock = CurrentDir(lock);

    /* Attempt to update internal buffer of the process.
       If we are not running in a process, but a plain task, this
       call does not cause any harm.
    */
    /* FIXME: What's the result of SetCurrentDirName() in a plain
       task? If it is FALSE, the below code won't work.
    */
    if (SetCurrentDirName(name)) {
      /* If this was successful, unlock `old_lock' because we
	 are not going to restore it later; this routine is one
	 of the few cases where such behavior is appropriate.
      */
      UnLock(old_lock);
      result = 0;
    }
    else {
      /* If it fails, restore the previous CWD and make the
	 whole routine fail.
      */
      CurrentDir(old_lock);
    }
  }
  return result;
}

static void strip_trailing_slash(char *path, size_t *length,
				 BOOL * stripped) {
  /* Used in `simulated_mkdir' and `simulated_rmdir' to temporarily
     blank out a possible traling slash (/) in the directory path.
     `restore_trailing_slash' puts it back in place afterwards.
  */
  *length = strlen(path);
  if ((*length > 0) && (path[*length - 1] == '/')) {
    *stripped = TRUE;
    path[*length - 1] = '\0';
  } else {
    *stripped = FALSE;
  }
}

static void restore_trailing_slash(char *path, size_t *length,
				   BOOL * stripped) {
  if (*stripped) {
    path[*length - 1] = '/';
  }
}

static int simulated_mkdir(char *directory_path, int permission) {
  BPTR lock;
  int result = -1;
  size_t path_length;
  BOOL slash_stripped;

  strip_trailing_slash(directory_path, &path_length, &slash_stripped);
  lock = CreateDir(directory_path);
  if (lock != NULL) {
    UnLock(lock);
    result = 0;
  }
  restore_trailing_slash(directory_path, &path_length, &slash_stripped);
  return result;
}

static int simulated_rmdir(char *directory_path) {
  int result = -1;
  size_t path_length;
  BOOL slash_stripped;

  strip_trailing_slash(directory_path, &path_length, &slash_stripped);
  if (DeleteFile(directory_path)) {
    result = 0;
  }
  restore_trailing_slash(directory_path, &path_length, &slash_stripped);
  return result;
}
#endif /* AMIGA */

/*--------------------------------------------------------------------
  At his point, either this is a Linux/POSIX platform or some
  SIMULATED_MODE is defined. Unsupported platform should add their own
  SIMULATED_MODE before.
*/

EIF_POINTER directory_open(EIF_POINTER path) {
#ifndef SIMULATED_MODE
  return (opendir(((char*) path)));
#else
  return (simulated_opendir(((char*) path)));
#endif
}

EIF_POINTER directory_read_entry(EIF_POINTER dirstream) {
#ifndef SIMULATED_MODE
  return readdir((DIR*)dirstream);
#else
  return simulated_readdir((SIMULATED_DIR*)dirstream);
#endif
}

EIF_POINTER directory_get_entry_name(EIF_POINTER entry) {
#ifndef SIMULATED_MODE
  return (((struct dirent*)entry)->d_name);
#else
  return simulated_get_entry_name((SIMULATED_DIR*)entry);
#endif
}

EIF_BOOLEAN directory_close(EIF_POINTER dirstream) {
  int status;
#ifndef SIMULATED_MODE
  status = (closedir((DIR*)dirstream) == 0);
#else
  status = (simulated_closedir((SIMULATED_DIR*)dirstream) == 0);
#endif
  return ((EIF_BOOLEAN)(status ? 1 : 0));
}

EIF_POINTER directory_cwd(void) {
  static char* buf = NULL;
#ifdef WIN32
  /* MS Windows requires size to be an int; whereas in non-windows systems,
     it needs to be size_t
  */
  static int size = 0;
#else
  static size_t size = 0;
#endif
  int status;
  if (buf == NULL) {
    size = 256;
    buf = (char*)se_malloc(size);
  }


#ifndef SIMULATED_MODE
  status = (getcwd(buf,size) != NULL);
#else
  status = (simulated_getcwd(buf,size) != NULL);
#endif


  if (status) {
    return buf;
  }
  else {
    free(buf);
    size = size * 2;
    buf = (char*)se_malloc(size);
    return directory_cwd();
  }
}

EIF_BOOLEAN directory_chdir(EIF_POINTER destination) {
  int status;
#ifndef SIMULATED_MODE
  status = (chdir((char*)destination));
#else
  status = simulated_chdir((char*)destination);
#endif
  return ((EIF_BOOLEAN)(status == 0 ? 1 : 0));
}

EIF_BOOLEAN directory_mkdir(EIF_POINTER directory_path){
  int status;
#ifndef SIMULATED_MODE
  status = (mkdir((char*)directory_path,0777));
#else
  status = simulated_mkdir((char*)directory_path,0777);
#endif
  return ((EIF_BOOLEAN)(status == 0 ? 1 : 0));
}

EIF_BOOLEAN directory_rmdir(EIF_POINTER directory_path){
  int status;
#ifndef SIMULATED_MODE
  status = rmdir((char*)directory_path);
#else
  status = simulated_rmdir((char*)directory_path);
#endif
  return ((EIF_BOOLEAN)(status == 0 ? 1 : 0));
}

