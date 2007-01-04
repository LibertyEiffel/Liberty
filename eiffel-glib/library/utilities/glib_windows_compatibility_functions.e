   Link: GLib Reference Manual (start)
   Link: GLib Utilities (parent)
   Link: Bookmark file parser (previous)
   Link: GLib Data Types (next)
   Link: GLib Overview (chapter)
   Link: GLib Fundamentals (chapter)
   Link: GLib Core Application Support (chapter)
   Link: GLib Utilities (chapter)
   Link: GLib Data Types (chapter)
   Link: GLib Tools (chapter)
   Link: Index (index)
   Link: Index of deprecated symbols (index)
   Link: Index of new symbols in 2.2 (index)
   Link: Index of new symbols in 2.4 (index)
   Link: Index of new symbols in 2.6 (index)
   Link: Index of new symbols in 2.8 (index)
   Link: Index of new symbols in 2.10 (index)
   Link: Index of new symbols in 2.12 (index)

   Prev Up Home                      GLib Reference Manual                      Next
   Top  |  Description

   Windows Compatibility Functions

   Windows Compatibility Functions -- UNIX emulation on Windows.

Synopsis


 #include <glib.h>


 #define     MAXPATHLEN
 #define     pipe                            (phandles)
 gchar*      g_win32_error_message           (gint error);
 gchar*      g_win32_getlocale               (void);
 gchar*      g_win32_get_package_installation_directory
                                             (gchar *package,
                                              gchar *dll_name);
 gchar*      g_win32_get_package_installation_subdirectory
                                             (gchar *package,
                                              gchar *dll_name,
                                              gchar *subdir);
 guint       g_win32_get_windows_version     (void);
 gchar*      g_win32_locale_filename_from_utf8
                                             (const gchar *utf8filename);
 #define     G_WIN32_DLLMAIN_FOR_DLL_NAME    (static, dll_name)
 #define     G_WIN32_HAVE_WIDECHAR_API       ()
 #define     G_WIN32_IS_NT_BASED             ()


Description

   These functions provide some level of UNIX emulation on the Windows platform. If
   your application really needs the POSIX APIs, we suggest you try the Cygwin
   project.

Details

  MAXPATHLEN

 #define MAXPATHLEN 1024

   Provided for UNIX emulation on Windows; equivalent to UNIX macro MAXPATHLEN,
   which is the maximum length of a filename (including full path).

   ---------------------------------------------------------------------------------

  pipe()

 #define pipe(phandles)  _pipe (phandles, 4096, _O_BINARY)

   Provided for UNIX emulation on Windows; see documentation for pipe() in any UNIX
   manual.

   phandles : file descriptors, the first one for reading, the second one for
              writing.

   ---------------------------------------------------------------------------------

  g_win32_error_message ()

 gchar*      g_win32_error_message           (gint error);

   Translate a Win32 error code (as returned by GetLastError()) into the
   corresponding message. The message is either language neutral, or in the thread's
   language, or the user's language, the system's language, or US English (see docs
   for FormatMessage()). The returned string is in UTF-8. It should be deallocated
   with g_free().

   error :   error code.
   Returns : newly-allocated error message

   ---------------------------------------------------------------------------------

  g_win32_getlocale ()

 gchar*      g_win32_getlocale               (void);

   The setlocale() function in the Microsoft C library uses locale names of the form
   "English_United States.1252" etc. We want the UNIXish standard form "en_US",
   "zh_TW" etc. This function gets the current thread locale from Windows - without
   any encoding info - and returns it as a string of the above form for use in
   forming file names etc. The returned string should be deallocated with g_free().

   Returns : newly-allocated locale name.

   ---------------------------------------------------------------------------------

  g_win32_get_package_installation_directory ()

 gchar*      g_win32_get_package_installation_directory
                                             (gchar *package,
                                              gchar *dll_name);

   Try to determine the installation directory for a software package. Typically
   used by GNU software packages.

   package should be a short identifier for the package. Typically it is the same
   identifier as used for GETTEXT_PACKAGE in software configured according to GNU
   standards. The function first looks in the Windows Registry for the value
   #InstallationDirectory in the key #HKLM\Software\package, and if that value
   exists and is a string, returns that.

   If package is NULL, or the above value isn't found in the Registry, but dll_name
   is non-NULL, it should name a DLL loaded into the current process. Typically that
   would be the name of the DLL calling this function, looking for its installation
   directory. The function then asks Windows what directory that DLL was loaded
   from. If that directory's last component is "bin" or "lib", the parent directory
   is returned, otherwise the directory itself. If that DLL isn't loaded, the
   function proceeds as if dll_name was NULL.

   If both package and dll_name are NULL, the directory from where the main
   executable of the process was loaded is used instead in the same way as above.

   package :  An identifier for a software package, or NULL, in UTF-8
   dll_name : The name of a DLL that a package provides, or NULL, in UTF-8
   Returns :  a string containing the installation directory for package. The string
              is in the GLib file name encoding, i.e. UTF-8 on Windows. The return
              value should be freed with g_free() when not needed any longer.

   ---------------------------------------------------------------------------------

  g_win32_get_package_installation_subdirectory ()

 gchar*      g_win32_get_package_installation_subdirectory
                                             (gchar *package,
                                              gchar *dll_name,
                                              gchar *subdir);

   Returns a newly-allocated string containing the path of the subdirectory subdir
   in the return value from calling g_win32_get_package_installation_directory()
   with the package and dll_name parameters.

   package :  An identifier for a software package, in UTF-8, or NULL
   dll_name : The name of a DLL that a package provides, in UTF-8, or NULL
   subdir :   A subdirectory of the package installation directory, also in UTF-8
   Returns :  a string containing the complete path to subdir inside the
              installation directory of package. The returned string is in the GLib
              file name encoding, i.e. UTF-8 on Windows. The return value should be
              freed with g_free() when no longer needed.

   ---------------------------------------------------------------------------------

  g_win32_get_windows_version ()

 guint       g_win32_get_windows_version     (void);

   Returns version information for the Windows operating system the code is running
   on. See MSDN documentation for the GetVersion() function. To summarize, the most
   significant bit is one on Win9x, and zero on NT-based systems. The least
   significant byte is 4 on Windows NT 4, 5 on Windows XP. Software that needs
   really detailled version and feature information should use Win32 API like
   GetVersionEx() and VerifyVersionInfo().

   If there is an environment variable G_WIN32_PRETEND_WIN9X defined (with any
   value), this function always returns a version code for Windows 9x. This is
   mainly an internal debugging aid for GTK+ and GLib developers, to be able to
   check the code paths for Windows 9x.

   Returns : The version information.

   Since 2.6

   ---------------------------------------------------------------------------------

  g_win32_locale_filename_from_utf8 ()

 gchar*      g_win32_locale_filename_from_utf8
                                             (const gchar *utf8filename);

   Converts a filename from UTF-8 to the system codepage.

   On NT-based Windows, on NTFS file systems, file names are in Unicode. It is quite
   possible that Unicode file names contain characters not representable in the
   system codepage. (For instance, Greek or Cyrillic characters on Western European
   or US Windows installations, or various less common CJK characters on CJK Windows
   installations.)

   In such a case, and if the filename refers to an existing file, and the file
   system stores alternate short (8.3) names for directory entries, the short form
   of the filename is returned. Note that the "short" name might in fact be longer
   than the Unicode name if the Unicode name has very short pathname components
   containing non-ASCII characters. If no system codepage name for the file is
   possible, NULL is returned.

   The return value is dynamically allocated and should be freed with g_free() when
   no longer needed.

   utf8filename : a UTF-8 encoded filename.
   Returns :      The converted filename, or NULL on conversion failure and lack of
                  short names.

   Since 2.8

   ---------------------------------------------------------------------------------

  G_WIN32_DLLMAIN_FOR_DLL_NAME()

 #define     G_WIN32_DLLMAIN_FOR_DLL_NAME(static, dll_name)

   On Windows, this macro defines a DllMain() function that stores the actual DLL
   name that the code being compiled will be included in.

   On non-Windows platforms, expands to nothing.

   static :   empty or "static".
   dll_name : the name of the (pointer to the) char array where the DLL name will be
              stored. If this is used, you must also include windows.h. If you need
              a more complex DLL entry point function, you cannot use this.

   ---------------------------------------------------------------------------------

  G_WIN32_HAVE_WIDECHAR_API()

 #define G_WIN32_HAVE_WIDECHAR_API() (G_WIN32_IS_NT_BASED ())

   On Windows, this macro defines an expression which evaluates to TRUE if the code
   is running on a version of Windows where the wide character versions of the Win32
   API functions, and the wide chaacter versions of the C library functions work.
   (They are always present in the DLLs, but don't work on Windows 9x and Me.)

   On non-Windows platforms, it is not defined.

   Since 2.6

   ---------------------------------------------------------------------------------

  G_WIN32_IS_NT_BASED()

 #define G_WIN32_IS_NT_BASED() (g_win32_get_windows_version () < 0x80000000)

   On Windows, this macro defines an expression which evaluates to TRUE if the code
   is running on an NT-based Windows operating system.

   On non-Windows platforms, it is not defined.

   Since 2.6

References

   Visible links
   . file:///usr/share/doc/libgtk2.0-doc/glib/index.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-utilities.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Bookmark-file-parser.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-data-types.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-fundamentals.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-core.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-utilities.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-data-types.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/tools.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/ix01.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/ix02.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/ix03.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/ix04.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/ix05.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/ix06.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/ix07.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/ix08.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Bookmark-file-parser.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-utilities.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/index.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-data-types.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Windows-Compatibility-Functions.html#id3116289
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Windows-Compatibility-Functions.html#id3116495
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Windows-Compatibility-Functions.html#MAXPATHLEN:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Windows-Compatibility-Functions.html#pipe
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Windows-Compatibility-Functions.html#g-win32-error-message
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gint
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Windows-Compatibility-Functions.html#g-win32-getlocale
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Windows-Compatibility-Functions.html#g-win32-get-package-installation-directory
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Windows-Compatibility-Functions.html#g-win32-get-package-installation-subdirectory
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#guint
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Windows-Compatibility-Functions.html#g-win32-get-windows-version
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Windows-Compatibility-Functions.html#g-win32-locale-filename-from-utf8
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Windows-Compatibility-Functions.html#G-WIN32-DLLMAIN-FOR-DLL-NAME:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Windows-Compatibility-Functions.html#G-WIN32-HAVE-WIDECHAR-API:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Windows-Compatibility-Functions.html#G-WIN32-IS-NT-BASED:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Windows-Compatibility-Functions.html#MAXPATHLEN:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Windows-Compatibility-Functions.html#pipe
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gint
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Memory-Allocation.html#g-free
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Memory-Allocation.html#g-free
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Memory-Allocation.html#g-free
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Windows-Compatibility-Functions.html#g-win32-get-package-installation-directory
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Memory-Allocation.html#g-free
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#guint
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Memory-Allocation.html#g-free
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#TRUE:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#TRUE:CAPS
