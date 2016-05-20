deferred class GLIB_BOOKMARK_FILE_PARSER
   -- Bookmark file parser

--    Bookmark file parser -- parses files containing bookmarks

-- Synopsis


--  #include <glib.h>


--              GBookmarkFile;
--  #define     G_BOOKMARK_FILE_ERROR
--  enum        GBookmarkFileError;
--  GBookmarkFile* g_bookmark_file_new          (void);
--  void        g_bookmark_file_free            (GBookmarkFile *bookmark);
--  gboolean    g_bookmark_file_load_from_file  (GBookmarkFile *bookmark,
--                                               const gchar *filename,
--                                               GError **error);
--  gboolean    g_bookmark_file_load_from_data  (GBookmarkFile *bookmark,
--                                               const gchar *data,
--                                               gsize length,
--                                               GError **error);
--  gboolean    g_bookmark_file_load_from_data_dirs
--                                              (GBookmarkFile *bookmark,
--                                               const gchar *file,
--                                               gchar **full_path,
--                                               GError **error);
--  gchar*      g_bookmark_file_to_data         (GBookmarkFile *bookmark,
--                                               gsize *length,
--                                               GError **error);
--  gboolean    g_bookmark_file_to_file         (GBookmarkFile *bookmark,
--                                               const gchar *filename,
--                                               GError **error);
--  gboolean    g_bookmark_file_has_item        (GBookmarkFile *bookmark,
--                                               const gchar *uri);
--  gboolean    g_bookmark_file_has_group       (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               const gchar *group,
--                                               GError **error);
--  gboolean    g_bookmark_file_has_application (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               const gchar *name,
--                                               GError **error);
--  gint        g_bookmark_file_get_size        (GBookmarkFile *bookmark);
--  gchar**     g_bookmark_file_get_uris        (GBookmarkFile *bookmark,
--                                               gsize *length);

--  gchar*      g_bookmark_file_get_title       (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               GError **error);
--  gchar*      g_bookmark_file_get_description (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               GError **error);
--  gchar*      g_bookmark_file_get_mime_type   (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               GError **error);
--  gboolean    g_bookmark_file_get_is_private  (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               GError **error);
--  gboolean    g_bookmark_file_get_icon        (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               gchar **href,
--                                               gchar **mime_type,
--                                               GError **error);
--  time_t      g_bookmark_file_get_added       (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               GError **error);
--  time_t      g_bookmark_file_get_modified    (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               GError **error);
--  time_t      g_bookmark_file_get_visited     (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               GError **error);
--  gchar**     g_bookmark_file_get_groups      (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               gsize *length,
--                                               GError **error);
--  gchar**     g_bookmark_file_get_applications
--                                              (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               gsize *length,
--                                               GError **error);
--  gboolean    g_bookmark_file_get_app_info    (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               const gchar *name,
--                                               gchar **exec,
--                                               guint *count,
--                                               time_t *stamp,
--                                               GError **error);

--  void        g_bookmark_file_set_title       (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               const gchar *title);
--  void        g_bookmark_file_set_description (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               const gchar *description);
--  void        g_bookmark_file_set_mime_type   (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               const gchar *mime_type);
--  void        g_bookmark_file_set_is_private  (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               gboolean is_private);
--  void        g_bookmark_file_set_icon        (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               const gchar *href,
--                                               const gchar *mime_type);
--  void        g_bookmark_file_set_added       (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               time_t added);
--  void        g_bookmark_file_set_groups      (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               const gchar **groups,
--                                               gsize length);
--  void        g_bookmark_file_set_modified    (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               time_t modified);
--  void        g_bookmark_file_set_visited     (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               time_t visited);
--  gboolean    g_bookmark_file_set_app_info    (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               const gchar *name,
--                                               const gchar *exec,
--                                               gint count,
--                                               time_t stamp,
--                                               GError **error);
--  void        g_bookmark_file_add_group       (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               const gchar *group);
--  void        g_bookmark_file_add_application (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               const gchar *name,
--                                               const gchar *exec);
--  gboolean    g_bookmark_file_remove_group    (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               const gchar *group,
--                                               GError **error);
--  gboolean    g_bookmark_file_remove_application
--                                              (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               const gchar *name,
--                                               GError **error);
--  gboolean    g_bookmark_file_remove_item     (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               GError **error);
--  gboolean    g_bookmark_file_move_item       (GBookmarkFile *bookmark,
--                                               const gchar *old_uri,
--                                               const gchar *new_uri,
--                                               GError **error);


-- Description

--    GBookmarkFile lets you parse, edit or create files containing bookmarks to URI,
--    along with some meta-data about the resource pointed by the URI like its MIME
--    type, the application that is registering the bookmark and the icon that should
--    be used to represent the bookmark. The data is stored using the Desktop Bookmark
--    Specification.

--    The syntax of the bookmark files is described in detail inside the Desktop
--    Bookmark Specification, here is a quick summary: bookmark files use a sub-class
--    of the XML Bookmark Exchange Language specification, consisting of valid UTF-8
--    encoded XML, under the xbel root element; each bookmark is stored inside a
--    bookmark element, using its URI: no relative paths can be used inside a bookmark
--    file. The bookmark may have a user defined title and description, to be used
--    instead of the URI. Under the metadata element, with its owner attribute set to
--    http://freedesktop.org, is stored the meta-data about a resource pointed by its
--    URI. The meta-data consists of the resource's MIME type; the applications that
--    have registered a bookmark; the groups to which a bookmark belongs to; a
--    visibility flag, used to set the bookmark as "private" to the applications and
--    groups that has it registered; the URI and MIME type of an icon, to be used when
--    displaying the bookmark inside a GUI.


--  <?xml version="1.0"?>
--  <!DOCTYPE xbel PUBLIC
--    "+//IDN python.org//DTD XML Bookmark Exchange Language 1.0//EN//XML"
--    "http://www.python.org/topics/xml/dtds/xbel-1.0.dtd">
--  <xbel version="1.0"
--        xmlns:mime="http://www.freedesktop.org/standards/shared-mime-info"
--        xmlns:bookmark="http://www.freedesktop.org/standards/desktop-bookmarks">
--    <bookmark href="file:///home/ebassi/bookmark-spec/bookmark-spec.xml">
--      <title>Desktop Bookmarks Spec</title>
--      <info>
--        <metadata owner="http://freedesktop.org">
--          <mime:mime-type>text/xml</mime:mime-type>
--          <bookmark:applications>
--            <bookmark:application name="GEdit" count="2" exec="gedit <link linkend="u"><literal>u</literal></link>" timestamp="1115726763"/>
--            <bookmark:application name="GViM" count="7" exec="gvim <link linkend="f"><literal>f</literal></link>" timestamp="1115726812"/>
--          </bookmark:applications>
--          <bookmark:groups>
--            <bookmark:group>Editors</bookmark:group>
--          </bookmark:groups>
--        </metadata>
--      </info>
--    </bookmark>
--  </xbel>


--    A bookmark file might contain more than one bookmark; each bookmark is accessed
--    through its URI.

--    The important caveat of bookmark files is that when you add a new bookmark you
--    must also add the application that is registering it, using
--    g_bookmark_file_add_application() or g_bookmark_file_set_app_info(). If a
--    bookmark has no applications then it won't be dumped when creating the on disk
--    representation, using g_bookmark_file_to_data() or g_bookmark_file_to_file().

--    The GBookmarkFile parser was added in GLib 2.12.

-- Details

--   GBookmarkFile

--  typedef struct _GBookmarkFile GBookmarkFile;

--    The GBookmarkFile struct contains only private data and should not be used
--    directly.

--    ---------------------------------------------------------------------------------

--   G_BOOKMARK_FILE_ERROR

--  #define G_BOOKMARK_FILE_ERROR   (g_bookmark_file_error_quark ())

--    Error domain for bookmark file parsing. Errors in this domain will be from the
--    GBookmarkFileError enumeration. See GError for informations on error domains.

--    ---------------------------------------------------------------------------------

--   enum GBookmarkFileError

--  typedef enum
--  {
--    G_BOOKMARK_FILE_ERROR_INVALID_URI,
--    G_BOOKMARK_FILE_ERROR_INVALID_VALUE,
--    G_BOOKMARK_FILE_ERROR_APP_NOT_REGISTERED,
--    G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND,
--    G_BOOKMARK_FILE_ERROR_READ,
--    G_BOOKMARK_FILE_ERROR_UNKNOWN_ENCODING,
--    G_BOOKMARK_FILE_ERROR_WRITE,
--    G_BOOKMARK_FILE_ERROR_FILE_NOT_FOUND
--  } GBookmarkFileError;

--    Error codes returned by bookmark file parsing.

--    G_BOOKMARK_FILE_ERROR_INVALID_URI        URI was ill-formed
--    G_BOOKMARK_FILE_ERROR_INVALID_VALUE      a requested field was not found
--    G_BOOKMARK_FILE_ERROR_APP_NOT_REGISTERED a requested application did not register
--                                             a bookmark
--    G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND      a requested URI was not found
--    G_BOOKMARK_FILE_ERROR_READ               document was ill formed
--    G_BOOKMARK_FILE_ERROR_UNKNOWN_ENCODING   the text being parsed was in an unknown
--                                             encoding
--    G_BOOKMARK_FILE_ERROR_WRITE              an error occurred while writing
--    G_BOOKMARK_FILE_ERROR_FILE_NOT_FOUND     requested file was not found

--    ---------------------------------------------------------------------------------

--   g_bookmark_file_new ()

--  GBookmarkFile* g_bookmark_file_new          (void);

--    Creates a new empty GBookmarkFile object.

--    Use g_bookmark_file_load_from_file(), g_bookmark_file_load_from_data() or
--    g_bookmark_file_load_from_data_dirs() to read an existing bookmark file.

--    Returns : an empty GBookmarkFile

--    Since 2.12

--    ---------------------------------------------------------------------------------

--   g_bookmark_file_free ()

--  void        g_bookmark_file_free            (GBookmarkFile *bookmark);

--    Frees a GBookmarkFile.

--    bookmark : a GBookmarkFile

--    Since 2.12

--    ---------------------------------------------------------------------------------

--   g_bookmark_file_load_from_file ()

--  gboolean    g_bookmark_file_load_from_file  (GBookmarkFile *bookmark,
--                                               const gchar *filename,
--                                               GError **error);

--    Loads a desktop bookmark file into an empty GBookmarkFile structure. If the file
--    could not be loaded then error is set to either a GFileError or
--    GBookmarkFileError.

--    bookmark : an empty GBookmarkFile struct
--    filename : the path of a filename to load, in the GLib file name encoding
--    error :    return location for a GError, or NULL
--    Returns :  TRUE if a desktop bookmark file could be loaded

--    Since 2.12

--    ---------------------------------------------------------------------------------

--   g_bookmark_file_load_from_data ()

--  gboolean    g_bookmark_file_load_from_data  (GBookmarkFile *bookmark,
--                                               const gchar *data,
--                                               gsize length,
--                                               GError **error);

--    Loads a bookmark file from memory into an empty GBookmarkFile structure. If the
--    object cannot be created then error is set to a GBookmarkFileError.

--    bookmark : an empty GBookmarkFile struct
--    data :     desktop bookmarks loaded in memory
--    length :   the length of data in bytes
--    error :    return location for a GError, or NULL
--    Returns :  TRUE if a desktop bookmark could be loaded.

--    Since 2.12

--    ---------------------------------------------------------------------------------

--   g_bookmark_file_load_from_data_dirs ()

--  gboolean    g_bookmark_file_load_from_data_dirs
--                                              (GBookmarkFile *bookmark,
--                                               const gchar *file,
--                                               gchar **full_path,
--                                               GError **error);

--    This function looks for a desktop bookmark file named file in the paths returned
--    from g_get_user_data_dir() and g_get_system_data_dirs(), loads the file into
--    bookmark and returns the file's full path in full_path. If the file could not be
--    loaded then an error is set to either a GFileError or GBookmarkFileError.

--    bookmark :  a GBookmarkFile
--    file :      a relative path to a filename to open and parse
--    full_path : return location for a string containing the full path of the file, or
--                NULL
--    error :     return location for a GError, or NULL
--    Returns :   TRUE if a key file could be loaded, FALSE othewise

--    Since 2.12

--    ---------------------------------------------------------------------------------

--   g_bookmark_file_to_data ()

--  gchar*      g_bookmark_file_to_data         (GBookmarkFile *bookmark,
--                                               gsize *length,
--                                               GError **error);

--    This function outputs bookmark as a string.

--    bookmark : a GBookmarkFile
--    length :   return location for the length of the returned string, or NULL
--    error :    return location for a GError, or NULL
--    Returns :  a newly allocated string holding the contents of the GBookmarkFile

--    Since 2.12

--    ---------------------------------------------------------------------------------

--   g_bookmark_file_to_file ()

--  gboolean    g_bookmark_file_to_file         (GBookmarkFile *bookmark,
--                                               const gchar *filename,
--                                               GError **error);

--    This function outputs bookmark into a file. The write process is guaranteed to be
--    atomic by using g_file_set_contents() internally.

--    bookmark : a GBookmarkFile
--    filename : path of the output file
--    error :    return location for a GError, or NULL
--    Returns :  TRUE if the file was successfully written.

--    Since 2.12

--    ---------------------------------------------------------------------------------

--   g_bookmark_file_has_item ()

--  gboolean    g_bookmark_file_has_item        (GBookmarkFile *bookmark,
--                                               const gchar *uri);

--    Looks whether the desktop bookmark has an item with its URI set to uri.

--    bookmark : a GBookmarkFile
--    uri :      a valid URI
--    Returns :  TRUE if uri is inside bookmark, FALSE otherwise

--    Since 2.12

--    ---------------------------------------------------------------------------------

--   g_bookmark_file_has_group ()

--  gboolean    g_bookmark_file_has_group       (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               const gchar *group,
--                                               GError **error);

--    Checks whether group appears in the list of groups to which the bookmark for uri
--    belongs to.

--    In the event the URI cannot be found, FALSE is returned and error is set to
--    G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND.

--    bookmark : a GBookmarkFile
--    uri :      a valid URI
--    group :    the group name to be searched
--    error :    return location for a GError, or NULL
--    Returns :  TRUE if group was found.

--    Since 2.12

--    ---------------------------------------------------------------------------------

--   g_bookmark_file_has_application ()

--  gboolean    g_bookmark_file_has_application (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               const gchar *name,
--                                               GError **error);

--    Checks whether the bookmark for uri inside bookmark has been registered by
--    application name.

--    In the event the URI cannot be found, FALSE is returned and error is set to
--    G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND.

--    bookmark : a GBookmarkFile
--    uri :      a valid URI
--    name :     the name of the application
--    error :    return location for a GError or NULL
--    Returns :  TRUE if the application name was found

--    Since 2.12

--    ---------------------------------------------------------------------------------

--   g_bookmark_file_get_size ()

--  gint        g_bookmark_file_get_size        (GBookmarkFile *bookmark);

--    Gets the number of bookmarks inside bookmark.

--    bookmark : a GBookmarkFile
--    Returns :  the number of bookmarks

--    Since 2.12

--    ---------------------------------------------------------------------------------

--   g_bookmark_file_get_uris ()

--  gchar**     g_bookmark_file_get_uris        (GBookmarkFile *bookmark,
--                                               gsize *length);

--    Returns all URIs of the bookmarks in the bookmark file bookmark. The array of
--    returned URIs will be NULL-terminated, so length may optionally be NULL.

--    bookmark : a GBookmarkFile
--    length :   return location for the number of returned URIs, or NULL
--    Returns :  a newly allocated NULL-terminated array of strings. Use g_strfreev()
--               to free it.

--    Since 2.12

--    ---------------------------------------------------------------------------------

--   g_bookmark_file_get_title ()

--  gchar*      g_bookmark_file_get_title       (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               GError **error);

--    Returns the title of the bookmark for uri.

--    If uri is NULL, the title of bookmark is returned.

--    In the event the URI cannot be found, NULL is returned and error is set to
--    G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND.

--    bookmark : a GBookmarkFile
--    uri :      a valid URI or NULL
--    error :    return location for a GError, or NULL
--    Returns :  a newly allocated string or NULL if the specified URI cannot be found.

--    Since 2.12

--    ---------------------------------------------------------------------------------

--   g_bookmark_file_get_description ()

--  gchar*      g_bookmark_file_get_description (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               GError **error);

--    Retrieves the description of the bookmark for uri.

--    In the event the URI cannot be found, NULL is returned and error is set to
--    G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND.

--    bookmark : a GBookmarkFile
--    uri :      a valid URI
--    error :    return location for a GError, or NULL
--    Returns :  a newly allocated string or NULL if the specified URI cannot be found.

--    Since 2.12

--    ---------------------------------------------------------------------------------

--   g_bookmark_file_get_mime_type ()

--  gchar*      g_bookmark_file_get_mime_type   (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               GError **error);

--    Retrieves the MIME type of the resource pointed by uri.

--    In the event the URI cannot be found, NULL is returned and error is set to
--    G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND. In the event that the MIME type cannot be
--    found, NULL is returned and error is set to G_BOOKMARK_FILE_ERROR_INVALID_VALUE.

--    bookmark : a GBookmarkFile
--    uri :      a valid URI
--    error :    return location for a GError, or NULL
--    Returns :  a newly allocated string or NULL if the specified URI cannot be found.

--    Since 2.12

--    ---------------------------------------------------------------------------------

--   g_bookmark_file_get_is_private ()

--  gboolean    g_bookmark_file_get_is_private  (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               GError **error);

--    Gets whether the private flag of the bookmark for uri is set.

--    In the event the URI cannot be found, FALSE is returned and error is set to
--    G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND. In the event that the private flag cannot be
--    found, FALSE is returned and error is set to G_BOOKMARK_FILE_ERROR_INVALID_VALUE.

--    bookmark : a GBookmarkFile
--    uri :      a valid URI
--    error :    return location for a GError, or NULL
--    Returns :  TRUE if the private flag is set, FALSE otherwise.

--    Since 2.12

--    ---------------------------------------------------------------------------------

--   g_bookmark_file_get_icon ()

--  gboolean    g_bookmark_file_get_icon        (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               gchar **href,
--                                               gchar **mime_type,
--                                               GError **error);

--    Gets the icon of the bookmark for uri.

--    In the event the URI cannot be found, FALSE is returned and error is set to
--    G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND.

--    bookmark :  a GBookmarkFile
--    uri :       a valid URI
--    href :      return location for the icon's location or NULL
--    mime_type : return location for the icon's MIME type or NULL
--    error :     return location for a GError or NULL
--    Returns :   TRUE if the icon for the bookmark for the URI was found. You should
--                free the returned strings.

--    Since 2.12

--    ---------------------------------------------------------------------------------

--   g_bookmark_file_get_added ()

--  time_t      g_bookmark_file_get_added       (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               GError **error);

--    Gets the time the bookmark for uri was added to bookmark

--    In the event the URI cannot be found, -1 is returned and error is set to
--    G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND.

--    bookmark : a GBookmarkFile
--    uri :      a valid URI
--    error :    return location for a GError, or NULL
--    Returns :  a timestamp

--    Since 2.12

--    ---------------------------------------------------------------------------------

--   g_bookmark_file_get_modified ()

--  time_t      g_bookmark_file_get_modified    (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               GError **error);

--    Gets the time when the bookmark for uri was last modified.

--    In the event the URI cannot be found, -1 is returned and error is set to
--    G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND.

--    bookmark : a GBookmarkFile
--    uri :      a valid URI
--    error :    return location for a GError, or NULL
--    Returns :  a timestamp

--    Since 2.12

--    ---------------------------------------------------------------------------------

--   g_bookmark_file_get_visited ()

--  time_t      g_bookmark_file_get_visited     (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               GError **error);

--    Gets the time the bookmark for uri was last visited.

--    In the event the URI cannot be found, -1 is returned and error is set to
--    G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND.

--    bookmark : a GBookmarkFile
--    uri :      a valid URI
--    error :    return location for a GError, or NULL
--    Returns :  a timestamp.

--    Since 2.12

--    ---------------------------------------------------------------------------------

--   g_bookmark_file_get_groups ()

--  gchar**     g_bookmark_file_get_groups      (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               gsize *length,
--                                               GError **error);

--    Retrieves the list of group names of the bookmark for uri.

--    In the event the URI cannot be found, NULL is returned and error is set to
--    G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND.

--    The returned array is NULL terminated, so length may optionally be NULL.

--    bookmark : a GBookmarkFile
--    uri :      a valid URI
--    length :   return location for the length of the returned string, or NULL
--    error :    return location for a GError, or NULL
--    Returns :  a newly allocated NULL-terminated array of group names. Use
--               g_strfreev() to free it.

--    Since 2.12

--    ---------------------------------------------------------------------------------

--   g_bookmark_file_get_applications ()

--  gchar**     g_bookmark_file_get_applications
--                                              (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               gsize *length,
--                                               GError **error);

--    Retrieves the names of the applications that have registered the bookmark for
--    uri.

--    In the event the URI cannot be found, NULL is returned and error is set to
--    G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND.

--    bookmark : a GBookmarkFile
--    uri :      a valid URI
--    length :   return location of the length of the returned list, or NULL
--    error :    return location for a GError, or NULL
--    Returns :  a newly allocated NULL-terminated array of strings. Use g_strfreev()
--               to free it.

--    Since 2.12

--    ---------------------------------------------------------------------------------

--   g_bookmark_file_get_app_info ()

--  gboolean    g_bookmark_file_get_app_info    (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               const gchar *name,
--                                               gchar **exec,
--                                               guint *count,
--                                               time_t *stamp,
--                                               GError **error);

--    Gets the registration informations of app_name for the bookmark for uri. See
--    g_bookmark_file_set_app_info() for more informations about the returned data.

--    The string returned in app_exec must be freed.

--    In the event the URI cannot be found, FALSE is returned and error is set to
--    G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND. In the event that no application with name
--    app_name has registered a bookmark for uri, FALSE is returned and error is set to
--    G_BOOKMARK_FILE_ERROR_APP_NOT_REGISTERED.

--    bookmark : a GBookmarkFile
--    uri :      a valid URI
--    name :     an application's name
--    exec :     location for the command line of the application, or NULL
--    count :    return location for the registration count, or NULL
--    stamp :    return location for the last registration time, or NULL
--    error :    return location for a GError, or NULL
--    Returns :  TRUE on success.

--    Since 2.12

--    ---------------------------------------------------------------------------------

--   g_bookmark_file_set_title ()

--  void        g_bookmark_file_set_title       (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               const gchar *title);

--    Sets title as the title of the bookmark for uri inside the bookmark file
--    bookmark.

--    If uri is NULL, the title of bookmark is set.

--    If a bookmark for uri cannot be found then it is created.

--    bookmark : a GBookmarkFile
--    uri :      a valid URI or NULL
--    title :    a UTF-8 encoded string

--    Since 2.12

--    ---------------------------------------------------------------------------------

--   g_bookmark_file_set_description ()

--  void        g_bookmark_file_set_description (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               const gchar *description);

--    Sets description as the description of the bookmark for uri.

--    If uri is NULL, the description of bookmark is set.

--    If a bookmark for uri cannot be found then it is created.

--    bookmark :    a GBookmarkFile
--    uri :         a valid URI or NULL
--    description : a string

--    Since 2.12

--    ---------------------------------------------------------------------------------

--   g_bookmark_file_set_mime_type ()

--  void        g_bookmark_file_set_mime_type   (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               const gchar *mime_type);

--    Sets mime_type as the MIME type of the bookmark for uri.

--    If a bookmark for uri cannot be found then it is created.

--    bookmark :  a GBookmarkFile
--    uri :       a valid URI
--    mime_type : a MIME type

--    Since 2.12

--    ---------------------------------------------------------------------------------

--   g_bookmark_file_set_is_private ()

--  void        g_bookmark_file_set_is_private  (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               gboolean is_private);

--    Sets the private flag of the bookmark for uri.

--    If a bookmark for uri cannot be found then it is created.

--    bookmark :   a GBookmarkFile
--    uri :        a valid URI
--    is_private : TRUE if the bookmark should be marked as private

--    Since 2.12

--    ---------------------------------------------------------------------------------

--   g_bookmark_file_set_icon ()

--  void        g_bookmark_file_set_icon        (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               const gchar *href,
--                                               const gchar *mime_type);

--    Sets the icon for the bookmark for uri. If href is NULL, unsets the currently set
--    icon.

--    If no bookmark for uri is found it is created.

--    bookmark :  a GBookmarkFile
--    uri :       a valid URI
--    href :      the URI of the icon for the bookmark, or NULL
--    mime_type : the MIME type of the icon for the bookmark

--    Since 2.12

--    ---------------------------------------------------------------------------------

--   g_bookmark_file_set_added ()

--  void        g_bookmark_file_set_added       (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               time_t added);

--    Sets the time the bookmark for uri was added into bookmark.

--    If no bookmark for uri is found then it is created.

--    bookmark : a GBookmarkFile
--    uri :      a valid URI
--    added :    a timestamp or -1 to use the current time

--    Since 2.12

--    ---------------------------------------------------------------------------------

--   g_bookmark_file_set_groups ()

--  void        g_bookmark_file_set_groups      (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               const gchar **groups,
--                                               gsize length);

--    Sets a list of group names for the item with URI uri. Each previously set group
--    name list is removed.

--    If uri cannot be found then an item for it is created.

--    bookmark : a GBookmarkFile
--    uri :      an item's URI
--    groups :   an array of group names, or NULL to remove all groups
--    length :   number of group name values in groups

--    Since 2.12

--    ---------------------------------------------------------------------------------

--   g_bookmark_file_set_modified ()

--  void        g_bookmark_file_set_modified    (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               time_t modified);

--    Sets the last time the bookmark for uri was last modified.

--    If no bookmark for uri is found then it is created.

--    The "modified" time should only be set when the bookmark's meta-data was actually
--    changed. Every function of GBookmarkFile that modifies a bookmark also changes
--    the modification time, except for g_bookmark_file_set_visited().

--    bookmark : a GBookmarkFile
--    uri :      a valid URI
--    modified : a timestamp or -1 to use the current time

--    Since 2.12

--    ---------------------------------------------------------------------------------

--   g_bookmark_file_set_visited ()

--  void        g_bookmark_file_set_visited     (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               time_t visited);

--    Sets the time the bookmark for uri was last visited.

--    If no bookmark for uri is found then it is created.

--    The "visited" time should only be set if the bookmark was launched, either using
--    the command line retrieved by g_bookmark_file_get_app_info() or by the default
--    application for the bookmark's MIME type, retrieved using
--    g_bookmark_file_get_mime_type(). Changing the "visited" time does not affect the
--    "modified" time.

--    bookmark : a GBookmarkFile
--    uri :      a valid URI
--    visited :  a timestamp or -1 to use the current time

--    Since 2.12

--    ---------------------------------------------------------------------------------

--   g_bookmark_file_set_app_info ()

--  gboolean    g_bookmark_file_set_app_info    (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               const gchar *name,
--                                               const gchar *exec,
--                                               gint count,
--                                               time_t stamp,
--                                               GError **error);

--    Sets the meta-data of application name inside the list of applications that have
--    registered a bookmark for uri inside bookmark.

--    You should rarely use this function; use g_bookmark_file_add_application() and
--    g_bookmark_file_remove_application() instead.

--    name can be any UTF-8 encoded string used to identify an application. exec can
--    have one of these two modifiers: "f", which will be expanded as the local file
--    name retrieved from the bookmark's URI; "u", which will be expanded as the
--    bookmark's URI. The expansion is done automatically when retrieving the stored
--    command line using the g_bookmark_file_get_app_info() function. count is the
--    number of times the application has registered the bookmark; if is < 0, the
--    current registration count will be increased by one, if is 0, the application
--    with name will be removed from the list of registered applications. stamp is the
--    Unix time of the last registration; if it is -1, the current time will be used.

--    If you try to remove an application by setting its registration count to zero,
--    and no bookmark for uri is found, FALSE is returned and error is set to
--    G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND; similarly, in the event that no application
--    name has registered a bookmark for uri, FALSE is returned and error is set to
--    G_BOOKMARK_FILE_ERROR_APP_NOT_REGISTERED. Otherwise, if no bookmark for uri is
--    found, one is created.

--    bookmark : a GBookmarkFile
--    uri :      a valid URI
--    name :     an application's name
--    exec :     an application's command line
--    count :    the number of registrations done for this application
--    stamp :    the time of the last registration for this application
--    error :    return location for a GError or NULL
--    Returns :  TRUE if the application's meta-data was successfully changed.

--    Since 2.12

--    ---------------------------------------------------------------------------------

--   g_bookmark_file_add_group ()

--  void        g_bookmark_file_add_group       (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               const gchar *group);

--    Adds group to the list of groups to which the bookmark for uri belongs to.

--    If no bookmark for uri is found then it is created.

--    bookmark : a GBookmarkFile
--    uri :      a valid URI
--    group :    the group name to be added

--    Since 2.12

--    ---------------------------------------------------------------------------------

--   g_bookmark_file_add_application ()

--  void        g_bookmark_file_add_application (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               const gchar *name,
--                                               const gchar *exec);

--    Adds the application with name and exec to the list of applications that have
--    registered a bookmark for uri into bookmark.

--    Every bookmark inside a GBookmarkFile must have at least an application
--    registered. Each application must provide a name, a command line useful for
--    launching the bookmark, the number of times the bookmark has been registered by
--    the application and the last time the application registered this bookmark.

--    If name is NULL, the name of the application will be the same returned by
--    g_get_application(); if exec is NULL, the command line will be a composition of
--    the program name as returned by g_get_prgname() and the "u" modifier, which will
--    be expanded to the bookmark's URI.

--    This function will automatically take care of updating the registrations count
--    and timestamping in case an application with the same name had already registered
--    a bookmark for uri inside bookmark.

--    If no bookmark for uri is found, one is created.

--    bookmark : a GBookmarkFile
--    uri :      a valid URI
--    name :     the name of the application registering the bookmark or NULL
--    exec :     command line to be used to launch the bookmark or NULL

--    Since 2.12

--    ---------------------------------------------------------------------------------

--   g_bookmark_file_remove_group ()

--  gboolean    g_bookmark_file_remove_group    (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               const gchar *group,
--                                               GError **error);

--    Removes group from the list of groups to which the bookmark for uri belongs to.

--    In the event the URI cannot be found, FALSE is returned and error is set to
--    G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND. In the event no group was defined, FALSE is
--    returned and error is set to G_BOOKMARK_FILE_ERROR_INVALID_VALUE.

--    bookmark : a GBookmarkFile
--    uri :      a valid URI
--    group :    the group name to be removed
--    error :    return location for a GError, or NULL
--    Returns :  TRUE if group was successfully removed.

--    Since 2.12

--    ---------------------------------------------------------------------------------

--   g_bookmark_file_remove_application ()

--  gboolean    g_bookmark_file_remove_application
--                                              (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               const gchar *name,
--                                               GError **error);

--    Removes application registered with name from the list of applications that have
--    registered a bookmark for uri inside bookmark.

--    In the event the URI cannot be found, FALSE is returned and error is set to
--    G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND. In the event that no application with name
--    app_name has registered a bookmark for uri, FALSE is returned and error is set to
--    G_BOOKMARK_FILE_ERROR_APP_NOT_REGISTERED.

--    bookmark : a GBookmarkFile
--    uri :      a valid URI
--    name :     the name of the application
--    error :    return location for a GError or NULL
--    Returns :  TRUE if the application was successfully removed.

--    Since 2.12

--    ---------------------------------------------------------------------------------

--   g_bookmark_file_remove_item ()

--  gboolean    g_bookmark_file_remove_item     (GBookmarkFile *bookmark,
--                                               const gchar *uri,
--                                               GError **error);

--    Removes the bookmark for uri from the bookmark file bookmark.

--    bookmark : a GBookmarkFile
--    uri :      a valid URI
--    error :    return location for a GError, or NULL
--    Returns :  TRUE if the bookmark was removed successfully.

--    Since 2.12

--    ---------------------------------------------------------------------------------

--   g_bookmark_file_move_item ()

--  gboolean    g_bookmark_file_move_item       (GBookmarkFile *bookmark,
--                                               const gchar *old_uri,
--                                               const gchar *new_uri,
--                                               GError **error);

--    Changes the URI of a bookmark item from old_uri to new_uri. Any existing bookmark
--    for new_uri will be overwritten. If new_uri is NULL, then the bookmark is
--    removed.

--    In the event the URI cannot be found, FALSE is returned and error is set to
--    G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND.

--    bookmark : a GBookmarkFile
--    old_uri :  a valid URI
--    new_uri :  a valid URI, or NULL
--    error :    return location for a GError or NULL
--    Returns :  TRUE if the URI was successfully changed

--    Since 2.12
end -- class GLIB_BOOKMARK_FILE_PARSER
