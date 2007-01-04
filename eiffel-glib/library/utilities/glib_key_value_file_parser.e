   Link: GLib Reference Manual (start)
   Link: GLib Utilities (parent)
   Link: Simple XML Subset Parser (previous)
   Link: Bookmark file parser (next)
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

   Key-value file parser

   Key-value file parser -- parses .ini-like config files

Synopsis


 #include <glib.h>


             GKeyFile;
 #define     G_KEY_FILE_ERROR
 enum        GKeyFileError;
 enum        GKeyFileFlags;
 GKeyFile*   g_key_file_new                  (void);
 void        g_key_file_free                 (GKeyFile *key_file);
 void        g_key_file_set_list_separator   (GKeyFile *key_file,
                                              gchar separator);
 gboolean    g_key_file_load_from_file       (GKeyFile *key_file,
                                              const gchar *file,
                                              GKeyFileFlags flags,
                                              GError **error);
 gboolean    g_key_file_load_from_data       (GKeyFile *key_file,
                                              const gchar *data,
                                              gsize length,
                                              GKeyFileFlags flags,
                                              GError **error);
 gboolean    g_key_file_load_from_data_dirs  (GKeyFile *key_file,
                                              const gchar *file,
                                              gchar **full_path,
                                              GKeyFileFlags flags,
                                              GError **error);
 gchar*      g_key_file_to_data              (GKeyFile *key_file,
                                              gsize *length,
                                              GError **error);
 gchar*      g_key_file_get_start_group      (GKeyFile *key_file);
 gchar**     g_key_file_get_groups           (GKeyFile *key_file,
                                              gsize *length);
 gchar**     g_key_file_get_keys             (GKeyFile *key_file,
                                              const gchar *group_name,
                                              gsize *length,
                                              GError **error);
 gboolean    g_key_file_has_group            (GKeyFile *key_file,
                                              const gchar *group_name);
 gboolean    g_key_file_has_key              (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              GError **error);

 gchar*      g_key_file_get_value            (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              GError **error);
 gchar*      g_key_file_get_string           (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              GError **error);
 gchar*      g_key_file_get_locale_string    (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              const gchar *locale,
                                              GError **error);
 gboolean    g_key_file_get_boolean          (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              GError **error);
 gint        g_key_file_get_integer          (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              GError **error);
 gdouble     g_key_file_get_double           (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              GError **error);
 gchar**     g_key_file_get_string_list      (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              gsize *length,
                                              GError **error);
 gchar**     g_key_file_get_locale_string_list
                                             (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              const gchar *locale,
                                              gsize *length,
                                              GError **error);
 gboolean*   g_key_file_get_boolean_list     (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              gsize *length,
                                              GError **error);
 gint*       g_key_file_get_integer_list     (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              gsize *length,
                                              GError **error);
 gdouble*    g_key_file_get_double_list      (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              gsize *length,
                                              GError **error);
 gchar*      g_key_file_get_comment          (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              GError **error);

 void        g_key_file_set_value            (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              const gchar *value);
 void        g_key_file_set_string           (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              const gchar *string);
 void        g_key_file_set_locale_string    (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              const gchar *locale,
                                              const gchar *string);
 void        g_key_file_set_boolean          (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              gboolean value);
 void        g_key_file_set_integer          (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              gint value);
 void        g_key_file_set_double           (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              gdouble value);
 void        g_key_file_set_string_list      (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key);
 void        g_key_file_set_locale_string_list
                                             (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              const gchar *locale);
 void        g_key_file_set_boolean_list     (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              gboolean list[],
                                              gsize length);
 void        g_key_file_set_integer_list     (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              gint list[],
                                              gsize length);
 void        g_key_file_set_double_list      (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              gdouble list[],
                                              gsize length);
 void        g_key_file_set_comment          (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              const gchar *comment,
                                              GError **error);
 void        g_key_file_remove_group         (GKeyFile *key_file,
                                              const gchar *group_name,
                                              GError **error);
 void        g_key_file_remove_key           (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              GError **error);
 void        g_key_file_remove_comment       (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              GError **error);


Description

   GKeyFile lets you parse, edit or create files containing groups of key-value
   pairs, which we call key files for lack of a better name. Several freedesktop.org
   specifications use key files now, e.g the Desktop Entry Specification and the
   Icon Theme Specification.

   The syntax of key files is described in detail in the Desktop Entry
   Specification, here is a quick summary: Key files consists of groups of key-value
   pairs, interspersed with comments.

 # this is just an example
 # there can be comments before the first group

 [First Group]

 Name=Key File Example\tthis value shows\nescaping

 # localized strings are stored in multiple key-value pairs
 Welcome=Hello
 Welcome[de]=Hallo
 Welcome[fr]=Bonjour
 Welcome[it]=Ciao

 [Another Group]

 Numbers=2;20;-200;0

 Booleans=true;false;true;true


   Lines beginning with a '#' and blank lines are considered comments.

   Groups are started by a header line containing the group name enclosed in '[' and
   ']', and ended implicitly by the start of the next group or the end of the file.
   Each key-value pair must be contained in a group.

   Key-value pairs generally have the form key=value, with the exception of
   localized strings, which have the form key[locale]=value. Space before and after
   the '=' character are ignored. Newline, tab, carriage return and backslash
   characters are escaped as \n, \t, \r, and \\, respectively. To preserve initial
   and final spaces, these can also be escaped as \s.

   Key files can store strings (possibly with localized variants), integers,
   booleans and lists of these. Lists are separated by a separator character,
   typically ';' or ','. To use the list separator character in a value in a list,
   it has to be escaped by prefixing it with a backslash.

   This syntax is obviously inspired by the .ini files commonly met on Windows, but
   there are some important differences:

     o .ini files use the ';' character to begin comments, key files use the '#'
       character.

     o Key files allow only comments before the first group.

     o Key files are always encoded in UTF-8.

     o Key and Group names are case-sensitive, for example a group called [GROUP] is
       a different group from [group].

Details

  GKeyFile

 typedef struct _GKeyFile GKeyFile;

   The GKeyFile struct contains only private fields and should not be used directly.

   ---------------------------------------------------------------------------------

  G_KEY_FILE_ERROR

 #define G_KEY_FILE_ERROR g_key_file_error_quark()

   Error domain for key file parsing. Errors in this domain will be from the
   GKeyFileError enumeration. See GError for information on error domains.

   ---------------------------------------------------------------------------------

  enum GKeyFileError

 typedef enum
 {
   G_KEY_FILE_ERROR_UNKNOWN_ENCODING,
   G_KEY_FILE_ERROR_PARSE,
   G_KEY_FILE_ERROR_NOT_FOUND,
   G_KEY_FILE_ERROR_KEY_NOT_FOUND,
   G_KEY_FILE_ERROR_GROUP_NOT_FOUND,
   G_KEY_FILE_ERROR_INVALID_VALUE
 } GKeyFileError;

   Error codes returned by key file parsing.

   G_KEY_FILE_ERROR_UNKNOWN_ENCODING the text being parsed was in an unknown
                                     encoding
   G_KEY_FILE_ERROR_PARSE            document was ill-formed
   G_KEY_FILE_ERROR_NOT_FOUND        the file was not found
   G_KEY_FILE_ERROR_KEY_NOT_FOUND    a requested key was not found
   G_KEY_FILE_ERROR_GROUP_NOT_FOUND  a requested group was not found
   G_KEY_FILE_ERROR_INVALID_VALUE    a value could not be parsed

   ---------------------------------------------------------------------------------

  enum GKeyFileFlags

 typedef enum
 {
   G_KEY_FILE_NONE              = 0,
   G_KEY_FILE_KEEP_COMMENTS     = 1 << 0,
   G_KEY_FILE_KEEP_TRANSLATIONS = 1 << 1
 } GKeyFileFlags;

   Flags which influence the parsing.

   G_KEY_FILE_NONE              No flags, default behaviour
   G_KEY_FILE_KEEP_COMMENTS     Use this flag if you plan to write the (possibly
                                modified) contents of the key file back to a file;
                                otherwise all comments will be lost when the key
                                file is written back.
   G_KEY_FILE_KEEP_TRANSLATIONS Use this flag if you plan to write the (possibly
                                modified) contents of the key file back to a file;
                                otherwise only the translations for the current
                                language will be written back.

   ---------------------------------------------------------------------------------

  g_key_file_new ()

 GKeyFile*   g_key_file_new                  (void);

   Creates a new empty GKeyFile object. Use g_key_file_load_from_file(),
   g_key_file_load_from_data() or g_key_file_load_from_data_dirs() to read an
   existing key file.

   Returns : an empty GKeyFile.

   Since 2.6

   ---------------------------------------------------------------------------------

  g_key_file_free ()

 void        g_key_file_free                 (GKeyFile *key_file);

   Frees a GKeyFile.

   key_file : a GKeyFile

   Since 2.6

   ---------------------------------------------------------------------------------

  g_key_file_set_list_separator ()

 void        g_key_file_set_list_separator   (GKeyFile *key_file,
                                              gchar separator);

   Sets the character which is used to separate values in lists. Typically ';' or
   ',' are used as separators. The default list separator is ';'.

   key_file :  a GKeyFile
   separator : the separator

   Since 2.6

   ---------------------------------------------------------------------------------

  g_key_file_load_from_file ()

 gboolean    g_key_file_load_from_file       (GKeyFile *key_file,
                                              const gchar *file,
                                              GKeyFileFlags flags,
                                              GError **error);

   Loads a key file into an empty GKeyFile structure. If the file could not be
   loaded then error is set to either a GFileError or GKeyFileError.

   key_file : an empty GKeyFile struct
   file :     the path of a filename to load, in the GLib file name encoding
   flags :    flags from GKeyFileFlags
   error :    return location for a GError, or NULL
   Returns :  TRUE if a key file could be loaded, FALSE othewise

   Since 2.6

   ---------------------------------------------------------------------------------

  g_key_file_load_from_data ()

 gboolean    g_key_file_load_from_data       (GKeyFile *key_file,
                                              const gchar *data,
                                              gsize length,
                                              GKeyFileFlags flags,
                                              GError **error);

   Loads a key file from memory into an empty GKeyFile structure. If the object
   cannot be created then error is set to a GKeyFileError.

   key_file : an empty GKeyFile struct
   data :     key file loaded in memory.
   length :   the length of data in bytes
   flags :    flags from GKeyFileFlags
   error :    return location for a GError, or NULL
   Returns :  TRUE if a key file could be loaded, FALSE othewise

   Since 2.6

   ---------------------------------------------------------------------------------

  g_key_file_load_from_data_dirs ()

 gboolean    g_key_file_load_from_data_dirs  (GKeyFile *key_file,
                                              const gchar *file,
                                              gchar **full_path,
                                              GKeyFileFlags flags,
                                              GError **error);

   This function looks for a key file named file in the paths returned from
   g_get_user_data_dir() and g_get_system_data_dirs(), loads the file into key_file
   and returns the file's full path in full_path. If the file could not be loaded
   then an error is set to either a GFileError or GKeyFileError.

   key_file :  an empty GKeyFile struct
   file :      a relative path to a filename to open and parse
   full_path : return location for a string containing the full path of the file, or
               NULL
   flags :     flags from GKeyFileFlags
   error :     return location for a GError, or NULL
   Returns :   TRUE if a key file could be loaded, FALSE othewise

   Since 2.6

   ---------------------------------------------------------------------------------

  g_key_file_to_data ()

 gchar*      g_key_file_to_data              (GKeyFile *key_file,
                                              gsize *length,
                                              GError **error);

   This function outputs key_file as a string.

   key_file : a GKeyFile
   length :   return location for the length of the returned string, or NULL
   error :    return location for a GError, or NULL
   Returns :  a newly allocated string holding the contents of the GKeyFile

   Since 2.6

   ---------------------------------------------------------------------------------

  g_key_file_get_start_group ()

 gchar*      g_key_file_get_start_group      (GKeyFile *key_file);

   Returns the name of the start group of the file.

   key_file : a GKeyFile
   Returns :  The start group of the key file.

   Since 2.6

   ---------------------------------------------------------------------------------

  g_key_file_get_groups ()

 gchar**     g_key_file_get_groups           (GKeyFile *key_file,
                                              gsize *length);

   Returns all groups in the key file loaded with key_file. The array of returned
   groups will be NULL-terminated, so length may optionally be NULL.

   key_file : a GKeyFile
   length :   return location for the number of returned groups, or NULL
   Returns :  a newly-allocated NULL-terminated array of strings. Use g_strfreev()
              to free it.

   Since 2.6

   ---------------------------------------------------------------------------------

  g_key_file_get_keys ()

 gchar**     g_key_file_get_keys             (GKeyFile *key_file,
                                              const gchar *group_name,
                                              gsize *length,
                                              GError **error);

   Returns all keys for the group name group_name. The array of returned keys will
   be NULL-terminated, so length may optionally be NULL. In the event that the
   group_name cannot be found, NULL is returned and error is set to
   G_KEY_FILE_ERROR_GROUP_NOT_FOUND.

   key_file :   a GKeyFile
   group_name : a group name
   length :     return location for the number of keys returned, or NULL
   error :      return location for a GError, or NULL
   Returns :    a newly-allocated NULL-terminated array of strings. Use g_strfreev()
                to free it.

   Since 2.6

   ---------------------------------------------------------------------------------

  g_key_file_has_group ()

 gboolean    g_key_file_has_group            (GKeyFile *key_file,
                                              const gchar *group_name);

   Looks whether the key file has the group group_name.

   key_file :   a GKeyFile
   group_name : a group name
   Returns :    TRUE if group_name is a part of key_file, FALSE otherwise.

   Since 2.6

   ---------------------------------------------------------------------------------

  g_key_file_has_key ()

 gboolean    g_key_file_has_key              (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              GError **error);

   Looks whether the key file has the key key in the group group_name.

   key_file :   a GKeyFile
   group_name : a group name
   key :        a key name
   error :      return location for a GError
   Returns :    TRUE if key is a part of group_name, FALSE otherwise.

   Since 2.6

   ---------------------------------------------------------------------------------

  g_key_file_get_value ()

 gchar*      g_key_file_get_value            (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              GError **error);

   Returns the value associated with key under group_name.

   In the event the key cannot be found, NULL is returned and error is set to
   G_KEY_FILE_ERROR_KEY_NOT_FOUND. In the event that the group_name cannot be found,
   NULL is returned and error is set to G_KEY_FILE_ERROR_GROUP_NOT_FOUND.

   key_file :   a GKeyFile
   group_name : a group name
   key :        a key
   error :      return location for a GError, or NULL
   Returns :    a newly allocated string or NULL if the specified key cannot be
                found.

   Since 2.6

   ---------------------------------------------------------------------------------

  g_key_file_get_string ()

 gchar*      g_key_file_get_string           (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              GError **error);

   Returns the value associated with key under group_name.

   In the event the key cannot be found, NULL is returned and error is set to
   G_KEY_FILE_ERROR_KEY_NOT_FOUND. In the event that the group_name cannot be found,
   NULL is returned and error is set to G_KEY_FILE_ERROR_GROUP_NOT_FOUND.

   key_file :   a GKeyFile
   group_name : a group name
   key :        a key
   error :      return location for a GError, or NULL
   Returns :    a newly allocated string or NULL if the specified key cannot be
                found.

   Since 2.6

   ---------------------------------------------------------------------------------

  g_key_file_get_locale_string ()

 gchar*      g_key_file_get_locale_string    (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              const gchar *locale,
                                              GError **error);

   Returns the value associated with key under group_name translated in the given
   locale if available. If locale is NULL then the current locale is assumed.

   If key cannot be found then NULL is returned and error is set to
   G_KEY_FILE_ERROR_KEY_NOT_FOUND. If the value associated with key cannot be
   interpreted or no suitable translation can be found then the untranslated value
   is returned.

   key_file :   a GKeyFile
   group_name : a group name
   key :        a key
   locale :     a locale or NULL
   error :      return location for a GError, or NULL
   Returns :    a newly allocated string or NULL if the specified key cannot be
                found.

   Since 2.6

   ---------------------------------------------------------------------------------

  g_key_file_get_boolean ()

 gboolean    g_key_file_get_boolean          (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              GError **error);

   Returns the value associated with key under group_name as a boolean.

   If key cannot be found then the return value is undefined and error is set to
   G_KEY_FILE_ERROR_KEY_NOT_FOUND. Likewise, if the value associated with key cannot
   be interpreted as a boolean then the return value is also undefined and error is
   set to G_KEY_FILE_ERROR_INVALID_VALUE.

   key_file :   a GKeyFile
   group_name : a group name
   key :        a key
   error :      return location for a GError
   Returns :    the value associated with the key as a boolean

   Since 2.6

   ---------------------------------------------------------------------------------

  g_key_file_get_integer ()

 gint        g_key_file_get_integer          (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              GError **error);

   Returns the value associated with key under group_name as an integer. If
   group_name is NULL, the start_group is used.

   If key cannot be found then the return value is undefined and error is set to
   G_KEY_FILE_ERROR_KEY_NOT_FOUND. Likewise, if the value associated with key cannot
   be interpreted as an integer then the return value is also undefined and error is
   set to G_KEY_FILE_ERROR_INVALID_VALUE.

   key_file :   a GKeyFile
   group_name : a group name
   key :        a key
   error :      return location for a GError
   Returns :    the value associated with the key as an integer.

   Since 2.6

   ---------------------------------------------------------------------------------

  g_key_file_get_double ()

 gdouble     g_key_file_get_double           (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              GError **error);

   Returns the value associated with key under group_name as an integer. If
   group_name is NULL, the start_group is used.

   If key cannot be found then the return value is undefined and error is set to
   G_KEY_FILE_ERROR_KEY_NOT_FOUND. Likewise, if the value associated with key cannot
   be interpreted as a double then the return value is also undefined and error is
   set to G_KEY_FILE_ERROR_INVALID_VALUE.

   key_file :   a GKeyFile
   group_name : a group name
   key :        a key
   error :      return location for a GError
   Returns :    the value associated with the key as a double.

   Since 2.12

   ---------------------------------------------------------------------------------

  g_key_file_get_string_list ()

 gchar**     g_key_file_get_string_list      (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              gsize *length,
                                              GError **error);

   Returns the values associated with key under group_name.

   In the event the key cannot be found, NULL is returned and error is set to
   G_KEY_FILE_ERROR_KEY_NOT_FOUND. In the event that the group_name cannot be found,
   NULL is returned and error is set to G_KEY_FILE_ERROR_GROUP_NOT_FOUND.

   key_file :   a GKeyFile
   group_name : a group name
   key :        a key
   length :     return location for the number of returned strings, or NULL
   error :      return location for a GError, or NULL
   Returns :    a NULL-terminated string array or NULL if the specified key cannot
                be found. The array should be freed with g_strfreev().

   Since 2.6

   ---------------------------------------------------------------------------------

  g_key_file_get_locale_string_list ()

 gchar**     g_key_file_get_locale_string_list
                                             (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              const gchar *locale,
                                              gsize *length,
                                              GError **error);

   Returns the values associated with key under group_name translated in the given
   locale if available. If locale is NULL then the current locale is assumed.

   If key cannot be found then NULL is returned and error is set to
   G_KEY_FILE_ERROR_KEY_NOT_FOUND. If the values associated with key cannot be
   interpreted or no suitable translations can be found then the untranslated values
   are returned. The returned array is NULL-terminated, so length may optionally be
   NULL.

   key_file :   a GKeyFile
   group_name : a group name
   key :        a key
   locale :     a locale
   length :     return location for the number of returned strings or NULL
   error :      return location for a GError or NULL
   Returns :    a newly allocated NULL-terminated string array or NULL if the key
                isn't found. The string array should be freed with g_strfreev().

   Since 2.6

   ---------------------------------------------------------------------------------

  g_key_file_get_boolean_list ()

 gboolean*   g_key_file_get_boolean_list     (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              gsize *length,
                                              GError **error);

   Returns the values associated with key under group_name as booleans. If
   group_name is NULL, the start_group is used.

   If key cannot be found then the return value is undefined and error is set to
   G_KEY_FILE_ERROR_KEY_NOT_FOUND. Likewise, if the values associated with key
   cannot be interpreted as booleans then the return value is also undefined and
   error is set to G_KEY_FILE_ERROR_INVALID_VALUE.

   key_file :   a GKeyFile
   group_name : a group name
   key :        a key
   length :     the number of booleans returned
   error :      return location for a GError
   Returns :    the values associated with the key as a boolean

   Since 2.6

   ---------------------------------------------------------------------------------

  g_key_file_get_integer_list ()

 gint*       g_key_file_get_integer_list     (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              gsize *length,
                                              GError **error);

   Returns the values associated with key under group_name as integers.

   If key cannot be found then the return value is undefined and error is set to
   G_KEY_FILE_ERROR_KEY_NOT_FOUND. Likewise, if the values associated with key
   cannot be interpreted as integers then the return value is also undefined and
   error is set to G_KEY_FILE_ERROR_INVALID_VALUE.

   key_file :   a GKeyFile
   group_name : a group name
   key :        a key
   length :     the number of integers returned
   error :      return location for a GError
   Returns :    the values associated with the key as a integer

   Since 2.6

   ---------------------------------------------------------------------------------

  g_key_file_get_double_list ()

 gdouble*    g_key_file_get_double_list      (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              gsize *length,
                                              GError **error);

   Returns the values associated with key under group_name as doubles. If group_name
   is NULL, the start group is used.

   If key cannot be found then the return value is undefined and error is set to
   G_KEY_FILE_ERROR_KEY_NOT_FOUND. Likewise, if the values associated with key
   cannot be interpreted as doubles then the return value is also undefined and
   error is set to G_KEY_FILE_ERROR_INVALID_VALUE.

   key_file :   a GKeyFile
   group_name : a group name
   key :        a key
   length :     the number of doubles returned
   error :      return location for a GError
   Returns :    the values associated with the key as a double

   Since 2.12

   ---------------------------------------------------------------------------------

  g_key_file_get_comment ()

 gchar*      g_key_file_get_comment          (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              GError **error);

   Retrieves a comment above key from group_name. group_name. If key is NULL then
   comment will be read from above group_name. If both key and group_name are NULL,
   then comment will be read from above the first group in the file.

   key_file :   a GKeyFile
   group_name : a group name, or NULL
   key :        a key
   error :      return location for a GError
   Returns :    a comment that should be freed with g_free()

   Since 2.6

   ---------------------------------------------------------------------------------

  g_key_file_set_value ()

 void        g_key_file_set_value            (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              const gchar *value);

   Associates a new value with key under group_name. If key cannot be found then it
   is created. If group_name cannot be found then it is created.

   key_file :   a GKeyFile
   group_name : a group name
   key :        a key
   value :      a string

   Since 2.6

   ---------------------------------------------------------------------------------

  g_key_file_set_string ()

 void        g_key_file_set_string           (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              const gchar *string);

   Associates a new string value with key under group_name. If key cannot be found
   then it is created. If group_name cannot be found then it is created.

   key_file :   a GKeyFile
   group_name : a group name
   key :        a key
   string :     a string

   Since 2.6

   ---------------------------------------------------------------------------------

  g_key_file_set_locale_string ()

 void        g_key_file_set_locale_string    (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              const gchar *locale,
                                              const gchar *string);

   Associates a string value for key and locale under group_name. If the translation
   for key cannot be found then it is created.

   key_file :   a GKeyFile
   group_name : a group name
   key :        a key
   locale :     a locale
   string :     a string

   Since 2.6

   ---------------------------------------------------------------------------------

  g_key_file_set_boolean ()

 void        g_key_file_set_boolean          (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              gboolean value);

   Associates a new boolean value with key under group_name. If key cannot be found
   then it is created.

   key_file :   a GKeyFile
   group_name : a group name
   key :        a key
   value :      TRUE or FALSE

   Since 2.6

   ---------------------------------------------------------------------------------

  g_key_file_set_integer ()

 void        g_key_file_set_integer          (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              gint value);

   Associates a new integer value with key under group_name. If key cannot be found
   then it is created.

   key_file :   a GKeyFile
   group_name : a group name
   key :        a key
   value :      an integer value

   Since 2.6

   ---------------------------------------------------------------------------------

  g_key_file_set_double ()

 void        g_key_file_set_double           (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              gdouble value);

   Associates a new double value with key under group_name. If key cannot be found
   then it is created. If group_name is NULL, the start group is used.

   key_file :   a GKeyFile
   group_name : a group name
   key :        a key
   value :      an double value

   Since 2.12

   ---------------------------------------------------------------------------------

  g_key_file_set_string_list ()

 void        g_key_file_set_string_list      (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key);

   Associates a list of string values for key under group_name. If key cannot be
   found then it is created. If group_name cannot be found then it is created.

   key_file :   a GKeyFile
   group_name : a group name
   key :        a key

   Since 2.6

   ---------------------------------------------------------------------------------

  g_key_file_set_locale_string_list ()

 void        g_key_file_set_locale_string_list
                                             (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              const gchar *locale);

   Associates a list of string values for key and locale under group_name. If the
   translation for key cannot be found then it is created.

   key_file :   a GKeyFile
   group_name : a group name
   key :        a key
   locale :     a locale

   Since 2.6

   ---------------------------------------------------------------------------------

  g_key_file_set_boolean_list ()

 void        g_key_file_set_boolean_list     (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              gboolean list[],
                                              gsize length);

   Associates a list of boolean values with key under group_name. If key cannot be
   found then it is created. If group_name is NULL, the start_group is used.

   key_file :   a GKeyFile
   group_name : a group name
   key :        a key
   list :       an array of boolean values
   length :     length of list

   Since 2.6

   ---------------------------------------------------------------------------------

  g_key_file_set_integer_list ()

 void        g_key_file_set_integer_list     (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              gint list[],
                                              gsize length);

   Associates a list of integer values with key under group_name. If key cannot be
   found then it is created.

   key_file :   a GKeyFile
   group_name : a group name
   key :        a key
   list :       an array of integer values
   length :     number of integer values in list

   Since 2.6

   ---------------------------------------------------------------------------------

  g_key_file_set_double_list ()

 void        g_key_file_set_double_list      (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              gdouble list[],
                                              gsize length);

   Associates a list of double values with key under group_name. If key cannot be
   found then it is created. If group_name is NULL the start group is used.

   key_file :   a GKeyFile
   group_name : a group name
   key :        a key
   list :       an array of double values
   length :     number of double values in list

   Since 2.12

   ---------------------------------------------------------------------------------

  g_key_file_set_comment ()

 void        g_key_file_set_comment          (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              const gchar *comment,
                                              GError **error);

   Places a comment above key from group_name. group_name. If key is NULL then
   comment will be written above group_name. If both key and group_name are NULL,
   then comment will be written above the first group in the file.

   key_file :   a GKeyFile
   group_name : a group name, or NULL
   key :        a key
   comment :    a comment
   error :      return location for a GError

   Since 2.6

   ---------------------------------------------------------------------------------

  g_key_file_remove_group ()

 void        g_key_file_remove_group         (GKeyFile *key_file,
                                              const gchar *group_name,
                                              GError **error);

   Removes the specified group, group_name, from the key file.

   key_file :   a GKeyFile
   group_name : a group name
   error :      return location for a GError or NULL

   Since 2.6

   ---------------------------------------------------------------------------------

  g_key_file_remove_key ()

 void        g_key_file_remove_key           (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              GError **error);

   Removes key in group_name from the key file.

   key_file :   a GKeyFile
   group_name : a group name
   key :        a key name to remove
   error :      return location for a GError or NULL

   Since 2.6

   ---------------------------------------------------------------------------------

  g_key_file_remove_comment ()

 void        g_key_file_remove_comment       (GKeyFile *key_file,
                                              const gchar *group_name,
                                              const gchar *key,
                                              GError **error);

   Removes a comment above key from group_name. group_name. If key is NULL then
   comment will be written above group_name. If both key and group_name are NULL,
   then comment will be written above the first group in the file.

   key_file :   a GKeyFile
   group_name : a group name, or NULL
   key :        a key
   error :      return location for a GError

   Since 2.6

References

   Visible links
   . file:///usr/share/doc/libgtk2.0-doc/glib/index.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-utilities.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Simple-XML-Subset-Parser.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Bookmark-file-parser.html
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
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Simple-XML-Subset-Parser.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-utilities.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/index.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Bookmark-file-parser.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#id3075805
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#id3077619
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#G-KEY-FILE-ERROR:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFileError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFileFlags
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#g-key-file-new
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#g-key-file-free
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#g-key-file-set-list-separator
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gboolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#g-key-file-load-from-file
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFileFlags
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gboolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#g-key-file-load-from-data
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gsize
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFileFlags
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gboolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#g-key-file-load-from-data-dirs
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFileFlags
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#g-key-file-to-data
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gsize
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#g-key-file-get-start-group
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#g-key-file-get-groups
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gsize
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#g-key-file-get-keys
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gsize
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gboolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#g-key-file-has-group
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gboolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#g-key-file-has-key
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#g-key-file-get-value
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#g-key-file-get-string
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#g-key-file-get-locale-string
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gboolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#g-key-file-get-boolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gint
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#g-key-file-get-integer
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gdouble
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#g-key-file-get-double
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#g-key-file-get-string-list
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gsize
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#g-key-file-get-locale-string-list
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gsize
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gboolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#g-key-file-get-boolean-list
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gsize
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gint
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#g-key-file-get-integer-list
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gsize
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gdouble
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#g-key-file-get-double-list
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gsize
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#g-key-file-get-comment
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#g-key-file-set-value
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#g-key-file-set-string
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#g-key-file-set-locale-string
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#g-key-file-set-boolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gboolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#g-key-file-set-integer
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gint
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#g-key-file-set-double
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gdouble
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#g-key-file-set-string-list
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#g-key-file-set-locale-string-list
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#g-key-file-set-boolean-list
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gboolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gsize
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#g-key-file-set-integer-list
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gint
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gsize
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#g-key-file-set-double-list
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gdouble
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gsize
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#g-key-file-set-comment
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#g-key-file-remove-group
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#g-key-file-remove-key
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#g-key-file-remove-comment
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . http://freedesktop.org/Standards/desktop-entry-spec
   . http://freedesktop.org/Standards/icon-theme-spec
   . http://freedesktop.org/Standards/desktop-entry-spec
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFileError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#g-key-file-load-from-file
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#g-key-file-load-from-data
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#g-key-file-load-from-data-dirs
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gboolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFileFlags
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-File-Utilities.html#GFileError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFileError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFileFlags
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#TRUE:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#FALSE:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gboolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gsize
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFileFlags
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFileError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFileFlags
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#TRUE:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#FALSE:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gboolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFileFlags
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Miscellaneous-Utility-Functions.html#g-get-user-data-dir
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Miscellaneous-Utility-Functions.html#g-get-system-data-dirs
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-File-Utilities.html#GFileError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFileError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFileFlags
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#TRUE:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#FALSE:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gsize
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gsize
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-String-Utility-Functions.html#g-strfreev
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gsize
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#G-KEY-FILE-ERROR-GROUP-NOT-FOUND:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-String-Utility-Functions.html#g-strfreev
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gboolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#TRUE:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#FALSE:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gboolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#TRUE:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#FALSE:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#G-KEY-FILE-ERROR-KEY-NOT-FOUND:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#G-KEY-FILE-ERROR-GROUP-NOT-FOUND:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#G-KEY-FILE-ERROR-KEY-NOT-FOUND:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#G-KEY-FILE-ERROR-GROUP-NOT-FOUND:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#G-KEY-FILE-ERROR-KEY-NOT-FOUND:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gboolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#G-KEY-FILE-ERROR-KEY-NOT-FOUND:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#G-KEY-FILE-ERROR-INVALID-VALUE:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gint
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#G-KEY-FILE-ERROR-KEY-NOT-FOUND:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#G-KEY-FILE-ERROR-INVALID-VALUE:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gdouble
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#G-KEY-FILE-ERROR-KEY-NOT-FOUND:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#G-KEY-FILE-ERROR-INVALID-VALUE:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gsize
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#G-KEY-FILE-ERROR-KEY-NOT-FOUND:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#G-KEY-FILE-ERROR-GROUP-NOT-FOUND:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-String-Utility-Functions.html#g-strfreev
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gsize
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#G-KEY-FILE-ERROR-KEY-NOT-FOUND:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-String-Utility-Functions.html#g-strfreev
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gboolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gsize
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#G-KEY-FILE-ERROR-KEY-NOT-FOUND:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#G-KEY-FILE-ERROR-INVALID-VALUE:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gint
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gsize
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#G-KEY-FILE-ERROR-KEY-NOT-FOUND:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#G-KEY-FILE-ERROR-INVALID-VALUE:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gdouble
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gsize
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#G-KEY-FILE-ERROR-KEY-NOT-FOUND:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#G-KEY-FILE-ERROR-INVALID-VALUE:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Memory-Allocation.html#g-free
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gboolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#TRUE:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#FALSE:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gint
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gdouble
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gboolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gsize
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gint
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gsize
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gdouble
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gsize
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Key-value-file-parser.html#GKeyFile
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Error-Reporting.html#GError
