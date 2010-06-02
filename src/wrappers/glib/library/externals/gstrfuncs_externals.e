-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSTRFUNCS_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_ascii_toupper (a_c: CHARACTER): CHARACTER is
 		-- g_ascii_toupper (node at line 100)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_ascii_toupper"
		}"
		end

	g_strsignal (a_signum: INTEGER_32): POINTER is
 		-- g_strsignal (node at line 202)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strsignal"
		}"
		end

	g_strdup_vprintf (a_format: POINTER; an_args: POINTER): POINTER is
 		-- g_strdup_vprintf (node at line 307)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strdup_vprintf"
		}"
		end

	g_strrstr_len (a_haystack: POINTER; a_haystack_len: INTEGER_32; a_needle: POINTER): POINTER is
 		-- g_strrstr_len (node at line 565)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strrstr_len"
		}"
		end

	g_ascii_dtostr (a_buffer: POINTER; a_buf_len: INTEGER_32; a_d: REAL_64): POINTER is
 		-- g_ascii_dtostr (node at line 958)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_ascii_dtostr"
		}"
		end

	g_strtod (a_nptr: POINTER; an_endptr: POINTER): REAL_64 is
 		-- g_strtod (node at line 1063)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strtod"
		}"
		end

	g_strreverse (a_string: POINTER): POINTER is
 		-- g_strreverse (node at line 1109)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strreverse"
		}"
		end

	g_ascii_strtoull (a_nptr: POINTER; an_endptr: POINTER; a_base: NATURAL_32): NATURAL_64 is
 		-- g_ascii_strtoull (node at line 1203)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_ascii_strtoull"
		}"
		end

	g_strlcpy (a_dest: POINTER; a_src: POINTER; a_dest_size: NATURAL_32): NATURAL_32 is
 		-- g_strlcpy (node at line 1331)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strlcpy"
		}"
		end

	g_strstr_len (a_haystack: POINTER; a_haystack_len: INTEGER_32; a_needle: POINTER): POINTER is
 		-- g_strstr_len (node at line 1355)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strstr_len"
		}"
		end

	g_dgettext (a_domain: POINTER; a_msgid: POINTER): POINTER is
 		-- g_dgettext (node at line 1360)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_dgettext"
		}"
		end

	g_strescape (a_source: POINTER; an_exceptions: POINTER): POINTER is
 		-- g_strescape (node at line 1710)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strescape"
		}"
		end

	g_ascii_tolower (a_c: CHARACTER): CHARACTER is
 		-- g_ascii_tolower (node at line 1853)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_ascii_tolower"
		}"
		end

	g_strsplit (a_string: POINTER; a_delimiter: POINTER; a_max_tokens: INTEGER_32): POINTER is
 		-- g_strsplit (node at line 1969)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strsplit"
		}"
		end

	g_strfreev (a_str_array: POINTER) is
 		-- g_strfreev (node at line 1975)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strfreev"
		}"
		end

	g_strjoin (a_separator: POINTER): POINTER is
 		-- g_strjoin (variadic call)  (node at line 2106)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strjoin"
		}"
		end

	g_dpgettext (a_domain: POINTER; a_msgctxtid: POINTER; a_msgidoffset: NATURAL_32): POINTER is
 		-- g_dpgettext (node at line 2202)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_dpgettext"
		}"
		end

	g_strlcat (a_dest: POINTER; a_src: POINTER; a_dest_size: NATURAL_32): NATURAL_32 is
 		-- g_strlcat (node at line 2482)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strlcat"
		}"
		end

	g_strdup (a_str: POINTER): POINTER is
 		-- g_strdup (node at line 2586)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strdup"
		}"
		end

	g_strcasecmp (a_s1: POINTER; a_s2: POINTER): INTEGER_32 is
 		-- g_strcasecmp (node at line 2617)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strcasecmp"
		}"
		end

	g_strdelimit (a_string: POINTER; a_delimiters: POINTER; a_new_delimiter: CHARACTER): POINTER is
 		-- g_strdelimit (node at line 2729)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strdelimit"
		}"
		end

	g_ascii_xdigit_value (a_c: CHARACTER): INTEGER_32 is
 		-- g_ascii_xdigit_value (node at line 2817)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_ascii_xdigit_value"
		}"
		end

	g_ascii_strtoll (a_nptr: POINTER; an_endptr: POINTER; a_base: NATURAL_32): INTEGER_64 is
 		-- g_ascii_strtoll (node at line 2820)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_ascii_strtoll"
		}"
		end

	g_strdup_printf (a_format: POINTER): POINTER is
 		-- g_strdup_printf (variadic call)  (node at line 2854)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strdup_printf"
		}"
		end

	g_str_has_suffix (a_str: POINTER; a_suffix: POINTER): INTEGER_32 is
 		-- g_str_has_suffix (node at line 2869)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_str_has_suffix"
		}"
		end

	g_strndup (a_str: POINTER; a_n: NATURAL_32): POINTER is
 		-- g_strndup (node at line 2928)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strndup"
		}"
		end

	g_strchomp (a_string: POINTER): POINTER is
 		-- g_strchomp (node at line 2981)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strchomp"
		}"
		end

	g_strconcat (a_string1: POINTER): POINTER is
 		-- g_strconcat (variadic call)  (node at line 3210)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strconcat"
		}"
		end

	g_strdupv (a_str_array: POINTER): POINTER is
 		-- g_strdupv (node at line 3414)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strdupv"
		}"
		end

	g_dpgettext2 (a_domain: POINTER; a_context: POINTER; a_msgid: POINTER): POINTER is
 		-- g_dpgettext2 (node at line 3425)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_dpgettext2"
		}"
		end

	g_ascii_strtod (a_nptr: POINTER; an_endptr: POINTER): REAL_64 is
 		-- g_ascii_strtod (node at line 3485)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_ascii_strtod"
		}"
		end

	g_ascii_digit_value (a_c: CHARACTER): INTEGER_32 is
 		-- g_ascii_digit_value (node at line 3511)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_ascii_digit_value"
		}"
		end

	g_memdup (a_mem: POINTER; a_byte_size: NATURAL_32): POINTER is
 		-- g_memdup (node at line 3750)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_memdup"
		}"
		end

	g_ascii_strncasecmp (a_s1: POINTER; a_s2: POINTER; a_n: NATURAL_32): INTEGER_32 is
 		-- g_ascii_strncasecmp (node at line 3896)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_ascii_strncasecmp"
		}"
		end

	g_strup (a_string: POINTER): POINTER is
 		-- g_strup (node at line 4001)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strup"
		}"
		end

	g_strchug (a_string: POINTER): POINTER is
 		-- g_strchug (node at line 4179)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strchug"
		}"
		end

	g_ascii_strcasecmp (a_s1: POINTER; a_s2: POINTER): INTEGER_32 is
 		-- g_ascii_strcasecmp (node at line 4387)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_ascii_strcasecmp"
		}"
		end

	g_ascii_formatd (a_buffer: POINTER; a_buf_len: INTEGER_32; a_format: POINTER; a_d: REAL_64): POINTER is
 		-- g_ascii_formatd (node at line 4626)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_ascii_formatd"
		}"
		end

	g_strcanon (a_string: POINTER; a_valid_chars: POINTER; a_substitutor: CHARACTER): POINTER is
 		-- g_strcanon (node at line 4641)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strcanon"
		}"
		end

	g_dngettext (a_domain: POINTER; a_msgid: POINTER; a_msgid_plural: POINTER; a_n: NATURAL_32): POINTER is
 		-- g_dngettext (node at line 4717)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_dngettext"
		}"
		end

	g_strip_context (a_msgid: POINTER; a_msgval: POINTER): POINTER is
 		-- g_strip_context (node at line 4724)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strip_context"
		}"
		end

	g_strerror (an_errnum: INTEGER_32): POINTER is
 		-- g_strerror (node at line 4752)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strerror"
		}"
		end

	g_strv_length (a_str_array: POINTER): NATURAL_32 is
 		-- g_strv_length (node at line 4843)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strv_length"
		}"
		end

	g_ascii_strdown (a_str: POINTER; a_len: INTEGER_32): POINTER is
 		-- g_ascii_strdown (node at line 5097)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_ascii_strdown"
		}"
		end

	g_strcompress (a_source: POINTER): POINTER is
 		-- g_strcompress (node at line 5147)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strcompress"
		}"
		end

	g_strncasecmp (a_s1: POINTER; a_s2: POINTER; a_n: NATURAL_32): INTEGER_32 is
 		-- g_strncasecmp (node at line 5311)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strncasecmp"
		}"
		end

	g_strjoinv (a_separator: POINTER; a_str_array: POINTER): POINTER is
 		-- g_strjoinv (node at line 5364)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strjoinv"
		}"
		end

	g_stpcpy (a_dest: POINTER; a_src: POINTER): POINTER is
 		-- g_stpcpy (node at line 5400)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_stpcpy"
		}"
		end

	g_strnfill (a_length: NATURAL_32; a_fill_char: CHARACTER): POINTER is
 		-- g_strnfill (node at line 5800)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strnfill"
		}"
		end

	g_strsplit_set (a_string: POINTER; a_delimiters: POINTER; a_max_tokens: INTEGER_32): POINTER is
 		-- g_strsplit_set (node at line 5864)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strsplit_set"
		}"
		end

	g_strdown (a_string: POINTER): POINTER is
 		-- g_strdown (node at line 6033)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strdown"
		}"
		end

	g_ascii_strup (a_str: POINTER; a_len: INTEGER_32): POINTER is
 		-- g_ascii_strup (node at line 6484)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_ascii_strup"
		}"
		end

	g_strrstr (a_haystack: POINTER; a_needle: POINTER): POINTER is
 		-- g_strrstr (node at line 6707)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strrstr"
		}"
		end

	g_str_has_prefix (a_str: POINTER; a_prefix: POINTER): INTEGER_32 is
 		-- g_str_has_prefix (node at line 6934)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_str_has_prefix"
		}"
		end


end -- class GSTRFUNCS_EXTERNALS
