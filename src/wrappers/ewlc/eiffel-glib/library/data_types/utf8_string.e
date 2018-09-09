note
	description: "Unicode UTF-8 string."
	copyright: "[
					Copyright (C) 2006-2018: Paolo Redaelli, Glib team
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

class UTF8_STRING
	-- A string of Unicode characters encoded into UTF-8. This 
	-- particular encoding trades access efficiency foe space 
	-- efficiency: it uses a variable amount of memory to store each 
	-- character, from 8 to 32 bits, thus making traversal and 
	-- random-access costly; AFAIK random access is O(n) and 
	-- trasversal while being still an O(1) operation is much more 
	-- complex and costly than traversing a normal STRING.

	-- UNICODE_MANIPULATION

	-- A number of functions for dealing with Unicode characters and
	-- strings. There are analogues of the traditional C functions
	-- found in ctype.h character classification and case conversion
	-- functions, UTF-8 analogues of some string utility functions,
	-- functions to perform normalization, case conversion and
	-- collation on UTF-8 strings and finally functions to convert
	-- between the UTF-8, UTF-16 and UCS-4 encodings of Unicode.
	
	-- The implementations of the Unicode functions in GLib are based
	-- on the Unicode Character Data tables, which are available from
	-- www.unicode.org. GLib 2.8 supports Unicode 4.0, GLib 2.10
	-- supports Unicode 4.1, GLib 2.12 supports Unicode 5.0.

inherit
	ANY -- temporary 
	WRAPPER_HANDLER -- C_STRUCT

		-- TODO: make it a proper heir of COLLECTION[NATURAL] or ARRAY[NATURAL]

insert GLIB_UNICODE_MANIPULATION_EXTERNALS
	

--    ---------------------------------------------------------------------------------

--   g_unichar_digit_value ()

--  gint        g_unichar_digit_value           (gunichar c);

--    Determines the numeric value of a character as a decimal digit.

--    c :       a Unicode character
--    Returns : If c is a decimal digit (according to g_unichar_isdigit()), its numeric
--              value. Otherwise, -1.

--    ---------------------------------------------------------------------------------

--   g_unichar_xdigit_value ()

--  gint        g_unichar_xdigit_value          (gunichar c);

--    Determines the numeric value of a character as a hexidecimal digit.

--    c :       a Unicode character
--    Returns : If c is a hex digit (according to g_unichar_isxdigit()), its numeric
--              value. Otherwise, -1.

--    ---------------------------------------------------------------------------------

--   enum GUnicodeType

--  typedef enum
--  {
--    G_UNICODE_CONTROL,
--    G_UNICODE_FORMAT,
--    G_UNICODE_UNASSIGNED,
--    G_UNICODE_PRIVATE_USE,
--    G_UNICODE_SURROGATE,
--    G_UNICODE_LOWERCASE_LETTER,
--    G_UNICODE_MODIFIER_LETTER,
--    G_UNICODE_OTHER_LETTER,
--    G_UNICODE_TITLECASE_LETTER,
--    G_UNICODE_UPPERCASE_LETTER,
--    G_UNICODE_COMBINING_MARK,
--    G_UNICODE_ENCLOSING_MARK,
--    G_UNICODE_NON_SPACING_MARK,
--    G_UNICODE_DECIMAL_NUMBER,
--    G_UNICODE_LETTER_NUMBER,
--    G_UNICODE_OTHER_NUMBER,
--    G_UNICODE_CONNECT_PUNCTUATION,
--    G_UNICODE_DASH_PUNCTUATION,
--    G_UNICODE_CLOSE_PUNCTUATION,
--    G_UNICODE_FINAL_PUNCTUATION,
--    G_UNICODE_INITIAL_PUNCTUATION,
--    G_UNICODE_OTHER_PUNCTUATION,
--    G_UNICODE_OPEN_PUNCTUATION,
--    G_UNICODE_CURRENCY_SYMBOL,
--    G_UNICODE_MODIFIER_SYMBOL,
--    G_UNICODE_MATH_SYMBOL,
--    G_UNICODE_OTHER_SYMBOL,
--    G_UNICODE_LINE_SEPARATOR,
--    G_UNICODE_PARAGRAPH_SEPARATOR,
--    G_UNICODE_SPACE_SEPARATOR
--  } GUnicodeType;

--    These are the possible character classifications. See
--    http://www.unicode.org/Public/UNIDATA/UnicodeData.html.

--    ---------------------------------------------------------------------------------

--   g_unichar_type ()

--  GUnicodeType g_unichar_type                 (gunichar c);

--    Classifies a Unicode character by type.

--    c :       a Unicode character
--    Returns : the type of the character.

--    ---------------------------------------------------------------------------------

--   enum GUnicodeBreakType

--  typedef enum
--  {
--    G_UNICODE_BREAK_MANDATORY,
--    G_UNICODE_BREAK_CARRIAGE_RETURN,
--    G_UNICODE_BREAK_LINE_FEED,
--    G_UNICODE_BREAK_COMBINING_MARK,
--    G_UNICODE_BREAK_SURROGATE,
--    G_UNICODE_BREAK_ZERO_WIDTH_SPACE,
--    G_UNICODE_BREAK_INSEPARABLE,
--    G_UNICODE_BREAK_NON_BREAKING_GLUE,
--    G_UNICODE_BREAK_CONTINGENT,
--    G_UNICODE_BREAK_SPACE,
--    G_UNICODE_BREAK_AFTER,
--    G_UNICODE_BREAK_BEFORE,
--    G_UNICODE_BREAK_BEFORE_AND_AFTER,
--    G_UNICODE_BREAK_HYPHEN,
--    G_UNICODE_BREAK_NON_STARTER,
--    G_UNICODE_BREAK_OPEN_PUNCTUATION,
--    G_UNICODE_BREAK_CLOSE_PUNCTUATION,
--    G_UNICODE_BREAK_QUOTATION,
--    G_UNICODE_BREAK_EXCLAMATION,
--    G_UNICODE_BREAK_IDEOGRAPHIC,
--    G_UNICODE_BREAK_NUMERIC,
--    G_UNICODE_BREAK_INFIX_SEPARATOR,
--    G_UNICODE_BREAK_SYMBOL,
--    G_UNICODE_BREAK_ALPHABETIC,
--    G_UNICODE_BREAK_PREFIX,
--    G_UNICODE_BREAK_POSTFIX,
--    G_UNICODE_BREAK_COMPLEX_CONTEXT,
--    G_UNICODE_BREAK_AMBIGUOUS,
--    G_UNICODE_BREAK_UNKNOWN,
--    G_UNICODE_BREAK_NEXT_LINE,
--    G_UNICODE_BREAK_WORD_JOINER,
--    G_UNICODE_BREAK_HANGUL_L_JAMO,
--    G_UNICODE_BREAK_HANGUL_V_JAMO,
--    G_UNICODE_BREAK_HANGUL_T_JAMO,
--    G_UNICODE_BREAK_HANGUL_LV_SYLLABLE,
--    G_UNICODE_BREAK_HANGUL_LVT_SYLLABLE
--  } GUnicodeBreakType;

--    These are the possible line break classifications. The five Hangul types were
--    Added in Unicode 4.1, so, has been introduced in GLib 2.10. Note that new types
--    may be added in the future. Applications should be ready to handle unknown
--    values. They may be regarded as G_UNICODE_BREAK_UNKNOWN. See
--    http://www.unicode.org/unicode/reports/tr14/.

--    ---------------------------------------------------------------------------------

--   g_unichar_break_type ()

--  GUnicodeBreakType g_unichar_break_type      (gunichar c);

--    Determines the break type of c. c should be a Unicode character (to derive a
--    character from UTF-8 encoded text, use g_utf8_get_char()). The break type is used
--    to find word and line breaks ("text boundaries"), Pango implements the Unicode
--    boundary resolution algorithms and normally you would use a function such as
--    pango_break() instead of caring about break types yourself.

--    c :       a Unicode character
--    Returns : the break type of c

--    ---------------------------------------------------------------------------------

--   g_unicode_canonical_ordering ()

--  void        g_unicode_canonical_ordering    (gunichar *string,
--                                               gsize len);

--    Computes the canonical ordering of a string in-place. This rearranges decomposed
--    characters in the string according to their combining classes. See the Unicode
--    manual for more information.

--    string : a UCS-4 encoded string.
--    len :    the maximum length of string to use.

--    ---------------------------------------------------------------------------------

--   g_unicode_canonical_decomposition ()

--  gunichar*   g_unicode_canonical_decomposition
--                                              (gunichar ch,
--                                               gsize *result_len);

--    Computes the canonical decomposition of a Unicode character.

--    ch :         a Unicode character.
--    result_len : location to store the length of the return value.
--    Returns :    a newly allocated string of Unicode characters. result_len is set to
--                 the resulting length of the string.

--    ---------------------------------------------------------------------------------

--   g_unichar_get_mirror_char ()

--  gboolean    g_unichar_get_mirror_char       (gunichar ch,
--                                               gunichar *mirrored_ch);

--    In Unicode, some characters are mirrored. This means that their images are
--    mirrored horizontally in text that is laid out from right to left. For instance,
--    "(" would become its mirror image, ")", in right-to-left text.

--    If ch has the Unicode mirrored property and there is another unicode character
--    that typically has a glyph that is the mirror image of ch's glyph and mirrored_ch
--    is set, it puts that character in the address pointed to by mirrored_ch.
--    Otherwise the original character is put.

--    ch :          a Unicode character
--    mirrored_ch : location to store the mirrored character
--    Returns :     TRUE if ch has a mirrored character, FALSE otherwise

--    Since 2.4

--    ---------------------------------------------------------------------------------

--   g_utf8_next_char()

--  #define     g_utf8_next_char(p)

--    Skips to the next character in a UTF-8 string. The string must be valid; this
--    macro is as fast as possible, and has no error-checking. You would use this macro
--    to iterate over a string character by character. The macro returns the start of
--    the next UTF-8 character. Before using this macro, use g_utf8_validate() to
--    validate strings that may contain invalid UTF-8.

--    p : Pointer to the start of a valid UTF-8 character.

--    ---------------------------------------------------------------------------------

--   g_utf8_get_char ()

--  gunichar    g_utf8_get_char                 (const gchar *p);

--    Converts a sequence of bytes encoded as UTF-8 to a Unicode character. If p does
--    not point to a valid UTF-8 encoded character, results are undefined. If you are
--    not sure that the bytes are complete valid Unicode characters, you should use
--    g_utf8_get_char_validated() instead.

--    p :       a pointer to Unicode character encoded as UTF-8
--    Returns : the resulting character

--    ---------------------------------------------------------------------------------

--   g_utf8_get_char_validated ()

--  gunichar    g_utf8_get_char_validated       (const gchar *p,
--                                               gssize max_len);

--    Convert a sequence of bytes encoded as UTF-8 to a Unicode character. This
--    function checks for incomplete characters, for invalid characters such as
--    characters that are out of the range of Unicode, and for overlong encodings of
--    valid characters.

--    p :       a pointer to Unicode character encoded as UTF-8
--    max_len : the maximum number of bytes to read, or -1, for no maximum.
--    Returns : the resulting character. If p points to a partial sequence at the end
--              of a string that could begin a valid character, returns (gunichar)-2;
--              otherwise, if p does not point to a valid UTF-8 encoded Unicode
--              character, returns (gunichar)-1.

--    ---------------------------------------------------------------------------------

--   g_utf8_offset_to_pointer ()

--  gchar*      g_utf8_offset_to_pointer        (const gchar *str,
--                                               glong offset);

--    Converts from an integer character offset to a pointer to a position within the
--    string.

--    Since 2.10, this function allows to pass a negative offset to step backwards. It
--    is usually worth stepping backwards from the end instead of forwards if offset is
--    in the last fourth of the string, since moving forward is about 3 times faster
--    than moving backward.

--    str :     a UTF-8 encoded string
--    offset :  a character offset within str
--    Returns : the resulting pointer

--    ---------------------------------------------------------------------------------

--   g_utf8_pointer_to_offset ()

--  glong       g_utf8_pointer_to_offset        (const gchar *str,
--                                               const gchar *pos);

--    Converts from a pointer to position within a string to a integer character
--    offset.

--    Since 2.10, this function allows pos to be before str, and returns a negative
--    offset in this case.

--    str :     a UTF-8 encoded string
--    pos :     a pointer to a position within str
--    Returns : the resulting character offset

--    ---------------------------------------------------------------------------------

--   g_utf8_prev_char ()

--  gchar*      g_utf8_prev_char                (const gchar *p);

--    Finds the previous UTF-8 character in the string before p.

--    p does not have to be at the beginning of a UTF-8 character. No check is made to
--    see if the character found is actually valid other than it starts with an
--    appropriate byte. If p might be the first character of the string, you must use
--    g_utf8_find_prev_char() instead.

--    p :       a pointer to a position within a UTF-8 encoded string
--    Returns : a pointer to the found character.

--    ---------------------------------------------------------------------------------

--   g_utf8_find_next_char ()

--  gchar*      g_utf8_find_next_char           (const gchar *p,
--                                               const gchar *end);

--    Finds the start of the next UTF-8 character in the string after p.

--    p does not have to be at the beginning of a UTF-8 character. No check is made to
--    see if the character found is actually valid other than it starts with an
--    appropriate byte.

--    p :       a pointer to a position within a UTF-8 encoded string
--    end :     a pointer to the end of the string, or NULL to indicate that the string
--              is nul-terminated, in which case the returned value will be
--    Returns : a pointer to the found character or NULL

--    ---------------------------------------------------------------------------------

--   g_utf8_find_prev_char ()

--  gchar*      g_utf8_find_prev_char           (const gchar *str,
--                                               const gchar *p);

--    Given a position p with a UTF-8 encoded string str, find the start of the
--    previous UTF-8 character starting before p. Returns NULL if no UTF-8 characters
--    are present in str before p.

--    p does not have to be at the beginning of a UTF-8 character. No check is made to
--    see if the character found is actually valid other than it starts with an
--    appropriate byte.

--    str :     pointer to the beginning of a UTF-8 encoded string
--    p :       pointer to some position within str
--    Returns : a pointer to the found character or NULL.

--    ---------------------------------------------------------------------------------

--   g_utf8_strlen ()

--  glong       g_utf8_strlen                   (const gchar *p,
--                                               gssize max);

--    Returns the length of the string in characters.

--    p :       pointer to the start of a UTF-8 encoded string.
--    max :     the maximum number of bytes to examine. If max is less than 0, then the
--              string is assumed to be nul-terminated. If max is 0, p will not be
--              examined and may be NULL.
--    Returns : the length of the string in characters

--    ---------------------------------------------------------------------------------

--   g_utf8_strncpy ()

--  gchar*      g_utf8_strncpy                  (gchar *dest,
--                                               const gchar *src,
--                                               gsize n);

--    Like the standard C strncpy() function, but copies a given number of characters
--    instead of a given number of bytes. The src string must be valid UTF-8 encoded
--    text. (Use g_utf8_validate() on all text before trying to use UTF-8 utility
--    functions with it.)

--    dest :    buffer to fill with characters from src
--    src :     UTF-8 encoded string
--    n :       character count
--    Returns : dest

--    ---------------------------------------------------------------------------------

--   g_utf8_strchr ()

--  gchar*      g_utf8_strchr                   (const gchar *p,
--                                               gssize len,
--                                               gunichar c);

--    Finds the leftmost occurrence of the given Unicode character in a UTF-8 encoded
--    string, while limiting the search to len bytes. If len is -1, allow unbounded
--    search.

--    p :       a nul-terminated UTF-8 encoded string
--    len :     the maximum length of p
--    c :       a Unicode character
--    Returns : NULL if the string does not contain the character, otherwise, a pointer
--              to the start of the leftmost occurrence of the character in the string.

--    ---------------------------------------------------------------------------------

--   g_utf8_strrchr ()

--  gchar*      g_utf8_strrchr                  (const gchar *p,
--                                               gssize len,
--                                               gunichar c);

--    Find the rightmost occurrence of the given Unicode character in a UTF-8 encoded
--    string, while limiting the search to len bytes. If len is -1, allow unbounded
--    search.

--    p :       a nul-terminated UTF-8 encoded string
--    len :     the maximum length of p
--    c :       a Unicode character
--    Returns : NULL if the string does not contain the character, otherwise, a pointer
--              to the start of the rightmost occurrence of the character in the
--              string.

--    ---------------------------------------------------------------------------------

--   g_utf8_strreverse ()

--  gchar*      g_utf8_strreverse               (const gchar *str,
--                                               gssize len);

--    Reverses a UTF-8 string. str must be valid UTF-8 encoded text. (Use
--    g_utf8_validate() on all text before trying to use UTF-8 utility functions with
--    it.)

--    Note that unlike g_strreverse(), this function returns newly-allocated memory,
--    which should be freed with g_free() when no longer needed.

--    str :     a UTF-8 encoded string
--    len :     the maximum length of str to use. If len < 0, then the string is
--              nul-terminated.
--    Returns : a newly-allocated string which is the reverse of str.

--    Since 2.2

--    ---------------------------------------------------------------------------------

--   g_utf8_validate ()

--  gboolean    g_utf8_validate                 (const gchar *str,
--                                               gssize max_len,
--                                               const gchar **end);

--    Validates UTF-8 encoded text. str is the text to validate; if str is
--    nul-terminated, then max_len can be -1, otherwise max_len should be the number of
--    bytes to validate. If end is non-NULL, then the end of the valid range will be
--    stored there (i.e. the start of the first invalid character if some bytes were
--    invalid, or the end of the text being validated otherwise).

--    Note that g_utf8_validate() returns FALSE if max_len is positive and NUL is met
--    before max_len bytes have been read.

--    Returns TRUE if all of str was valid. Many GLib and GTK+ routines require valid
--    UTF-8 as input; so data read from a file or the network should be checked with
--    g_utf8_validate() before doing anything else with it.

--    str :     a pointer to character data
--    max_len : max bytes to validate, or -1 to go until NUL
--    end :     return location for end of valid data
--    Returns : TRUE if the text was valid UTF-8

--    ---------------------------------------------------------------------------------

--   g_utf8_strup ()

--  gchar*      g_utf8_strup                    (const gchar *str,
--                                               gssize len);

--    Converts all Unicode characters in the string that have a case to uppercase. The
--    exact manner that this is done depends on the current locale, and may result in
--    the number of characters in the string increasing. (For instance, the German
--    ess-zet will be changed to SS.)

--    str :     a UTF-8 encoded string
--    len :     length of str, in bytes, or -1 if str is nul-terminated.
--    Returns : a newly allocated string, with all characters converted to uppercase.

--    ---------------------------------------------------------------------------------

--   g_utf8_strdown ()

--  gchar*      g_utf8_strdown                  (const gchar *str,
--                                               gssize len);

--    Converts all Unicode characters in the string that have a case to lowercase. The
--    exact manner that this is done depends on the current locale, and may result in
--    the number of characters in the string changing.

--    str :     a UTF-8 encoded string
--    len :     length of str, in bytes, or -1 if str is nul-terminated.
--    Returns : a newly allocated string, with all characters converted to lowercase.

--    ---------------------------------------------------------------------------------

--   g_utf8_casefold ()

--  gchar*      g_utf8_casefold                 (const gchar *str,
--                                               gssize len);

--    Converts a string into a form that is independent of case. The result will not
--    correspond to any particular case, but can be compared for equality or ordered
--    with the results of calling g_utf8_casefold() on other strings.

--    Note that calling g_utf8_casefold() followed by g_utf8_collate() is only an
--    approximation to the correct linguistic case insensitive ordering, though it is a
--    fairly good one. Getting this exactly right would require a more sophisticated
--    collation function that takes case sensitivity into account. GLib does not
--    currently provide such a function.

--    str :     a UTF-8 encoded string
--    len :     length of str, in bytes, or -1 if str is nul-terminated.
--    Returns : a newly allocated string, that is a case independent form of str.

--    ---------------------------------------------------------------------------------

--   g_utf8_normalize ()

--  gchar*      g_utf8_normalize                (const gchar *str,
--                                               gssize len,
--                                               GNormalizeMode mode);

--    Converts a string into canonical form, standardizing such issues as whether a
--    character with an accent is represented as a base character and combining accent
--    or as a single precomposed character. You should generally call
--    g_utf8_normalize() before comparing two Unicode strings.

--    The normalization mode G_NORMALIZE_DEFAULT only standardizes differences that do
--    not affect the text content, such as the above-mentioned accent representation.
--    G_NORMALIZE_ALL also standardizes the "compatibility" characters in Unicode, such
--    as SUPERSCRIPT THREE to the standard forms (in this case DIGIT THREE). Formatting
--    information may be lost but for most text operations such characters should be
--    considered the same. For example, g_utf8_collate() normalizes with
--    G_NORMALIZE_ALL as its first step.

--    G_NORMALIZE_DEFAULT_COMPOSE and G_NORMALIZE_ALL_COMPOSE are like
--    G_NORMALIZE_DEFAULT and G_NORMALIZE_ALL, but returned a result with composed
--    forms rather than a maximally decomposed form. This is often useful if you intend
--    to convert the string to a legacy encoding or pass it to a system with less
--    capable Unicode handling.

--    str :     a UTF-8 encoded string.
--    len :     length of str, in bytes, or -1 if str is nul-terminated.
--    mode :    the type of normalization to perform.
--    Returns : a newly allocated string, that is the normalized form of str.

--    ---------------------------------------------------------------------------------

--   enum GNormalizeMode

--  typedef enum {
--    G_NORMALIZE_DEFAULT,
--    G_NORMALIZE_NFD = G_NORMALIZE_DEFAULT,
--    G_NORMALIZE_DEFAULT_COMPOSE,
--    G_NORMALIZE_NFC = G_NORMALIZE_DEFAULT_COMPOSE,
--    G_NORMALIZE_ALL,
--    G_NORMALIZE_NFKD = G_NORMALIZE_ALL,
--    G_NORMALIZE_ALL_COMPOSE,
--    G_NORMALIZE_NFKC = G_NORMALIZE_ALL_COMPOSE
--  } GNormalizeMode;

--    Defines how a Unicode string is transformed in a canonical form, standardizing
--    such issues as whether a character with an accent is represented as a base
--    character and combining accent or as a single precomposed character. Unicode
--    strings should generally be normalized before comparing them.

--    G_NORMALIZE_DEFAULT         standardize differences that do not affect the text
--                                content, such as the above-mentioned accent
--                                representation.
--    G_NORMALIZE_NFD             another name for G_NORMALIZE_DEFAULT.
--    G_NORMALIZE_DEFAULT_COMPOSE like G_NORMALIZE_DEFAULT, but with composed forms
--                                rather than a maximally decomposed form.
--    G_NORMALIZE_NFC             another name for G_NORMALIZE_DEFAULT_COMPOSE.
--    G_NORMALIZE_ALL             beyond G_NORMALIZE_DEFAULT also standardize the
--                                "compatibility" characters in Unicode, such as
--                                SUPERSCRIPT THREE to the standard forms (in this case
--                                DIGIT THREE). Formatting information may be lost but
--                                for most text operations such characters should be
--                                considered the same.
--    G_NORMALIZE_NFKD            another name for G_NORMALIZE_ALL.
--    G_NORMALIZE_ALL_COMPOSE     like G_NORMALIZE_ALL, but with composed forms rather
--                                than a maximally decomposed form.
--    G_NORMALIZE_NFKC            another name for G_NORMALIZE_ALL_COMPOSE.

--    ---------------------------------------------------------------------------------

--   g_utf8_collate ()

--  gint        g_utf8_collate                  (const gchar *str1,
--                                               const gchar *str2);

--    Compares two strings for ordering using the linguistically correct rules for the
--    current locale. When sorting a large number of strings, it will be significantly
--    faster to obtain collation keys with g_utf8_collate_key() and compare the keys
--    with strcmp() when sorting instead of sorting the original strings.

--    str1 :    a UTF-8 encoded string
--    str2 :    a UTF-8 encoded string
--    Returns : < 0 if str1 compares before str2, 0 if they compare equal, > 0 if str1
--              compares after str2.

--    ---------------------------------------------------------------------------------

--   g_utf8_collate_key ()

--  gchar*      g_utf8_collate_key              (const gchar *str,
--                                               gssize len);

--    Converts a string into a collation key that can be compared with other collation
--    keys produced by the same function using strcmp(). The results of comparing the
--    collation keys of two strings with strcmp() will always be the same as comparing
--    the two original keys with g_utf8_collate().

--    str :     a UTF-8 encoded string.
--    len :     length of str, in bytes, or -1 if str is nul-terminated.
--    Returns : a newly allocated string. This string should be freed with g_free()
--              when you are done with it.

--    ---------------------------------------------------------------------------------

--   g_utf8_collate_key_for_filename ()

--  gchar*      g_utf8_collate_key_for_filename (const gchar *str,
--                                               gssize len);

--    Converts a string into a collation key that can be compared with other collation
--    keys produced by the same function using strcmp().

--    In order to sort filenames correctly, this function treats the dot '.' as a
--    special case. Most dictionary orderings seem to consider it insignificant, thus
--    producing the ordering "event.c" "eventgenerator.c" "event.h" instead of
--    "event.c" "event.h" "eventgenerator.c". Also, we would like to treat numbers
--    intelligently so that "file1" "file10" "file5" is sorted as "file1" "file5"
--    "file10".

--    str :     a UTF-8 encoded string.
--    len :     length of str, in bytes, or -1 if str is nul-terminated.
--    Returns : a newly allocated string. This string should be freed with g_free()
--              when you are done with it.

--    Since 2.8

--    ---------------------------------------------------------------------------------

--   g_utf8_to_utf16 ()

--  gunichar2*  g_utf8_to_utf16                 (const gchar *str,
--                                               glong len,
--                                               glong *items_read,
--                                               glong *items_written,
--                                               GError **error);

--    Convert a string from UTF-8 to UTF-16. A 0 character will be added to the result
--    after the converted text.

--    str :           a UTF-8 encoded string
--    len :           the maximum length (number of characters) of str to use. If len <
--                    0, then the string is nul-terminated.
--    items_read :    location to store number of bytes read, or NULL. If NULL, then
--                    G_CONVERT_ERROR_PARTIAL_INPUT will be returned in case str
--                    contains a trailing partial character. If an error occurs then
--                    the index of the invalid input is stored here.
--    items_written : location to store number of gunichar2 written, or NULL. The value
--                    stored here does not include the trailing 0.
--    error :         location to store the error occuring, or NULL to ignore errors.
--                    Any of the errors in GConvertError other than
--                    G_CONVERT_ERROR_NO_CONVERSION may occur.
--    Returns :       a pointer to a newly allocated UTF-16 string. This value must be
--                    freed with g_free(). If an error occurs, NULL will be returned
--                    and error set.

--    ---------------------------------------------------------------------------------

--   g_utf8_to_ucs4 ()

--  gunichar*   g_utf8_to_ucs4                  (const gchar *str,
--                                               glong len,
--                                               glong *items_read,
--                                               glong *items_written,
--                                               GError **error);

--    Convert a string from UTF-8 to a 32-bit fixed width representation as UCS-4. A
--    trailing 0 will be added to the string after the converted text.

--    str :           a UTF-8 encoded string
--    len :           the maximum length of str to use. If len < 0, then the string is
--                    nul-terminated.
--    items_read :    location to store number of bytes read, or NULL. If NULL, then
--                    G_CONVERT_ERROR_PARTIAL_INPUT will be returned in case str
--                    contains a trailing partial character. If an error occurs then
--                    the index of the invalid input is stored here.
--    items_written : location to store number of characters written or NULL. The value
--                    here stored does not include the trailing 0 character.
--    error :         location to store the error occuring, or NULL to ignore errors.
--                    Any of the errors in GConvertError other than
--                    G_CONVERT_ERROR_NO_CONVERSION may occur.
--    Returns :       a pointer to a newly allocated UCS-4 string. This value must be
--                    freed with g_free(). If an error occurs, NULL will be returned
--                    and error set.

--    ---------------------------------------------------------------------------------

--   g_utf8_to_ucs4_fast ()

--  gunichar*   g_utf8_to_ucs4_fast             (const gchar *str,
--                                               glong len,
--                                               glong *items_written);

--    Convert a string from UTF-8 to a 32-bit fixed width representation as UCS-4,
--    assuming valid UTF-8 input. This function is roughly twice as fast as
--    g_utf8_to_ucs4() but does no error checking on the input.

--    str :           a UTF-8 encoded string
--    len :           the maximum length of str to use. If len < 0, then the string is
--                    nul-terminated.
--    items_written : location to store the number of characters in the result, or
--                    NULL.
--    Returns :       a pointer to a newly allocated UCS-4 string. This value must be
--                    freed with g_free().

--    ---------------------------------------------------------------------------------

--   g_utf16_to_ucs4 ()

--  gunichar*   g_utf16_to_ucs4                 (const gunichar2 *str,
--                                               glong len,
--                                               glong *items_read,
--                                               glong *items_written,
--                                               GError **error);

--    Convert a string from UTF-16 to UCS-4. The result will be terminated with a 0
--    character.

--    str :           a UTF-16 encoded string
--    len :           the maximum length (number of gunichar2) of str to use. If len <
--                    0, then the string is terminated with a 0 character.
--    items_read :    location to store number of words read, or NULL. If NULL, then
--                    G_CONVERT_ERROR_PARTIAL_INPUT will be returned in case str
--                    contains a trailing partial character. If an error occurs then
--                    the index of the invalid input is stored here.
--    items_written : location to store number of characters written, or NULL. The
--                    value stored here does not include the trailing 0 character.
--    error :         location to store the error occuring, or NULL to ignore errors.
--                    Any of the errors in GConvertError other than
--                    G_CONVERT_ERROR_NO_CONVERSION may occur.
--    Returns :       a pointer to a newly allocated UCS-4 string. This value must be
--                    freed with g_free(). If an error occurs, NULL will be returned
--                    and error set.

--    ---------------------------------------------------------------------------------

--   g_utf16_to_utf8 ()

--  gchar*      g_utf16_to_utf8                 (const gunichar2 *str,
--                                               glong len,
--                                               glong *items_read,
--                                               glong *items_written,
--                                               GError **error);

--    Convert a string from UTF-16 to UTF-8. The result will be terminated with a 0
--    byte.

--    Note that the input is expected to be already in native endianness, an initial
--    byte-order-mark character is not handled specially. g_convert() can be used to
--    convert a byte buffer of UTF-16 data of ambiguous endianess.

--    str :           a UTF-16 encoded string
--    len :           the maximum length (number of gunichar2) of str to use. If len <
--                    0, then the string is terminated with a 0 character.
--    items_read :    location to store number of words read, or NULL. If NULL, then
--                    G_CONVERT_ERROR_PARTIAL_INPUT will be returned in case str
--                    contains a trailing partial character. If an error occurs then
--                    the index of the invalid input is stored here.
--    items_written : location to store number of bytes written, or NULL. The value
--                    stored here does not include the trailing 0 byte.
--    error :         location to store the error occuring, or NULL to ignore errors.
--                    Any of the errors in GConvertError other than
--                    G_CONVERT_ERROR_NO_CONVERSION may occur.
--    Returns :       a pointer to a newly allocated UTF-8 string. This value must be
--                    freed with g_free(). If an error occurs, NULL will be returned
--                    and error set.

--    ---------------------------------------------------------------------------------

--   g_ucs4_to_utf16 ()

--  gunichar2*  g_ucs4_to_utf16                 (const gunichar *str,
--                                               glong len,
--                                               glong *items_read,
--                                               glong *items_written,
--                                               GError **error);

--    Convert a string from UCS-4 to UTF-16. A 0 character will be added to the result
--    after the converted text.

--    str :           a UCS-4 encoded string
--    len :           the maximum length (number of characters) of str to use. If len <
--                    0, then the string is terminated with a 0 character.
--    items_read :    location to store number of bytes read, or NULL. If an error
--                    occurs then the index of the invalid input is stored here.
--    items_written : location to store number of gunichar2 written, or NULL. The value
--                    stored here does not include the trailing 0.
--    error :         location to store the error occuring, or NULL to ignore errors.
--                    Any of the errors in GConvertError other than
--                    G_CONVERT_ERROR_NO_CONVERSION may occur.
--    Returns :       a pointer to a newly allocated UTF-16 string. This value must be
--                    freed with g_free(). If an error occurs, NULL will be returned
--                    and error set.

--    ---------------------------------------------------------------------------------

--   g_ucs4_to_utf8 ()

--  gchar*      g_ucs4_to_utf8                  (const gunichar *str,
--                                               glong len,
--                                               glong *items_read,
--                                               glong *items_written,
--                                               GError **error);

--    Convert a string from a 32-bit fixed width representation as UCS-4. to UTF-8. The
--    result will be terminated with a 0 byte.

--    str :           a UCS-4 encoded string
--    len :           the maximum length (number of characters) of str to use. If len <
--                    0, then the string is terminated with a 0 character.
--    items_read :    location to store number of characters read, or NULL.
--    items_written : location to store number of bytes written or NULL. The value here
--                    stored does not include the trailing 0 byte.
--    error :         location to store the error occuring, or NULL to ignore errors.
--                    Any of the errors in GConvertError other than
--                    G_CONVERT_ERROR_NO_CONVERSION may occur.
--    Returns :       a pointer to a newly allocated UTF-8 string. This value must be
--                    freed with g_free(). If an error occurs, NULL will be returned
--                    and error set. In that case, items_read will be set to the
--                    position of the first invalid input character.

--    ---------------------------------------------------------------------------------

--   g_unichar_to_utf8 ()

--  gint        g_unichar_to_utf8               (gunichar c,
--                                               gchar *outbuf);

--    Converts a single character to UTF-8.

--    c :       a Unicode character code
--    outbuf :  output buffer, must have at least 6 bytes of space. If NULL, the length
--              will be computed and returned and nothing will be written to outbuf.
--    Returns : number of bytes written

-- See Also

--    g_locale_to_utf8(), g_locale_from_utf8() Convenience functions for converting
--                                             between UTF-8 and the locale encoding.

--    --------------

--    ^[3] surrogate pairs

feature {} -- Implementation
	storage: POINTER
	size: INTEGER
			-- Size of allocated memory in bytes/CHARACTERS/C char
	
end --  class UTF8_STRING
