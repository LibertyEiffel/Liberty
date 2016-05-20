deferred class GLIB_MISCELLANEOUS_UTILITY_FUNCTIONS
--    Miscellaneous Utility Functions

--    Miscellaneous Utility Functions -- a selection of portable utility functions.

-- Synopsis


--  #include <glib.h>


--  const gchar* g_get_application_name         (void);
--  void        g_set_application_name          (const gchar *application_name);
--  gchar*      g_get_prgname                   (void);
--  void        g_set_prgname                   (const gchar *prgname);
--  const gchar* g_getenv                       (const gchar *variable);
--  gboolean    g_setenv                        (const gchar *variable,
--                                               const gchar *value,
--                                               gboolean overwrite);
--  void        g_unsetenv                      (const gchar *variable);
--  gchar**     g_listenv                       (void);
--  const gchar* g_get_user_name                (void);
--  const gchar* g_get_real_name                (void);
--  const gchar* g_get_user_cache_dir           (void);
--  const gchar* g_get_user_data_dir            (void);
--  const gchar* g_get_user_config_dir          (void);
--  const gchar* const * g_get_system_data_dirs (void);
--  const gchar* const * g_get_system_config_dirs
--                                              (void);

--  const gchar* g_get_host_name                (void);
--  const gchar* g_get_home_dir                 (void);
--  const gchar* g_get_tmp_dir                  (void);
--  gchar*      g_get_current_dir               (void);
--  const gchar* g_basename                     (const gchar *file_name);
--  #define     g_dirname
--  gboolean    g_path_is_absolute              (const gchar *file_name);
--  const gchar* g_path_skip_root               (const gchar *file_name);
--  gchar*      g_path_get_basename             (const gchar *file_name);
--  gchar*      g_path_get_dirname              (const gchar *file_name);
--  gchar*      g_build_filename                (const gchar *first_element,
--                                               ...);
--  gchar*      g_build_filenamev               (gchar **args);
--  gchar*      g_build_path                    (const gchar *separator,
--                                               const gchar *first_element,
--                                               ...);
--  gchar*      g_build_pathv                   (const gchar *separator,
--                                               gchar **args);

--  gchar*      g_find_program_in_path          (const gchar *program);

--  gint        g_bit_nth_lsf                   (gulong mask,
--                                               gint nth_bit);
--  gint        g_bit_nth_msf                   (gulong mask,
--                                               gint nth_bit);
--  guint       g_bit_storage                   (gulong number);

--  guint       g_spaced_primes_closest         (guint num);

--  void        g_atexit                        (GVoidFunc func);

--  guint       g_parse_debug_string            (const gchar *string,
--                                               const GDebugKey *keys,
--                                               guint nkeys);
--              GDebugKey;

--  void        (*GVoidFunc)                    (void);
--  void        (*GFreeFunc)                    (gpointer data);

--  void        g_qsort_with_data               (gconstpointer pbase,
--                                               gint total_elems,
--                                               gsize size,
--                                               GCompareDataFunc compare_func,
--                                               gpointer user_data);

--  void        g_nullify_pointer               (gpointer *nullify_location);


-- Description

--    These are portable utility functions.

-- Details

--   g_get_application_name ()

--  const gchar* g_get_application_name         (void);

--    Gets a human-readable name for the application, as set by
--    g_set_application_name(). This name should be localized if possible, and is
--    intended for display to the user. Contrast with g_get_prgname(), which gets a
--    non-localized name. If g_set_application_name() has not been called, returns the
--    result of g_get_prgname() (which may be NULL if g_set_prgname() has also not been
--    called).

--    Returns : human-readable application name. may return NULL

--    Since 2.2

--    ---------------------------------------------------------------------------------

--   g_set_application_name ()

--  void        g_set_application_name          (const gchar *application_name);

--    Sets a human-readable name for the application. This name should be localized if
--    possible, and is intended for display to the user. Contrast with g_set_prgname(),
--    which sets a non-localized name. g_set_prgname() will be called automatically by
--    gtk_init(), but g_set_application_name() will not.

--    Note that for thread safety reasons, this function can only be called once.

--    The application name will be used in contexts such as error messages, or when
--    displaying an application's name in the task list.

--    application_name : localized name of the application

--    ---------------------------------------------------------------------------------

--   g_get_prgname ()

--  gchar*      g_get_prgname                   (void);

--    Gets the name of the program. This name should not be localized, contrast with
--    g_get_application_name(). (If you are using GDK or GTK+ the program name is set
--    in gdk_init(), which is called by gtk_init(). The program name is found by taking
--    the last component of argv[0].)

--    Returns : the name of the program. The returned string belongs to GLib and must
--              not be modified or freed.

--    ---------------------------------------------------------------------------------

--   g_set_prgname ()

--  void        g_set_prgname                   (const gchar *prgname);

--    Sets the name of the program. This name should not be localized, contrast with
--    g_set_application_name(). Note that for thread-safety reasons this function can
--    only be called once.

--    prgname : the name of the program.

--    ---------------------------------------------------------------------------------

--   g_getenv ()

--  const gchar* g_getenv                       (const gchar *variable);

--    Returns the value of an environment variable. The name and value are in the GLib
--    file name encoding. On UNIX, this means the actual bytes which might or might not
--    be in some consistent character set and encoding. On Windows, it is in UTF-8. On
--    Windows, in case the environment variable's value contains references to other
--    environment variables, they are expanded.

--    variable : the environment variable to get, in the GLib file name encoding.
--    Returns :  the value of the environment variable, or NULL if the environment
--               variable is not found. The returned string may be overwritten by the
--               next call to g_getenv(), g_setenv() or g_unsetenv().

--    ---------------------------------------------------------------------------------

--   g_setenv ()

--  gboolean    g_setenv                        (const gchar *variable,
--                                               const gchar *value,
--                                               gboolean overwrite);

--    Sets an environment variable. Both the variable's name and value should be in the
--    GLib file name encoding. On UNIX, this means that they can be any sequence of
--    bytes. On Windows, they should be in UTF-8.

--    Note that on some systems, when variables are overwritten, the memory used for
--    the previous variables and its value isn't reclaimed.

--    variable :  the environment variable to set, must not contain '='.
--    value :     the value for to set the variable to.
--    overwrite : whether to change the variable if it already exists.
--    Returns :   FALSE if the environment variable couldn't be set.

--    Since 2.4

--    ---------------------------------------------------------------------------------

--   g_unsetenv ()

--  void        g_unsetenv                      (const gchar *variable);

--    Removes an environment variable from the environment.

--    Note that on some systems, when variables are overwritten, the memory used for
--    the previous variables and its value isn't reclaimed. Furthermore, this function
--    can't be guaranteed to operate in a threadsafe way.

--    variable : the environment variable to remove, must not contain '='.

--    Since 2.4

--    ---------------------------------------------------------------------------------

--   g_listenv ()

--  gchar**     g_listenv                       (void);

--    Gets the names of all variables set in the environment.

--    Returns : a NULL-terminated list of strings which must be freed with
--              g_strfreev(). Programs that want to be portable to Windows should
--              typically use this function and g_getenv() instead of using the environ
--              array from the C library directly. On Windows, the strings in the
--              environ array are in system codepage encoding, while in most of the
--              typical use cases for environment variables in GLib-using programs you
--              want the UTF-8 encoding that this function and g_getenv() provide.

--    Since 2.8

--    ---------------------------------------------------------------------------------

--   g_get_user_name ()

--  const gchar* g_get_user_name                (void);

--    Gets the user name of the current user. The encoding of the returned string is
--    system-defined. On UNIX, it might be the preferred file name encoding, or
--    something else, and there is no guarantee that it is even consistent on a
--    machine. On Windows, it is always UTF-8.

--    Returns : the user name of the current user.

--    ---------------------------------------------------------------------------------

--   g_get_real_name ()

--  const gchar* g_get_real_name                (void);

--    Gets the real name of the user. This usually comes from the user's entry in the
--    passwd file. The encoding of the returned string is system-defined. (On Windows,
--    it is, however, always UTF-8.) If the real user name cannot be determined, the
--    string "Unknown" is returned.

--    Returns : the user's real name.

--    ---------------------------------------------------------------------------------

--   g_get_user_cache_dir ()

--  const gchar* g_get_user_cache_dir           (void);

--    Returns a base directory in which to store non-essential, cached data specific to
--    particular user.

--    On UNIX platforms this is determined using the mechanisms described in the XDG
--    Base Directory Specification

--    Returns : a string owned by GLib that must not be modified or freed.

--    Since 2.6

--    ---------------------------------------------------------------------------------

--   g_get_user_data_dir ()

--  const gchar* g_get_user_data_dir            (void);

--    Returns a base directory in which to access application data such as icons that
--    is customized for a particular user.

--    On UNIX platforms this is determined using the mechanisms described in the XDG
--    Base Directory Specification

--    Returns : a string owned by GLib that must not be modified or freed.

--    Since 2.6

--    ---------------------------------------------------------------------------------

--   g_get_user_config_dir ()

--  const gchar* g_get_user_config_dir          (void);

--    Returns a base directory in which to store user-specific application
--    configuration information such as user preferences and settings.

--    On UNIX platforms this is determined using the mechanisms described in the XDG
--    Base Directory Specification

--    Returns : a string owned by GLib that must not be modified or freed.

--    Since 2.6

--    ---------------------------------------------------------------------------------

--   g_get_system_data_dirs ()

--  const gchar* const * g_get_system_data_dirs (void);

--    Returns an ordered list of base directories in which to access system-wide
--    application data.

--    On UNIX platforms this is determined using the mechanisms described in the XDG
--    Base Directory Specification

--    On Windows the first elements in the list are the Application Data and Documents
--    folders for All Users. (These can be determined only on Windows 2000 or later and
--    are not present in the list on other Windows versions.) See documentation for
--    CSIDL_COMMON_APPDATA and CSIDL_COMMON_DOCUMENTS.

--    Then follows the "share" subfolder in the installation folder for the package
--    containing the DLL that calls this function, if it can be determined.

--    Finally the list contains the "share" subfolder in the installation folder for
--    GLib, and in the installation folder for the package the application's .exe file
--    belongs to.

--    The installation folders above are determined by looking up the folder where the
--    module (DLL or EXE) in question is located. If the folder's name is "bin", its
--    parent is used, otherwise the folder itself.

--    Note that on Windows the returned list can vary depending on where this function
--    is called.

--    Returns : a NULL-terminated array of strings owned by GLib that must not be
--              modified or freed.

--    Since 2.6

--    ---------------------------------------------------------------------------------

--   g_get_system_config_dirs ()

--  const gchar* const * g_get_system_config_dirs
--                                              (void);

--    Returns an ordered list of base directories in which to access system-wide
--    configuration information.

--    On UNIX platforms this is determined using the mechanisms described in the XDG
--    Base Directory Specification

--    Returns : a NULL-terminated array of strings owned by GLib that must not be
--              modified or freed.

--    Since 2.6

--    ---------------------------------------------------------------------------------

--   g_get_host_name ()

--  const gchar* g_get_host_name                (void);

--    Return a name for the machine.

--    The returned name is not necessarily a fully-qualified domain name, or even
--    present in DNS or some other name service at all. It need not even be unique on
--    your local network or site, but usually it is. Callers should not rely on the
--    return value having any specific properties like uniqueness for security
--    purposes. Even if the name of the machine is changed while an application is
--    running, the return value from this function does not change. The returned string
--    is owned by GLib and should not be modified or freed. If no name can be
--    determined, a default fixed string "localhost" is returned.

--    Returns : the host name of the machine.

--    Since 2.8

--    ---------------------------------------------------------------------------------

--   g_get_home_dir ()

--  const gchar* g_get_home_dir                 (void);

--    Gets the current user's home directory.

--    Note that in contrast to traditional UNIX tools, this function prefers passwd
--    entries over the HOME environment variable.

--    Returns : the current user's home directory.

--    ---------------------------------------------------------------------------------

--   g_get_tmp_dir ()

--  const gchar* g_get_tmp_dir                  (void);

--    Gets the directory to use for temporary files. This is found from inspecting the
--    environment variables TMPDIR, TMP, and TEMP in that order. If none of those are
--    defined "/tmp" is returned on UNIX and "C:\" on Windows. The encoding of the
--    returned string is system-defined. On Windows, it is always UTF-8. The return
--    value is never NULL.

--    Returns : the directory to use for temporary files.

--    ---------------------------------------------------------------------------------

--   g_get_current_dir ()

--  gchar*      g_get_current_dir               (void);

--    Gets the current directory. The returned string should be freed when no longer
--    needed. The encoding of the returned string is system defined. On Windows, it is
--    always UTF-8.

--    Returns : the current directory.

--    ---------------------------------------------------------------------------------

--   g_basename ()

--  const gchar* g_basename                     (const gchar *file_name);

--   Warning

--    g_basename has been deprecated since version 2.2 and should not be used in
--    newly-written code. Use g_path_get_basename() instead, but notice that
--    g_path_get_basename() allocates new memory for the returned string, unlike this
--    function which returns a pointer into the argument.

--    Gets the name of the file without any leading directory components. It returns a
--    pointer into the given file name string.

--    file_name : the name of the file.
--    Returns :   the name of the file without any leading directory components.

--    ---------------------------------------------------------------------------------

--   g_dirname

--  #define     g_dirname

--   Warning

--    g_dirname is deprecated and should not be used in newly-written code.

--    This function is deprecated and will be removed in the next major release of
--    GLib. Use g_path_get_dirname() instead.

--    Gets the directory components of a file name. If the file name has no directory
--    components "." is returned. The returned string should be freed when no longer
--    needed.

--    Returns : the directory components of the file.

--    ---------------------------------------------------------------------------------

--   g_path_is_absolute ()

--  gboolean    g_path_is_absolute              (const gchar *file_name);

--    Returns TRUE if the given file_name is an absolute file name, i.e. it contains a
--    full path from the root directory such as "/usr/local" on UNIX or "C:\windows" on
--    Windows systems.

--    file_name : a file name.
--    Returns :   TRUE if file_name is an absolute path.

--    ---------------------------------------------------------------------------------

--   g_path_skip_root ()

--  const gchar* g_path_skip_root               (const gchar *file_name);

--    Returns a pointer into file_name after the root component, i.e. after the "/" in
--    UNIX or "C:\" under Windows. If file_name is not an absolute path it returns
--    NULL.

--    file_name : a file name.
--    Returns :   a pointer into file_name after the root component.

--    ---------------------------------------------------------------------------------

--   g_path_get_basename ()

--  gchar*      g_path_get_basename             (const gchar *file_name);

--    Gets the last component of the filename. If file_name ends with a directory
--    separator it gets the component before the last slash. If file_name consists only
--    of directory separators (and on Windows, possibly a drive letter), a single
--    separator is returned. If file_name is empty, it gets ".".

--    file_name : the name of the file.
--    Returns :   a newly allocated string containing the last component of the
--                filename.

--    ---------------------------------------------------------------------------------

--   g_path_get_dirname ()

--  gchar*      g_path_get_dirname              (const gchar *file_name);

--    Gets the directory components of a file name. If the file name has no directory
--    components "." is returned. The returned string should be freed when no longer
--    needed.

--    file_name : the name of the file.
--    Returns :   the directory components of the file.

--    ---------------------------------------------------------------------------------

--   g_build_filename ()

--  gchar*      g_build_filename                (const gchar *first_element,
--                                               ...);

--    Creates a filename from a series of elements using the correct separator for
--    filenames.

--    On Unix, this function behaves identically to g_build_path (G_DIR_SEPARATOR_S,
--    first_element, ....).

--    On Windows, it takes into account that either the backslash (\ or slash (/) can
--    be used as separator in filenames, but otherwise behaves as on Unix. When file
--    pathname separators need to be inserted, the one that last previously occurred in
--    the parameters (reading from left to right) is used.

--    No attempt is made to force the resulting filename to be an absolute path. If the
--    first element is a relative path, the result will be a relative path.

--    first_element : the first element in the path
--    ... :           remaining elements in path, terminated by NULL
--    Returns :       a newly-allocated string that must be freed with g_free().

--    ---------------------------------------------------------------------------------

--   g_build_filenamev ()

--  gchar*      g_build_filenamev               (gchar **args);

--    Behaves exactly like g_build_filename(), but takes the path elements as a string
--    array, instead of varargs. This function is mainly meant for language bindings.

--    args :    NULL-terminated array of strings containing the path elements.
--    Returns : a newly-allocated string that must be freed with g_free().

--    Since 2.8

--    ---------------------------------------------------------------------------------

--   g_build_path ()

--  gchar*      g_build_path                    (const gchar *separator,
--                                               const gchar *first_element,
--                                               ...);

--    Creates a path from a series of elements using separator as the separator between
--    elements. At the boundary between two elements, any trailing occurrences of
--    separator in the first element, or leading occurrences of separator in the second
--    element are removed and exactly one copy of the separator is inserted.

--    Empty elements are ignored.

--    The number of leading copies of the separator on the result is the same as the
--    number of leading copies of the separator on the first non-empty element.

--    The number of trailing copies of the separator on the result is the same as the
--    number of trailing copies of the separator on the last non-empty element.
--    (Determination of the number of trailing copies is done without stripping leading
--    copies, so if the separator is ABA, ABABA has 1 trailing copy.)

--    However, if there is only a single non-empty element, and there are no characters
--    in that element not part of the leading or trailing separators, then the result
--    is exactly the original value of that element.

--    Other than for determination of the number of leading and trailing copies of the
--    separator, elements consisting only of copies of the separator are ignored.

--    separator :     a string used to separator the elements of the path.
--    first_element : the first element in the path
--    ... :           remaining elements in path, terminated by NULL
--    Returns :       a newly-allocated string that must be freed with g_free().

--    ---------------------------------------------------------------------------------

--   g_build_pathv ()

--  gchar*      g_build_pathv                   (const gchar *separator,
--                                               gchar **args);

--    Behaves exactly like g_build_path(), but takes the path elements as a string
--    array, instead of varargs. This function is mainly meant for language bindings.

--    separator : a string used to separator the elements of the path.
--    args :      NULL-terminated array of strings containing the path elements.
--    Returns :   a newly-allocated string that must be freed with g_free().

--    Since 2.8

--    ---------------------------------------------------------------------------------

--   g_find_program_in_path ()

--  gchar*      g_find_program_in_path          (const gchar *program);

--    Locates the first executable named program in the user's path, in the same way
--    that execvp() would locate it. Returns an allocated string with the absolute path
--    name, or NULL if the program is not found in the path. If program is already an
--    absolute path, returns a copy of program if program exists and is executable, and
--    NULL otherwise. On Windows, if program does not have a file type suffix, tries
--    with the suffixes .exe, .cmd, .bat and .com, and the suffixes in the PATHEXT
--    environment variable.

--    On Windows, it looks for the file in the same way as CreateProcess() would. This
--    means first in the directory where the executing program was loaded from, then in
--    the current directory, then in the Windows 32-bit system directory, then in the
--    Windows directory, and finally in the directories in the PATH environment
--    variable. If the program is found, the return value contains the full name
--    including the type suffix.

--    program : a program name in the GLib file name encoding
--    Returns : absolute path, or NULL

--    ---------------------------------------------------------------------------------

--   g_bit_nth_lsf ()

--  gint        g_bit_nth_lsf                   (gulong mask,
--                                               gint nth_bit);

--    Find the position of the first bit set in mask, searching from (but not
--    including) nth_bit upwards. Bits are numbered from 0 (least significant) to
--    sizeof(gulong) * 8 - 1 (31 or 63, usually). To start searching from the 0th bit,
--    set nth_bit to -1.

--    mask :    a gulong containing flags.
--    nth_bit : the index of the bit to start the search from.
--    Returns : the index of the first bit set which is higher than nth_bit.

--    ---------------------------------------------------------------------------------

--   g_bit_nth_msf ()

--  gint        g_bit_nth_msf                   (gulong mask,
--                                               gint nth_bit);

--    Find the position of the first bit set in mask, searching from (but not
--    including) nth_bit downwards. Bits are numbered from 0 (least significant) to
--    sizeof(gulong) * 8 - 1 (31 or 63, usually). To start searching from the last bit,
--    set nth_bit to -1 or GLIB_SIZEOF_LONG * 8.

--    mask :    a gulong containing flags.
--    nth_bit : the index of the bit to start the search from.
--    Returns : the index of the first bit set which is lower than nth_bit.

--    ---------------------------------------------------------------------------------

--   g_bit_storage ()

--  guint       g_bit_storage                   (gulong number);

--    Gets the number of bits used to hold number, e.g. if number is 4, 3 bits are
--    needed.

--    number :  a guint.
--    Returns : the number of bits used to hold number.

--    ---------------------------------------------------------------------------------

--   g_spaced_primes_closest ()

--  guint       g_spaced_primes_closest         (guint num);

--    Gets the smallest prime number from a built-in array of primes which is larger
--    than num. This is used within GLib to calculate the optimum size of a GHashTable.

--    The built-in array of primes ranges from 11 to 13845163 such that each prime is
--    approximately 1.5-2 times the previous prime.

--    num :     a guint.
--    Returns : the smallest prime number from a built-in array of primes which is
--              larger than num.

--    ---------------------------------------------------------------------------------

--   g_atexit ()

--  void        g_atexit                        (GVoidFunc func);

--    Specifies a function to be called at normal program termination.

--    Since GLib 2.8.2, on Windows g_atexit() actually is a preprocessor macro that
--    maps to a call to the atexit() function in the C library. This means that in case
--    the code that calls g_atexit(), i.e. atexit(), is in a DLL, the function will be
--    called when the DLL is detached from the program. This typically makes more sense
--    than that the function is called when the GLib DLL is detached, which happened
--    earlier when g_atexit() was a function in the GLib DLL.

--    The behaviour of atexit() in the context of dynamically loaded modules is not
--    formally specified and varies wildly.

--    On POSIX systems, calling g_atexit() (or atexit()) in a dynamically loaded module
--    which is unloaded before the program terminates might well cause a crash at
--    program exit.

--    Some POSIX systems implement atexit() like Windows, and have each dynamically
--    loaded module maintain an own atexit chain that is called when the module is
--    unloaded.

--    On other POSIX systems, before a dynamically loaded module is unloaded, the
--    registered atexit functions (if any) residing in that module are called,
--    regardless where the code that registered them resided. This is presumably the
--    most robust approach.

--    As can be seen from the above, for portability it's best to avoid calling
--    g_atexit() (or atexit()) except in the main executable of a program.

--    func : the function to call on normal program termination.

--    ---------------------------------------------------------------------------------

--   g_parse_debug_string ()

--  guint       g_parse_debug_string            (const gchar *string,
--                                               const GDebugKey *keys,
--                                               guint nkeys);

--    Parses a string containing debugging options into a guint containing bit flags.
--    This is used within GDK and GTK+ to parse the debug options passed on the command
--    line or through environment variables.

--    string :  a list of debug options separated by colons, spaces, or commas; or the
--              string "all" to set all flags.
--    keys :    pointer to an array of GDebugKey which associate strings with bit
--              flags.
--    nkeys :   the number of GDebugKeys in the array.
--    Returns : the combined set of bit flags.

--    ---------------------------------------------------------------------------------

--   GDebugKey

--  typedef struct {
--    gchar *key;
--    guint  value;
--  } GDebugKey;

--    Associates a string with a bit flag. Used in g_parse_debug_string().

--    gchar *key;  the string
--    guint value; the flag

--    ---------------------------------------------------------------------------------

--   GVoidFunc ()

--  void        (*GVoidFunc)                    (void);

--    Declares a type of function which takes no arguments and has no return value. It
--    is used to specify the type function passed to g_atexit().

--    ---------------------------------------------------------------------------------

--   GFreeFunc ()

--  void        (*GFreeFunc)                    (gpointer data);

--    Declares a type of function which takes an arbitrary data pointer argument and
--    has no return value. It is not currently used in GLib or GTK+.

--    data : a data pointer.

--    ---------------------------------------------------------------------------------

--   g_qsort_with_data ()

--  void        g_qsort_with_data               (gconstpointer pbase,
--                                               gint total_elems,
--                                               gsize size,
--                                               GCompareDataFunc compare_func,
--                                               gpointer user_data);

--    This is just like the standard C qsort() function, but the comparison routine
--    accepts a user data argument.

--    pbase :        start of array to sort
--    total_elems :  elements in the array
--    size :         size of each element
--    compare_func : function to compare elements
--    user_data :    data to pass to compare_func

--    ---------------------------------------------------------------------------------

--   g_nullify_pointer ()

--  void        g_nullify_pointer               (gpointer *nullify_location);

--    Set the pointer at the specified location to NULL.

--    nullify_location : the memory address of the pointer.

end --  class GLIB_MISCELLANEOUS_UTILITY_FUNCTIONS
