note
	description: "External calls to a number of functions for dealing with Unicode characters and strings."
	copyright: "Copyright (C) 2007 Paolo Redaelli, $original_copyright_holder"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GLIB_UNICODE_MANIPULATION_EXTERNALS

inherit ANY undefine is_equal, copy end

insert GLIB_BASIC_TYPES
	
feature {} -- Unicode character size
	gunichar_size: INTEGER
			-- typedef guint32 gunichar;
	
			-- A type which can hold any UCS-4 character code.
		external "C macro use <glib.h>"
		alias "sizeof(gunichar)"
		end

	gunichar2_size: INTEGER
			-- typedef guint16 gunichar2;

			-- A type which can hold any UTF-16 code point.
		external "C macro use <glib.h>"
		alias "sizeof(gunichar2)"
		end
	
	gunichar: INTEGER_32
			-- A placeholder for "typedef guint32 gunichar;"
		
			-- A type which can hold any UCS-4 character code.

			-- TODO: should ba a NATURAL_32
		do
			-- Empty by design
		ensure correct_length: Result.object_size = 4
		end

	gunichar2: INTEGER_16
			-- A placeholder for "typedef guint16 gunichar2;"

			-- A type which can hold any UTF-16 code point.

			-- TODO: should ba a NATURAL_16
		do
			-- Empty by design
		ensure correct_length:  Result.object_size = 2
		end

feature {} -- External calls
	--  #include <glib.h>
		
	--  typedef     gunichar;
	--  typedef     gunichar2;

	g_unichar_validate (a_ch: like gunichar): INTEGER
			-- gboolean g_unichar_validate (gunichar ch);
		external "C use <glib.h>"
		end
	
	g_unichar_isalnum (a_c: like gunichar): INTEGER
			-- gboolean g_unichar_isalnum (gunichar c);
		external "C use <glib.h>"
		end

	g_unichar_isalpha (a_c: like gunichar): INTEGER
			-- gboolean g_unichar_isalpha (gunichar c);
		external "C use <glib.h>"
		end

	g_unichar_iscntrl (a_c: like gunichar): INTEGER
			-- gboolean g_unichar_iscntrl (gunichar c);
		external "C use <glib.h>"
		end

	g_unichar_isdigit (a_c: like gunichar): INTEGER
			-- gboolean g_unichar_isdigit (gunichar c);
		external "C use <glib.h>"
		end

	g_unichar_isgraph (a_c: like gunichar): INTEGER
			-- gboolean g_unichar_isgraph (gunichar c);
		external "C use <glib.h>"
		end

	g_unichar_islower (a_c: like gunichar): INTEGER
			-- gboolean g_unichar_islower (gunichar c);
		external "C use <glib.h>"
		end

	g_unichar_isprint (a_c: like gunichar): INTEGER
			-- gboolean g_unichar_isprint (gunichar c);
		external "C use <glib.h>"
		end

	g_unichar_ispunct (a_c: like gunichar): INTEGER
			-- gboolean g_unichar_ispunct (gunichar c);
		external "C use <glib.h>"
		end

	g_unichar_isspace (a_c: like gunichar): INTEGER
			-- gboolean g_unichar_isspace (gunichar c);
		external "C use <glib.h>"
		end

	g_unichar_isupper (a_c: like gunichar): INTEGER
			-- gboolean g_unichar_isupper (gunichar c);
		external "C use <glib.h>"
		end

	g_unichar_isxdigit (a_c: like gunichar): INTEGER
			-- gboolean g_unichar_isxdigit (gunichar c);
		external "C use <glib.h>"
		end

	g_unichar_istitle (a_c: like gunichar): INTEGER
			-- gboolean g_unichar_istitle (gunichar c);
		external "C use <glib.h>"
		end

	g_unichar_isdefined (a_c: like gunichar): INTEGER
			-- gboolean g_unichar_isdefined (gunichar c);
		external "C use <glib.h>"
		end

	g_unichar_iswide (a_c: like gunichar): INTEGER
			-- gboolean g_unichar_iswide (gunichar c);
		external "C use <glib.h>"
		end

	g_unichar_iswide_cjk (a_c: like gunichar): INTEGER
			-- gboolean g_unichar_iswide_cjk (gunichar c);
		external "C use <glib.h>"
		end
	
	g_unichar_toupper (a_c: like gunichar): like gunichar
			-- gunichar g_unichar_toupper (gunichar c);
		external "C use <glib.h>"
		end
	
	g_unichar_tolower (a_c: like gunichar): like gunichar
			-- gunichar g_unichar_tolower (gunichar c);
		external "C use <glib.h>"
		end
	
	g_unichar_totitle (a_c: like gunichar): like gunichar
			-- gunichar g_unichar_totitle (gunichar c);
		external "C use <glib.h>"
		end

	g_unichar_digit_value (a_c: like gunichar): INTEGER
			-- gint g_unichar_digit_value (gunichar c);
		external "C use <glib.h>"
		end

	g_unichar_xdigit_value (a_c: like gunichar): INTEGER
			-- gint g_unichar_xdigit_value (gunichar c);
		external "C use <glib.h>"
		end

	g_unichar_type (a_c: like gunichar): INTEGER
			-- GUnicodeType g_unichar_type (gunichar c);
		external "C use <glib.h>"
		ensure valid_gunicode_type: -- TODO
		end

	g_unichar_break_type (a_c: like gunichar): INTEGER
			-- GUnicodeBreakType g_unichar_break_type (gunichar c);
		external "C use <glib.h>"
		ensure valid_gunicode_break_type: --TODO
		end

	g_unicode_canonical_ordering (a_string: POINTER; a_len: INTEGER)
			-- void g_unicode_canonical_ordering (gunichar *string, gsize
			-- len);
		external "C use <glib.h>"
		end

	g_unicode_canonical_decomposition (a_ch: like gunichar; a_result_len_gsize: POINTER): POINTER
			--   gunichar*   g_unicode_canonical_decomposition (gunichar ch, gsize *result_len);
		external "C use <glib.h>"
		end

	g_unichar_get_mirror_char (a_ch: like gunichar; a_mirrored_ch: POITNER): INTEGER
			-- gboolean g_unichar_get_mirror_char (gunichar ch, gunichar
			-- *mirrored_ch);
		external "C use <glib.h>"
		end

	g_utf8_next_char (a_p: POINTER): like gunichar
			-- #define g_utf8_next_char (p)
		external "C macro use <glib.h>"
		end

	g_utf8_get_char (a_p: POINTER): like gunichar
			-- gunichar g_utf8_get_char (const gchar *p);
		external "C use <glib.h>"
		end

	g_utf8_get_char_validated (a_p: POINTER; a_max_len: like gssize): like gunichar
			-- gunichar g_utf8_get_char_validated (const gchar *p, gssize max_len);
		external "C use <glib.h>"
		end

   g_utf8_offset_to_pointer (a_str: POINTER; an_offset: like glong): POINTER
			-- gchar* g_utf8_offset_to_pointer (const gchar *str, glong offset);
		external "C use <glib.h>"
		end

	g_utf8_pointer_to_offset (a_str, a_pos: POINTER): like glong
			-- glong g_utf8_pointer_to_offset (const gchar *str, const gchar *pos);
		external "C use <glib.h>"
		end

	g_utf8_prev_char (a_p: POINTER): POINTER
			-- gchar* g_utf8_prev_char (const gchar *p);
		external "C use <glib.h>"
		end

	g_utf8_find_next_char (a_p, an_end: POINTER): POINTER
			-- gchar* g_utf8_find_next_char (const gchar *p, const gchar *end);
		external "C use <glib.h>"
		end

	g_utf8_find_prev_char (a_str, a_p: POINTER): POINTER
			-- gchar* g_utf8_find_prev_char (const gchar *str, const gchar *p);
		external "C use <glib.h>"
		end

	g_utf8_strlen (a_p: POINTER; a_max: like gssize): like glong
			-- glong g_utf8_strlen (const gchar *p, gssize max);
		external "C use <glib.h>"
		end

	g_utf8_strncpy (a_dest, a_src: POINTER; an_n: like gsize): POINTER
			-- gchar* g_utf8_strncpy (gchar *dest, const gchar *src, gsize n);
		external "C use <glib.h>"
		end

	g_utf8_strchr (a_p: POINTER; a_len: like gssize; a_c: like gunichar): POINTER
			-- gchar* g_utf8_strchr (const gchar *p, gssize len, gunichar c);
		external "C use <glib.h>"
		end

	g_utf8_strrchr (a_p: POINTER; a_len: like gssize; a_c: like gunichar): POINTER
			-- gchar* g_utf8_strrchr (const gchar *p, gssize len, gunichar c);
		external "C use <glib.h>"
		end

	g_utf8_strreverse (a_str: POINTER; a_len: like gssize): POINTER
			-- gchar* g_utf8_strreverse (const gchar *str, gssize len);
		external "C use <glib.h>"
		end

   g_utf8_validate (a_str: POINTER; a_max_len: like gssize; an_end: POINTER): INTEGER
			-- gboolean g_utf8_validate (const gchar *str, gssize max_len, const
			-- gchar **end);
		external "C use <glib.h>"
		end

	g_utf8_strup (a_str: POINTER; a_len: like gssize): POINTER
			-- gchar* g_utf8_strup (const gchar *str, gssize len);
		external "C use <glib.h>"
		end

	g_utf8_strdown (a_str: POINTER; a_len: like gssize): POINTER
			-- gchar* g_utf8_strdown (const gchar *str, gssize len);
		external "C use <glib.h>"
		end

	g_utf8_casefold (a_str: POINTER; a_len: like gssize): POINTER
			-- gchar* g_utf8_casefold (const gchar *str, gssize len);
		external "C use <glib.h>"
		end
	
	g_utf8_normalize (a_str: POINTER; a_len: like gssize; a_gnormalizemode: INTEGER): POINTER
			-- gchar* g_utf8_normalize (const gchar *str, gssize len,
			-- GNormalizeMode mode);
		external "C use <glib.h>"
		end

	-- enum GNormalizeMode;

	 g_utf8_collate (a_str, a_str2: POINTER): INTEGER
			-- gint g_utf8_collate (const gchar *str1, const gchar *str2);
		external "C use <glib.h>"
		end
	
	g_utf8_collate_key (a_str: POINTER; a_len: like gssize): POINTER
			-- gchar* g_utf8_collate_key (const gchar *str, gssize len);
		external "C use <glib.h>"
		end

	g_utf8_collate_key_for_filename (a_str: POINTER; a_len: like gssize): POINTER
			-- gchar* g_utf8_collate_key_for_filename (const gchar *str, gssize
			-- len);
		external "C use <glib.h>"
		end

	g_utf8_to_utf16 (a_str: POINTER; a_len: like glong; a_items_read, aitems_written: POINTER; an_error_ref: POINTER): POINTER
			-- gunichar2* g_utf8_to_utf16 (const gchar *str, glong len, glong
			-- *items_read, glong *items_written, GError **error);
		external "C use <glib.h>"
		end

	g_utf8_to_ucs4 (a_str: POINTER; a_len: like glong; some_glong_items_read, some_glong_items_written: POINTER; a_gerror_handle: POINTER): POINTER
			-- gunichar* g_utf8_to_ucs4 (const gchar *str, glong len, glong
			-- *items_read, glong *items_written, GError **error);
		external "C use <glib.h>"
		end
	
	g_utf8_to_ucs4_fast (a_str: POINTER; a_len: like glong; some_glong_items_written: POINTER): POINTER
			-- gunichar* g_utf8_to_ucs4_fast (const gchar *str, glong len, glong
			-- *items_written);
		external "C use <glib.h>"
		end

	g_utf16_to_ucs4 (a_str: POINTER; a_len: like glong; some_glong_items_read, some_glong_items_written: POINTER; a_gerror_handle: POINTER): POINTER
			-- gunichar* g_utf16_to_ucs4 (const gunichar2 *str, glong len, glong
			-- *items_read, glong *items_written, GError **error);
		external "C use <glib.h>"
		end
	
	g_utf16_to_utf8 (a_str: POINTER; a_len: like glong; some_glong_items_read, some_glong_items_written: POINTER; a_gerror_handle: POINTER): POINTER
			-- gchar* g_utf16_to_utf8 (const gunichar2 *str, glong len, glong
			-- *items_read, glong *items_written, GError **error);
		external "C use <glib.h>"
		end
	
	 g_ucs4_to_utf16 (a_str: POINTER; a_len: like glong; some_glong_items_read, some_glong_items_written: POINTER; a_gerror_handle: POINTER): POINTER
			-- gunichar2* g_ucs4_to_utf16 (const gunichar *str, glong len, glong
			-- *items_read, glong *items_written, GError **error);
		external "C use <glib.h>"
		end
	
	g_ucs4_to_utf8 (a_str: POINTER; a_len: like glong; some_glong_items_read, some_glong_items_written: POINTER; a_gerror_handle: POINTER): POINTER
			-- gchar* g_ucs4_to_utf8 (const gunichar *str, glong len, glong
			-- *items_read, glong *items_written, GError **error);
		external "C use <glib.h>"
		end

	g_unichar_to_utf8 (a_c: like gunichar; a_outbuf: POINTER): POINTER
			-- gint g_unichar_to_utf8 (gunichar c, gchar *outbuf);
		external "C use <glib.h>"
		end
end
