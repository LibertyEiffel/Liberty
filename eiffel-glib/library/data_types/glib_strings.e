indexing
	copyright: "(C) 2005 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class GLIB_STRINGS
-- Prev 	Up 	Home 	GLib Reference Manual 	Next
-- Top  |  Description
-- Strings

-- Strings %GÅ‚Äî%@ text buffers which grow automatically as text is added.
	
-- Synopsis

-- #include <glib.h>


--             GString;
-- GString*    g_string_new                    (const gchar *init);
-- GString*    g_string_new_len                (const gchar *init,
--                                              gssize len);
-- GString*    g_string_sized_new              (gsize dfl_size);
-- GString*    g_string_assign                 (GString *string,
--                                              const gchar *rval);
-- #define     g_string_sprintf
-- #define     g_string_sprintfa
-- void        g_string_printf                 (GString *string,
--                                              const gchar *format,
--                                              ...);
-- void        g_string_append_printf          (GString *string,
--                                              const gchar *format,
--                                              ...);
-- GString*    g_string_append                 (GString *string,
--                                              const gchar *val);
-- GString*    g_string_append_c               (GString *string,
--                                              gchar c);
-- GString*    g_string_append_unichar         (GString *string,
--                                              gunichar wc);
-- GString*    g_string_append_len             (GString *string,
--                                              const gchar *val,
--                                              gssize len);
-- GString*    g_string_prepend                (GString *string,
--                                              const gchar *val);
-- GString*    g_string_prepend_c              (GString *string,
--                                              gchar c);
-- GString*    g_string_prepend_unichar        (GString *string,
--                                              gunichar wc);
-- GString*    g_string_prepend_len            (GString *string,
--                                              const gchar *val,
--                                              gssize len);
-- GString*    g_string_insert                 (GString *string,
--                                              gssize pos,
--                                              const gchar *val);
-- GString*    g_string_insert_c               (GString *string,
--                                              gssize pos,
--                                              gchar c);
-- GString*    g_string_insert_unichar         (GString *string,
--                                              gssize pos,
--                                              gunichar wc);
-- GString*    g_string_insert_len             (GString *string,
--                                              gssize pos,
--                                              const gchar *val,
--                                              gssize len);
-- GString*    g_string_erase                  (GString *string,
--                                              gssize pos,
--                                              gssize len);
-- GString*    g_string_truncate               (GString *string,
--                                              gsize len);
-- GString*    g_string_set_size               (GString *string,
--                                              gsize len);
-- gchar*      g_string_free                   (GString *string,
--                                              gboolean free_segment);

-- GString*    g_string_up                     (GString *string);
-- GString*    g_string_down                   (GString *string);

-- guint       g_string_hash                   (const GString *str);
-- gboolean    g_string_equal                  (const GString *v,
--                                              const GString *v2);

-- Description

-- A GString is similar to a standard C string, except that it grows automatically as text is appended or inserted. Also, it stores the length of the string, so can be used for binary data with embedded nul bytes.
-- Details
-- GString

-- typedef struct {
--   gchar  *str;
--   gsize len;    
--   gsize allocated_len;
-- } GString;

-- The GString struct contains the public fields of a GString. The str field points to the character data. It may move as text is added. The len field contains the length of the string, not including the terminating nul byte.

-- The str field is nul-terminated and so can be used as an ordinary C string. But it may be moved when text is appended or inserted into the string.
-- g_string_new ()

-- GString*    g_string_new                    (const gchar *init);

-- Creates a new GString, initialized with the given string.
-- init : 	the initial text to copy into the string.
-- Returns : 	the new GString.
-- g_string_new_len ()

-- GString*    g_string_new_len                (const gchar *init,
--                                              gssize len);

-- Creates a new GString with len bytes of the init buffer. Because a length is provided, init need not be nul-terminated, and can contain embedded nul bytes.
-- init : 	initial contents of string.
-- len : 	length of init to use.
-- Returns : 	a new GString.
-- g_string_sized_new ()

-- GString*    g_string_sized_new              (gsize dfl_size);

-- Creates a new GString, with enough space for dfl_size bytes. This is useful if you are going to add a lot of text to the string and don't want it to be reallocated too often.
-- dfl_size : 	the default size of the space allocated to hold the string.
-- Returns : 	the new GString.
-- g_string_assign ()

-- GString*    g_string_assign                 (GString *string,
--                                              const gchar *rval);

-- Copies the bytes from a string into a GString, destroying any previous contents. It is rather like the standard strcpy() function, except that you do not have to worry about having enough space to copy the string.
-- string : 	the destination GString. Its current contents are destroyed.
-- rval : 	the string to copy into string
-- Returns : 	the destination GString.
-- g_string_sprintf

-- #define     g_string_sprintf

-- Warning

-- g_string_sprintf is deprecated and should not be used in newly-written code. This function has been renamed to g_string_printf().

-- Writes a formatted string into a GString. This is similar to the standard sprintf() function, except that the GString buffer automatically expands to contain the results. The previous contents of the GString are destroyed.
-- g_string_sprintfa

-- #define     g_string_sprintfa

-- Warning

-- g_string_sprintfa is deprecated and should not be used in newly-written code. This function has been renamed to g_string_append_printf().

-- Appends a formatted string onto the end of a GString. This function is is similar to g_string_sprintf() except that the text is appended to the GString.
-- g_string_printf ()

-- void        g_string_printf                 (GString *string,
--                                              const gchar *format,
--                                              ...);

-- Writes a formatted string into a GString. This is similar to the standard sprintf() function, except that the GString buffer automatically expands to contain the results. The previous contents of the GString are destroyed.
-- string : 	a GString.
-- format : 	the string format. See the printf() documentation.
-- ... : 	the parameters to insert into the format string.
-- g_string_append_printf ()

-- void        g_string_append_printf          (GString *string,
--                                              const gchar *format,
--                                              ...);

-- Appends a formatted string onto the end of a GString. This function is is similar to g_string_printf() except that the text is appended to the GString.
-- string : 	a GString.
-- format : 	the string format. See the printf() documentation.
-- ... : 	the parameters to insert into the format string.
-- g_string_append ()

-- GString*    g_string_append                 (GString *string,
--                                              const gchar *val);

-- Adds a string onto the end of a GString, expanding it if necessary.
-- string : 	a GString.
-- val : 	the string to append onto the end of the GString.
-- Returns : 	the GString.
-- g_string_append_c ()

-- GString*    g_string_append_c               (GString *string,
--                                              gchar c);

-- Adds a byte onto the end of a GString, expanding it if necessary.
-- string : 	a GString.
-- c : 	the byte to append onto the end of the GString.
-- Returns : 	the GString.
-- g_string_append_unichar ()

-- GString*    g_string_append_unichar         (GString *string,
--                                              gunichar wc);

-- Converts a Unicode character into UTF-8, and appends it to the string.

-- string : 	a GString
-- wc : 	a Unicode character
-- Returns : 	string
-- g_string_append_len ()

-- GString*    g_string_append_len             (GString *string,
--                                              const gchar *val,
--                                              gssize len);

-- Appends len bytes of val to string. Because len is provided, val may contain embedded nuls and need not be nul-terminated.
-- string : 	a GString.
-- val : 	bytes to append.
-- len : 	number of bytes of val to use.
-- Returns : 	the GString.
-- g_string_prepend ()

-- GString*    g_string_prepend                (GString *string,
--                                              const gchar *val);

-- Adds a string on to the start of a GString, expanding it if necessary.
-- string : 	a GString.
-- val : 	the string to prepend on the start of the GString.
-- Returns : 	the GString.
-- g_string_prepend_c ()

-- GString*    g_string_prepend_c              (GString *string,
--                                              gchar c);

-- Adds a byte onto the start of a GString, expanding it if necessary.
-- string : 	a GString.
-- c : 	the byte to prepend on the start of the GString.
-- Returns : 	the GString.
-- g_string_prepend_unichar ()

-- GString*    g_string_prepend_unichar        (GString *string,
--                                              gunichar wc);

-- Converts a Unicode character into UTF-8, and prepends it to the string.

-- string : 	a GString.
-- wc : 	a Unicode character.
-- Returns : 	string.
-- g_string_prepend_len ()

-- GString*    g_string_prepend_len            (GString *string,
--                                              const gchar *val,
--                                              gssize len);

-- Prepends len bytes of val to string. Because len is provided, val may contain embedded nuls and need not be nul-terminated.
-- string : 	a GString.
-- val : 	bytes to prepend.
-- len : 	number of bytes in val to prepend.
-- Returns : 	the GString passed in.
-- g_string_insert ()

-- GString*    g_string_insert                 (GString *string,
--                                              gssize pos,
--                                              const gchar *val);

-- Inserts a copy of a string into a GString, expanding it if necessary.
-- string : 	a GString.
-- pos : 	the position to insert the copy of the string.
-- val : 	the string to insert.
-- Returns : 	the GString.
-- g_string_insert_c ()

-- GString*    g_string_insert_c               (GString *string,
--                                              gssize pos,
--                                              gchar c);

-- Inserts a byte into a GString, expanding it if necessary.
-- string : 	a GString.
-- pos : 	the position to insert the byte.
-- c : 	the byte to insert.
-- Returns : 	the GString.
-- g_string_insert_unichar ()

-- GString*    g_string_insert_unichar         (GString *string,
--                                              gssize pos,
--                                              gunichar wc);

-- Converts a Unicode character into UTF-8, and insert it into the string at the given position.

-- string : 	a GString
-- pos : 	the position at which to insert character, or -1 to append at the end of the string.
-- wc : 	a Unicode character
-- Returns : 	string
-- g_string_insert_len ()

-- GString*    g_string_insert_len             (GString *string,
--                                              gssize pos,
--                                              const gchar *val,
--                                              gssize len);

-- Inserts len bytes of val into string at pos. Because len is provided, val may contain embedded nuls and need not be nul-terminated. If pos is -1, bytes are inserted at the end of the string.
-- string : 	a GString.
-- pos : 	position in string where insertion should happen, or -1 for at the end.
-- val : 	bytes to insert.
-- len : 	number of bytes of val to insert.
-- Returns : 	the GString.
-- g_string_erase ()

-- GString*    g_string_erase                  (GString *string,
--                                              gssize pos,
--                                              gssize len);

-- Removes len bytes from a GString, starting at position pos. The rest of the GString is shifted down to fill the gap.
-- string : 	a GString.
-- pos : 	the position of the content to remove.
-- len : 	the number of bytes to remove, or -1 to remove all following bytes.
-- Returns : 	the GString.
-- g_string_truncate ()

-- GString*    g_string_truncate               (GString *string,
--                                              gsize len);

-- Cuts off the end of the GString, leaving the first len bytes.
-- string : 	a GString.
-- len : 	the new size of the GString.
-- Returns : 	the GString.
-- g_string_set_size ()

-- GString*    g_string_set_size               (GString *string,
--                                              gsize len);

-- Sets the length of a GString. If the length is less than the current length, the string will be truncated. If the length is greater than the current length, the contents of the newly added area are undefined. (However, as always, string->str[string->len] will be a nul byte.)

-- string : 	a GString
-- len : 	the new length
-- Returns : 	string
-- g_string_free ()

-- gchar*      g_string_free                   (GString *string,
--                                              gboolean free_segment);

-- Frees the memory allocated for the GString. If free_segment is TRUE it also frees the character data.
-- string : 	a GString.
-- free_segment : 	if TRUE the actual character data is freed as well.
-- Returns : 	the character data of string (i.e. NULL if free_segment is TRUE)
-- g_string_up ()

-- GString*    g_string_up                     (GString *string);

-- Warning

-- g_string_up is deprecated and should not be used in newly-written code. This function uses the locale-specific toupper() function, which is almost never the right thing. Use g_string_ascii_up() or g_utf8_strup() instead.

-- Converts a GString to uppercase.

-- string : 	a GString
-- Returns : 	the GString
-- g_string_down ()

-- GString*    g_string_down                   (GString *string);

-- Warning

-- g_string_down is deprecated and should not be used in newly-written code. This function uses the locale-specific tolower() function, which is almost never the right thing. Use g_string_ascii_down() or g_utf8_strdown() instead.

-- Converts a GString to lowercase.

-- string : 	a GString
-- Returns : 	the GString.
-- g_string_hash ()

-- guint       g_string_hash                   (const GString *str);

-- Creates a hash code for str; for use with GHashTable.
-- str : 	a string to hash.
-- Returns : 	hash code for str.
-- g_string_equal ()

-- gboolean    g_string_equal                  (const GString *v,
--                                              const GString *v2);

-- Compares two strings for equality, returning TRUE if they are equal. For use with GHashTable.
-- v : 	a GString.
-- v2 : 	another GString.
-- Returns : 	TRUE if they strings are the same length and contain the same bytes.
end
