   Link: GLib Reference Manual (start)
   Link: GLib Utilities (parent)
   Link: Shell-related Utilities (previous)
   Link: Glob-style pattern matching (next)
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

   Commandline option parser

   Commandline option parser -- parses commandline options

Synopsis


 #include <glib.h>


 enum        GOptionError;
 #define     G_OPTION_ERROR
 gboolean    (*GOptionArgFunc)               (const gchar *option_name,
                                              const gchar *value,
                                              gpointer data,
                                              GError **error);
             GOptionContext;
 GOptionContext* g_option_context_new        (const gchar *parameter_string);
 void        g_option_context_set_summary    (GOptionContext *context,
                                              const gchar *summary);
 const gchar* g_option_context_get_summary   (GOptionContext *context);
 void        g_option_context_set_description
                                             (GOptionContext *context,
                                              const gchar *description);
 const gchar* g_option_context_get_description
                                             (GOptionContext *context);
 const gchar* (*GTranslateFunc)              (const gchar *str,
                                              gpointer data);
 void        g_option_context_set_translate_func
                                             (GOptionContext *context,
                                              GTranslateFunc func,
                                              gpointer data,
                                              GDestroyNotify destroy_notify);
 void        g_option_context_set_translation_domain
                                             (GOptionContext *context,
                                              const gchar *domain);
 void        g_option_context_free           (GOptionContext *context);
 gboolean    g_option_context_parse          (GOptionContext *context,
                                              gint *argc,
                                              gchar ***argv,
                                              GError **error);
 void        g_option_context_set_help_enabled
                                             (GOptionContext *context,
                                              gboolean help_enabled);
 gboolean    g_option_context_get_help_enabled
                                             (GOptionContext *context);
 void        g_option_context_set_ignore_unknown_options
                                             (GOptionContext *context,
                                              gboolean ignore_unknown);
 gboolean    g_option_context_get_ignore_unknown_options
                                             (GOptionContext *context);
 enum        GOptionArg;
 enum        GOptionFlags;
 #define     G_OPTION_REMAINING
             GOptionEntry;
 void        g_option_context_add_main_entries
                                             (GOptionContext *context,
                                              const GOptionEntry *entries,
                                              const gchar *translation_domain);
             GOptionGroup;
 void        g_option_context_add_group      (GOptionContext *context,
                                              GOptionGroup *group);
 void        g_option_context_set_main_group (GOptionContext *context,
                                              GOptionGroup *group);
 GOptionGroup* g_option_context_get_main_group
                                             (GOptionContext *context);
 GOptionGroup* g_option_group_new            (const gchar *name,
                                              const gchar *description,
                                              const gchar *help_description,
                                              gpointer user_data,
                                              GDestroyNotify destroy);
 void        g_option_group_free             (GOptionGroup *group);
 void        g_option_group_add_entries      (GOptionGroup *group,
                                              const GOptionEntry *entries);
 gboolean    (*GOptionParseFunc)             (GOptionContext *context,
                                              GOptionGroup *group,
                                              gpointer data,
                                              GError **error);
 void        g_option_group_set_parse_hooks  (GOptionGroup *group,
                                              GOptionParseFunc pre_parse_func,
                                              GOptionParseFunc post_parse_func);
 void        (*GOptionErrorFunc)             (GOptionContext *context,
                                              GOptionGroup *group,
                                              gpointer data,
                                              GError **error);
 void        g_option_group_set_error_hook   (GOptionGroup *group,
                                              GOptionErrorFunc error_func);
 void        g_option_group_set_translate_func
                                             (GOptionGroup *group,
                                              GTranslateFunc func,
                                              gpointer data,
                                              GDestroyNotify destroy_notify);
 void        g_option_group_set_translation_domain
                                             (GOptionGroup *group,
                                              const gchar *domain);


Description

   The GOption commandline parser is intended to be a simpler replacement for the
   popt library. It supports short and long commandline options, as shown in the
   following example:

   testtreemodel -r 1 --max-size 20 --rand --display=:1.0 -vb -- file1 file2

   The example demonstrates a number of features of the GOption commandline parser

     o Options can be single letters, prefixed by a single dash. Multiple short
       options can be grouped behind a single dash.

     o Long options are prefixed by two consecutive dashes.

     o Options can have an extra argument, which can be a number, a string or a
       filename. For long options, the extra argument can be appended with an equals
       sign after the option name.

     o Non-option arguments are returned to the application as rest arguments.

     o An argument consisting solely of two dashes turns off further parsing, any
       remaining arguments (even those starting with a dash) are returned to the
       application as rest arguments.

   Another important feature of GOption is that it can automatically generate nicely
   formatted help output. Unless it is explicitly turned off with
   g_option_context_set_help_enabled(), GOption will recognize the --help, -?,
   --help-all and --help-groupname options (where groupname is the name of a
   GOptionGroup) and write a text similar to the one shown in the following example
   to stdout.

 Usage:
   testtreemodel [OPTION...] - test tree model performance

 Help Options:
   -?, --help               Show help options
   --help-all               Show all help options
   --help-gtk               Show GTK+ Options

 Application Options:
   -r, --repeats=N          Average over N repetitions
   -m, --max-size=M         Test up to 2^M items
   --display=DISPLAY        X display to use
   -v, --verbose            Be verbose
   -b, --beep               Beep when done
   --rand                   Randomize the data

   GOption groups options in GOptionGroups, which makes it easy to incorporate
   options from multiple sources. The intended use for this is to let applications
   collect option groups from the libraries it uses, add them to their
   GOptionContext, and parse all options by a single call to
   g_option_context_parse(). See gtk_get_option_group() for an example.

   If an option is declared to be of type string or filename, GOption takes care of
   converting it to the right encoding; strings are returned in UTF-8, filenames are
   returned in the GLib filename encoding.

   Here is a complete example of setting up GOption to parse the example commandline
   above and produce the example help output.

 static gint repeats = 2;
 static gint max_size = 8;
 static gboolean verbose = FALSE;
 static gboolean beep = FALSE;
 static gboolean rand = FALSE;

 static GOptionEntry entries[] =
 {
   { "repeats", 'r', 0, G_OPTION_ARG_INT, &repeats, "Average over N repetitions", "N" },
   { "max-size", 'm', 0, G_OPTION_ARG_INT, &max_size, "Test up to 2^M items", "M" },
   { "verbose", 'v', 0, G_OPTION_ARG_NONE, &verbose, "Be verbose", NULL },
   { "beep", 'b', 0, G_OPTION_ARG_NONE, &beep, "Beep when done", NULL },
   { "rand", 0, 0, G_OPTION_ARG_NONE, &rand, "Randomize the data", NULL },
   { NULL }
 };

 int
 main (int argc, char *argv[])
 {
   GError *error = NULL;
   GOptionContext *context;

   context = g_option_context_new ("- test tree model performance");
   g_option_context_add_main_entries (context, entries, GETTEXT_PACKAGE);
   g_option_context_add_group (context, gtk_get_option_group (TRUE));
   g_option_context_parse (context, &argc, &argv, &error);

   /* ... */

 }

Details

  enum GOptionError

 typedef enum
 {
   G_OPTION_ERROR_UNKNOWN_OPTION,
   G_OPTION_ERROR_BAD_VALUE,
   G_OPTION_ERROR_FAILED
 } GOptionError;

   Error codes returned by option parsing.

   G_OPTION_ERROR_UNKNOWN_OPTION An option was not known to the parser. This error
                                 will only be reported, if the parser hasn't been
                                 instructed to ignore unknown options, see
                                 g_option_context_set_ignore_unknown_options().
   G_OPTION_ERROR_BAD_VALUE      A value couldn't be parsed.
   G_OPTION_ERROR_FAILED         A GOptionArgFunc callback failed.

   ---------------------------------------------------------------------------------

  G_OPTION_ERROR

 #define G_OPTION_ERROR (g_option_error_quark ())

   Error domain for option parsing. Errors in this domain will be from the
   GOptionError enumeration. See GError for information on error domains.

   ---------------------------------------------------------------------------------

  GOptionArgFunc ()

 gboolean    (*GOptionArgFunc)               (const gchar *option_name,
                                              const gchar *value,
                                              gpointer data,
                                              GError **error);

   The type of function to be passed as callback for G_OPTION_ARG_CALLBACK options.

   option_name : The name of the option being parsed. This will be either a single
                 dash followed by a single letter (for a short name) or two dashes
                 followed by a long option name.
   value :       The value to be parsed.
   data :        User data added to the GOptionGroup containing the option when it
                 was created with g_option_group_new()
   error :       A return location for errors. The error code G_OPTION_ERROR_FAILED
                 is intended to be used for errors in GOptionArgFunc callbacks.
   Returns :     TRUE if the option was successfully parsed, FALSE if an error
                 occurred, in which case error should be set with g_set_error()

   ---------------------------------------------------------------------------------

  GOptionContext

 typedef struct _GOptionContext GOptionContext;

   A GOptionContext struct defines which options are accepted by the commandline
   option parser. The struct has only private fields and should not be directly
   accessed.

   ---------------------------------------------------------------------------------

  g_option_context_new ()

 GOptionContext* g_option_context_new        (const gchar *parameter_string);

   Creates a new option context.

   The parameter_string can serve multiple purposes. It can be used to add
   descriptions for "rest" arguments, which are not parsed by the GOptionContext,
   typically something like "FILES" or "FILE1 FILE2...". If you are using
   G_OPTION_REMAINING for collecting "rest" arguments, GLib handles this
   automatically by using the arg_description of the corresponding GOptionEntry in
   the usage summary.

   Another usage is to give a short summary of the program functionality, like " -
   frob the strings", which will be displayed in the same line as the usage. For a
   longer description of the program functionality that should be displayed as a
   paragraph below the usage line, use g_option_context_set_summary().

   Note that the parameter_string is translated (see
   g_option_context_set_translate_func()).

   parameter_string : a string which is displayed in the first line of --help
                      output, after the usage summary programname [OPTION...]
   Returns :          a newly created GOptionContext, which must be freed with
                      g_option_context_free() after use.

   Since 2.6

   ---------------------------------------------------------------------------------

  g_option_context_set_summary ()

 void        g_option_context_set_summary    (GOptionContext *context,
                                              const gchar *summary);

   Adds a string to be displayed in --help output before the list of options. This
   is typically a summary of the program functionality.

   Note that the summary is translated (see g_option_context_set_translate_func()).

   context : a GOptionContext
   summary : a string to be shown in --help output before the list of options, or
             NULL

   Since 2.12

   ---------------------------------------------------------------------------------

  g_option_context_get_summary ()

 const gchar* g_option_context_get_summary   (GOptionContext *context);

   Returns the summary. See g_option_context_set_summary().

   context : a GOptionContext
   Returns : the summary

   Since 2.12

   ---------------------------------------------------------------------------------

  g_option_context_set_description ()

 void        g_option_context_set_description
                                             (GOptionContext *context,
                                              const gchar *description);

   Adds a string to be displayed in --help output after the list of options. This
   text often includes a bug reporting address.

   Note that the summary is translated (see g_option_context_set_translate_func()).

   context :     a GOptionContext
   description : a string to be shown in --help output after the list of options, or
                 NULL

   Since 2.12

   ---------------------------------------------------------------------------------

  g_option_context_get_description ()

 const gchar* g_option_context_get_description
                                             (GOptionContext *context);

   Returns the description. See g_option_context_set_description().

   context : a GOptionContext
   Returns : the description

   Since 2.12

   ---------------------------------------------------------------------------------

  GTranslateFunc ()

 const gchar* (*GTranslateFunc)              (const gchar *str,
                                              gpointer data);

   The type of functions which are used to translate user-visible strings, for
   --help output.

   str :     the untranslated string
   data :    user data specified when installing the function, e.g. in
             g_option_group_set_translate_func()
   Returns : a translation of the string for the current locale. The returned string
             is owned by GLib and must not be freed.

   ---------------------------------------------------------------------------------

  g_option_context_set_translate_func ()

 void        g_option_context_set_translate_func
                                             (GOptionContext *context,
                                              GTranslateFunc func,
                                              gpointer data,
                                              GDestroyNotify destroy_notify);

   Sets the function which is used to translate the contexts user-visible strings,
   for --help output. If func is NULL, strings are not translated.

   Note that option groups have their own translation functions, this function only
   affects the parameter_string (see g_option_context_nex()), the summary (see
   g_option_context_set_summary()) and the description (see
   g_option_context_set_description()).

   If you are using gettext(), you only need to set the translation domain, see
   g_context_group_set_translation_domain().

   context :        a GOptionContext
   func :           the GTranslateFunc, or NULL
   data :           user data to pass to func, or NULL
   destroy_notify : a function which gets called to free data, or NULL

   Since 2.12

   ---------------------------------------------------------------------------------

  g_option_context_set_translation_domain ()

 void        g_option_context_set_translation_domain
                                             (GOptionContext *context,
                                              const gchar *domain);

   A convenience function to use gettext() for translating user-visible strings.

   context : a GOptionContext
   domain :  the domain to use

   Since 2.12

   ---------------------------------------------------------------------------------

  g_option_context_free ()

 void        g_option_context_free           (GOptionContext *context);

   Frees context and all the groups which have been added to it.

   context : a GOptionContext

   Since 2.6

   ---------------------------------------------------------------------------------

  g_option_context_parse ()

 gboolean    g_option_context_parse          (GOptionContext *context,
                                              gint *argc,
                                              gchar ***argv,
                                              GError **error);

   Parses the command line arguments, recognizing options which have been added to
   context. A side-effect of calling this function is that g_set_prgname() will be
   called.

   If the parsing is successful, any parsed arguments are removed from the array and
   argc and argv are updated accordingly. A '--' option is stripped from argv unless
   there are unparsed options before and after it, or some of the options after it
   start with '-'. In case of an error, argc and argv are left unmodified.

   If automatic --help support is enabled (see g_option_context_set_help_enabled()),
   and the argv array contains one of the recognized help options, this function
   will produce help output to stdout and call exit (0).

   context : a GOptionContext
   argc :    a pointer to the number of command line arguments.
   argv :    a pointer to the array of command line arguments.
   error :   a return location for errors
   Returns : TRUE if the parsing was successful, FALSE if an error occurred

   Since 2.6

   ---------------------------------------------------------------------------------

  g_option_context_set_help_enabled ()

 void        g_option_context_set_help_enabled
                                             (GOptionContext *context,
                                              gboolean help_enabled);

   Enables or disables automatic generation of --help output. By default,
   g_option_context_parse() recognizes --help, -?, --help-all and --help-groupname
   and creates suitable output to stdout.

   context :      a GOptionContext
   help_enabled : TRUE to enable --help, FALSE to disable it

   Since 2.6

   ---------------------------------------------------------------------------------

  g_option_context_get_help_enabled ()

 gboolean    g_option_context_get_help_enabled
                                             (GOptionContext *context);

   Returns whether automatic --help generation is turned on for context. See
   g_option_context_set_help_enabled().

   context : a GOptionContext
   Returns : TRUE if automatic help generation is turned on.

   Since 2.6

   ---------------------------------------------------------------------------------

  g_option_context_set_ignore_unknown_options ()

 void        g_option_context_set_ignore_unknown_options
                                             (GOptionContext *context,
                                              gboolean ignore_unknown);

   Sets whether to ignore unknown options or not. If an argument is ignored, it is
   left in the argv array after parsing. By default, g_option_context_parse() treats
   unknown options as error.

   This setting does not affect non-option arguments (i.e. arguments which don't
   start with a dash). But note that GOption cannot reliably determine whether a
   non-option belongs to a preceding unknown option.

   context :        a GOptionContext
   ignore_unknown : TRUE to ignore unknown options, FALSE to produce an error when
                    unknown options are met

   Since 2.6

   ---------------------------------------------------------------------------------

  g_option_context_get_ignore_unknown_options ()

 gboolean    g_option_context_get_ignore_unknown_options
                                             (GOptionContext *context);

   Returns whether unknown options are ignored or not. See
   g_option_context_set_ignore_unknown_options().

   context : a GOptionContext
   Returns : TRUE if unknown options are ignored.

   Since 2.6

   ---------------------------------------------------------------------------------

  enum GOptionArg

 typedef enum
 {
   G_OPTION_ARG_NONE,
   G_OPTION_ARG_STRING,
   G_OPTION_ARG_INT,
   G_OPTION_ARG_CALLBACK,
   G_OPTION_ARG_FILENAME,
   G_OPTION_ARG_STRING_ARRAY,
   G_OPTION_ARG_FILENAME_ARRAY,
   G_OPTION_ARG_DOUBLE,
   G_OPTION_ARG_INT64
 } GOptionArg;

   The GOptionArg enum values determine which type of extra argument the options
   expect to find. If an option expects an extra argument, it can be specified in
   several ways; with a short option: -x arg, with a long option: --name arg or
   combined in a single argument: --name=arg.

   G_OPTION_ARG_NONE           No extra argument. This is useful for simple flags.
   G_OPTION_ARG_STRING         The option takes a string argument.
   G_OPTION_ARG_INT            The option takes an integer argument.
   G_OPTION_ARG_CALLBACK       The option provides a callback to parse the extra
                               argument.
   G_OPTION_ARG_FILENAME       The option takes a filename as argument.
   G_OPTION_ARG_STRING_ARRAY   The option takes a string argument, multiple uses of
                               the option are collected into an array of strings.
   G_OPTION_ARG_FILENAME_ARRAY The option takes a filename as argument, multiple
                               uses of the option are collected into an array of
                               strings.
   G_OPTION_ARG_DOUBLE         The option takes a double argument. The argument can
                               be formatted either for the user's locale or for the
                               "C" locale. Since 2.12
   G_OPTION_ARG_INT64          The option takes a 64-bit integer. Like
                               G_OPTION_ARG_INT but for larger numbers. The number
                               can be in decimal base, or in hexadecimal (when
                               prefixed with 0x, for example, 0xffffffff). Since
                               2.12

   ---------------------------------------------------------------------------------

  enum GOptionFlags

 typedef enum
 {
   G_OPTION_FLAG_HIDDEN          = 1 << 0,
   G_OPTION_FLAG_IN_MAIN         = 1 << 1,
   G_OPTION_FLAG_REVERSE         = 1 << 2,
   G_OPTION_FLAG_NO_ARG          = 1 << 3,
   G_OPTION_FLAG_FILENAME        = 1 << 4,
   G_OPTION_FLAG_OPTIONAL_ARG    = 1 << 5,
   G_OPTION_FLAG_NOALIAS         = 1 << 6
 } GOptionFlags;

   Flags which modify individual options.

   G_OPTION_FLAG_HIDDEN       The option doesn't appear in --help output.
   G_OPTION_FLAG_IN_MAIN      The option appears in the main section of the --help
                              output, even if it is defined in a group.
   G_OPTION_FLAG_REVERSE      For options of the G_OPTION_ARG_NONE kind, this flag
                              indicates that the sense of the option is reversed.
   G_OPTION_FLAG_NO_ARG       For options of the G_OPTION_ARG_CALLBACK kind, this
                              flag indicates that the callback does not take any
                              argument (like a G_OPTION_ARG_NONE option). Since 2.8
   G_OPTION_FLAG_FILENAME     For options of the G_OPTION_ARG_CALLBACK kind, this
                              flag indicates that the argument should be passed to
                              the callback in the GLib filename encoding rather than
                              UTF-8. Since 2.8
   G_OPTION_FLAG_OPTIONAL_ARG For options of the G_OPTION_ARG_CALLBACK kind, this
                              flag indicates that the argument supply is optional.
                              If no argument is given then data of GOptionParseFunc
                              will be set to NULL. Since 2.8
   G_OPTION_FLAG_NOALIAS      This flag turns off the automatic conflict resolution
                              which prefixes long option names with groupname- if
                              there is a conflict. This option should only be used
                              in situations where aliasing is necessary to model
                              some legacy commandline interface. It is not safe to
                              use this option, unless all option groups are under
                              your direct control. Since 2.8.

   ---------------------------------------------------------------------------------

  G_OPTION_REMAINING

 #define G_OPTION_REMAINING ""

   If a long option in the main group has this name, it is not treated as a regular
   option. Instead it collects all non-option arguments which would otherwise be
   left in argv. The option must be of type G_OPTION_ARG_STRING_ARRAY or
   G_OPTION_ARG_FILENAME_ARRAY.

   Using G_OPTION_REMAINING instead of simply scanning argv for leftover arguments
   has the advantage that GOption takes care of necessary encoding conversions for
   strings or filenames.

   Since 2.6

   ---------------------------------------------------------------------------------

  GOptionEntry

 typedef struct {
   const gchar *long_name;
   gchar        short_name;
   gint         flags;

   GOptionArg   arg;
   gpointer     arg_data;

   const gchar *description;
   const gchar *arg_description;
 } GOptionEntry;

   A GOptionEntry defines a single option. To have an effect, they must be added to
   a GOptionGroup with g_option_context_add_main_entries() or
   g_option_group_add_entries().

   const gchar *long_name;       The long name of an option can be used to specify
                                 it in a commandline as --long_name. Every option
                                 must have a long name. To resolve conflicts if
                                 multiple option groups contain the same long name,
                                 it is also possible to specify the option as
                                 --groupname-long_name.
   gchar short_name;             If an option has a short name, it can be specified
                                 -short_name in a commandline. short_name must be a
                                 printable ASCII character different from '-', or
                                 zero if the option has no short name.
   gint flags;                   Flags from GOptionFlags.
   GOptionArg arg;               The type of the option, as a GOptionArg.
   gpointer arg_data;            If the arg type is G_OPTION_ARG_CALLBACK, then
                                 arg_data must point to a GOptionArgFunc callback
                                 function, which will be called to handle the extra
                                 argument. Otherwise, arg_data is a pointer to a
                                 location to store the value, the required type of
                                 the location depends on the arg type:

                                 G_OPTION_ARG_NONE           gboolean
                                 G_OPTION_ARG_STRING         gchar*
                                 G_OPTION_ARG_INT            gint
                                 G_OPTION_ARG_FILENAME       gchar*
                                 G_OPTION_ARG_STRING_ARRAY   gchar**
                                 G_OPTION_ARG_FILENAME_ARRAY gchar**
                                 G_OPTION_ARG_DOUBLE         gdouble
   const gchar *description;     the description for the option in --help output.
                                 The description is translated using the
                                 translate_func of the group, see
                                 g_option_group_set_translation_domain().
   const gchar *arg_description; The placeholder to use for the extra argument
                                 parsed by the option in --help output. The
                                 arg_description is translated using the
                                 translate_func of the group, see
                                 g_option_group_set_translation_domain().

   ---------------------------------------------------------------------------------

  g_option_context_add_main_entries ()

 void        g_option_context_add_main_entries
                                             (GOptionContext *context,
                                              const GOptionEntry *entries,
                                              const gchar *translation_domain);

   A convenience function which creates a main group if it doesn't exist, adds the
   entries to it and sets the translation domain.

   context :            a GOptionContext
   entries :            a NULL-terminated array of GOptionEntrys
   translation_domain : a translation domain to use for translating the --help
                        output for the options in entries with gettext(), or NULL

   Since 2.6

   ---------------------------------------------------------------------------------

  GOptionGroup

 typedef struct _GOptionGroup GOptionGroup;

   A GOptionGroup struct defines the options in a single group. The struct has only
   private fields and should not be directly accessed.

   All options in a group share the same translation function. Libaries which need
   to parse commandline options are expected to provide a function for getting a
   GOptionGroup holding their options, which the application can then add to its
   GOptionContext.

   ---------------------------------------------------------------------------------

  g_option_context_add_group ()

 void        g_option_context_add_group      (GOptionContext *context,
                                              GOptionGroup *group);

   Adds a GOptionGroup to the context, so that parsing with context will recognize
   the options in the group. Note that the group will be freed together with the
   context when g_option_context_free() is called, so you must not free the group
   yourself after adding it to a context.

   context : a GOptionContext
   group :   the group to add

   Since 2.6

   ---------------------------------------------------------------------------------

  g_option_context_set_main_group ()

 void        g_option_context_set_main_group (GOptionContext *context,
                                              GOptionGroup *group);

   Sets a GOptionGroup as main group of the context. This has the same effect as
   calling g_option_context_add_group(), the only difference is that the options in
   the main group are treated differently when generating --help output.

   context : a GOptionContext
   group :   the group to set as main group

   Since 2.6

   ---------------------------------------------------------------------------------

  g_option_context_get_main_group ()

 GOptionGroup* g_option_context_get_main_group
                                             (GOptionContext *context);

   Returns a pointer to the main group of context.

   context : a GOptionContext
   Returns : the main group of context, or NULL if context doesn't have a main
             group. Note that group belongs to context and should not be modified or
             freed.

   Since 2.6

   ---------------------------------------------------------------------------------

  g_option_group_new ()

 GOptionGroup* g_option_group_new            (const gchar *name,
                                              const gchar *description,
                                              const gchar *help_description,
                                              gpointer user_data,
                                              GDestroyNotify destroy);

   Creates a new GOptionGroup.

   name :             the name for the option group, this is used to provide help
                      for the options in this group with --help-name
   description :      a description for this group to be shown in --help. This
                      string is translated using the translation domain or
                      translation function of the group
   help_description : a description for the --help-name option. This string is
                      translated using the translation domain or translation
                      function of the group
   user_data :        user data that will be passed to the pre- and post-parse
                      hooks, the error hook and to callbacks of
                      G_OPTION_ARG_CALLBACK options, or NULL
   destroy :          a function that will be called to free user_data, or NULL
   Returns :          a newly created option group. It should be added to a
                      GOptionContext or freed with g_option_group_free().

   Since 2.6

   ---------------------------------------------------------------------------------

  g_option_group_free ()

 void        g_option_group_free             (GOptionGroup *group);

   Frees a GOptionGroup. Note that you must not free groups which have been added to
   a GOptionContext.

   group : a GOptionGroup

   Since 2.6

   ---------------------------------------------------------------------------------

  g_option_group_add_entries ()

 void        g_option_group_add_entries      (GOptionGroup *group,
                                              const GOptionEntry *entries);

   Adds the options specified in entries to group.

   group :   a GOptionGroup
   entries : a NULL-terminated array of GOptionEntrys

   Since 2.6

   ---------------------------------------------------------------------------------

  GOptionParseFunc ()

 gboolean    (*GOptionParseFunc)             (GOptionContext *context,
                                              GOptionGroup *group,
                                              gpointer data,
                                              GError **error);

   The type of function that can be called before and after parsing.

   context : The active GOptionContext
   group :   The group to which the function belongs
   data :    User data added to the GOptionGroup containing the option when it was
             created with g_option_group_new()
   error :   A return location for error details
   Returns : TRUE if the function completed successfully, FALSE if an error
             occurred, in which case error should be set with g_set_error()

   ---------------------------------------------------------------------------------

  g_option_group_set_parse_hooks ()

 void        g_option_group_set_parse_hooks  (GOptionGroup *group,
                                              GOptionParseFunc pre_parse_func,
                                              GOptionParseFunc post_parse_func);

   Associates two functions with group which will be called from
   g_option_context_parse() before the first option is parsed and after the last
   option has been parsed, respectively.

   Note that the user data to be passed to pre_parse_func and post_parse_func can be
   specified when constructing the group with g_option_group_new().

   group :           a GOptionGroup
   pre_parse_func :  a function to call before parsing, or NULL
   post_parse_func : a function to call after parsing, or NULL

   Since 2.6

   ---------------------------------------------------------------------------------

  GOptionErrorFunc ()

 void        (*GOptionErrorFunc)             (GOptionContext *context,
                                              GOptionGroup *group,
                                              gpointer data,
                                              GError **error);

   The type of function to be used as callback when a parse error occurs.

   context : The active GOptionContext
   group :   The group to which the function belongs
   data :    User data added to the GOptionGroup containing the option when it was
             created with g_option_group_new()
   error :   The GError containing details about the parse error

   ---------------------------------------------------------------------------------

  g_option_group_set_error_hook ()

 void        g_option_group_set_error_hook   (GOptionGroup *group,
                                              GOptionErrorFunc error_func);

   Associates a function with group which will be called from
   g_option_context_parse() when an error occurs.

   Note that the user data to be passed to pre_parse_func and post_parse_func can be
   specified when constructing the group with g_option_group_new().

   group :      a GOptionGroup
   error_func : a function to call when an error occurs

   Since 2.6

   ---------------------------------------------------------------------------------

  g_option_group_set_translate_func ()

 void        g_option_group_set_translate_func
                                             (GOptionGroup *group,
                                              GTranslateFunc func,
                                              gpointer data,
                                              GDestroyNotify destroy_notify);

   Sets the function which is used to translate user-visible strings, for --help
   output. Different groups can use different GTranslateFuncs. If func is NULL,
   strings are not translated.

   If you are using gettext(), you only need to set the translation domain, see
   g_option_group_set_translation_domain().

   group :          a GOptionGroup
   func :           the GTranslateFunc, or NULL
   data :           user data to pass to func, or NULL
   destroy_notify : a function which gets called to free data, or NULL

   Since 2.6

   ---------------------------------------------------------------------------------

  g_option_group_set_translation_domain ()

 void        g_option_group_set_translation_domain
                                             (GOptionGroup *group,
                                              const gchar *domain);

   A convenience function to use gettext() for translating user-visible strings.

   group :  a GOptionGroup
   domain : the domain to use

   Since 2.6

References

   Visible links
   . file:///usr/share/doc/libgtk2.0-doc/glib/index.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-utilities.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Shell-related-Utilities.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Glob-style-pattern-matching.html
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
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Shell-related-Utilities.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-utilities.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/index.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Glob-style-pattern-matching.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#id3054381
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#id3055412
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#G-OPTION-ERROR:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gboolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionArgFunc
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gpointer
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-context-new
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-context-set-summary
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-context-get-summary
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-context-set-description
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-context-get-description
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GTranslateFunc
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gpointer
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-context-set-translate-func
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GTranslateFunc
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gpointer
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Datasets.html#GDestroyNotify
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-context-set-translation-domain
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-context-free
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gboolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-context-parse
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gint
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-context-set-help-enabled
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gboolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gboolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-context-get-help-enabled
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-context-set-ignore-unknown-options
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gboolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gboolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-context-get-ignore-unknown-options
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionArg
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionFlags
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#G-OPTION-REMAINING:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionEntry
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-context-add-main-entries
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionEntry
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionGroup
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-context-add-group
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionGroup
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-context-set-main-group
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionGroup
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionGroup
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-context-get-main-group
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionGroup
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-group-new
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gpointer
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Datasets.html#GDestroyNotify
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-group-free
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionGroup
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-group-add-entries
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionGroup
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionEntry
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gboolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionParseFunc
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionGroup
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gpointer
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-group-set-parse-hooks
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionGroup
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionParseFunc
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionParseFunc
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionErrorFunc
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionGroup
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gpointer
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-group-set-error-hook
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionGroup
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionErrorFunc
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-group-set-translate-func
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionGroup
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GTranslateFunc
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gpointer
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Datasets.html#GDestroyNotify
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-group-set-translation-domain
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionGroup
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-context-set-help-enabled
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionGroup
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionGroup
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-context-parse
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-context-set-ignore-unknown-options
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionArgFunc
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gboolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gpointer
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#G-OPTION-ARG-CALLBACK:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionGroup
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-group-new
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#G-OPTION-ERROR-FAILED:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionArgFunc
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#TRUE:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#FALSE:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#g-set-error
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#G-OPTION-REMAINING:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionEntry
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-context-set-summary
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-context-set-translate-func
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-context-free
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-context-set-translate-func
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-context-set-summary
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-context-set-translate-func
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-context-set-description
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gpointer
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-group-set-translate-func
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GTranslateFunc
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gpointer
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Datasets.html#GDestroyNotify
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-context-set-summary
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-context-set-description
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GTranslateFunc
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gboolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gint
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Miscellaneous-Utility-Functions.html#g-set-prgname
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-context-set-help-enabled
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#TRUE:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#FALSE:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gboolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-context-parse
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#TRUE:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#FALSE:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gboolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-context-set-help-enabled
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#TRUE:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gboolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-context-parse
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#TRUE:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#FALSE:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gboolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-context-set-ignore-unknown-options
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#TRUE:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionArg
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#G-OPTION-ARG-INT:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#G-OPTION-ARG-NONE:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#G-OPTION-ARG-CALLBACK:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#G-OPTION-ARG-NONE:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#G-OPTION-ARG-CALLBACK:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#G-OPTION-ARG-CALLBACK:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionParseFunc
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#G-OPTION-ARG-STRING-ARRAY:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#G-OPTION-ARG-FILENAME-ARRAY:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#G-OPTION-REMAINING:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionGroup
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-context-add-main-entries
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-group-add-entries
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gint
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionFlags
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionArg
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionArg
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gpointer
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#G-OPTION-ARG-CALLBACK:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionArgFunc
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#G-OPTION-ARG-NONE:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gboolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#G-OPTION-ARG-STRING:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#G-OPTION-ARG-INT:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gint
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#G-OPTION-ARG-FILENAME:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#G-OPTION-ARG-STRING-ARRAY:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#G-OPTION-ARG-FILENAME-ARRAY:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#G-OPTION-ARG-DOUBLE:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gdouble
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-group-set-translation-domain
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-group-set-translation-domain
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionEntry
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionEntry
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionGroup
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionGroup
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-context-free
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionGroup
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionGroup
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-context-add-group
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionGroup
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionGroup
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gpointer
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Datasets.html#GDestroyNotify
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionGroup
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#G-OPTION-ARG-CALLBACK:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-group-free
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionGroup
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionGroup
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionGroup
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionGroup
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionEntry
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionGroup
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionEntry
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gboolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionGroup
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gpointer
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionGroup
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-group-new
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#TRUE:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#FALSE:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#g-set-error
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionGroup
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionParseFunc
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionParseFunc
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-context-parse
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-group-new
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionGroup
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionGroup
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gpointer
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionContext
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionGroup
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-group-new
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionGroup
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionErrorFunc
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-context-parse
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-group-new
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionGroup
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionGroup
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GTranslateFunc
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gpointer
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Datasets.html#GDestroyNotify
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GTranslateFunc
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#g-option-group-set-translation-domain
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionGroup
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GTranslateFunc
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionGroup
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html#GOptionGroup
