class GLIB_SIMPLE_XML_SUBSET_PARSER
--    Simple XML Subset Parser

--    Simple XML Subset Parser -- parses a subset of XML.

-- Synopsis


--  #include <glib.h>


--  enum        GMarkupError;
--  #define     G_MARKUP_ERROR
--  enum        GMarkupParseFlags;
--              GMarkupParseContext;
--              GMarkupParser;
--  gchar*      g_markup_escape_text            (const gchar *text,
--                                               gssize length);
--  gchar*      g_markup_printf_escaped         (const char *format,
--                                               ...);
--  gchar*      g_markup_vprintf_escaped        (const char *format,
--                                               va_list args);
--  gboolean    g_markup_parse_context_end_parse
--                                              (GMarkupParseContext *context,
--                                               GError **error);
--  void        g_markup_parse_context_free     (GMarkupParseContext *context);
--  void        g_markup_parse_context_get_position
--                                              (GMarkupParseContext *context,
--                                               gint *line_number,
--                                               gint *char_number);
--  const gchar* g_markup_parse_context_get_element
--                                              (GMarkupParseContext *context);
--  GMarkupParseContext* g_markup_parse_context_new
--                                              (const GMarkupParser *parser,
--                                               GMarkupParseFlags flags,
--                                               gpointer user_data,
--                                               GDestroyNotify user_data_dnotify);
--  gboolean    g_markup_parse_context_parse    (GMarkupParseContext *context,
--                                               const gchar *text,
--                                               gssize text_len,
--                                               GError **error);


-- Description

--    The "GMarkup" parser is intended to parse a simple markup format that's a subset
--    of XML. This is a small, efficient, easy-to-use parser. It should not be used if
--    you expect to interoperate with other applications generating full-scale XML.
--    However, it's very useful for application data files, config files, etc. where
--    you know your application will be the only one writing the file. Full-scale XML
--    parsers should be able to parse the subset used by GMarkup, so you can easily
--    migrate to full-scale XML at a later time if the need arises.

--    GMarkup is not guaranteed to signal an error on all invalid XML; the parser may
--    accept documents that an XML parser would not. However, XML documents which are
--    not well-formed^[4] are not considered valid GMarkup documents.

--    Simplifications to XML include:

--      o Only UTF-8 encoding is allowed.

--      o No user-defined entities.

--      o Processing instructions, comments and the doctype declaration are "passed
--        through" but are not interpreted in any way.

--      o No DTD or validation.

--    The markup format does support:

--      o Elements

--      o Attributes

--      o 5 standard entities: &amp; &lt; &gt; &quot; &apos;

--      o Character references

--      o Sections marked as CDATA

-- Details

--   enum GMarkupError

--  typedef enum
--  {
--    G_MARKUP_ERROR_BAD_UTF8,
--    G_MARKUP_ERROR_EMPTY,
--    G_MARKUP_ERROR_PARSE,
--    /* These three are primarily intended for specific GMarkupParser
--     * implementations to set.
--     */
--    G_MARKUP_ERROR_UNKNOWN_ELEMENT,
--    G_MARKUP_ERROR_UNKNOWN_ATTRIBUTE,
--    G_MARKUP_ERROR_INVALID_CONTENT
--  } GMarkupError;

--    Error codes returned by markup parsing.

--    G_MARKUP_ERROR_BAD_UTF8          text being parsed was not valid UTF-8
--    G_MARKUP_ERROR_EMPTY             document contained nothing, or only whitespace
--    G_MARKUP_ERROR_PARSE             document was ill-formed
--    G_MARKUP_ERROR_UNKNOWN_ELEMENT   error should be set by GMarkupParser functions;
--                                     element wasn't known
--    G_MARKUP_ERROR_UNKNOWN_ATTRIBUTE error should be set by GMarkupParser functions;
--                                     attribute wasn't known
--    G_MARKUP_ERROR_INVALID_CONTENT   error should be set by GMarkupParser functions;
--                                     something was wrong with contents of the
--                                     document, e.g. invalid attribute value

--    ---------------------------------------------------------------------------------

--   G_MARKUP_ERROR

--  #define G_MARKUP_ERROR g_markup_error_quark ()

--    Error domain for markup parsing. Errors in this domain will be from the
--    GMarkupError enumeration. See GError for information on error domains.

--    ---------------------------------------------------------------------------------

--   enum GMarkupParseFlags

--  typedef enum
--  {
--    G_MARKUP_DO_NOT_USE_THIS_UNSUPPORTED_FLAG = 1 << 0,
--    G_MARKUP_TREAT_CDATA_AS_TEXT              = 1 << 1
--  } GMarkupParseFlags;

--    Flags that affect the behaviour of the parser.

--    G_MARKUP_DO_NOT_USE_THIS_UNSUPPORTED_FLAG flag you should not use.
--    G_MARKUP_TREAT_CDATA_AS_TEXT              When this flag is set, CDATA marked
--                                              sections are not passed literally to
--                                              the passthrough function of the parser.
--                                              Instead, the content of the section
--                                              (without the <![CDATA[ and ]]>) is
--                                              passed to the text function. This flag
--                                              was added in GLib 2.12.

--    ---------------------------------------------------------------------------------

--   GMarkupParseContext

--  typedef struct _GMarkupParseContext GMarkupParseContext;

--    A parse context is used to parse a stream of bytes that you expect to contain
--    marked-up text. See g_markup_parse_context_new(), GMarkupParser, and so on for
--    more details.

--    ---------------------------------------------------------------------------------

--   GMarkupParser

--  typedef struct {
--    /* Called for open tags <foo bar="baz"> */
--    void (*start_element)  (GMarkupParseContext *context,
--                            const gchar         *element_name,
--                            const gchar        **attribute_names,
--                            const gchar        **attribute_values,
--                            gpointer             user_data,
--                            GError             **error);

--    /* Called for close tags </foo> */
--    void (*end_element)    (GMarkupParseContext *context,
--                            const gchar         *element_name,
--                            gpointer             user_data,
--                            GError             **error);

--    /* Called for character data */
--    /* text is not nul-terminated */
--    void (*text)           (GMarkupParseContext *context,
--                            const gchar         *text,
--                            gsize                text_len,
--                            gpointer             user_data,
--                            GError             **error);

--    /* Called for strings that should be re-saved verbatim in this same
--     * position, but are not otherwise interpretable.  At the moment
--     * this includes comments and processing instructions.
--     */
--    /* text is not nul-terminated. */
--    void (*passthrough)    (GMarkupParseContext *context,
--                            const gchar         *passthrough_text,
--                            gsize                text_len,
--                            gpointer             user_data,
--                            GError             **error);

--    /* Called on error, including one set by other
--     * methods in the vtable. The GError should not be freed.
--     */
--    void (*error)          (GMarkupParseContext *context,
--                            GError              *error,
--                            gpointer             user_data);
--  } GMarkupParser;

--    Any of the fields in GMarkupParser can be NULL, in which case they will be
--    ignored. Except for the error function, any of these callbacks can set an error;
--    in particular the G_MARKUP_ERROR_UNKNOWN_ELEMENT,
--    G_MARKUP_ERROR_UNKNOWN_ATTRIBUTE, and G_MARKUP_ERROR_INVALID_CONTENT errors are
--    intended to be set from these callbacks. If you set an error from a callback,
--    g_markup_parse_context_parse() will report that error back to its caller.

--    start_element () Callback to invoke when the opening tag of an element is seen.
--    end_element ()   Callback to invoke when the closing tag of an element is seen.
--                     Note that this is also called for empty tags like <empty/>.
--    text ()          Callback to invoke when some text is seen (text is always inside
--                     an element). Note that the text of an element may be spread over
--                     multiple calls of this function. If the
--                     G_MARKUP_TREAT_CDATA_AS_TEXT flag is set, this function is also
--                     called for the content of CDATA marked sections.
--    passthrough ()   Callback to invoke for comments, processing instructions and
--                     doctype declarations; if you're re-writing the parsed document,
--                     write the passthrough text back out in the same position. If the
--                     G_MARKUP_TREAT_CDATA_AS_TEXT flag is not set, this function is
--                     also called for CDATA marked sections.
--    error ()         Callback to invoke when an error occurs.

--    ---------------------------------------------------------------------------------

--   g_markup_escape_text ()

--  gchar*      g_markup_escape_text            (const gchar *text,
--                                               gssize length);

--    Escapes text so that the markup parser will parse it verbatim. Less than, greater
--    than, ampersand, etc. are replaced with the corresponding entities. This function
--    would typically be used when writing out a file to be parsed with the markup
--    parser.

--    Note that this function doesn't protect whitespace and line endings from being
--    processed according to the XML rules for normalization of line endings and
--    attribute values.

--    text :    some valid UTF-8 text
--    length :  length of text in bytes, or -1 if the text is nul-terminated
--    Returns : a newly allocated string with the escaped text

--    ---------------------------------------------------------------------------------

--   g_markup_printf_escaped ()

--  gchar*      g_markup_printf_escaped         (const char *format,
--                                               ...);

--    Formats arguments according to format, escaping all string and character
--    arguments in the fashion of g_markup_escape_text(). This is useful when you want
--    to insert literal strings into XML-style markup output, without having to worry
--    that the strings might themselves contain markup.

--  const char *store = "Fortnum & Mason";
--  const char *item = "Tea";
--  char *output;

--  output = g_markup_printf_escaped ("<purchase>"
--                                    "<store>%s</store>"
--                                    "<item>%s</item>"
--                                    "</purchase>",
--                                    store, item);

--    format :  printf() style format string
--    ... :     the arguments to insert in the format string
--    Returns : newly allocated result from formatting operation. Free with g_free().

--    Since 2.4

--    ---------------------------------------------------------------------------------

--   g_markup_vprintf_escaped ()

--  gchar*      g_markup_vprintf_escaped        (const char *format,
--                                               va_list args);

--    Formats the data in args according to format, escaping all string and character
--    arguments in the fashion of g_markup_escape_text(). See
--    g_markup_printf_escaped().

--    format :  printf() style format string
--    args :    variable argument list, similar to vprintf()
--    Returns : newly allocated result from formatting operation. Free with g_free().

--    Since 2.4

--    ---------------------------------------------------------------------------------

--   g_markup_parse_context_end_parse ()

--  gboolean    g_markup_parse_context_end_parse
--                                              (GMarkupParseContext *context,
--                                               GError **error);

--    Signals to the GMarkupParseContext that all data has been fed into the parse
--    context with g_markup_parse_context_parse(). This function reports an error if
--    the document isn't complete, for example if elements are still open.

--    context : a GMarkupParseContext
--    error :   return location for a GError
--    Returns : TRUE on success, FALSE if an error was set

--    ---------------------------------------------------------------------------------

--   g_markup_parse_context_free ()

--  void        g_markup_parse_context_free     (GMarkupParseContext *context);

--    Frees a GMarkupParseContext. Can't be called from inside one of the GMarkupParser
--    functions.

--    context : a GMarkupParseContext

--    ---------------------------------------------------------------------------------

--   g_markup_parse_context_get_position ()

--  void        g_markup_parse_context_get_position
--                                              (GMarkupParseContext *context,
--                                               gint *line_number,
--                                               gint *char_number);

--    Retrieves the current line number and the number of the character on that line.
--    Intended for use in error messages; there are no strict semantics for what
--    constitutes the "current" line number other than "the best number we could come
--    up with for error messages."

--    context :     a GMarkupParseContext
--    line_number : return location for a line number, or NULL
--    char_number : return location for a char-on-line number, or NULL

--    ---------------------------------------------------------------------------------

--   g_markup_parse_context_get_element ()

--  const gchar* g_markup_parse_context_get_element
--                                              (GMarkupParseContext *context);

--    Retrieves the name of the currently open element.

--    context : a GMarkupParseContext
--    Returns : the name of the currently open element, or NULL

--    Since 2.2

--    ---------------------------------------------------------------------------------

--   g_markup_parse_context_new ()

--  GMarkupParseContext* g_markup_parse_context_new
--                                              (const GMarkupParser *parser,
--                                               GMarkupParseFlags flags,
--                                               gpointer user_data,
--                                               GDestroyNotify user_data_dnotify);

--    Creates a new parse context. A parse context is used to parse marked-up
--    documents. You can feed any number of documents into a context, as long as no
--    errors occur; once an error occurs, the parse context can't continue to parse
--    text (you have to free it and create a new parse context).

--    parser :            a GMarkupParser
--    flags :             one or more GMarkupParseFlags
--    user_data :         user data to pass to GMarkupParser functions
--    user_data_dnotify : user data destroy notifier called when the parse context is
--                        freed
--    Returns :           a new GMarkupParseContext

--    ---------------------------------------------------------------------------------

--   g_markup_parse_context_parse ()

--  gboolean    g_markup_parse_context_parse    (GMarkupParseContext *context,
--                                               const gchar *text,
--                                               gssize text_len,
--                                               GError **error);

--    Feed some data to the GMarkupParseContext. The data need not be valid UTF-8; an
--    error will be signaled if it's invalid. The data need not be an entire document;
--    you can feed a document into the parser incrementally, via multiple calls to this
--    function. Typically, as you receive data from a network connection or file, you
--    feed each received chunk of data into this function, aborting the process if an
--    error occurs. Once an error is reported, no further data may be fed to the
--    GMarkupParseContext; all errors are fatal.

--    context :  a GMarkupParseContext
--    text :     chunk of text to parse
--    text_len : length of text in bytes
--    error :    return location for a GError
--    Returns :  FALSE if an error occurred, TRUE on success

--    --------------

--    ^[4] XML specification

end -- class GLIB_SIMPLE_XML_SUBSET_PARSER 
