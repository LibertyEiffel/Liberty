   Link: GLib Reference Manual (start)
   Link: GLib Utilities (parent)
   Link: File Utilities (previous)
   Link: Commandline option parser (next)
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

   Shell-related Utilities

   Shell-related Utilities -- shell-like commandline handling.

Synopsis


 #include <glib.h>


 enum        GShellError;
 #define     G_SHELL_ERROR
 gboolean    g_shell_parse_argv              (const gchar *command_line,
                                              gint *argcp,
                                              gchar ***argvp,
                                              GError **error);
 gchar*      g_shell_quote                   (const gchar *unquoted_string);
 gchar*      g_shell_unquote                 (const gchar *quoted_string,
                                              GError **error);


Description

Details

  enum GShellError

 typedef enum
 {
   /* mismatched or otherwise mangled quoting */
   G_SHELL_ERROR_BAD_QUOTING,
   /* string to be parsed was empty */
   G_SHELL_ERROR_EMPTY_STRING,
   G_SHELL_ERROR_FAILED
 } GShellError;

   Error codes returned by shell functions.

   G_SHELL_ERROR_BAD_QUOTING  Mismatched or otherwise mangled quoting.
   G_SHELL_ERROR_EMPTY_STRING String to be parsed was empty.
   G_SHELL_ERROR_FAILED       Some other error.

   ---------------------------------------------------------------------------------

  G_SHELL_ERROR

 #define G_SHELL_ERROR g_shell_error_quark ()

   Error domain for shell functions. Errors in this domain will be from the
   GShellError enumeration. See GError for information on error domains.

   ---------------------------------------------------------------------------------

  g_shell_parse_argv ()

 gboolean    g_shell_parse_argv              (const gchar *command_line,
                                              gint *argcp,
                                              gchar ***argvp,
                                              GError **error);

   Parses a command line into an argument vector, in much the same way the shell
   would, but without many of the expansions the shell would perform (variable
   expansion, globs, operators, filename expansion, etc. are not supported). The
   results are defined to be the same as those you would get from a UNIX98 /bin/sh,
   as long as the input contains none of the unsupported shell expansions. If the
   input does contain such expansions, they are passed through literally. Possible
   errors are those from the G_SHELL_ERROR domain. Free the returned vector with
   g_strfreev().

   command_line : command line to parse
   argcp :        return location for number of args
   argvp :        return location for array of args
   error :        return location for error
   Returns :      TRUE on success, FALSE if error set

   ---------------------------------------------------------------------------------

  g_shell_quote ()

 gchar*      g_shell_quote                   (const gchar *unquoted_string);

   Quotes a string so that the shell (/bin/sh) will interpret the quoted string to
   mean unquoted_string. If you pass a filename to the shell, for example, you
   should first quote it with this function. The return value must be freed with
   g_free(). The quoting style used is undefined (single or double quotes may be
   used).

   unquoted_string : a literal string
   Returns :         quoted string

   ---------------------------------------------------------------------------------

  g_shell_unquote ()

 gchar*      g_shell_unquote                 (const gchar *quoted_string,
                                              GError **error);

   Unquotes a string as the shell (/bin/sh) would. Only handles quotes; if a string
   contains file globs, arithmetic operators, variables, backticks, redirections, or
   other special-to-the-shell features, the result will be different from the result
   a real shell would produce (the variables, backticks, etc. will be passed through
   literally instead of being expanded). This function is guaranteed to succeed if
   applied to the result of g_shell_quote(). If it fails, it returns NULL and sets
   the error. The quoted_string need not actually contain quoted or escaped text;
   g_shell_unquote() simply goes through the string and unquotes/unescapes anything
   that the shell would. Both single and double quotes are handled, as are escapes
   including escaped newlines. The return value must be freed with g_free().
   Possible errors are in the G_SHELL_ERROR domain.

   Shell quoting rules are a bit strange. Single quotes preserve the literal string
   exactly. escape sequences are not allowed; not even \' - if you want a ' in the
   quoted text, you have to do something like 'foo'\''bar'. Double quotes allow $,
   `, ", \, and newline to be escaped with backslash. Otherwise double quotes
   preserve things literally.

   quoted_string : shell-quoted string
   error :         error return location or NULL
   Returns :       an unquoted string

References

   Visible links
   . file:///usr/share/doc/libgtk2.0-doc/glib/index.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-utilities.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-File-Utilities.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html
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
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-File-Utilities.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-utilities.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/index.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Shell-related-Utilities.html#id3052810
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Shell-related-Utilities.html#id3052936
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Shell-related-Utilities.html#GShellError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Shell-related-Utilities.html#G-SHELL-ERROR:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gboolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Shell-related-Utilities.html#g-shell-parse-argv
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gint
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Shell-related-Utilities.html#g-shell-quote
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Shell-related-Utilities.html#g-shell-unquote
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Shell-related-Utilities.html#GShellError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gboolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gint
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Shell-related-Utilities.html#G-SHELL-ERROR:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-String-Utility-Functions.html#g-strfreev
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#TRUE:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#FALSE:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Memory-Allocation.html#g-free
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Shell-related-Utilities.html#g-shell-quote
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Shell-related-Utilities.html#g-shell-unquote
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Memory-Allocation.html#g-free
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Shell-related-Utilities.html#G-SHELL-ERROR:CAPS
