-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSTRFUNCS_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_ascii_digit_value (a_c: CHARACTER): INTEGER is
 		-- g_ascii_digit_value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_ascii_digit_value"
		}"
		end

	g_ascii_dtostr (a_buffer: POINTER; a_buf_len: INTEGER; a_d: REAL): POINTER is
 		-- g_ascii_dtostr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_ascii_dtostr"
		}"
		end

	g_ascii_formatd (a_buffer: POINTER; a_buf_len: INTEGER; a_format: POINTER; a_d: REAL): POINTER is
 		-- g_ascii_formatd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_ascii_formatd"
		}"
		end

	g_ascii_strcasecmp (a_s1: POINTER; a_s2: POINTER): INTEGER is
 		-- g_ascii_strcasecmp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_ascii_strcasecmp"
		}"
		end

	g_ascii_strdown (a_str: POINTER; a_len: INTEGER): POINTER is
 		-- g_ascii_strdown
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_ascii_strdown"
		}"
		end

	g_ascii_strncasecmp (a_s1: POINTER; a_s2: POINTER; a_n: NATURAL): INTEGER is
 		-- g_ascii_strncasecmp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_ascii_strncasecmp"
		}"
		end

	g_ascii_strtod (a_nptr: POINTER; an_endptr: POINTER): REAL is
 		-- g_ascii_strtod
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_ascii_strtod"
		}"
		end

	g_ascii_strtoll (a_nptr: POINTER; an_endptr: POINTER; a_base: NATURAL): INTEGER_64 is
 		-- g_ascii_strtoll
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_ascii_strtoll"
		}"
		end

	g_ascii_strtoull (a_nptr: POINTER; an_endptr: POINTER; a_base: NATURAL): NATURAL_64 is
 		-- g_ascii_strtoull
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_ascii_strtoull"
		}"
		end

	g_ascii_strup (a_str: POINTER; a_len: INTEGER): POINTER is
 		-- g_ascii_strup
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_ascii_strup"
		}"
		end

	g_ascii_table: POINTER is
 		-- g_ascii_table
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_ascii_table"
		}"
		end

	address_of_g_ascii_table: POINTER is
 		-- Address of g_ascii_table
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&g_ascii_table"
		}"
		end

	set_g_ascii_table (a_value: POINTER) is
		-- Set variable g_ascii_table value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_g_ascii_table"
		}"
		end

	g_ascii_tolower (a_c: CHARACTER): CHARACTER is
 		-- g_ascii_tolower
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_ascii_tolower"
		}"
		end

	g_ascii_toupper (a_c: CHARACTER): CHARACTER is
 		-- g_ascii_toupper
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_ascii_toupper"
		}"
		end

	g_ascii_xdigit_value (a_c: CHARACTER): INTEGER is
 		-- g_ascii_xdigit_value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_ascii_xdigit_value"
		}"
		end

	g_memdup (a_mem: POINTER; a_byte_size: NATURAL): POINTER is
 		-- g_memdup
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_memdup"
		}"
		end

	g_stpcpy (a_dest: POINTER; a_src: POINTER): POINTER is
 		-- g_stpcpy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_stpcpy"
		}"
		end

	g_str_has_prefix (a_str: POINTER; a_prefix: POINTER): INTEGER is
 		-- g_str_has_prefix
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_str_has_prefix"
		}"
		end

	g_str_has_suffix (a_str: POINTER; a_suffix: POINTER): INTEGER is
 		-- g_str_has_suffix
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_str_has_suffix"
		}"
		end

	g_strcanon (a_string: POINTER; a_valid_chars: POINTER; a_substitutor: CHARACTER): POINTER is
 		-- g_strcanon
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strcanon"
		}"
		end

	g_strcasecmp (a_s1: POINTER; a_s2: POINTER): INTEGER is
 		-- g_strcasecmp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strcasecmp"
		}"
		end

	g_strchomp (a_string: POINTER): POINTER is
 		-- g_strchomp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strchomp"
		}"
		end

	g_strchug (a_string: POINTER): POINTER is
 		-- g_strchug
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strchug"
		}"
		end

	g_strcompress (a_source: POINTER): POINTER is
 		-- g_strcompress
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strcompress"
		}"
		end

	g_strconcat (a_string1: POINTER): POINTER is
 		-- g_strconcat (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strconcat"
		}"
		end

	g_strdelimit (a_string: POINTER; a_delimiters: POINTER; a_new_delimiter: CHARACTER): POINTER is
 		-- g_strdelimit
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strdelimit"
		}"
		end

	g_strdown (a_string: POINTER): POINTER is
 		-- g_strdown
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strdown"
		}"
		end

	g_strdup (a_str: POINTER): POINTER is
 		-- g_strdup
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strdup"
		}"
		end

	g_strdup_printf (a_format: POINTER): POINTER is
 		-- g_strdup_printf (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strdup_printf"
		}"
		end

	g_strdup_vprintf (a_format: POINTER; an_args: POINTER): POINTER is
 		-- g_strdup_vprintf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strdup_vprintf"
		}"
		end

	g_strdupv (a_str_array: POINTER): POINTER is
 		-- g_strdupv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strdupv"
		}"
		end

	g_strerror (an_errnum: INTEGER): POINTER is
 		-- g_strerror
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strerror"
		}"
		end

	g_strescape (a_source: POINTER; an_exceptions: POINTER): POINTER is
 		-- g_strescape
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strescape"
		}"
		end

	g_strfreev (a_str_array: POINTER) is
 		-- g_strfreev
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strfreev"
		}"
		end

	g_strjoin (a_separator: POINTER): POINTER is
 		-- g_strjoin (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strjoin"
		}"
		end

	g_strjoinv (a_separator: POINTER; a_str_array: POINTER): POINTER is
 		-- g_strjoinv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strjoinv"
		}"
		end

	g_strlcat (a_dest: POINTER; a_src: POINTER; a_dest_size: NATURAL): NATURAL is
 		-- g_strlcat
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strlcat"
		}"
		end

	g_strlcpy (a_dest: POINTER; a_src: POINTER; a_dest_size: NATURAL): NATURAL is
 		-- g_strlcpy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strlcpy"
		}"
		end

	g_strncasecmp (a_s1: POINTER; a_s2: POINTER; a_n: NATURAL): INTEGER is
 		-- g_strncasecmp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strncasecmp"
		}"
		end

	g_strndup (a_str: POINTER; a_n: NATURAL): POINTER is
 		-- g_strndup
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strndup"
		}"
		end

	g_strnfill (a_length: NATURAL; a_fill_char: CHARACTER): POINTER is
 		-- g_strnfill
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strnfill"
		}"
		end

	g_strreverse (a_string: POINTER): POINTER is
 		-- g_strreverse
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strreverse"
		}"
		end

	g_strrstr (a_haystack: POINTER; a_needle: POINTER): POINTER is
 		-- g_strrstr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strrstr"
		}"
		end

	g_strrstr_len (a_haystack: POINTER; a_haystack_len: INTEGER; a_needle: POINTER): POINTER is
 		-- g_strrstr_len
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strrstr_len"
		}"
		end

	g_strsignal (a_signum: INTEGER): POINTER is
 		-- g_strsignal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strsignal"
		}"
		end

	g_strsplit (a_string: POINTER; a_delimiter: POINTER; a_max_tokens: INTEGER): POINTER is
 		-- g_strsplit
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strsplit"
		}"
		end

	g_strsplit_set (a_string: POINTER; a_delimiters: POINTER; a_max_tokens: INTEGER): POINTER is
 		-- g_strsplit_set
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strsplit_set"
		}"
		end

	g_strstr_len (a_haystack: POINTER; a_haystack_len: INTEGER; a_needle: POINTER): POINTER is
 		-- g_strstr_len
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strstr_len"
		}"
		end

	g_strtod (a_nptr: POINTER; an_endptr: POINTER): REAL is
 		-- g_strtod
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strtod"
		}"
		end

	g_strup (a_string: POINTER): POINTER is
 		-- g_strup
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strup"
		}"
		end

	g_strv_length (a_str_array: POINTER): NATURAL is
 		-- g_strv_length
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strv_length"
		}"
		end


end -- class GSTRFUNCS_EXTERNALS
