note
	description: "C string Utility Functions -- various C-string-related functions."
	copyright: "[
					Copyright (C) 2007-2018: Paolo Redaelli, GLib team
					
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

deferred class GLIB_STRING_UTILITY_FUNCTIONS
	-- Utility functions functions for creating, duplicating, and
	-- manipulating strings at C level.

	-- Note that the functions g_printf(), g_fprintf(), g_sprintf(),
	-- g_snprintf(), g_vprintf(), g_vfprintf(), g_vsprintf() and
	-- g_vsnprintf() are declared in the header gprintf.h which is not
	-- included in glib.h (otherwise using glib.h would drag in
	-- stdio.h), so you'll have to explicitly include <glib/gprintf.h>
	-- in order to use the GLib printf() functions.

	-- While you may use the printf() functions to format UTF-8
	-- strings, notice that the precision of a %Ns parameter is
	-- interpreted as the number of bytes, not characters to print. On
	-- top of that, the GNU libc implementation of the printf()
	-- functions has the "feature" that it checks that the string given
	-- for the %Ns parameter consists of a whole number of characters
	-- in the current encoding. So, unless you are sure you are always
	-- going to be in an UTF-8 locale or your know your text is
	-- restricted to ASCII, avoid using %Ns. If your intention is to
	-- format strings for a certain number of columns, then %Ns is not
	-- a correct solution anyway, since it fails to take wide
	-- characters (see g_unichar_iswide()) into account.

	-- Note: this class breaks the naming scheme used in the Eiffel
	-- Wrapper Library Collection as it provides low-level C calls
	-- without having "EXTERNALS" suffix.
	
	-- Note: variadic calls are wrapped without their variadic part, as
	-- in Eiffel the variadic part will almost never be used
	-- AFAIK. Some exception have been made, with a reasonable number
	-- of arguments, when without any further argument the call loses
	-- sense Paolo 2007-01-29

	-- Note: valist versions of the calls are not wrapped since AFAIK
	-- it is not possible to handle a valist in a portable way. Paolo
	-- 2007-01-29

insert
	ANY undefine is_equal, copy end
	GLIB_BASIC_TYPES
		-- For achored declaration of low-level types, i.e. gsize

feature {} -- External calls using gprintf.h
	g_printf (a_format: POINTER): INTEGER
			-- gint g_printf (gchar const *format, ...);
		external "C use <glib/gprintf.h>"
		end
	
	-- Unwrapped, since it uses valist:
	-- gint g_vprintf (gchar const *format, va_list args);
	
	g_sprintf (a_string, a_format: POINTER): INTEGER
			-- gint g_sprintf (gchar *string, gchar const *format, ...);
		external "C use <glib/gprintf.h>"
		end

	-- Unwrapped, since it uses valist:
	-- gint g_vsprintf (gchar *string, gchar const *format, va_list args);

	g_snprintf (a_string: POINTER an_gulong_n: INTEGER; a_format: POINTER): INTEGER
			-- gint g_snprintf (gchar *string, gulong n, gchar const
			-- *format, ...);
		external "C use <glib/gprintf.h>"
		end

	-- Unwrapped, since it uses valist: gint g_vsnprintf (gchar
	-- *string, gulong n, gchar const *format, va_list args);

	-- Unwrapped, since it uses valist: gint g_vfprintf (FILE *file,
	-- gchar const *format, va_list args);

feature {} -- External calls using glib.h

-- #include <glib.h>

	g_strdup (a_str: POINTER): POINTER
			-- gchar* g_strdup (const gchar *str);
		external "C use <glib.h>"
		end

	g_strndup (a_str: POINTER; an_n: like gsize): POINTER
			-- gchar* g_strndup (const gchar *str, gsize n);
		external "C use <glib.h>"
		end

	g_strdupv (a_str_array: POINTER): POINTER
			-- gchar** g_strdupv (gchar **str_array);
		external "C use <glib.h>"
		end

	g_strnfill (a_length: like gsize; a_fill_char: CHARACTER): POINTER
			-- gchar* g_strnfill (gsize length, gchar fill_char);
		external "C use <glib.h>"
		end

	g_stpcpy (a_dest, a_src: POINTER): POINTER
			-- gchar* g_stpcpy (gchar *dest, const char *src);
		external "C use <glib.h>"
		end

	g_strstr_len (a_haystack: POINTER; an_haystack_len: like gssize; a_needle: POINTER): POINTER
			-- gchar* g_strstr_len (const gchar *haystack, gssize
			-- haystack_len, const gchar *needle);
		external "C use <glib.h>"
		end

	g_strrstr (a_haystack, a_needle: POINTER): POINTER
			-- gchar* g_strrstr (const gchar *haystack, const gchar
			-- *needle);
		external "C use <glib.h>"
		end

	g_strrstr_len (a_haystack: POINTER; a_haystack_len: like gssize; a_needle: POINTER): POINTER
			-- gchar* g_strrstr_len (const gchar *haystack, gssize
			-- haystack_len, const gchar *needle);
		external "C use <glib.h>"
		end

	g_str_has_prefix (a_str: POINTER; a_prefix: POINTER): INTEGER
			-- gboolean g_str_has_prefix (const gchar *str, const gchar
			-- *prefix);
		external "C use <glib.h>"
		end

	g_str_has_suffix (a_str: POINTER; a_suffix: POINTER): INTEGER
			-- gboolean g_str_has_suffix (const gchar *str, const gchar
			-- *suffix);
		external "C use <glib.h>"
		end

	g_strlcpy (a_dest, a_src: POINTER; a_dest_size: like gsize): like gsize
			-- gsize g_strlcpy (gchar *dest, const gchar *src, gsize dest_size);
		external "C use <glib.h>"
		end

	g_strlcat (a_dest, a_src: POINTER; a_dest_size: like gsize): like gsize
			-- gsize g_strlcat (gchar *dest, const gchar *src, gsize dest_size);
		external "C use <glib.h>"
		end

	g_strdup_printf (a_format: POINTER): POINTER
			-- gchar* g_strdup_printf (const gchar *format, ...);
		external "C use <glib.h>"
		end

	-- Unwrapped: uses valist gchar* g_strdup_vprintf (const gchar
	-- *format, va_list args);

	g_fprintf (a_file, a_format: POINTER): INTEGER
			-- gint g_fprintf (FILE *file, gchar const *format, ...);
		external "C use <glib.h>"
		end
	
	-- Unwrapped, uses valist: gint g_vasprintf (gchar **string, gchar
	-- const *format, va_list args);

	-- Unwrapped, uses valist: gsize g_printf_string_upper_bound (const
	-- gchar *format, va_list args);

	g_ascii_isalnum (a_c: CHARACTER): INTEGER
			-- gboolean g_ascii_isalnum (gchar c);
		external "C use <glib.h>"
		end

	g_ascii_isalpha (a_c: CHARACTER): INTEGER
			-- gboolean g_ascii_isalpha (gchar c);
		external "C use <glib.h>"
		end

	g_ascii_iscntrl (a_c: CHARACTER): INTEGER
			-- gboolean g_ascii_iscntrl (gchar c);
		external "C use <glib.h>"
		end

	g_ascii_isdigit (a_c: CHARACTER): INTEGER
			-- gboolean g_ascii_isdigit (gchar c);
		external "C use <glib.h>"
		end

	g_ascii_isgraph (a_c: CHARACTER): INTEGER
			-- gboolean g_ascii_isgraph (gchar c);
		external "C use <glib.h>"
		end

	g_ascii_islower (a_c: CHARACTER): INTEGER
			-- gboolean g_ascii_islower (gchar c);
		external "C use <glib.h>"
		end

	g_ascii_isprint (a_c: CHARACTER): INTEGER
			-- gboolean g_ascii_isprint (gchar c);
		external "C use <glib.h>"
		end

	g_ascii_ispunct (a_c: CHARACTER): INTEGER
			-- gboolean g_ascii_ispunct (gchar c);
		external "C use <glib.h>"
		end

	g_ascii_isspace (a_c: CHARACTER): INTEGER
			-- gboolean g_ascii_isspace (gchar c);
		external "C use <glib.h>"
		end

	g_ascii_isupper (a_c: CHARACTER): INTEGER
			-- gboolean g_ascii_isupper (gchar c);
		external "C use <glib.h>"
		end

	g_ascii_isxdigit (a_c: CHARACTER): INTEGER
			-- gboolean g_ascii_isxdigit (gchar c);
		external "C use <glib.h>"
		end

	g_ascii_digit_value (a_c: CHARACTER): INTEGER
			-- gint g_ascii_digit_value (gchar c);
		external "C use <glib.h>"
		end
	
	g_ascii_xdigit_value (a_c: CHARACTER): INTEGER
			-- gint g_ascii_xdigit_value (gchar c);
		external "C use <glib.h>"
		end
	
	
	g_ascii_strcasecmp (a_s1, a_s2: POINTER): INTEGER
			-- gint g_ascii_strcasecmp (const gchar *s1, const gchar *s2);
		external "C use <glib.h>"
		end

	g_ascii_strncasecmp (a_s1, a_s2: POINTER; an_n: like gsize): INTEGER
			-- gint g_ascii_strncasecmp (const gchar *s1, const gchar
			-- *s2, gsize n);
		external "C use <glib.h>"
		end

	g_ascii_strup (a_str: POINTER; a_len: like gssize): POINTER
			-- gchar* g_ascii_strup (const gchar *str, gssize len);
		external "C use <glib.h>"
		end

	g_ascii_strdown (a_str: POINTER; a_len: like gssize): POINTER
			-- gchar* g_ascii_strdown (const gchar *str, gssize len);
		external "C use <glib.h>"
		end

	g_ascii_tolower (a_c: CHARACTER): CHARACTER
			-- gchar g_ascii_tolower (gchar c);
		external "C use <glib.h>"
		end

	g_ascii_toupper (a_c: CHARACTER): CHARACTER
			-- gchar g_ascii_toupper (gchar c);
		external "C use <glib.h>"
		end

	g_string_ascii_up (a_string: POINTER): POINTER
			-- GString* g_string_ascii_up (GString *string);
		external "C use <glib.h>"
		end

	g_string_ascii_down (a_string: POINTER): POINTER
			-- GString* g_string_ascii_down (GString *string);
		external "C use <glib.h>"
		end

	g_strup (a_string: POINTER): POINTER
			-- gchar* g_strup (gchar *string);
		external "C use <glib.h>"
		end
	
	g_strdown (a_string: POINTER): POINTER
			-- gchar* g_strdown (gchar *string);
		external "C use <glib.h>"
		end
	
	g_strcasecmp (a_s1, a_s2: POINTER): INTEGER
			-- gint g_strcasecmp (const gchar *s1, const gchar *s2);
		external "C use <glib.h>"
		end
	
	g_strncasecmp (a_s1, a_s2: POINTER; an_n: INTEGER): INTEGER
			-- gint g_strncasecmp (const gchar *s1, const gchar *s2,
			-- guint n);

			-- TODO: an_n should be NATURAL, since it is aguint
		external "C use <glib.h>"
		end


	g_strreverse (a_string: POINTER): POINTER
			-- gchar* g_strreverse (gchar *string);
		external "C use <glib.h>"
		end


	g_ascii_strtoll (a_nptr, a_endptr: POINTER; a_base: INTEGER): INTEGER_64
			-- gint64 g_ascii_strtoll (const gchar *nptr, gchar **endptr,
			-- guint base);

			-- TODO: a_base should be NATURAL, since it is a guint
		external "C use <glib.h>"
		end

	g_ascii_strtoull (a_nptr, a_endptr: POINTER; a_base: INTEGER): INTEGER_64
			-- guint64 g_ascii_strtoull (const gchar *nptr, gchar
			-- **endptr, guint base);

			-- TODO: a_base should be NATURAL, since it is guint
			-- TODO: should be NATURAL_64, since it is a guint
		external "C use <glib.h>"
		end
	
	-- #define G_ASCII_DTOSTR_BUF_SIZE
	g_ascii_strtod (a_nptr, a_endptr: POINTER): REAL
			-- gdouble g_ascii_strtod (const gchar *nptr, gchar **endptr);
		external "C use <glib.h>"
		end
	
	g_ascii_dtostr (a_buffer: POINTER; a_buf_len: INTEGER; a_d: REAL): POINTER
			-- gchar* g_ascii_dtostr (gchar *buffer, gint buf_len,
			-- gdouble d);
		external "C use <glib.h>"
		end
	
	g_ascii_formatd (a_buffer: POINTER; a_buf_len: INTEGER; a_format: POINTER; a_double: REAL): POINTER
			-- gchar* g_ascii_formatd (gchar *buffer, gint buf_len, const
			-- gchar *format, gdouble d);
		external "C use <glib.h>"
		end

	g_strtod (a_nptr, a_endptr: POINTER): REAL
			-- gdouble g_strtod (const gchar *nptr, gchar **endptr);
		external "C use <glib.h>"
		end
	
	g_strchug (a_string: POINTER): POINTER
			-- gchar* g_strchug (gchar *string);
		external "C use <glib.h>"
		end

	g_strchomp (a_string: POINTER): POINTER
			-- gchar* g_strchomp (gchar *string);
		external "C use <glib.h>"
		end

-- #define g_strstrip ( string )

	g_strdelimit (a_string, some_delimiters: POINTER; a_new_delimiter: CHARACTER): POINTER
			-- gchar* g_strdelimit (gchar *string, const gchar
			-- *delimiters, gchar new_delimiter);
		external "C use <glib.h>"
		end

	-- #define G_STR_DELIMITERS

	g_strescape (a_source, some_exceptions: POINTER): POINTER
			-- gchar* g_strescape (const gchar *source, const gchar *exceptions);
		external "C use <glib.h>"
		end

	g_strcompress (a_source: POINTER): POINTER
			-- gchar* g_strcompress (const gchar *source);
		external "C use <glib.h>"
		end

	g_strcanon (a_string, some_valid_chars: POINTER; a_substitutor: CHARACTER): POINTER
			-- gchar* g_strcanon (gchar *string, const gchar *valid_chars, gchar substitutor);
		external "C use <glib.h>"
		end

	g_strsplit (a_string, a_delimiter: POINTER; a_max_tokens: INTEGER): POINTER
			-- gchar** g_strsplit (const gchar *string, const gchar
			-- *delimiter, gint max_tokens);
		external "C use <glib.h>"
		end

	g_strsplit_set (a_string, some_delimiters: POINTER; a_max_tokens: INTEGER): POINTER
			-- gchar** g_strsplit_set (const gchar *string, const gchar
			-- *delimiters, gint max_tokens);
		external "C use <glib.h>"
		end

	g_strfreev (a_str_array: POINTER)
			-- void g_strfreev (gchar **str_array);
		external "C use <glib.h>"
		end

	g_strconcat (a_string, another: POINTER): POINTER
			-- gchar* g_strconcat (const gchar *string1, ...);
		external "C use <glib.h>"
		end

	g_strjoin (a_separator: POINTER): POINTER
			-- gchar* g_strjoin (const gchar *separator, ...);
		external "C use <glib.h>"
		end

	g_strjoinv (a_separator, a_str_array: POINTER): POINTER
			-- gchar* g_strjoinv (const gchar *separator, gchar **str_array);
		external "C use <glib.h>"
		end

	g_strv_length (a_str_array: POINTER): INTEGER
			-- guint g_strv_length (gchar **str_array);
		
			-- TODO: should be NATURAL, since it is guint
		external "C use <glib.h>"
		end


	g_strerror (an_errnum: INTEGER): POINTER
			-- const gchar* g_strerror (gint errnum);
		external "C use <glib.h>"
		end

	g_strsignal (a_signum: INTEGER): POINTER
			-- const gchar* g_strsignal (gint signum);
		external "C use <glib.h>"
		end

feature {ANY} -- Operations

	string_escape (a_source, some_exceptions: STRING): STRING
			-- Escapes the special characters '\b', '\f', '\n', '\r', '\t', '\' and '"'
			-- in the string source by inserting a '\' before them.  Additionally all
			-- characters in the range 0x01-0x1F (everything below SPACE) and in the
			-- range 0x7F-0xFF (all non-ASCII chars) are replaced with a '\' followed
			-- by their octal representation.  Characters supplied in exceptions are not
			-- escaped.
			-- See string_compress() for the reverse conversion.
		do
			create Result.from_external (g_strescape (a_source.to_external,
			                                          some_exceptions.to_external))
		end

	string_compress (a_source: STRING): STRING
			-- Replaces all escaped characters with their one byte equivalent. It does
			-- the reverse conversion of string_escape().
		do
			create Result.from_external (g_strcompress (a_source.to_external))
		end

feature {} -- Unwrapped full-text documentation

--   g_strdup ()

--  gchar*      g_strdup                        (const gchar *str);

--    Duplicates a string. If str is NULL it returns NULL. The returned string should
--    be freed when no longer needed.

--    str :     the string to duplicate.
--    Returns : a newly-allocated copy of str.

--    ---------------------------------------------------------------------------------

--   g_strndup ()

--  gchar*      g_strndup                       (const gchar *str, gsize n);

--    Duplicates the first n characters of a string, returning a newly-allocated buffer
--    n + 1 characters long which will always be nul-terminated. If str is less than n
--    characters long the buffer is padded with nuls. If str is NULL it returns NULL.
--    The returned value should be freed when no longer needed.

--    str :     the string to duplicate part of.
--    n :       the maximum number of characters to copy from str.
--    Returns : a newly-allocated buffer containing the first n characters of str,
--              nul-terminated.

--    ---------------------------------------------------------------------------------

--   g_strdupv ()

--  gchar**     g_strdupv                       (gchar **str_array);

--    Copies NULL-terminated array of strings. The copy is a deep copy; the new array
--    should be freed by first freeing each string, then the array itself. g_strfreev()
--    does this for you. If called on a NULL value, g_strdupv() simply returns NULL.

--    str_array : NULL-terminated array of strings.
--    Returns :   a new NULL-terminated array of strings.

--    ---------------------------------------------------------------------------------

--   g_strnfill ()

--  gchar*      g_strnfill                      (gsize length,
--                                               gchar fill_char);

--    Creates a new string length characters long filled with fill_char. The returned
--    string should be freed when no longer needed.

--    length :    the length of the new string.
--    fill_char : the character to fill the string with.
--    Returns :   a newly-allocated string filled the fill_char.

--    ---------------------------------------------------------------------------------

--   g_stpcpy ()

--  gchar*      g_stpcpy                        (gchar *dest,
--                                               const char *src);

--    Copies a nul-terminated string into the dest buffer, include the trailing nul,
--    and return a pointer to the trailing nul byte. This is useful for concatenating
--    multiple strings together without having to repeatedly scan for the end.

--    dest :    destination buffer.
--    src :     source string.
--    Returns : a pointer to trailing nul byte.

--    ---------------------------------------------------------------------------------

--   g_strstr_len ()

--  gchar*      g_strstr_len                    (const gchar *haystack,
--                                               gssize haystack_len,
--                                               const gchar *needle);

--    Searches the string haystack for the first occurrence of the string needle,
--    limiting the length of the search to haystack_len.

--    haystack :     a string.
--    haystack_len : the maximum length of haystack.
--    needle :       the string to search for.
--    Returns :      a pointer to the found occurrence, or NULL if not found.

--    ---------------------------------------------------------------------------------

--   g_strrstr ()

--  gchar*      g_strrstr                       (const gchar *haystack,
--                                               const gchar *needle);

--    Searches the string haystack for the last occurrence of the string needle.

--    haystack : a nul-terminated string.
--    needle :   the nul-terminated string to search for.
--    Returns :  a pointer to the found occurrence, or NULL if not found.

--    ---------------------------------------------------------------------------------

--   g_strrstr_len ()

--  gchar*      g_strrstr_len                   (const gchar *haystack,
--                                               gssize haystack_len,
--                                               const gchar *needle);

--    Searches the string haystack for the last occurrence of the string needle,
--    limiting the length of the search to haystack_len.

--    haystack :     a nul-terminated string.
--    haystack_len : the maximum length of haystack.
--    needle :       the nul-terminated string to search for.
--    Returns :      a pointer to the found occurrence, or NULL if not found.

--    ---------------------------------------------------------------------------------

--   g_str_has_prefix ()

--  gboolean    g_str_has_prefix                (const gchar *str,
--                                               const gchar *prefix);

--    Looks whether the string str begins with prefix.

--    str :     a nul-terminated string.
--    prefix :  the nul-terminated prefix to look for.
--    Returns : TRUE if str begins with prefix, FALSE otherwise.

--    Since 2.2

--    ---------------------------------------------------------------------------------

--   g_str_has_suffix ()

--  gboolean    g_str_has_suffix                (const gchar *str,
--                                               const gchar *suffix);

--    Looks whether the string str ends with suffix.

--    str :     a nul-terminated string.
--    suffix :  the nul-terminated suffix to look for.
--    Returns : TRUE if str end with suffix, FALSE otherwise.

--    Since 2.2

--    ---------------------------------------------------------------------------------

--   g_strlcpy ()

--  gsize       g_strlcpy                       (gchar *dest,
--                                               const gchar *src,
--                                               gsize dest_size);

--    Portability wrapper that calls strlcpy() on systems which have it, and emulates
--    strlcpy() otherwise. Copies src to dest; dest is guaranteed to be nul-terminated;
--    src must be nul-terminated; dest_size is the buffer size, not the number of chars
--    to copy. Caveat: strlcpy() is supposedly more secure than strcpy() or strncpy(),
--    but if you really want to avoid screwups, g_strdup() is an even better idea.

--    dest :      destination buffer
--    src :       source buffer
--    dest_size : length of dest in bytes
--    Returns :   length of src

--    ---------------------------------------------------------------------------------

--   g_strlcat ()

--  gsize       g_strlcat                       (gchar *dest,
--                                               const gchar *src,
--                                               gsize dest_size);

--    Portability wrapper that calls strlcat() on systems which have it, and emulates
--    it otherwise. Appends nul-terminated src string to dest, guaranteeing
--    nul-termination for dest. The total size of dest won't exceed dest_size. Caveat:
--    this is supposedly a more secure alternative to strcat() or strncat(), but for
--    real security g_strconcat() is harder to mess up.

--    dest :      destination buffer, already containing one nul-terminated string
--    src :       source buffer
--    dest_size : length of dest buffer in bytes (not length of existing string inside
--                dest)
--    Returns :   length of src plus initial length of string in dest

--    ---------------------------------------------------------------------------------

--   g_strdup_printf ()

--  gchar*      g_strdup_printf                 (const gchar *format,
--                                               ...);

--    Similar to the standard C sprintf() function but safer, since it calculates the
--    maximum space required and allocates memory to hold the result. The returned
--    string should be freed when no longer needed.

--    format :  a standard printf() format string, but notice string precision
--              pitfalls.
--    ... :     the parameters to insert into the format string.
--    Returns : a newly-allocated string holding the result.

--    ---------------------------------------------------------------------------------

--   g_strdup_vprintf ()

--  gchar*      g_strdup_vprintf                (const gchar *format,
--                                               va_list args);

--    Similar to the standard C vsprintf() function but safer, since it calculates the
--    maximum space required and allocates memory to hold the result. The returned
--    string should be freed when no longer needed.

--    See also g_vasprintf(), which offers the same functionality, but additionally
--    returns the length of the allocated string.

--    format :  a standard printf() format string, but notice string precision
--              pitfalls.
--    args :    the list of parameters to insert into the format string.
--    Returns : a newly-allocated string holding the result.

--    ---------------------------------------------------------------------------------

--   g_printf ()

--  gint        g_printf                        (gchar const *format,
--                                               ...);

--    An implementation of the standard printf() function which supports positional
--    parameters, as specified in the Single Unix Specification.

--    format :  a standard printf() format string, but notice string precision
--              pitfalls.
--    ... :     the arguments to insert in the output.
--    Returns : the number of characters printed.

--    Since 2.2

--    ---------------------------------------------------------------------------------

--   g_vprintf ()

--  gint        g_vprintf                       (gchar const *format,
--                                               va_list args);

--    An implementation of the standard vprintf() function which supports positional
--    parameters, as specified in the Single Unix Specification.

--    format :  a standard printf() format string, but notice string precision
--              pitfalls.
--    args :    the list of arguments to insert in the output.
--    Returns : the number of characters printed.

--    Since 2.2

--    ---------------------------------------------------------------------------------

--   g_fprintf ()

--  gint        g_fprintf                       (FILE *file,
--                                               gchar const *format,
--                                               ...);

--    An implementation of the standard fprintf() function which supports positional
--    parameters, as specified in the Single Unix Specification.

--    file :    the stream to write to.
--    format :  a standard printf() format string, but notice string precision
--              pitfalls.
--    ... :     the arguments to insert in the output.
--    Returns : the number of characters printed.

--    Since 2.2

--    ---------------------------------------------------------------------------------

--   g_vfprintf ()

--  gint        g_vfprintf                      (FILE *file,
--                                               gchar const *format,
--                                               va_list args);

--    An implementation of the standard fprintf() function which supports positional
--    parameters, as specified in the Single Unix Specification.

--    file :    the stream to write to.
--    format :  a standard printf() format string, but notice string precision
--              pitfalls.
--    args :    the list of arguments to insert in the output.
--    Returns : the number of characters printed.

--    Since 2.2

--    ---------------------------------------------------------------------------------

--   g_sprintf ()

--  gint        g_sprintf                       (gchar *string,
--                                               gchar const *format,
--                                               ...);

--    An implementation of the standard sprintf() function which supports positional
--    parameters, as specified in the Single Unix Specification.

--    string :  the buffer to hold the output.
--    format :  a standard printf() format string, but notice string precision
--              pitfalls.
--    ... :     the arguments to insert in the output.
--    Returns : the number of characters printed.

--    Since 2.2

--    ---------------------------------------------------------------------------------

--   g_vsprintf ()

--  gint        g_vsprintf                      (gchar *string,
--                                               gchar const *format,
--                                               va_list args);

--    An implementation of the standard vsprintf() function which supports positional
--    parameters, as specified in the Single Unix Specification.

--    string :  the buffer to hold the output.
--    format :  a standard printf() format string, but notice string precision
--              pitfalls.
--    args :    the list of arguments to insert in the output.
--    Returns : the number of characters printed.

--    Since 2.2

--    ---------------------------------------------------------------------------------

--   g_snprintf ()

--  gint        g_snprintf                      (gchar *string,
--                                               gulong n,
--                                               gchar const *format,
--                                               ...);

--    A safer form of the standard sprintf() function. The output is guaranteed to not
--    exceed n characters (including the terminating nul character), so it is easy to
--    ensure that a buffer overflow cannot occur.

--    See also g_strdup_printf().

--    In versions of GLib prior to 1.2.3, this function may return -1 if the output was
--    truncated, and the truncated string may not be nul-terminated. In versions prior
--    to 1.3.12, this function returns the length of the output string.

--    The return value of g_snprintf() conforms to the snprintf() function as
--    standardized in ISO C99. Note that this is different from traditional snprintf(),
--    which returns the length of the output string.

--    The format string may contain positional parameters, as specified in the Single
--    Unix Specification.

--    string :  the buffer to hold the output.
--    n :       the maximum number of characters to produce (including the terminating
--              nul character).
--    format :  a standard printf() format string, but notice string precision
--              pitfalls.
--    ... :     the arguments to insert in the output.
--    Returns : the number of characters which would be produced if the buffer was
--              large enough.

--    ---------------------------------------------------------------------------------

--   g_vsnprintf ()

--  gint        g_vsnprintf                     (gchar *string,
--                                               gulong n,
--                                               gchar const *format,
--                                               va_list args);

--    A safer form of the standard vsprintf() function. The output is guaranteed to not
--    exceed n characters (including the terminating nul character), so it is easy to
--    ensure that a buffer overflow cannot occur.

--    See also g_strdup_vprintf().

--    In versions of GLib prior to 1.2.3, this function may return -1 if the output was
--    truncated, and the truncated string may not be nul-terminated. In versions prior
--    to 1.3.12, this function returns the length of the output string.

--    The return value of g_vsnprintf() conforms to the vsnprintf() function as
--    standardized in ISO C99. Note that this is different from traditional
--    vsnprintf(), which returns the length of the output string.

--    The format string may contain positional parameters, as specified in the Single
--    Unix Specification.

--    string :  the buffer to hold the output.
--    n :       the maximum number of characters to produce (including the terminating
--              nul character).
--    format :  a standard printf() format string, but notice string precision
--              pitfalls.
--    args :    the list of arguments to insert in the output.
--    Returns : the number of characters which would be produced if the buffer was
--              large enough.

--    ---------------------------------------------------------------------------------

--   g_vasprintf ()

--  gint        g_vasprintf                     (gchar **string,
--                                               gchar const *format,
--                                               va_list args);

--    An implementation of the GNU vasprintf() function which supports positional
--    parameters, as specified in the Single Unix Specification. This function is
--    similar to g_vsprintf(), except that it allocates a string to hold the output,
--    instead of putting the output in a buffer you allocate in advance.

--    string :  the return location for the newly-allocated string.
--    format :  a standard printf() format string, but notice string precision
--              pitfalls.
--    args :    the list of arguments to insert in the output.
--    Returns : the number of characters printed.

--    Since 2.4

--    ---------------------------------------------------------------------------------

--   g_printf_string_upper_bound ()

--  gsize       g_printf_string_upper_bound     (const gchar *format,
--                                               va_list args);

--    Calculates the maximum space needed to store the output of the sprintf()
--    function.

--    format :  the format string. See the printf() documentation.
--    args :    the parameters to be inserted into the format string.
--    Returns : the maximum space needed to store the formatted string.

--    ---------------------------------------------------------------------------------

--   g_ascii_isalnum ()

--  gboolean    g_ascii_isalnum                 (gchar c);

--    Determines whether a character is alphanumeric.

--    Unlike the standard C library isalnum() function, this only recognizes standard
--    ASCII letters and ignores the locale, returning FALSE for all non-ASCII
--    characters. Also unlike the standard library function, this takes a char, not an
--    int, so don't call it on EOF but no need to cast to guchar before passing a
--    possibly non-ASCII character in.

--    c :       any character
--    Returns : TRUE if c is an ASCII alphanumeric character

--    ---------------------------------------------------------------------------------

--   g_ascii_isalpha ()

--  gboolean    g_ascii_isalpha                 (gchar c);

--    Determines whether a character is alphabetic (i.e. a letter).

--    Unlike the standard C library isalpha() function, this only recognizes standard
--    ASCII letters and ignores the locale, returning FALSE for all non-ASCII
--    characters. Also unlike the standard library function, this takes a char, not an
--    int, so don't call it on EOF but no need to cast to guchar before passing a
--    possibly non-ASCII character in.

--    c :       any character
--    Returns : TRUE if c is an ASCII alphabetic character

--    ---------------------------------------------------------------------------------

--   g_ascii_iscntrl ()

--  gboolean    g_ascii_iscntrl                 (gchar c);

--    Determines whether a character is a control character.

--    Unlike the standard C library iscntrl() function, this only recognizes standard
--    ASCII control characters and ignores the locale, returning FALSE for all
--    non-ASCII characters. Also unlike the standard library function, this takes a
--    char, not an int, so don't call it on EOF but no need to cast to guchar before
--    passing a possibly non-ASCII character in.

--    c :       any character
--    Returns : TRUE if c is an ASCII control character.

--    ---------------------------------------------------------------------------------

--   g_ascii_isdigit ()

--  gboolean    g_ascii_isdigit                 (gchar c);

--    Determines whether a character is digit (0-9).

--    Unlike the standard C library isdigit() function, this takes a char, not an int,
--    so don't call it on EOF but no need to cast to guchar before passing a possibly
--    non-ASCII character in.

--    c :       any character
--    Returns : TRUE if c is an ASCII digit.

--    ---------------------------------------------------------------------------------

--   g_ascii_isgraph ()

--  gboolean    g_ascii_isgraph                 (gchar c);

--    Determines whether a character is a printing character and not a space.

--    Unlike the standard C library isgraph() function, this only recognizes standard
--    ASCII characters and ignores the locale, returning FALSE for all non-ASCII
--    characters. Also unlike the standard library function, this takes a char, not an
--    int, so don't call it on EOF but no need to cast to guchar before passing a
--    possibly non-ASCII character in.

--    c :       any character
--    Returns : TRUE if c is an ASCII printing character other than space.

--    ---------------------------------------------------------------------------------

--   g_ascii_islower ()

--  gboolean    g_ascii_islower                 (gchar c);

--    Determines whether a character is an ASCII lower case letter.

--    Unlike the standard C library islower() function, this only recognizes standard
--    ASCII letters and ignores the locale, returning FALSE for all non-ASCII
--    characters. Also unlike the standard library function, this takes a char, not an
--    int, so don't call it on EOF but no need to worry about casting to guchar before
--    passing a possibly non-ASCII character in.

--    c :       any character
--    Returns : TRUE if c is an ASCII lower case letter

--    ---------------------------------------------------------------------------------

--   g_ascii_isprint ()

--  gboolean    g_ascii_isprint                 (gchar c);

--    Determines whether a character is a printing character.

--    Unlike the standard C library isprint() function, this only recognizes standard
--    ASCII characters and ignores the locale, returning FALSE for all non-ASCII
--    characters. Also unlike the standard library function, this takes a char, not an
--    int, so don't call it on EOF but no need to cast to guchar before passing a
--    possibly non-ASCII character in.

--    c :       any character
--    Returns : TRUE if c is an ASCII printing character.

--    ---------------------------------------------------------------------------------

--   g_ascii_ispunct ()

--  gboolean    g_ascii_ispunct                 (gchar c);

--    Determines whether a character is a punctuation character.

--    Unlike the standard C library ispunct() function, this only recognizes standard
--    ASCII letters and ignores the locale, returning FALSE for all non-ASCII
--    characters. Also unlike the standard library function, this takes a char, not an
--    int, so don't call it on EOF but no need to cast to guchar before passing a
--    possibly non-ASCII character in.

--    c :       any character
--    Returns : TRUE if c is an ASCII punctuation character.

--    ---------------------------------------------------------------------------------

--   g_ascii_isspace ()

--  gboolean    g_ascii_isspace                 (gchar c);

--    Determines whether a character is a white-space character.

--    Unlike the standard C library isspace() function, this only recognizes standard
--    ASCII white-space and ignores the locale, returning FALSE for all non-ASCII
--    characters. Also unlike the standard library function, this takes a char, not an
--    int, so don't call it on EOF but no need to cast to guchar before passing a
--    possibly non-ASCII character in.

--    c :       any character
--    Returns : TRUE if c is an ASCII white-space character

--    ---------------------------------------------------------------------------------

--   g_ascii_isupper ()

--  gboolean    g_ascii_isupper                 (gchar c);

--    Determines whether a character is an ASCII upper case letter.

--    Unlike the standard C library isupper() function, this only recognizes standard
--    ASCII letters and ignores the locale, returning FALSE for all non-ASCII
--    characters. Also unlike the standard library function, this takes a char, not an
--    int, so don't call it on EOF but no need to worry about casting to guchar before
--    passing a possibly non-ASCII character in.

--    c :       any character
--    Returns : TRUE if c is an ASCII upper case letter

--    ---------------------------------------------------------------------------------

--   g_ascii_isxdigit ()

--  gboolean    g_ascii_isxdigit                (gchar c);

--    Determines whether a character is a hexadecimal-digit character.

--    Unlike the standard C library isxdigit() function, this takes a char, not an int,
--    so don't call it on EOF but no need to cast to guchar before passing a possibly
--    non-ASCII character in.

--    c :       any character
--    Returns : TRUE if c is an ASCII hexadecimal-digit character.

--    ---------------------------------------------------------------------------------

--   g_ascii_digit_value ()

--  gint        g_ascii_digit_value             (gchar c);

--    Determines the numeric value of a character as a decimal digit. Differs from
--    g_unichar_digit_value() because it takes a char, so there's no worry about sign
--    extension if characters are signed.

--    c :       an ASCII character.
--    Returns : If c is a decimal digit (according to g_ascii_isdigit()), its numeric
--              value. Otherwise, -1.

--    ---------------------------------------------------------------------------------

--   g_ascii_xdigit_value ()

--  gint        g_ascii_xdigit_value            (gchar c);

--    Determines the numeric value of a character as a hexidecimal digit. Differs from
--    g_unichar_xdigit_value() because it takes a char, so there's no worry about sign
--    extension if characters are signed.

--    c :       an ASCII character.
--    Returns : If c is a hex digit (according to g_ascii_isxdigit()), its numeric
--              value. Otherwise, -1.

--    ---------------------------------------------------------------------------------

--   g_ascii_strcasecmp ()

--  gint        g_ascii_strcasecmp              (const gchar *s1,
--                                               const gchar *s2);

--    Compare two strings, ignoring the case of ASCII characters.

--    Unlike the BSD strcasecmp() function, this only recognizes standard ASCII letters
--    and ignores the locale, treating all non-ASCII bytes as if they are not letters.

--    This function should be used only on strings that are known to be in encodings
--    where the bytes corresponding to ASCII letters always represent themselves. This
--    includes UTF-8 and the ISO-8859-* charsets, but not for instance double-byte
--    encodings like the Windows Codepage 932, where the trailing bytes of double-byte
--    characters include all ASCII letters. If you compare two CP932 strings using this
--    function, you will get false matches.

--    s1 :      string to compare with s2.
--    s2 :      string to compare with s1.
--    Returns : 0 if the strings match, a negative value if s1 < s2, or a positive
--              value if s1 > s2.

--    ---------------------------------------------------------------------------------

--   g_ascii_strncasecmp ()

--  gint        g_ascii_strncasecmp             (const gchar *s1,
--                                               const gchar *s2,
--                                               gsize n);

--    Compare s1 and s2, ignoring the case of ASCII characters and any characters after
--    the first n in each string.

--    Unlike the BSD strcasecmp() function, this only recognizes standard ASCII letters
--    and ignores the locale, treating all non-ASCII characters as if they are not
--    letters.

--    The same warning as in g_ascii_strcasecmp() applies: Use this function only on
--    strings known to be in encodings where bytes corresponding to ASCII letters
--    always represent themselves.

--    s1 :      string to compare with s2.
--    s2 :      string to compare with s1.
--    n :       number of characters to compare.
--    Returns : 0 if the strings match, a negative value if s1 < s2, or a positive
--              value if s1 > s2.

--    ---------------------------------------------------------------------------------

--   g_ascii_strup ()

--  gchar*      g_ascii_strup                   (const gchar *str,
--                                               gssize len);

--    Converts all lower case ASCII letters to upper case ASCII letters.

--    str :     a string.
--    len :     length of str in bytes, or -1 if str is nul-terminated.
--    Returns : a newly allocated string, with all the lower case characters in str
--              converted to upper case, with semantics that exactly match
--              g_ascii_toupper(). (Note that this is unlike the old g_strup(), which
--              modified the string in place.)

--    ---------------------------------------------------------------------------------

--   g_ascii_strdown ()

--  gchar*      g_ascii_strdown                 (const gchar *str,
--                                               gssize len);

--    Converts all upper case ASCII letters to lower case ASCII letters.

--    str :     a string.
--    len :     length of str in bytes, or -1 if str is nul-terminated.
--    Returns : a newly-allocated string, with all the upper case characters in str
--              converted to lower case, with semantics that exactly match
--              g_ascii_tolower(). (Note that this is unlike the old g_strdown(), which
--              modified the string in place.)

--    ---------------------------------------------------------------------------------

--   g_ascii_tolower ()

--  gchar       g_ascii_tolower                 (gchar c);

--    Convert a character to ASCII lower case.

--    Unlike the standard C library tolower() function, this only recognizes standard
--    ASCII letters and ignores the locale, returning all non-ASCII characters
--    unchanged, even if they are lower case letters in a particular character set.
--    Also unlike the standard library function, this takes and returns a char, not an
--    int, so don't call it on EOF but no need to worry about casting to guchar before
--    passing a possibly non-ASCII character in.

--    c :       any character.
--    Returns : the result of converting c to lower case. If c is not an ASCII upper
--              case letter, c is returned unchanged.

--    ---------------------------------------------------------------------------------

--   g_ascii_toupper ()

--  gchar       g_ascii_toupper                 (gchar c);

--    Convert a character to ASCII upper case.

--    Unlike the standard C library toupper() function, this only recognizes standard
--    ASCII letters and ignores the locale, returning all non-ASCII characters
--    unchanged, even if they are upper case letters in a particular character set.
--    Also unlike the standard library function, this takes and returns a char, not an
--    int, so don't call it on EOF but no need to worry about casting to guchar before
--    passing a possibly non-ASCII character in.

--    c :       any character.
--    Returns : the result of converting c to upper case. If c is not an ASCII lower
--              case letter, c is returned unchanged.

--    ---------------------------------------------------------------------------------

--   g_string_ascii_up ()

--  GString*    g_string_ascii_up               (GString *string);

--    Converts all lower case ASCII letters to upper case ASCII letters.

--    string :  a GString
--    Returns : passed-in string pointer, with all the lower case characters converted
--              to upper case in place, with semantics that exactly match
--              g_ascii_toupper.

--    ---------------------------------------------------------------------------------

--   g_string_ascii_down ()

--  GString*    g_string_ascii_down             (GString *string);

--    Converts all upper case ASCII letters to lower case ASCII letters.

--    string :  a GString
--    Returns : passed-in string pointer, with all the upper case characters converted
--              to lower case in place, with semantics that exactly match
--              g_ascii_tolower.

--    ---------------------------------------------------------------------------------

--   g_strup ()

--  gchar*      g_strup                         (gchar *string);

--   Warning

--    g_strup has been deprecated since version 2.2 and should not be used in
--    newly-written code. This function is totally broken for the reasons discussed in
--    the g_strncasecmp() docs - use g_ascii_strup() or g_utf8_strup() instead.

--    Converts a string to upper case.

--    string :  the string to convert.
--    Returns : the string

--    ---------------------------------------------------------------------------------

--   g_strdown ()

--  gchar*      g_strdown                       (gchar *string);

--   Warning

--    g_strdown has been deprecated since version 2.2 and should not be used in
--    newly-written code. This function is totally broken for the reasons discussed in
--    the g_strncasecmp() docs - use g_ascii_strdown() or g_utf8_strdown() instead.

--    Converts a string to lower case.

--    string :  the string to convert.
--    Returns : the string

--    ---------------------------------------------------------------------------------

--   g_strcasecmp ()

--  gint        g_strcasecmp                    (const gchar *s1,
--                                               const gchar *s2);

--   Warning

--    g_strcasecmp has been deprecated since version 2.2 and should not be used in
--    newly-written code. See g_strncasecmp() for a discussion of why this function is
--    deprecated and how to replace it.

--    A case-insensitive string comparison, corresponding to the standard strcasecmp()
--    function on platforms which support it.

--    s1 :      a string.
--    s2 :      a string to compare with s1.
--    Returns : 0 if the strings match, a negative value if s1 < s2, or a positive
--              value if s1 > s2.

--    ---------------------------------------------------------------------------------

--   g_strncasecmp ()

--  gint        g_strncasecmp                   (const gchar *s1,
--                                               const gchar *s2,
--                                               guint n);

--   Warning

--    g_strncasecmp has been deprecated since version 2.2 and should not be used in
--    newly-written code. The problem with g_strncasecmp() is that it does the
--    comparison by calling toupper()/tolower(). These functions are locale-specific
--    and operate on single bytes. However, it is impossible to handle things correctly
--    from an I18N standpoint by operating on bytes, since characters may be multibyte.
--    Thus g_strncasecmp() is broken if your string is guaranteed to be ASCII, since
--    it's locale-sensitive, and it's broken if your string is localized, since it
--    doesn't work on many encodings at all, including UTF-8, EUC-JP, etc.

--    There are therefore two replacement functions: g_ascii_strncasecmp(), which only
--    works on ASCII and is not locale-sensitive, and g_utf8_casefold(), which is good
--    for case-insensitive sorting of UTF-8.

--    A case-insensitive string comparison, corresponding to the standard strncasecmp()
--    function on platforms which support it. It is similar to g_strcasecmp() except it
--    only compares the first n characters of the strings.

--    s1 :      a string.
--    s2 :      a string to compare with s1.
--    n :       the maximum number of characters to compare.
--    Returns : 0 if the strings match, a negative value if s1 < s2, or a positive
--              value if s1 > s2.

--    ---------------------------------------------------------------------------------

--   g_strreverse ()

--  gchar*      g_strreverse                    (gchar *string);

--    Reverses all of the bytes in a string. For example, g_strreverse ("abcdef") will
--    result in "fedcba".

--    Note that g_strreverse() doesn't work on UTF-8 strings containing multibyte
--    characters. For that purpose, use g_utf8_strreverse().

--    string :  the string to reverse.
--    Returns : the same pointer passed in as string.

--    ---------------------------------------------------------------------------------

--   g_ascii_strtoll ()

--  gint64      g_ascii_strtoll                 (const gchar *nptr,
--                                               gchar **endptr,
--                                               guint base);

--    Converts a string to a gint64 value. This function behaves like the standard
--    strtoll() function does in the C locale. It does this without actually changing
--    the current locale, since that would not be thread-safe.

--    This function is typically used when reading configuration files or other
--    non-user input that should be locale independent. To handle input from the user
--    you should normally use the locale-sensitive system strtoll() function.

--    If the correct value would cause overflow, G_MAXINT64 or G_MININT64 is returned,
--    and ERANGE is stored in errno. If the base is outside the valid range, zero is
--    returned, and EINVAL is stored in errno. If the string conversion fails, zero is
--    returned, and endptr returns nptr (if endptr is non-NULL).

--    nptr :    the string to convert to a numeric value.
--    endptr :  if non-NULL, it returns the character after the last character used in
--              the conversion.
--    base :    to be used for the conversion, 2..36 or 0
--    Returns : the gint64 value or zero on error.

--    Since 2.12

--    ---------------------------------------------------------------------------------

--   g_ascii_strtoull ()

--  guint64     g_ascii_strtoull                (const gchar *nptr,
--                                               gchar **endptr,
--                                               guint base);

--    Converts a string to a guint64 value. This function behaves like the standard
--    strtoull() function does in the C locale. It does this without actually changing
--    the current locale, since that would not be thread-safe.

--    This function is typically used when reading configuration files or other
--    non-user input that should be locale independent. To handle input from the user
--    you should normally use the locale-sensitive system strtoull() function.

--    If the correct value would cause overflow, G_MAXUINT64 is returned, and ERANGE is
--    stored in errno. If the base is outside the valid range, zero is returned, and
--    EINVAL is stored in errno. If the string conversion fails, zero is returned, and
--    endptr returns nptr (if endptr is non-NULL).

--    nptr :    the string to convert to a numeric value.
--    endptr :  if non-NULL, it returns the character after the last character used in
--              the conversion.
--    base :    to be used for the conversion, 2..36 or 0
--    Returns : the guint64 value or zero on error.

--    Since 2.2

--    ---------------------------------------------------------------------------------

--   G_ASCII_DTOSTR_BUF_SIZE

--  #define G_ASCII_DTOSTR_BUF_SIZE (29 + 10)

--    A good size for a buffer to be passed into g_ascii_dtostr(). It is guaranteed to
--    be enough for all output of that function on systems with 64bit IEEE-compatible
--    doubles.

--    The typical usage would be something like:

--    char buf[G_ASCII_DTOSTR_BUF_SIZE];

--    fprintf (out, "value=%s\n", g_ascii_dtostr (buf, sizeof (buf), value));

--    ---------------------------------------------------------------------------------

--   g_ascii_strtod ()

--  gdouble     g_ascii_strtod                  (const gchar *nptr,
--                                               gchar **endptr);

--    Converts a string to a gdouble value. This function behaves like the standard
--    strtod() function does in the C locale. It does this without actually changing
--    the current locale, since that would not be thread-safe.

--    This function is typically used when reading configuration files or other
--    non-user input that should be locale independent. To handle input from the user
--    you should normally use the locale-sensitive system strtod() function.

--    To convert from a gdouble to a string in a locale-insensitive way, use
--    g_ascii_dtostr().

--    If the correct value would cause overflow, plus or minus HUGE_VAL is returned
--    (according to the sign of the value), and ERANGE is stored in errno. If the
--    correct value would cause underflow, zero is returned and ERANGE is stored in
--    errno.

--    This function resets errno before calling strtod() so that you can reliably
--    detect overflow and underflow.

--    nptr :    the string to convert to a numeric value.
--    endptr :  if non-NULL, it returns the character after the last character used in
--              the conversion.
--    Returns : the gdouble value.

--    ---------------------------------------------------------------------------------

--   g_ascii_dtostr ()

--  gchar*      g_ascii_dtostr                  (gchar *buffer,
--                                               gint buf_len,
--                                               gdouble d);

--    Converts a gdouble to a string, using the '.' as decimal point.

--    This functions generates enough precision that converting the string back using
--    g_ascii_strtod() gives the same machine-number (on machines with IEEE compatible
--    64bit doubles). It is guaranteed that the size of the resulting string will never
--    be larger than G_ASCII_DTOSTR_BUF_SIZE bytes.

--    buffer :  A buffer to place the resulting string in
--    buf_len : The length of the buffer.
--    d :       The gdouble to convert
--    Returns : The pointer to the buffer with the converted string.

--    ---------------------------------------------------------------------------------

--   g_ascii_formatd ()

--  gchar*      g_ascii_formatd                 (gchar *buffer,
--                                               gint buf_len,
--                                               const gchar *format,
--                                               gdouble d);

--    Converts a gdouble to a string, using the '.' as decimal point. To format the
--    number you pass in a printf()-style format string. Allowed conversion specifiers
--    are 'e', 'E', 'f', 'F', 'g' and 'G'.

--    If you just want to want to serialize the value into a string, use
--    g_ascii_dtostr().

--    buffer :  A buffer to place the resulting string in
--    buf_len : The length of the buffer.
--    format :  The printf()-style format to use for the code to use for converting.
--    d :       The gdouble to convert
--    Returns : The pointer to the buffer with the converted string.

--    ---------------------------------------------------------------------------------

--   g_strtod ()

--  gdouble     g_strtod                        (const gchar *nptr,
--                                               gchar **endptr);

--    Converts a string to a gdouble value. It calls the standard strtod() function to
--    handle the conversion, but if the string is not completely converted it attempts
--    the conversion again with g_ascii_strtod(), and returns the best match.

--    This function should seldomly be used. The normal situation when reading numbers
--    not for human consumption is to use g_ascii_strtod(). Only when you know that you
--    must expect both locale formatted and C formatted numbers should you use this.
--    Make sure that you don't pass strings such as comma separated lists of values,
--    since the commas may be interpreted as a decimal point in some locales, causing
--    unexpected results.

--    nptr :    the string to convert to a numeric value.
--    endptr :  if non-NULL, it returns the character after the last character used in
--              the conversion.
--    Returns : the gdouble value.

--    ---------------------------------------------------------------------------------

--   g_strchug ()

--  gchar*      g_strchug                       (gchar *string);

--    Removes leading whitespace from a string, by moving the rest of the characters
--    forward.

--    This function doesn't allocate or reallocate any memory; it modifies string in
--    place. The pointer to string is returned to allow the nesting of functions.

--    Also see g_strchomp() and g_strstrip().

--    string :  a string to remove the leading whitespace from.
--    Returns : string.

--    ---------------------------------------------------------------------------------

--   g_strchomp ()

--  gchar*      g_strchomp                      (gchar *string);

--    Removes trailing whitespace from a string.

--    This function doesn't allocate or reallocate any memory; it modifies string in
--    place. The pointer to string is returned to allow the nesting of functions.

--    Also see g_strchug() and g_strstrip().

--    string :  a string to remove the trailing whitespace from.
--    Returns : string.

--    ---------------------------------------------------------------------------------

--   g_strstrip()

--  #define     g_strstrip( string )

--    Removes leading and trailing whitespace from a string. See g_strchomp() and
--    g_strchug().

--    string : a string to remove the leading and trailing whitespace from.

--    ---------------------------------------------------------------------------------

--   g_strdelimit ()

--  gchar*      g_strdelimit                    (gchar *string,
--                                               const gchar *delimiters,
--                                               gchar new_delimiter);

--    Converts any delimiter characters in string to new_delimiter. Any characters in
--    string which are found in delimiters are changed to the new_delimiter character.
--    Modifies string in place, and returns string itself, not a copy. The return value
--    is to allow nesting such as g_ascii_strup (g_strdelimit (str, "abc", '?')).

--    string :        the string to convert.
--    delimiters :    a string containing the current delimiters, or NULL to use the
--                    standard delimiters defined in G_STR_DELIMITERS.
--    new_delimiter : the new delimiter character.
--    Returns :       string.

--    ---------------------------------------------------------------------------------

--   G_STR_DELIMITERS

--  #define  G_STR_DELIMITERS       "_-|> <."

--    The standard delimiters, used in g_strdelimit().

--    ---------------------------------------------------------------------------------

--   g_strescape ()

--  gchar*      g_strescape                     (const gchar *source,
--                                               const gchar *exceptions);

--    Escapes the special characters '\b', '\f', '\n', '\r', '\t', '\' and '"' in the
--    string source by inserting a '\' before them. Additionally all characters in the
--    range 0x01-0x1F (everything below SPACE) and in the range 0x7F-0xFF (all
--    non-ASCII chars) are replaced with a '\' followed by their octal representation.
--    Characters supplied in exceptions are not escaped.

--    g_strcompress() does the reverse conversion.

--    source :     a string to escape.
--    exceptions : a string of characters not to escape in source.
--    Returns :    a newly-allocated copy of source with certain characters escaped.
--                 See above.

--    ---------------------------------------------------------------------------------

--   g_strcompress ()

--  gchar*      g_strcompress                   (const gchar *source);

--    Replaces all escaped characters with their one byte equivalent. It does the
--    reverse conversion of g_strescape().

--    source :  a string to compress.
--    Returns : a newly-allocated copy of source with all escaped character compressed.

--    ---------------------------------------------------------------------------------

--   g_strcanon ()

--  gchar*      g_strcanon                      (gchar *string,
--                                               const gchar *valid_chars,
--                                               gchar substitutor);

--    For each character in string, if the character is not in valid_chars, replaces
--    the character with substitutor. Modifies string in place, and return string
--    itself, not a copy. The return value is to allow nesting such as g_ascii_strup
--    (g_strcanon (str, "abc", '?')).

--    string :      a nul-terminated array of bytes.
--    valid_chars : bytes permitted in string.
--    substitutor : replacement character for disallowed bytes.
--    Returns :     string.

--    ---------------------------------------------------------------------------------

--   g_strsplit ()

--  gchar**     g_strsplit                      (const gchar *string,
--                                               const gchar *delimiter,
--                                               gint max_tokens);

--    Splits a string into a maximum of max_tokens pieces, using the given delimiter.
--    If max_tokens is reached, the remainder of string is appended to the last token.

--    As a special case, the result of splitting the empty string "" is an empty
--    vector, not a vector containing a single string. The reason for this special case
--    is that being able to represent a empty vector is typically more useful than
--    consistent handling of empty elements. If you do need to represent empty
--    elements, you'll need to check for the empty string before calling g_strsplit().

--    string :     a string to split.
--    delimiter :  a string which specifies the places at which to split the string.
--                 The delimiter is not included in any of the resulting strings,
--                 unless max_tokens is reached.
--    max_tokens : the maximum number of pieces to split string into. If this is less
--                 than 1, the string is split completely.
--    Returns :    a newly-allocated NULL-terminated array of strings. Use g_strfreev()
--                 to free it.

--    ---------------------------------------------------------------------------------

--   g_strsplit_set ()

--  gchar**     g_strsplit_set                  (const gchar *string,
--                                               const gchar *delimiters,
--                                               gint max_tokens);

--    Splits string into a number of tokens not containing any of the characters in
--    delimiter. A token is the (possibly empty) longest string that does not contain
--    any of the characters in delimiters. If max_tokens is reached, the remainder is
--    appended to the last token.

--    For example the result of g_strsplit_set ("abc:def/ghi", ":/", -1) is a
--    NULL-terminated vector containing the three strings "abc", "def", and "ghi".

--    The result if g_strsplit_set (":def/ghi:", ":/", -1) is a NULL-terminated vector
--    containing the four strings "", "def", "ghi", and "".

--    As a special case, the result of splitting the empty string "" is an empty
--    vector, not a vector containing a single string. The reason for this special case
--    is that being able to represent a empty vector is typically more useful than
--    consistent handling of empty elements. If you do need to represent empty
--    elements, you'll need to check for the empty string before calling
--    g_strsplit_set().

--    Note that this function works on bytes not characters, so it can't be used to
--    delimit UTF-8 strings for anything but ASCII characters.

--    string :     The string to be tokenized
--    delimiters : A nul-terminated string containing bytes that are used to split the
--                 string.
--    max_tokens : The maximum number of tokens to split string into. If this is less
--                 than 1, the string is split completely
--    Returns :    a newly-allocated NULL-terminated array of strings. Use g_strfreev()
--                 to free it.

--    Since 2.4

--    ---------------------------------------------------------------------------------

--   g_strfreev ()

--  void        g_strfreev                      (gchar **str_array);

--    Frees a NULL-terminated array of strings, and the array itself. If called on a
--    NULL value, g_strfreev() simply returns.

--    str_array : a NULL-terminated array of strings to free.

--    ---------------------------------------------------------------------------------

--   g_strconcat ()

--  gchar*      g_strconcat                     (const gchar *string1,
--                                               ...);

--    Concatenates all of the given strings into one long string. The returned string
--    should be freed when no longer needed.

--   Warning

--    The variable argument list must end with NULL. If you forget the NULL,
--    g_strconcat() will start appending random memory junk to your string.

--    string1 : The first string to add, which must not be NULL.
--    ... :     a NULL-terminated list of strings to append to the string.
--    Returns : a newly-allocated string containing all the string arguments.

--    ---------------------------------------------------------------------------------

--   g_strjoin ()

--  gchar*      g_strjoin                       (const gchar *separator,
--                                               ...);

--    Joins a number of strings together to form one long string, with the optional
--    separator inserted between each of them.

--    separator : a string to insert between each of the strings, or NULL.
--    ... :       a NULL-terminated list of strings to join.
--    Returns :   a newly-allocated string containing all of the strings joined
--                together, with separator between them.

--    ---------------------------------------------------------------------------------

--   g_strjoinv ()

--  gchar*      g_strjoinv                      (const gchar *separator,
--                                               gchar **str_array);

--    Joins a number of strings together to form one long string, with the optional
--    separator inserted between each of them.

--    separator : a string to insert between each of the strings, or NULL.
--    str_array : a NULL-terminated array of strings to join.
--    Returns :   a newly-allocated string containing all of the strings joined
--                together, with separator between them.

--    ---------------------------------------------------------------------------------

--   g_strv_length ()

--  guint       g_strv_length                   (gchar **str_array);

--    Returns the length of the given NULL-terminated string array str_array.

--    str_array : a NULL-terminated array of strings.
--    Returns :   length of str_array.

--    Since 2.6

--    ---------------------------------------------------------------------------------

--   g_strerror ()

--  const gchar* g_strerror                     (gint errnum);

--    Returns a string corresponding to the given error code, e.g. "no such process".
--    This function is included since not all platforms support the strerror()
--    function.

--    errnum :  the system error number. See the standard C errno documentation.
--    Returns : a string describing the error code. If the error code is unknown, it
--              returns "unknown error (<code>)". The string can only be used until the
--              next call to g_strerror().

--    ---------------------------------------------------------------------------------

--   g_strsignal ()

--  const gchar* g_strsignal                    (gint signum);

--    Returns a string describing the given signal, e.g. "Segmentation fault". This
--    function is included since not all platforms support the strsignal() function.

--    signum :  the signal number. See the signal documentation.
--    Returns : a string describing the signal. If the signal is unknown, it returns
--              "unknown signal (<signum>)". The string can only be used until the next
--              call to g_strsignal().

end
