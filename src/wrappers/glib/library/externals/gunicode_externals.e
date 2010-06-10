-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GUNICODE_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_utf8_strup (a_str: POINTER; a_len: INTEGER_32): POINTER is
 		-- g_utf8_strup (node at line 136)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_utf8_strup"
		}"
		end

	g_utf8_strncpy (a_dest: POINTER; a_src: POINTER; a_n: NATURAL_32): POINTER is
 		-- g_utf8_strncpy (node at line 140)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_utf8_strncpy"
		}"
		end

	g_unichar_islower (a_c: NATURAL_32): INTEGER_32 is
 		-- g_unichar_islower (node at line 357)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_unichar_islower"
		}"
		end

	g_unichar_tolower (a_c: NATURAL_32): NATURAL_32 is
 		-- g_unichar_tolower (node at line 361)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_unichar_tolower"
		}"
		end

	g_unichar_isxdigit (a_c: NATURAL_32): INTEGER_32 is
 		-- g_unichar_isxdigit (node at line 817)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_unichar_isxdigit"
		}"
		end

	g_unichar_isdigit (a_c: NATURAL_32): INTEGER_32 is
 		-- g_unichar_isdigit (node at line 921)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_unichar_isdigit"
		}"
		end

	g_unichar_isdefined (a_c: NATURAL_32): INTEGER_32 is
 		-- g_unichar_isdefined (node at line 1454)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_unichar_isdefined"
		}"
		end

	g_utf8_collate_key_for_filename (a_str: POINTER; a_len: INTEGER_32): POINTER is
 		-- g_utf8_collate_key_for_filename (node at line 1560)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_utf8_collate_key_for_filename"
		}"
		end

	g_utf16_to_ucs4 (a_str: POINTER; a_len: INTEGER_32; an_items_read: POINTER; an_items_written: POINTER; an_error: POINTER): POINTER is
 		-- g_utf16_to_ucs4 (node at line 1669)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_utf16_to_ucs4"
		}"
		end

	g_unichar_xdigit_value (a_c: NATURAL_32): INTEGER_32 is
 		-- g_unichar_xdigit_value (node at line 1754)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_unichar_xdigit_value"
		}"
		end

	g_unicode_canonical_decomposition (a_ch: NATURAL_32; a_result_len: POINTER): POINTER is
 		-- g_unicode_canonical_decomposition (node at line 1856)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_unicode_canonical_decomposition"
		}"
		end

	g_unichar_iswide_cjk (a_c: NATURAL_32): INTEGER_32 is
 		-- g_unichar_iswide_cjk (node at line 1914)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_unichar_iswide_cjk"
		}"
		end

	g_unichar_combining_class (an_uc: NATURAL_32): INTEGER_32 is
 		-- g_unichar_combining_class (node at line 2149)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_unichar_combining_class"
		}"
		end

	g_utf8_find_prev_char (a_str: POINTER; a_p: POINTER): POINTER is
 		-- g_utf8_find_prev_char (node at line 2302)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_utf8_find_prev_char"
		}"
		end

	g_utf8_find_next_char (a_p: POINTER; an_end_external: POINTER): POINTER is
 		-- g_utf8_find_next_char (node at line 2312)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_utf8_find_next_char"
		}"
		end

	-- `hidden' function _g_utf8_make_valid skipped.
	g_utf8_prev_char (a_p: POINTER): POINTER is
 		-- g_utf8_prev_char (node at line 2575)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_utf8_prev_char"
		}"
		end

	g_unichar_validate (a_ch: NATURAL_32): INTEGER_32 is
 		-- g_unichar_validate (node at line 2603)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_unichar_validate"
		}"
		end

	g_utf8_collate_key (a_str: POINTER; a_len: INTEGER_32): POINTER is
 		-- g_utf8_collate_key (node at line 2626)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_utf8_collate_key"
		}"
		end

	g_unichar_isalnum (a_c: NATURAL_32): INTEGER_32 is
 		-- g_unichar_isalnum (node at line 2643)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_unichar_isalnum"
		}"
		end

	g_utf8_strrchr (a_p: POINTER; a_len: INTEGER_32; a_c: NATURAL_32): POINTER is
 		-- g_utf8_strrchr (node at line 2846)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_utf8_strrchr"
		}"
		end

	g_get_charset (a_charset: POINTER): INTEGER_32 is
 		-- g_get_charset (node at line 2861)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_get_charset"
		}"
		end

	g_unichar_type (a_c: NATURAL_32): INTEGER is
 		-- g_unichar_type (node at line 2909)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_unichar_type"
		}"
		end

	g_utf8_get_char (a_p: POINTER): NATURAL_32 is
 		-- g_utf8_get_char (node at line 2922)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_utf8_get_char"
		}"
		end

	g_unichar_ispunct (a_c: NATURAL_32): INTEGER_32 is
 		-- g_unichar_ispunct (node at line 2932)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_unichar_ispunct"
		}"
		end

	g_unicode_canonical_ordering (a_string: POINTER; a_len: NATURAL_32) is
 		-- g_unicode_canonical_ordering (node at line 3247)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_unicode_canonical_ordering"
		}"
		end

	g_unichar_break_type (a_c: NATURAL_32): INTEGER is
 		-- g_unichar_break_type (node at line 3274)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_unichar_break_type"
		}"
		end

	g_ucs4_to_utf8 (a_str: POINTER; a_len: INTEGER_32; an_items_read: POINTER; an_items_written: POINTER; an_error: POINTER): POINTER is
 		-- g_ucs4_to_utf8 (node at line 3363)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_ucs4_to_utf8"
		}"
		end

	g_utf8_strchr (a_p: POINTER; a_len: INTEGER_32; a_c: NATURAL_32): POINTER is
 		-- g_utf8_strchr (node at line 3430)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_utf8_strchr"
		}"
		end

	g_unichar_iswide (a_c: NATURAL_32): INTEGER_32 is
 		-- g_unichar_iswide (node at line 3491)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_unichar_iswide"
		}"
		end

	g_unichar_isgraph (a_c: NATURAL_32): INTEGER_32 is
 		-- g_unichar_isgraph (node at line 3500)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_unichar_isgraph"
		}"
		end

	g_utf8_to_utf16 (a_str: POINTER; a_len: INTEGER_32; an_items_read: POINTER; an_items_written: POINTER; an_error: POINTER): POINTER is
 		-- g_utf8_to_utf16 (node at line 3664)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_utf8_to_utf16"
		}"
		end

	g_utf8_get_char_validated (a_p: POINTER; a_max_len: INTEGER_32): NATURAL_32 is
 		-- g_utf8_get_char_validated (node at line 3696)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_utf8_get_char_validated"
		}"
		end

	g_unichar_totitle (a_c: NATURAL_32): NATURAL_32 is
 		-- g_unichar_totitle (node at line 3712)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_unichar_totitle"
		}"
		end

	g_unichar_iscntrl (a_c: NATURAL_32): INTEGER_32 is
 		-- g_unichar_iscntrl (node at line 4086)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_unichar_iscntrl"
		}"
		end

	g_unichar_istitle (a_c: NATURAL_32): INTEGER_32 is
 		-- g_unichar_istitle (node at line 4152)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_unichar_istitle"
		}"
		end

	g_utf8_casefold (a_str: POINTER; a_len: INTEGER_32): POINTER is
 		-- g_utf8_casefold (node at line 4165)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_utf8_casefold"
		}"
		end

	g_unichar_isprint (a_c: NATURAL_32): INTEGER_32 is
 		-- g_unichar_isprint (node at line 4356)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_unichar_isprint"
		}"
		end

	g_utf8_validate (a_str: POINTER; a_max_len: INTEGER_32; an_end_external: POINTER): INTEGER_32 is
 		-- g_utf8_validate (node at line 4371)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_utf8_validate"
		}"
		end

	g_unichar_digit_value (a_c: NATURAL_32): INTEGER_32 is
 		-- g_unichar_digit_value (node at line 4709)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_unichar_digit_value"
		}"
		end

	g_utf8_strdown (a_str: POINTER; a_len: INTEGER_32): POINTER is
 		-- g_utf8_strdown (node at line 5248)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_utf8_strdown"
		}"
		end

	g_utf8_strreverse (a_str: POINTER; a_len: INTEGER_32): POINTER is
 		-- g_utf8_strreverse (node at line 5273)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_utf8_strreverse"
		}"
		end

	g_unichar_get_script (a_ch: NATURAL_32): INTEGER is
 		-- g_unichar_get_script (node at line 5337)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_unichar_get_script"
		}"
		end

	g_utf8_normalize (a_str: POINTER; a_len: INTEGER_32; a_mode: INTEGER): POINTER is
 		-- g_utf8_normalize (node at line 5384)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_utf8_normalize"
		}"
		end

	g_unichar_ismark (a_c: NATURAL_32): INTEGER_32 is
 		-- g_unichar_ismark (node at line 5475)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_unichar_ismark"
		}"
		end

	g_utf8_pointer_to_offset (a_str: POINTER; a_pos: POINTER): INTEGER_32 is
 		-- g_utf8_pointer_to_offset (node at line 5705)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_utf8_pointer_to_offset"
		}"
		end

	g_unichar_isupper (a_c: NATURAL_32): INTEGER_32 is
 		-- g_unichar_isupper (node at line 5771)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_unichar_isupper"
		}"
		end

	g_unichar_toupper (a_c: NATURAL_32): NATURAL_32 is
 		-- g_unichar_toupper (node at line 5780)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_unichar_toupper"
		}"
		end

	g_utf16_to_utf8 (a_str: POINTER; a_len: INTEGER_32; an_items_read: POINTER; an_items_written: POINTER; an_error: POINTER): POINTER is
 		-- g_utf16_to_utf8 (node at line 5807)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_utf16_to_utf8"
		}"
		end

	g_unichar_isspace (a_c: NATURAL_32): INTEGER_32 is
 		-- g_unichar_isspace (node at line 5952)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_unichar_isspace"
		}"
		end

	g_unichar_get_mirror_char (a_ch: NATURAL_32; a_mirrored_ch: POINTER): INTEGER_32 is
 		-- g_unichar_get_mirror_char (node at line 6046)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_unichar_get_mirror_char"
		}"
		end

	g_unichar_isalpha (a_c: NATURAL_32): INTEGER_32 is
 		-- g_unichar_isalpha (node at line 6135)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_unichar_isalpha"
		}"
		end

	g_utf8_collate (a_str1: POINTER; a_str2: POINTER): INTEGER_32 is
 		-- g_utf8_collate (node at line 6222)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_utf8_collate"
		}"
		end

	g_unichar_to_utf8 (a_c: NATURAL_32; an_outbuf: POINTER): INTEGER_32 is
 		-- g_unichar_to_utf8 (node at line 6336)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_unichar_to_utf8"
		}"
		end

	g_utf8_to_ucs4 (a_str: POINTER; a_len: INTEGER_32; an_items_read: POINTER; an_items_written: POINTER; an_error: POINTER): POINTER is
 		-- g_utf8_to_ucs4 (node at line 6461)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_utf8_to_ucs4"
		}"
		end

	g_unichar_iszerowidth (a_c: NATURAL_32): INTEGER_32 is
 		-- g_unichar_iszerowidth (node at line 6548)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_unichar_iszerowidth"
		}"
		end

	g_ucs4_to_utf16 (a_str: POINTER; a_len: INTEGER_32; an_items_read: POINTER; an_items_written: POINTER; an_error: POINTER): POINTER is
 		-- g_ucs4_to_utf16 (node at line 6644)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_ucs4_to_utf16"
		}"
		end

	g_utf8_strlen (a_p: POINTER; a_max: INTEGER_32): INTEGER_32 is
 		-- g_utf8_strlen (node at line 6664)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_utf8_strlen"
		}"
		end

	g_utf8_to_ucs4_fast (a_str: POINTER; a_len: INTEGER_32; an_items_written: POINTER): POINTER is
 		-- g_utf8_to_ucs4_fast (node at line 6770)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_utf8_to_ucs4_fast"
		}"
		end

	g_utf8_offset_to_pointer (a_str: POINTER; an_offset: INTEGER_32): POINTER is
 		-- g_utf8_offset_to_pointer (node at line 6852)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_utf8_offset_to_pointer"
		}"
		end

feature {} -- Variables
	g_utf8_skip: POINTER is
 		-- g_utf8_skip (node at line 274)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_utf8_skip"
		}"
		end


end -- class GUNICODE_EXTERNALS
