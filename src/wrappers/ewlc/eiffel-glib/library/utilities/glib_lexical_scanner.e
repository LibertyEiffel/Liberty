deferred class GLIB_LEXICAL_SCANNER
--    Lexical Scanner

--    Lexical Scanner -- a general purpose lexical scanner.

-- Synopsis


--  #include <glib.h>


--              GScanner;
--  GScanner*   g_scanner_new                   (const GScannerConfig *config_templ);
--              GScannerConfig;

--  void        g_scanner_input_file            (GScanner *scanner,
--                                               gint input_fd);
--  void        g_scanner_sync_file_offset      (GScanner *scanner);
--  void        g_scanner_input_text            (GScanner *scanner,
--                                               const gchar *text,
--                                               guint text_len);
--  GTokenType  g_scanner_peek_next_token       (GScanner *scanner);
--  GTokenType  g_scanner_get_next_token        (GScanner *scanner);

--  guint       g_scanner_cur_line              (GScanner *scanner);
--  guint       g_scanner_cur_position          (GScanner *scanner);
--  GTokenType  g_scanner_cur_token             (GScanner *scanner);
--  GTokenValue g_scanner_cur_value             (GScanner *scanner);
--  gboolean    g_scanner_eof                   (GScanner *scanner);

--  guint       g_scanner_set_scope             (GScanner *scanner,
--                                               guint scope_id);
--  void        g_scanner_scope_add_symbol      (GScanner *scanner,
--                                               guint scope_id,
--                                               const gchar *symbol,
--                                               gpointer value);
--  void        g_scanner_scope_foreach_symbol  (GScanner *scanner,
--                                               guint scope_id,
--                                               GHFunc func,
--                                               gpointer user_data);
--  gpointer    g_scanner_scope_lookup_symbol   (GScanner *scanner,
--                                               guint scope_id,
--                                               const gchar *symbol);
--  void        g_scanner_scope_remove_symbol   (GScanner *scanner,
--                                               guint scope_id,
--                                               const gchar *symbol);

--  #define     g_scanner_freeze_symbol_table   (scanner)
--  #define     g_scanner_thaw_symbol_table     (scanner)
--  gpointer    g_scanner_lookup_symbol         (GScanner *scanner,
--                                               const gchar *symbol);

--  void        g_scanner_warn                  (GScanner *scanner,
--                                               const gchar *format,
--                                               ...);
--  void        g_scanner_error                 (GScanner *scanner,
--                                               const gchar *format,
--                                               ...);
--  void        g_scanner_unexp_token           (GScanner *scanner,
--                                               GTokenType expected_token,
--                                               const gchar *identifier_spec,
--                                               const gchar *symbol_spec,
--                                               const gchar *symbol_name,
--                                               const gchar *message,
--                                               gint is_error);
--  void        (*GScannerMsgFunc)              (GScanner *scanner,
--                                               gchar *message,
--                                               gboolean error);

--  void        g_scanner_destroy               (GScanner *scanner);

--  enum        GTokenType;
--  union       GTokenValue;
--  enum        GErrorType;
--  #define     G_CSET_a_2_z
--  #define     G_CSET_A_2_Z
--  #define     G_CSET_DIGITS
--  #define     G_CSET_LATINC
--  #define     G_CSET_LATINS

--  #define     g_scanner_add_symbol            ( scanner, symbol, value )
--  #define     g_scanner_remove_symbol         ( scanner, symbol )
--  #define     g_scanner_foreach_symbol        ( scanner, func, data )

-- Description

--    The GScanner and its associated functions provide a general purpose lexical
--    scanner.

-- Details

--   GScanner

--  typedef struct {
--    /* unused fields */
--    gpointer              user_data;
--    guint                 max_parse_errors;

--    /* g_scanner_error() increments this field */
--    guint                 parse_errors;

--    /* name of input stream, featured by the default message handler */
--    const gchar           *input_name;

--    /* quarked data */
--    GData                 *qdata;

--    /* link into the scanner configuration */
--    GScannerConfig        *config;

--    /* fields filled in after g_scanner_get_next_token() */
--    GTokenType            token;
--    GTokenValue           value;
--    guint                 line;
--    guint                 position;

--    /* fields filled in after g_scanner_peek_next_token() */
--    GTokenType            next_token;
--    GTokenValue           next_value;
--    guint                 next_line;
--    guint                 next_position;

--    /* to be considered private */
--    GHashTable            *symbol_table;
--    gint                  input_fd;
--    const gchar           *text;
--    const gchar           *text_end;
--    gchar                 *buffer;
--    guint                 scope_id;

--    /* handler function for _warn and _error */
--    GScannerMsgFunc       msg_handler;
--  } GScanner;

--    The data structure representing a lexical scanner.

--    You should set input_name after creating the scanner, since it is used by the
--    default message handler when displaying warnings and errors. If you are scanning
--    a file, the file name would be a good choice.

--    The user_data and max_parse_errors fields are not used. If you need to associate
--    extra data with the scanner you can place them here.

--    If you want to use your own message handler you can set the msg_handler field.
--    The type of the message handler function is declared by GScannerMsgFunc.

--    ---------------------------------------------------------------------------------

--   g_scanner_new ()

--  GScanner*   g_scanner_new                   (const GScannerConfig *config_templ);

--    Creates a new GScanner. The config_templ structure specifies the initial settings
--    of the scanner, which are copied into the GScanner config field. If you pass NULL
--    then the default settings are used.

--    config_templ : the initial scanner settings.
--    Returns :      the new GScanner.

--    ---------------------------------------------------------------------------------

--   GScannerConfig

--  typedef struct {
--    /* Character sets
--     */
--    gchar         *cset_skip_characters;          /* default: " \t\n" */
--    gchar         *cset_identifier_first;
--    gchar         *cset_identifier_nth;
--    gchar         *cpair_comment_single;          /* default: "#\n" */

--    /* Should symbol lookup work case sensitive?
--     */
--    guint         case_sensitive : 1;

--    /* Boolean values to be adjusted "on the fly"
--     * to configure scanning behaviour.
--     */
--    guint         skip_comment_multi : 1;         /* C like comment */
--    guint         skip_comment_single : 1;        /* single line comment */
--    guint         scan_comment_multi : 1;         /* scan multi line comments? */
--    guint         scan_identifier : 1;
--    guint         scan_identifier_1char : 1;
--    guint         scan_identifier_NULL : 1;
--    guint         scan_symbols : 1;
--    guint         scan_binary : 1;
--    guint         scan_octal : 1;
--    guint         scan_float : 1;
--    guint         scan_hex : 1;                   /* `0x0ff0' */
--    guint         scan_hex_dollar : 1;            /* `$0ff0' */
--    guint         scan_string_sq : 1;             /* string: 'anything' */
--    guint         scan_string_dq : 1;             /* string: "\\-escapes!\n" */
--    guint         numbers_2_int : 1;              /* bin, octal, hex => int */
--    guint         int_2_float : 1;                /* int => G_TOKEN_FLOAT? */
--    guint         identifier_2_string : 1;
--    guint         char_2_token : 1;               /* return G_TOKEN_CHAR? */
--    guint         symbol_2_token : 1;
--    guint         scope_0_fallback : 1;           /* try scope 0 on lookups? */
--    guint         store_int64 : 1;                /* use value.v_int64 rather than v_int */
--    guint         padding_dummy;
--  } GScannerConfig;

--    Specifies the GScanner settings.

--    cset_skip_characters specifies which characters should be skipped by the scanner
--    (the default is the whitespace characters: space, tab, carriage-return and
--    line-feed).

--    cset_identifier_first specifies the characters which can start identifiers (the
--    default is G_CSET_a_2_z, "_", and G_CSET_A_2_Z).

--    cset_identifier_nth specifies the characters which can be used in identifiers,
--    after the first character (the default is G_CSET_a_2_z, "_0123456789",
--    G_CSET_A_2_Z, G_CSET_LATINS, G_CSET_LATINC).

--    cpair_comment_single specifies the characters at the start and end of single-line
--    comments. The default is "#\n" which means that single-line comments start with a
--    '#' and continue until a '\n' (end of line).

--    case_sensitive specifies if symbols are case sensitive (the default is FALSE).

--    skip_comment_multi specifies if multi-line comments are skipped and not returned
--    as tokens (the default is TRUE).

--    skip_comment_single specifies if single-line comments are skipped and not
--    returned as tokens (the default is TRUE).

--    scan_comment_multi specifies if multi-line comments are recognized (the default
--    is TRUE).

--    scan_identifier specifies if identifiers are recognized (the default is TRUE).

--    scan_identifier_1char specifies if single-character identifiers are recognized
--    (the default is FALSE).

--    scan_identifier_NULL specifies if NULL is reported as G_TOKEN_IDENTIFIER_NULL.
--    (the default is FALSE).

--    scan_symbols specifies if symbols are recognized (the default is TRUE).

--    scan_binary specifies if binary numbers are recognized (the default is FALSE).

--    scan_octal specifies if octal numbers are recognized (the default is TRUE).

--    scan_float specifies if floating point numbers are recognized (the default is
--    TRUE).

--    scan_hex specifies if hexadecimal numbers are recognized (the default is TRUE).

--    scan_hex_dollar specifies if '$' is recognized as a prefix for hexadecimal
--    numbers (the default is FALSE).

--    scan_string_sq specifies if strings can be enclosed in single quotes (the default
--    is TRUE).

--    scan_string_dq specifies if strings can be enclosed in double quotes (the default
--    is TRUE).

--    numbers_2_int specifies if binary, octal and hexadecimal numbers are reported as
--    G_TOKEN_INT (the default is TRUE).

--    int_2_float specifies if all numbers are reported as G_TOKEN_FLOAT (the default
--    is FALSE).

--    identifier_2_string specifies if identifiers are reported as strings (the default
--    is FALSE).

--    char_2_token specifies if characters are reported by setting token = ch or as
--    G_TOKEN_CHAR (the default is TRUE).

--    symbol_2_token specifies if symbols are reported by setting token = v_symbol or
--    as G_TOKEN_SYMBOL (the default is FALSE).

--    scope_0_fallback specifies if a symbol is searched for in the default scope in
--    addition to the current scope (the default is FALSE).

--    ---------------------------------------------------------------------------------

--   g_scanner_input_file ()

--  void        g_scanner_input_file            (GScanner *scanner,
--                                               gint input_fd);

--    Prepares to scan a file.

--    scanner :  a GScanner.
--    input_fd : a file descriptor.

--    ---------------------------------------------------------------------------------

--   g_scanner_sync_file_offset ()

--  void        g_scanner_sync_file_offset      (GScanner *scanner);

--    Rewinds the filedescriptor to the current buffer position and blows the file read
--    ahead buffer. This is useful for third party uses of the scanners filedescriptor,
--    which hooks onto the current scanning position.

--    scanner : a GScanner.

--    ---------------------------------------------------------------------------------

--   g_scanner_input_text ()

--  void        g_scanner_input_text            (GScanner *scanner,
--                                               const gchar *text,
--                                               guint text_len);

--    Prepares to scan a text buffer.

--    scanner :  a GScanner.
--    text :     the text buffer to scan.
--    text_len : the length of the text buffer.

--    ---------------------------------------------------------------------------------

--   g_scanner_peek_next_token ()

--  GTokenType  g_scanner_peek_next_token       (GScanner *scanner);

--    Gets the next token, without removing it from the input stream. The token data is
--    placed in the next_token, next_value, next_line, and next_position fields of the
--    GScanner structure.

--    Note that, while the token is not removed from the input stream (i.e. the next
--    call to g_scanner_get_next_token() will return the same token), it will not be
--    reevaluated. This can lead to surprising results when changing scope after
--    peeking for the next token. Getting the next token after switching the scope will
--    return whatever was peeked before, regardless of any symbols that may have been
--    added or removed in the new scope.

--    scanner : a GScanner.
--    Returns : the type of the token.

--    ---------------------------------------------------------------------------------

--   g_scanner_get_next_token ()

--  GTokenType  g_scanner_get_next_token        (GScanner *scanner);

--    Gets the next token, removing it from the input stream. The token data is placed
--    in the token, value, line, and position fields of the GScanner structure.

--    scanner : a GScanner.
--    Returns : the type of the token.

--    ---------------------------------------------------------------------------------

--   g_scanner_cur_line ()

--  guint       g_scanner_cur_line              (GScanner *scanner);

--    Gets the current line in the input stream (counting from 1).

--    scanner : a GScanner.
--    Returns : the current line.

--    ---------------------------------------------------------------------------------

--   g_scanner_cur_position ()

--  guint       g_scanner_cur_position          (GScanner *scanner);

--    Gets the current position in the current line (counting from 0).

--    scanner : a GScanner.
--    Returns : the current position on the line.

--    ---------------------------------------------------------------------------------

--   g_scanner_cur_token ()

--  GTokenType  g_scanner_cur_token             (GScanner *scanner);

--    Gets the current token type. This is simply the token field in the GScanner
--    structure.

--    scanner : a GScanner.
--    Returns : the current token type.

--    ---------------------------------------------------------------------------------

--   g_scanner_cur_value ()

--  GTokenValue g_scanner_cur_value             (GScanner *scanner);

--    Gets the current token value. This is simply the value field in the GScanner
--    structure.

--    scanner : a GScanner.
--    Returns : the current token value.

--    ---------------------------------------------------------------------------------

--   g_scanner_eof ()

--  gboolean    g_scanner_eof                   (GScanner *scanner);

--    Returns TRUE if the scanner has reached the end of the file or text buffer.

--    scanner : a GScanner.
--    Returns : TRUE if the scanner has reached the end of the file or text buffer.

--    ---------------------------------------------------------------------------------

--   g_scanner_set_scope ()

--  guint       g_scanner_set_scope             (GScanner *scanner,
--                                               guint scope_id);

--    Sets the current scope.

--    scanner :  a GScanner.
--    scope_id : the new scope id.
--    Returns :  the old scope id.

--    ---------------------------------------------------------------------------------

--   g_scanner_scope_add_symbol ()

--  void        g_scanner_scope_add_symbol      (GScanner *scanner,
--                                               guint scope_id,
--                                               const gchar *symbol,
--                                               gpointer value);

--    Adds a symbol to the given scope.

--    scanner :  a GScanner.
--    scope_id : the scope id.
--    symbol :   the symbol to add.
--    value :    the value of the symbol.

--    ---------------------------------------------------------------------------------

--   g_scanner_scope_foreach_symbol ()

--  void        g_scanner_scope_foreach_symbol  (GScanner *scanner,
--                                               guint scope_id,
--                                               GHFunc func,
--                                               gpointer user_data);

--    Calls the given function for each of the symbol/value pairs in the given scope of
--    the GScanner. The function is passed the symbol and value of each pair, and the
--    given user_data parameter.

--    scanner :   a GScanner.
--    scope_id :  the scope id.
--    func :      the function to call for each symbol/value pair.
--    user_data : user data to pass to the function.

--    ---------------------------------------------------------------------------------

--   g_scanner_scope_lookup_symbol ()

--  gpointer    g_scanner_scope_lookup_symbol   (GScanner *scanner,
--                                               guint scope_id,
--                                               const gchar *symbol);

--    Looks up a symbol in a scope and return its value. If the symbol is not bound in
--    the scope, NULL is returned.

--    scanner :  a GScanner.
--    scope_id : the scope id.
--    symbol :   the symbol to look up.
--    Returns :  the value of symbol in the given scope, or NULL if symbol is not bound
--               in the given scope.

--    ---------------------------------------------------------------------------------

--   g_scanner_scope_remove_symbol ()

--  void        g_scanner_scope_remove_symbol   (GScanner *scanner,
--                                               guint scope_id,
--                                               const gchar *symbol);

--    Removes a symbol from a scope.

--    scanner :  a GScanner.
--    scope_id : the scope id.
--    symbol :   the symbol to remove.

--    ---------------------------------------------------------------------------------

--   g_scanner_freeze_symbol_table()

--  #define     g_scanner_freeze_symbol_table(scanner)

--   Warning

--    g_scanner_freeze_symbol_table has been deprecated since version 2.2 and should
--    not be used in newly-written code. This macro does nothing.

--    scanner : a GScanner.

--    ---------------------------------------------------------------------------------

--   g_scanner_thaw_symbol_table()

--  #define     g_scanner_thaw_symbol_table(scanner)

--   Warning

--    g_scanner_thaw_symbol_table has been deprecated since version 2.2 and should not
--    be used in newly-written code. This macro does nothing.

--    scanner : a GScanner.

--    ---------------------------------------------------------------------------------

--   g_scanner_lookup_symbol ()

--  gpointer    g_scanner_lookup_symbol         (GScanner *scanner,
--                                               const gchar *symbol);

--    Looks up a symbol in the current scope and return its value. If the symbol is not
--    bound in the current scope, NULL is returned.

--    scanner : a GScanner.
--    symbol :  the symbol to look up.
--    Returns : the value of symbol in the current scope, or NULL if symbol is not
--              bound in the current scope.

--    ---------------------------------------------------------------------------------

--   g_scanner_warn ()

--  void        g_scanner_warn                  (GScanner *scanner,
--                                               const gchar *format,
--                                               ...);

--    Outputs a warning message, via the GScanner message handler.

--    scanner : a GScanner.
--    format :  the message format. See the printf() documentation.
--    ... :     the parameters to insert into the format string.

--    ---------------------------------------------------------------------------------

--   g_scanner_error ()

--  void        g_scanner_error                 (GScanner *scanner,
--                                               const gchar *format,
--                                               ...);

--    Outputs an error message, via the GScanner message handler.

--    scanner : a GScanner.
--    format :  the message format. See the printf() documentation.
--    ... :     the parameters to insert into the format string.

--    ---------------------------------------------------------------------------------

--   g_scanner_unexp_token ()

--  void        g_scanner_unexp_token           (GScanner *scanner,
--                                               GTokenType expected_token,
--                                               const gchar *identifier_spec,
--                                               const gchar *symbol_spec,
--                                               const gchar *symbol_name,
--                                               const gchar *message,
--                                               gint is_error);

--    Outputs a message through the scanner's msg_handler, resulting from an unexpected
--    token in the input stream. Note that you should not call
--    g_scanner_peek_next_token() followed by g_scanner_unexp_token() without an
--    intermediate call to g_scanner_get_next_token(), as g_scanner_unexp_token()
--    evaluates the scanner's current token (not the peeked token) to construct part of
--    the message.

--    scanner :         a GScanner.
--    expected_token :  the expected token.
--    identifier_spec : a string describing how the scanner's user refers to
--                      identifiers (NULL defaults to "identifier"). This is used if
--                      expected_token is G_TOKEN_IDENTIFIER or
--                      G_TOKEN_IDENTIFIER_NULL.
--    symbol_spec :     a string describing how the scanner's user refers to symbols
--                      (NULL defaults to "symbol"). This is used if expected_token is
--                      G_TOKEN_SYMBOL or any token value greater than G_TOKEN_LAST.
--    symbol_name :     the name of the symbol, if the scanner's current token is a
--                      symbol.
--    message :         a message string to output at the end of the warning/error, or
--                      NULL.
--    is_error :        if TRUE it is output as an error. If FALSE it is output as a
--                      warning.

--    ---------------------------------------------------------------------------------

--   GScannerMsgFunc ()

--  void        (*GScannerMsgFunc)              (GScanner *scanner,
--                                               gchar *message,
--                                               gboolean error);

--    Specifies the type of the message handler function.

--    scanner : a GScanner.
--    message : the message.
--    error :   TRUE if the message signals an error, FALSE if it signals a warning.

--    ---------------------------------------------------------------------------------

--   g_scanner_destroy ()

--  void        g_scanner_destroy               (GScanner *scanner);

--    Frees all memory used by the GScanner.

--    scanner : a GScanner.

--    ---------------------------------------------------------------------------------

--   enum GTokenType

--  typedef enum
--  {
--    G_TOKEN_EOF                   =   0,

--    G_TOKEN_LEFT_PAREN            = '(',
--    G_TOKEN_RIGHT_PAREN           = ')',
--    G_TOKEN_LEFT_CURLY            = '{',
--    G_TOKEN_RIGHT_CURLY           = '}',
--    G_TOKEN_LEFT_BRACE            = '[',
--    G_TOKEN_RIGHT_BRACE           = ']',
--    G_TOKEN_EQUAL_SIGN            = '=',
--    G_TOKEN_COMMA                 = ',',

--    G_TOKEN_NONE                  = 256,

--    G_TOKEN_ERROR,

--    G_TOKEN_CHAR,
--    G_TOKEN_BINARY,
--    G_TOKEN_OCTAL,
--    G_TOKEN_INT,
--    G_TOKEN_HEX,
--    G_TOKEN_FLOAT,
--    G_TOKEN_STRING,

--    G_TOKEN_SYMBOL,
--    G_TOKEN_IDENTIFIER,
--    G_TOKEN_IDENTIFIER_NULL,

--    G_TOKEN_COMMENT_SINGLE,
--    G_TOKEN_COMMENT_MULTI,
--    G_TOKEN_LAST
--  } GTokenType;

--    The possible types of token returned from each g_scanner_get_next_token() call.

--    G_TOKEN_EOF         the end of the file.
--    G_TOKEN_LEFT_PAREN  a '(' character.
--    G_TOKEN_LEFT_CURLY  a '{' character.
--    G_TOKEN_RIGHT_CURLY a '}' character.

--    ---------------------------------------------------------------------------------

--   union GTokenValue

--  union GTokenValue
--  {
--    gpointer      v_symbol;
--    gchar         *v_identifier;
--    gulong        v_binary;
--    gulong        v_octal;
--    gulong        v_int;
--    guint64       v_int64;
--    gdouble       v_float;
--    gulong        v_hex;
--    gchar         *v_string;
--    gchar         *v_comment;
--    guchar        v_char;
--    guint         v_error;
--  };

--    A union holding the value of the token.

--    ---------------------------------------------------------------------------------

--   enum GErrorType

--  typedef enum
--  {
--    G_ERR_UNKNOWN,
--    G_ERR_UNEXP_EOF,
--    G_ERR_UNEXP_EOF_IN_STRING,
--    G_ERR_UNEXP_EOF_IN_COMMENT,
--    G_ERR_NON_DIGIT_IN_CONST,
--    G_ERR_DIGIT_RADIX,
--    G_ERR_FLOAT_RADIX,
--    G_ERR_FLOAT_MALFORMED
--  } GErrorType;

--    The possible errors, used in the v_error field of GTokenValue, when the token is
--    a G_TOKEN_ERROR.

--    G_ERR_UNKNOWN              unknown error.
--    G_ERR_UNEXP_EOF            unexpected end of file.
--    G_ERR_UNEXP_EOF_IN_STRING  unterminated string constant.
--    G_ERR_UNEXP_EOF_IN_COMMENT unterminated comment.
--    G_ERR_NON_DIGIT_IN_CONST   non-digit character in a number.
--    G_ERR_DIGIT_RADIX          digit beyond radix in a number.
--    G_ERR_FLOAT_RADIX          non-decimal floating point number.
--    G_ERR_FLOAT_MALFORMED      malformed floating point number.

--    ---------------------------------------------------------------------------------

--   G_CSET_a_2_z

--  #define G_CSET_a_2_z    "abcdefghijklmnopqrstuvwxyz"

--    The set of lowercase ASCII alphabet characters. Used for specifying valid
--    identifier characters in GScannerConfig.

--    ---------------------------------------------------------------------------------

--   G_CSET_A_2_Z

--  #define G_CSET_A_2_Z    "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

--    The set of uppercase ASCII alphabet characters. Used for specifying valid
--    identifier characters in GScannerConfig.

--    ---------------------------------------------------------------------------------

--   G_CSET_DIGITS

--  #define G_CSET_DIGITS   "0123456789"

--    The set of digits. Used for specifying valid identifier characters in
--    GScannerConfig.

--    ---------------------------------------------------------------------------------

--   G_CSET_LATINC

--  #define     G_CSET_LATINC

--    The set of uppercase ISO 8859-1 alphabet characters which are not ASCII
--    characters. Used for specifying valid identifier characters in GScannerConfig.

--    ---------------------------------------------------------------------------------

--   G_CSET_LATINS

--  #define     G_CSET_LATINS

--    The set of lowercase ISO 8859-1 alphabet characters which are not ASCII
--    characters. Used for specifying valid identifier characters in GScannerConfig.

--    ---------------------------------------------------------------------------------

--   g_scanner_add_symbol()

--  #define     g_scanner_add_symbol( scanner, symbol, value )

--   Warning

--    g_scanner_add_symbol has been deprecated since version 2.2 and should not be used
--    in newly-written code. Use g_scanner_scope_add_symbol() instead.

--    Adds a symbol to the default scope.

--    scanner : a GScanner.
--    symbol :  the symbol to add.
--    value :   the value of the symbol.

--    ---------------------------------------------------------------------------------

--   g_scanner_remove_symbol()

--  #define     g_scanner_remove_symbol( scanner, symbol )

--   Warning

--    g_scanner_remove_symbol has been deprecated since version 2.2 and should not be
--    used in newly-written code. Use g_scanner_scope_remove_symbol() instead.

--    Removes a symbol from the default scope.

--    scanner : a GScanner.
--    symbol :  the symbol to remove.

--    ---------------------------------------------------------------------------------

--   g_scanner_foreach_symbol()

--  #define     g_scanner_foreach_symbol( scanner, func, data )

--   Warning

--    g_scanner_foreach_symbol has been deprecated since version 2.2 and should not be
--    used in newly-written code. Use g_scanner_scope_foreach_symbol() instead.

--    Calls a function for each symbol in the default scope.

--    scanner : a GScanner.
--    func :    the function to call with each symbol.
--    data :    data to pass to the function.
end -- class GLIB_LEXICAL_SCANNER

