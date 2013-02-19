class GLIB_SPAWNING_PROCESSES
--    Spawning Processes

--    Spawning Processes -- process launching with fork()/exec().

-- Synopsis


--  #include <glib.h>


--  enum        GSpawnError;
--  #define     G_SPAWN_ERROR
--  enum        GSpawnFlags;
--  void        (*GSpawnChildSetupFunc)         (gpointer user_data);
--  gboolean    g_spawn_async_with_pipes        (const gchar *working_directory,
--                                               gchar **argv,
--                                               gchar **envp,
--                                               GSpawnFlags flags,
--                                               GSpawnChildSetupFunc child_setup,
--                                               gpointer user_data,
--                                               GPid *child_pid,
--                                               gint *standard_input,
--                                               gint *standard_output,
--                                               gint *standard_error,
--                                               GError **error);
--  gboolean    g_spawn_async                   (const gchar *working_directory,
--                                               gchar **argv,
--                                               gchar **envp,
--                                               GSpawnFlags flags,
--                                               GSpawnChildSetupFunc child_setup,
--                                               gpointer user_data,
--                                               GPid *child_pid,
--                                               GError **error);
--  gboolean    g_spawn_sync                    (const gchar *working_directory,
--                                               gchar **argv,
--                                               gchar **envp,
--                                               GSpawnFlags flags,
--                                               GSpawnChildSetupFunc child_setup,
--                                               gpointer user_data,
--                                               gchar **standard_output,
--                                               gchar **standard_error,
--                                               gint *exit_status,
--                                               GError **error);
--  gboolean    g_spawn_command_line_async      (const gchar *command_line,
--                                               GError **error);
--  gboolean    g_spawn_command_line_sync       (const gchar *command_line,
--                                               gchar **standard_output,
--                                               gchar **standard_error,
--                                               gint *exit_status,
--                                               GError **error);
--  void        g_spawn_close_pid               (GPid pid);


-- Description

-- Details

--   enum GSpawnError

--  typedef enum
--  {
--    G_SPAWN_ERROR_FORK,   /* fork failed due to lack of memory */
--    G_SPAWN_ERROR_READ,   /* read or select on pipes failed */
--    G_SPAWN_ERROR_CHDIR,  /* changing to working dir failed */
--    G_SPAWN_ERROR_ACCES,  /* execv() returned EACCES */
--    G_SPAWN_ERROR_PERM,   /* execv() returned EPERM */
--    G_SPAWN_ERROR_2BIG,   /* execv() returned E2BIG */
--    G_SPAWN_ERROR_NOEXEC, /* execv() returned ENOEXEC */
--    G_SPAWN_ERROR_NAMETOOLONG, /* ""  "" ENAMETOOLONG */
--    G_SPAWN_ERROR_NOENT,       /* ""  "" ENOENT */
--    G_SPAWN_ERROR_NOMEM,       /* ""  "" ENOMEM */
--    G_SPAWN_ERROR_NOTDIR,      /* ""  "" ENOTDIR */
--    G_SPAWN_ERROR_LOOP,        /* ""  "" ELOOP   */
--    G_SPAWN_ERROR_TXTBUSY,     /* ""  "" ETXTBUSY */
--    G_SPAWN_ERROR_IO,          /* ""  "" EIO */
--    G_SPAWN_ERROR_NFILE,       /* ""  "" ENFILE */
--    G_SPAWN_ERROR_MFILE,       /* ""  "" EMFLE */
--    G_SPAWN_ERROR_INVAL,       /* ""  "" EINVAL */
--    G_SPAWN_ERROR_ISDIR,       /* ""  "" EISDIR */
--    G_SPAWN_ERROR_LIBBAD,      /* ""  "" ELIBBAD */
--    G_SPAWN_ERROR_FAILED       /* other fatal failure, error->message
--                                * should explain
--                                */
--  } GSpawnError;

--    Error codes returned by spawning processes.

--    G_SPAWN_ERROR_FORK        Fork failed due to lack of memory.
--    G_SPAWN_ERROR_READ        Read or select on pipes failed.
--    G_SPAWN_ERROR_CHDIR       Changing to working directory failed.
--    G_SPAWN_ERROR_ACCES       execv() returned EACCES.
--    G_SPAWN_ERROR_PERM        execv() returned EPERM.
--    G_SPAWN_ERROR_2BIG        execv() returned E2BIG.
--    G_SPAWN_ERROR_NOEXEC      execv() returned ENOEXEC.
--    G_SPAWN_ERROR_NAMETOOLONG execv() returned ENAMETOOLONG.
--    G_SPAWN_ERROR_NOENT       execv() returned ENOENT.
--    G_SPAWN_ERROR_NOMEM       execv() returned ENOMEM.
--    G_SPAWN_ERROR_NOTDIR      execv() returned ENOTDIR.
--    G_SPAWN_ERROR_LOOP        execv() returned ELOOP.
--    G_SPAWN_ERROR_TXTBUSY     execv() returned ETXTBUSY.
--    G_SPAWN_ERROR_IO          execv() returned EIO.
--    G_SPAWN_ERROR_NFILE       execv() returned ENFILE.
--    G_SPAWN_ERROR_MFILE       execv() returned EMFILE.
--    G_SPAWN_ERROR_INVAL       execv() returned EINVAL.
--    G_SPAWN_ERROR_ISDIR       execv() returned EISDIR.
--    G_SPAWN_ERROR_LIBBAD      execv() returned ELIBBAD.
--    G_SPAWN_ERROR_FAILED      Some other fatal failure, error->message should
--                              explain.

--    ---------------------------------------------------------------------------------

--   G_SPAWN_ERROR

--  #define G_SPAWN_ERROR g_spawn_error_quark ()

--    Error domain for spawning processes. Errors in this domain will be from the
--    GSpawnError enumeration. See GError for information on error domains.

--    ---------------------------------------------------------------------------------

--   enum GSpawnFlags

--  typedef enum
--  {
--    G_SPAWN_LEAVE_DESCRIPTORS_OPEN = 1 << 0,
--    G_SPAWN_DO_NOT_REAP_CHILD      = 1 << 1,
--    /* look for argv[0] in the path i.e. use execvp() */
--    G_SPAWN_SEARCH_PATH            = 1 << 2,
--    /* Dump output to /dev/null */
--    G_SPAWN_STDOUT_TO_DEV_NULL     = 1 << 3,
--    G_SPAWN_STDERR_TO_DEV_NULL     = 1 << 4,
--    G_SPAWN_CHILD_INHERITS_STDIN   = 1 << 5,
--    G_SPAWN_FILE_AND_ARGV_ZERO     = 1 << 6
--  } GSpawnFlags;

--    Flags passed to g_spawn_sync(), g_spawn_async() and g_spawn_async_with_pipes().

--    G_SPAWN_LEAVE_DESCRIPTORS_OPEN the parent's open file descriptors will be
--                                   inherited by the child; otherwise all descriptors
--                                   except stdin/stdout/stderr will be closed before
--                                   calling exec() in the child.
--    G_SPAWN_DO_NOT_REAP_CHILD      the child will not be automatically reaped; you
--                                   must call waitpid() or handle SIGCHLD yourself, or
--                                   the child will become a zombie.
--    G_SPAWN_SEARCH_PATH            argv[0] need not be an absolute path, it will be
--                                   looked for in the user's PATH.
--    G_SPAWN_STDOUT_TO_DEV_NULL     the child's standad output will be discarded,
--                                   instead of going to the same location as the
--                                   parent's standard output.
--    G_SPAWN_STDERR_TO_DEV_NULL     the child's standard error will be discarded.
--    G_SPAWN_CHILD_INHERITS_STDIN   the child will inherit the parent's standard input
--                                   (by default, the child's standard input is
--                                   attached to /dev/null).
--    G_SPAWN_FILE_AND_ARGV_ZERO     the first element of argv is the file to execute,
--                                   while the remaining elements are the actual
--                                   argument vector to pass to the file. Normally
--                                   g_spawn_async_with_pipes() uses argv[0] as the
--                                   file to execute, and passes all of argv to the
--                                   child.

--    ---------------------------------------------------------------------------------

--   GSpawnChildSetupFunc ()

--  void        (*GSpawnChildSetupFunc)         (gpointer user_data);

--    Specifies the type of the setup function passed to g_spawn_async(),
--    g_spawn_sync() and g_spawn_async_with_pipes(). On POSIX platforms it is called in
--    the child after GLib has performed all the setup it plans to perform but before
--    calling exec(). On POSIX actions taken in this function will thus only affect the
--    child, not the parent.

--    On Windows the function is called in the parent. Its usefulness on Windows is
--    thus questionable. In many cases executing the child setup function in the parent
--    can have ill effects, and you should be very careful when porting software to
--    Windows that uses child setup functions.

--    user_data : user data to pass to the function.

--    ---------------------------------------------------------------------------------

--   g_spawn_async_with_pipes ()

--  gboolean    g_spawn_async_with_pipes        (const gchar *working_directory,
--                                               gchar **argv,
--                                               gchar **envp,
--                                               GSpawnFlags flags,
--                                               GSpawnChildSetupFunc child_setup,
--                                               gpointer user_data,
--                                               GPid *child_pid,
--                                               gint *standard_input,
--                                               gint *standard_output,
--                                               gint *standard_error,
--                                               GError **error);

--    Executes a child program asynchronously (your program will not block waiting for
--    the child to exit). The child program is specified by the only argument that must
--    be provided, argv. argv should be a NULL-terminated array of strings, to be
--    passed as the argument vector for the child. The first string in argv is of
--    course the name of the program to execute. By default, the name of the program
--    must be a full path; the PATH shell variable will only be searched if you pass
--    the G_SPAWN_SEARCH_PATH flag.

--    On Windows, note that all the string or string vector arguments to this function
--    and the other g_spawn*() functions are in UTF-8, the GLib file name encoding.
--    Unicode characters that are not part of the system codepage passed in argument
--    vectors will be correctly available in the spawned program only if it uses wide
--    character API to retrieve its command line. For C programs built with Microsoft's
--    tools it is enough to make the program have a wmain() instead of main(). wmain()
--    has a wide character argument vector as parameter.

--    At least currently, mingw doesn't support wmain(), so if you use mingw to develop
--    the spawned program, it will have to call the undocumented function
--    __wgetmainargs() to get the wide character argument vector and environment. See
--    gspawn-win32-helper.c in the GLib sources or init.c in the mingw runtime sources
--    for a prototype for that function. Alternatively, you can retrieve the Win32
--    system level wide character command line passed to the spawned program using the
--    GetCommandLineW() function.

--    On Windows the low-level child process creation API CreateProcess() doesn't use
--    argument vectors, but a command line. The C runtime library's spawn*() family of
--    functions (which g_spawn_async_with_pipes() eventually calls) paste the argument
--    vector elements together into a command line, and the C runtime startup code does
--    a corresponding reconstruction of an argument vector from the command line, to be
--    passed to main(). Complications arise when you have argument vector elements that
--    contain spaces of double quotes. The spawn*() functions don't do any quoting or
--    escaping, but on the other hand the startup code does do unquoting and unescaping
--    in order to enable receiving arguments with embedded spaces or double quotes. To
--    work around this asymmetry, g_spawn_async_with_pipes() will do quoting and
--    escaping on argument vector elements that need it before calling the C runtime
--    spawn() function.

--    envp is a NULL-terminated array of strings, where each string has the form
--    KEY=VALUE. This will become the child's environment. If envp is NULL, the child
--    inherits its parent's environment.

--    flags should be the bitwise OR of any flags you want to affect the function's
--    behaviour. The G_SPAWN_DO_NOT_REAP_CHILD means that the child will not
--    automatically be reaped; you must use a GChildWatch source to be notified about
--    the death of the child process. Eventually you must call g_spawn_close_pid() on
--    the child_pid, in order to free resources which may be associated with the child
--    process. (On Unix, using a GChildWatch source is equivalent to calling waitpid()
--    or handling the SIGCHLD signal manually. On Windows, calling g_spawn_close_pid()
--    is equivalent to calling CloseHandle() on the process handle returned in
--    child_pid).

--    G_SPAWN_LEAVE_DESCRIPTORS_OPEN means that the parent's open file descriptors will
--    be inherited by the child; otherwise all descriptors except stdin/stdout/stderr
--    will be closed before calling exec() in the child. G_SPAWN_SEARCH_PATH means that
--    argv[0] need not be an absolute path, it will be looked for in the user's PATH.
--    G_SPAWN_STDOUT_TO_DEV_NULL means that the child's standard output will be
--    discarded, instead of going to the same location as the parent's standard output.
--    If you use this flag, standard_output must be NULL. G_SPAWN_STDERR_TO_DEV_NULL
--    means that the child's standard error will be discarded, instead of going to the
--    same location as the parent's standard error. If you use this flag,
--    standard_error must be NULL. G_SPAWN_CHILD_INHERITS_STDIN means that the child
--    will inherit the parent's standard input (by default, the child's standard input
--    is attached to /dev/null). If you use this flag, standard_input must be NULL.
--    G_SPAWN_FILE_AND_ARGV_ZERO means that the first element of argv is the file to
--    execute, while the remaining elements are the actual argument vector to pass to
--    the file. Normally g_spawn_async_with_pipes() uses argv[0] as the file to
--    execute, and passes all of argv to the child.

--    child_setup and user_data are a function and user data. On POSIX platforms, the
--    function is called in the child after GLib has performed all the setup it plans
--    to perform (including creating pipes, closing file descriptors, etc.) but before
--    calling exec(). That is, child_setup is called just before calling exec() in the
--    child. Obviously actions taken in this function will only affect the child, not
--    the parent. On Windows, there is no separate fork() and exec() functionality.
--    Child processes are created and run with a single API call, CreateProcess().
--    child_setup is called in the parent process just before creating the child
--    process. You should carefully consider what you do in child_setup if you intend
--    your software to be portable to Windows.

--    If non-NULL, child_pid will on Unix be filled with the child's process ID. You
--    can use the process ID to send signals to the child, or to waitpid() if you
--    specified the G_SPAWN_DO_NOT_REAP_CHILD flag. On Windows, child_pid will be
--    filled with a handle to the child process only if you specified the
--    G_SPAWN_DO_NOT_REAP_CHILD flag. You can then access the child process using the
--    Win32 API, for example wait for its termination with the WaitFor*() functions, or
--    examine its exit code with GetExitCodeProcess(). You should close the handle with
--    CloseHandle() or g_spawn_close_pid() when you no longer need it.

--    If non-NULL, the standard_input, standard_output, standard_error locations will
--    be filled with file descriptors for writing to the child's standard input or
--    reading from its standard output or standard error. The caller of
--    g_spawn_async_with_pipes() must close these file descriptors when they are no
--    longer in use. If these parameters are NULL, the corresponding pipe won't be
--    created.

--    If standard_input is NULL, the child's standard input is attached to /dev/null
--    unless G_SPAWN_CHILD_INHERITS_STDIN is set.

--    If standard_error is NULL, the child's standard error goes to the same location
--    as the parent's standard error unless G_SPAWN_STDERR_TO_DEV_NULL is set.

--    If standard_output is NULL, the child's standard output goes to the same location
--    as the parent's standard output unless G_SPAWN_STDOUT_TO_DEV_NULL is set.

--    error can be NULL to ignore errors, or non-NULL to report errors. If an error is
--    set, the function returns FALSE. Errors are reported even if they occur in the
--    child (for example if the executable in argv[0] is not found). Typically the
--    message field of returned errors should be displayed to users. Possible errors
--    are those from the G_SPAWN_ERROR domain.

--    If an error occurs, child_pid, standard_input, standard_output, and
--    standard_error will not be filled with valid values.

--    If child_pid is not NULL and an error does not occur then the returned pid must
--    be closed using g_spawn_close_pid().

--    working_directory : child's current working directory, or NULL to inherit
--                        parent's, in the GLib file name encoding
--    argv :              child's argument vector, in the GLib file name encoding
--    envp :              child's environment, or NULL to inherit parent's, in the GLib
--                        file name encoding
--    flags :             flags from GSpawnFlags
--    child_setup :       function to run in the child just before exec()
--    user_data :         user data for child_setup
--    child_pid :         return location for child process ID, or NULL
--    standard_input :    return location for file descriptor to write to child's
--                        stdin, or NULL
--    standard_output :   return location for file descriptor to read child's stdout,
--                        or NULL
--    standard_error :    return location for file descriptor to read child's stderr,
--                        or NULL
--    error :             return location for error
--    Returns :           TRUE on success, FALSE if an error was set

--    ---------------------------------------------------------------------------------

--   g_spawn_async ()

--  gboolean    g_spawn_async                   (const gchar *working_directory,
--                                               gchar **argv,
--                                               gchar **envp,
--                                               GSpawnFlags flags,
--                                               GSpawnChildSetupFunc child_setup,
--                                               gpointer user_data,
--                                               GPid *child_pid,
--                                               GError **error);

--    See g_spawn_async_with_pipes() for a full description; this function simply calls
--    the g_spawn_async_with_pipes() without any pipes.

--    working_directory : child's current working directory, or NULL to inherit
--                        parent's
--    argv :              child's argument vector
--    envp :              child's environment, or NULL to inherit parent's
--    flags :             flags from GSpawnFlags
--    child_setup :       function to run in the child just before exec()
--    user_data :         user data for child_setup
--    child_pid :         return location for child process ID, or NULL
--    error :             return location for error
--    Returns :           TRUE on success, FALSE if error is set

--    ---------------------------------------------------------------------------------

--   g_spawn_sync ()

--  gboolean    g_spawn_sync                    (const gchar *working_directory,
--                                               gchar **argv,
--                                               gchar **envp,
--                                               GSpawnFlags flags,
--                                               GSpawnChildSetupFunc child_setup,
--                                               gpointer user_data,
--                                               gchar **standard_output,
--                                               gchar **standard_error,
--                                               gint *exit_status,
--                                               GError **error);

--    Executes a child synchronously (waits for the child to exit before returning).
--    All output from the child is stored in standard_output and standard_error, if
--    those parameters are non-NULL. If exit_status is non-NULL, the exit status of the
--    child is stored there as it would be returned by waitpid(); standard UNIX macros
--    such as WIFEXITED() and WEXITSTATUS() must be used to evaluate the exit status.
--    If an error occurs, no data is returned in standard_output, standard_error, or
--    exit_status.

--    This function calls g_spawn_async_with_pipes() internally; see that function for
--    full details on the other parameters and details on how these functions work on
--    Windows.

--    working_directory : child's current working directory, or NULL to inherit
--                        parent's
--    argv :              child's argument vector
--    envp :              child's environment, or NULL to inherit parent's
--    flags :             flags from GSpawnFlags
--    child_setup :       function to run in the child just before exec()
--    user_data :         user data for child_setup
--    standard_output :   return location for child output
--    standard_error :    return location for child error messages
--    exit_status :       return location for child exit status, as returned by
--                        waitpid()
--    error :             return location for error
--    Returns :           TRUE on success, FALSE if an error was set.

--    ---------------------------------------------------------------------------------

--   g_spawn_command_line_async ()

--  gboolean    g_spawn_command_line_async      (const gchar *command_line,
--                                               GError **error);

--    A simple version of g_spawn_async() that parses a command line with
--    g_shell_parse_argv() and passes it to g_spawn_async(). Runs a command line in the
--    background. Unlike g_spawn_async(), the G_SPAWN_SEARCH_PATH flag is enabled,
--    other flags are not. Note that G_SPAWN_SEARCH_PATH can have security
--    implications, so consider using g_spawn_async() directly if appropriate. Possible
--    errors are those from g_shell_parse_argv() and g_spawn_async().

--    The same concerns on Windows apply as for g_spawn_command_line_sync().

--    command_line : a command line
--    error :        return location for errors
--    Returns :      TRUE on success, FALSE if error is set.

--    ---------------------------------------------------------------------------------

--   g_spawn_command_line_sync ()

--  gboolean    g_spawn_command_line_sync       (const gchar *command_line,
--                                               gchar **standard_output,
--                                               gchar **standard_error,
--                                               gint *exit_status,
--                                               GError **error);

--    A simple version of g_spawn_sync() with little-used parameters removed, taking a
--    command line instead of an argument vector. See g_spawn_sync() for full details.
--    command_line will be parsed by g_shell_parse_argv(). Unlike g_spawn_sync(), the
--    G_SPAWN_SEARCH_PATH flag is enabled. Note that G_SPAWN_SEARCH_PATH can have
--    security implications, so consider using g_spawn_sync() directly if appropriate.
--    Possible errors are those from g_spawn_sync() and those from
--    g_shell_parse_argv().

--    If exit_status is non-NULL, the exit status of the child is stored there as it
--    would be returned by waitpid(); standard UNIX macros such as WIFEXITED() and
--    WEXITSTATUS() must be used to evaluate the exit status.

--    On Windows, please note the implications of g_shell_parse_argv() parsing
--    command_line. Parsing is done according to Unix shell rules, not Windows command
--    interpreter rules. Space is a separator, and backslashes are special. Thus you
--    cannot simply pass a command_line containing canonical Windows paths, like
--    "c:\\program files\\app\\app.exe", as the backslashes will be eaten, and the
--    space will act as a separator. You need to enclose such paths with single quotes,
--    like "'c:\\program files\\app\\app.exe' 'e:\\folder\\argument.txt'".

--    command_line :    a command line
--    standard_output : return location for child output
--    standard_error :  return location for child errors
--    exit_status :     return location for child exit status, as returned by waitpid()
--    error :           return location for errors
--    Returns :         TRUE on success, FALSE if an error was set

--    ---------------------------------------------------------------------------------

--   g_spawn_close_pid ()

--  void        g_spawn_close_pid               (GPid pid);

--    On some platforms, notably WIN32, the GPid type represents a resource which must
--    be closed to prevent resource leaking. g_spawn_close_pid() is provided for this
--    purpose. It should be used on all platforms, even though it doesn't do anything
--    under UNIX.

--    pid : The process identifier to close
end -- class GLIB_SPAWNING_PROCESSES
