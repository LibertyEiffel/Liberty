-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GSTRFUNCS_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_ascii_digit_value (a_c: CHARACTER): INTEGER 
               -- g_ascii_digit_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_ascii_digit_value"
               }"
               end

	g_ascii_dtostr (a_buffer: POINTER; a_buf_len: INTEGER; a_d: REAL): POINTER 
               -- g_ascii_dtostr
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_ascii_dtostr"
               }"
               end

	g_ascii_formatd (a_buffer: POINTER; a_buf_len: INTEGER; a_format: POINTER; a_d: REAL): POINTER 
               -- g_ascii_formatd
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_ascii_formatd"
               }"
               end

	g_ascii_strcasecmp (a_s1: POINTER; a_s2: POINTER): INTEGER 
               -- g_ascii_strcasecmp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_ascii_strcasecmp"
               }"
               end

	g_ascii_strdown (a_str: POINTER; a_len: like long): POINTER 
               -- g_ascii_strdown
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_ascii_strdown"
               }"
               end

	g_ascii_strncasecmp (a_s1: POINTER; a_s2: POINTER; a_n: like long_unsigned): INTEGER 
               -- g_ascii_strncasecmp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_ascii_strncasecmp"
               }"
               end

	g_ascii_strtod (a_nptr: POINTER; an_endptr: POINTER): REAL 
               -- g_ascii_strtod
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_ascii_strtod"
               }"
               end

	g_ascii_strtoll (a_nptr: POINTER; an_endptr: POINTER; a_base: NATURAL): like long 
               -- g_ascii_strtoll
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_ascii_strtoll"
               }"
               end

	g_ascii_strtoull (a_nptr: POINTER; an_endptr: POINTER; a_base: NATURAL): like long_unsigned 
               -- g_ascii_strtoull
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_ascii_strtoull"
               }"
               end

	g_ascii_strup (a_str: POINTER; a_len: like long): POINTER 
               -- g_ascii_strup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_ascii_strup"
               }"
               end

	g_ascii_table: POINTER
               -- g_ascii_table
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_ascii_table"
               }"
               end

       address_of_g_ascii_table: POINTER
               -- Address of g_ascii_table
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&g_ascii_table"
               }"
               end

       set_g_ascii_table (a_value: POINTER)
               -- Set variable g_ascii_table value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_g_ascii_table"
               }"
               end

	g_ascii_tolower (a_c: CHARACTER): CHARACTER 
               -- g_ascii_tolower
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_ascii_tolower"
               }"
               end

	g_ascii_toupper (a_c: CHARACTER): CHARACTER 
               -- g_ascii_toupper
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_ascii_toupper"
               }"
               end

	g_ascii_xdigit_value (a_c: CHARACTER): INTEGER 
               -- g_ascii_xdigit_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_ascii_xdigit_value"
               }"
               end

	g_memdup (a_mem: POINTER; a_byte_size: NATURAL): POINTER 
               -- g_memdup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_memdup"
               }"
               end

	g_stpcpy (a_dest: POINTER; a_src: POINTER): POINTER 
               -- g_stpcpy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_stpcpy"
               }"
               end

	g_str_has_prefix (a_str: POINTER; a_prefix: POINTER): INTEGER 
               -- g_str_has_prefix
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_str_has_prefix"
               }"
               end

	g_str_has_suffix (a_str: POINTER; a_suffix: POINTER): INTEGER 
               -- g_str_has_suffix
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_str_has_suffix"
               }"
               end

	g_str_is_ascii (a_str: POINTER): INTEGER 
               -- g_str_is_ascii
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_str_is_ascii"
               }"
               end

	g_str_match_string (a_search_term: POINTER; a_potential_hit: POINTER; an_accept_alternates: INTEGER): INTEGER 
               -- g_str_match_string
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_str_match_string"
               }"
               end

	g_str_to_ascii (a_str: POINTER; a_from_locale: POINTER): POINTER 
               -- g_str_to_ascii
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_str_to_ascii"
               }"
               end

	g_str_tokenize_and_fold (a_string: POINTER; a_translit_locale: POINTER; an_ascii_alternates: POINTER): POINTER 
               -- g_str_tokenize_and_fold
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_str_tokenize_and_fold"
               }"
               end

	g_strcanon (a_string: POINTER; a_valid_chars: POINTER; a_substitutor: CHARACTER): POINTER 
               -- g_strcanon
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_strcanon"
               }"
               end

	g_strcasecmp (a_s1: POINTER; a_s2: POINTER): INTEGER 
               -- g_strcasecmp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_strcasecmp"
               }"
               end

	g_strchomp (a_string: POINTER): POINTER 
               -- g_strchomp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_strchomp"
               }"
               end

	g_strchug (a_string: POINTER): POINTER 
               -- g_strchug
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_strchug"
               }"
               end

	g_strcompress (a_source: POINTER): POINTER 
               -- g_strcompress
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_strcompress"
               }"
               end

	g_strconcat (a_string1: POINTER): POINTER 
               -- g_strconcat (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_strconcat"
               }"
               end

	g_strdelimit (a_string: POINTER; a_delimiters: POINTER; a_new_delimiter: CHARACTER): POINTER 
               -- g_strdelimit
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_strdelimit"
               }"
               end

	g_strdown (a_string: POINTER): POINTER 
               -- g_strdown
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_strdown"
               }"
               end

	g_strdup (a_str: POINTER): POINTER 
               -- g_strdup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_strdup"
               }"
               end

	g_strdup_printf (a_format: POINTER): POINTER 
               -- g_strdup_printf (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_strdup_printf"
               }"
               end

	g_strdup_vprintf (a_format: POINTER; an_args: POINTER): POINTER 
               -- g_strdup_vprintf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_strdup_vprintf"
               }"
               end

	g_strdupv (a_str_array: POINTER): POINTER 
               -- g_strdupv
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_strdupv"
               }"
               end

	g_strerror (an_errnum: INTEGER): POINTER 
               -- g_strerror
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_strerror"
               }"
               end

	g_strescape (a_source: POINTER; an_exceptions: POINTER): POINTER 
               -- g_strescape
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_strescape"
               }"
               end

	g_strfreev (a_str_array: POINTER) 
               -- g_strfreev
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_strfreev"
               }"
               end

	g_strjoin (a_separator: POINTER): POINTER 
               -- g_strjoin (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_strjoin"
               }"
               end

	g_strjoinv (a_separator: POINTER; a_str_array: POINTER): POINTER 
               -- g_strjoinv
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_strjoinv"
               }"
               end

	g_strlcat (a_dest: POINTER; a_src: POINTER; a_dest_size: like long_unsigned): like long_unsigned 
               -- g_strlcat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_strlcat"
               }"
               end

	g_strlcpy (a_dest: POINTER; a_src: POINTER; a_dest_size: like long_unsigned): like long_unsigned 
               -- g_strlcpy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_strlcpy"
               }"
               end

	g_strncasecmp (a_s1: POINTER; a_s2: POINTER; a_n: NATURAL): INTEGER 
               -- g_strncasecmp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_strncasecmp"
               }"
               end

	g_strndup (a_str: POINTER; a_n: like long_unsigned): POINTER 
               -- g_strndup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_strndup"
               }"
               end

	g_strnfill (a_length: like long_unsigned; a_fill_char: CHARACTER): POINTER 
               -- g_strnfill
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_strnfill"
               }"
               end

	g_strreverse (a_string: POINTER): POINTER 
               -- g_strreverse
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_strreverse"
               }"
               end

	g_strrstr (a_haystack: POINTER; a_needle: POINTER): POINTER 
               -- g_strrstr
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_strrstr"
               }"
               end

	g_strrstr_len (a_haystack: POINTER; a_haystack_len: like long; a_needle: POINTER): POINTER 
               -- g_strrstr_len
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_strrstr_len"
               }"
               end

	g_strsignal (a_signum: INTEGER): POINTER 
               -- g_strsignal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_strsignal"
               }"
               end

	g_strsplit (a_string: POINTER; a_delimiter: POINTER; a_max_tokens: INTEGER): POINTER 
               -- g_strsplit
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_strsplit"
               }"
               end

	g_strsplit_set (a_string: POINTER; a_delimiters: POINTER; a_max_tokens: INTEGER): POINTER 
               -- g_strsplit_set
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_strsplit_set"
               }"
               end

	g_strstr_len (a_haystack: POINTER; a_haystack_len: like long; a_needle: POINTER): POINTER 
               -- g_strstr_len
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_strstr_len"
               }"
               end

	g_strtod (a_nptr: POINTER; an_endptr: POINTER): REAL 
               -- g_strtod
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_strtod"
               }"
               end

	g_strup (a_string: POINTER): POINTER 
               -- g_strup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_strup"
               }"
               end

	g_strv_contains (a_strv: POINTER; a_str: POINTER): INTEGER 
               -- g_strv_contains
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_strv_contains"
               }"
               end

	g_strv_length (a_str_array: POINTER): NATURAL 
               -- g_strv_length
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_strv_length"
               }"
               end


end -- class GSTRFUNCS_EXTERNALS
