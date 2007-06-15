deferred class GLIB_SHELL_RELATED_UTILITIES
--    Shell-related Utilities

--    Shell-related Utilities -- shell-like commandline handling.

-- Synopsis


--  #include <glib.h>


--  enum        GShellError;
--  #define     G_SHELL_ERROR
--  gboolean    g_shell_parse_argv              (const gchar *command_line,
--                                               gint *argcp,
--                                               gchar ***argvp,
--                                               GError **error);
--  gchar*      g_shell_quote                   (const gchar *unquoted_string);
--  gchar*      g_shell_unquote                 (const gchar *quoted_string,
--                                               GError **error);


-- Description

-- Details

--   enum GShellError

--  typedef enum
--  {
--    /* mismatched or otherwise mangled quoting */
--    G_SHELL_ERROR_BAD_QUOTING,
--    /* string to be parsed was empty */
--    G_SHELL_ERROR_EMPTY_STRING,
--    G_SHELL_ERROR_FAILED
--  } GShellError;

--    Error codes returned by shell functions.

--    G_SHELL_ERROR_BAD_QUOTING  Mismatched or otherwise mangled quoting.
--    G_SHELL_ERROR_EMPTY_STRING String to be parsed was empty.
--    G_SHELL_ERROR_FAILED       Some other error.

--    ---------------------------------------------------------------------------------

--   G_SHELL_ERROR

--  #define G_SHELL_ERROR g_shell_error_quark ()

--    Error domain for shell functions. Errors in this domain will be from the
--    GShellError enumeration. See GError for information on error domains.

--    ---------------------------------------------------------------------------------

--   g_shell_parse_argv ()

--  gboolean    g_shell_parse_argv              (const gchar *command_line,
--                                               gint *argcp,
--                                               gchar ***argvp,
--                                               GError **error);

--    Parses a command line into an argument vector, in much the same way the shell
--    would, but without many of the expansions the shell would perform (variable
--    expansion, globs, operators, filename expansion, etc. are not supported). The
--    results are defined to be the same as those you would get from a UNIX98 /bin/sh,
--    as long as the input contains none of the unsupported shell expansions. If the
--    input does contain such expansions, they are passed through literally. Possible
--    errors are those from the G_SHELL_ERROR domain. Free the returned vector with
--    g_strfreev().

--    command_line : command line to parse
--    argcp :        return location for number of args
--    argvp :        return location for array of args
--    error :        return location for error
--    Returns :      TRUE on success, FALSE if error set

--    ---------------------------------------------------------------------------------

--   g_shell_quote ()

--  gchar*      g_shell_quote                   (const gchar *unquoted_string);

--    Quotes a string so that the shell (/bin/sh) will interpret the quoted string to
--    mean unquoted_string. If you pass a filename to the shell, for example, you
--    should first quote it with this function. The return value must be freed with
--    g_free(). The quoting style used is undefined (single or double quotes may be
--    used).

--    unquoted_string : a literal string
--    Returns :         quoted string

--    ---------------------------------------------------------------------------------

--   g_shell_unquote ()

--  gchar*      g_shell_unquote                 (const gchar *quoted_string,
--                                               GError **error);

--    Unquotes a string as the shell (/bin/sh) would. Only handles quotes; if a string
--    contains file globs, arithmetic operators, variables, backticks, redirections, or
--    other special-to-the-shell features, the result will be different from the result
--    a real shell would produce (the variables, backticks, etc. will be passed through
--    literally instead of being expanded). This function is guaranteed to succeed if
--    applied to the result of g_shell_quote(). If it fails, it returns NULL and sets
--    the error. The quoted_string need not actually contain quoted or escaped text;
--    g_shell_unquote() simply goes through the string and unquotes/unescapes anything
--    that the shell would. Both single and double quotes are handled, as are escapes
--    including escaped newlines. The return value must be freed with g_free().
--    Possible errors are in the G_SHELL_ERROR domain.

--    Shell quoting rules are a bit strange. Single quotes preserve the literal string
--    exactly. escape sequences are not allowed; not even \' - if you want a ' in the
--    quoted text, you have to do something like 'foo'\''bar'. Double quotes allow $,
--    `, ", \, and newline to be escaped with backslash. Otherwise double quotes
--    preserve things literally.

--    quoted_string : shell-quoted string
--    error :         error return location or NULL
--    Returns :       an unquoted string
end -- class GLIB_SHELL_RELATED_UTILITIES
