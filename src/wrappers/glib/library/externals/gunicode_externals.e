-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GUNICODE_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_ucs4_to_utf16 (a_str: POINTER; a_len: like long; an_items_read: POINTER; an_items_written: POINTER; an_error: POINTER): POINTER 
               -- g_ucs4_to_utf16
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_ucs4_to_utf16"
               }"
               end

	g_ucs4_to_utf8 (a_str: POINTER; a_len: like long; an_items_read: POINTER; an_items_written: POINTER; an_error: POINTER): POINTER 
               -- g_ucs4_to_utf8
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_ucs4_to_utf8"
               }"
               end

	g_unichar_break_type (a_c: NATURAL): INTEGER 
               -- g_unichar_break_type
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_unichar_break_type"
               }"
               end

	g_unichar_combining_class (an_uc: NATURAL): INTEGER 
               -- g_unichar_combining_class
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_unichar_combining_class"
               }"
               end

	g_unichar_compose (an_a: NATURAL; a_b: NATURAL; a_ch: POINTER): INTEGER 
               -- g_unichar_compose
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_unichar_compose"
               }"
               end

	g_unichar_decompose (a_ch: NATURAL; an_a: POINTER; a_b: POINTER): INTEGER 
               -- g_unichar_decompose
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_unichar_decompose"
               }"
               end

	g_unichar_digit_value (a_c: NATURAL): INTEGER 
               -- g_unichar_digit_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_unichar_digit_value"
               }"
               end

	g_unichar_fully_decompose (a_ch: NATURAL; a_compat: INTEGER; a_result: POINTER; a_result_len: like long_unsigned): like long_unsigned 
               -- g_unichar_fully_decompose
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_unichar_fully_decompose"
               }"
               end

	g_unichar_get_mirror_char (a_ch: NATURAL; a_mirrored_ch: POINTER): INTEGER 
               -- g_unichar_get_mirror_char
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_unichar_get_mirror_char"
               }"
               end

	g_unichar_get_script (a_ch: NATURAL): INTEGER 
               -- g_unichar_get_script
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_unichar_get_script"
               }"
               end

	g_unichar_isalnum (a_c: NATURAL): INTEGER 
               -- g_unichar_isalnum
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_unichar_isalnum"
               }"
               end

	g_unichar_isalpha (a_c: NATURAL): INTEGER 
               -- g_unichar_isalpha
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_unichar_isalpha"
               }"
               end

	g_unichar_iscntrl (a_c: NATURAL): INTEGER 
               -- g_unichar_iscntrl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_unichar_iscntrl"
               }"
               end

	g_unichar_isdefined (a_c: NATURAL): INTEGER 
               -- g_unichar_isdefined
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_unichar_isdefined"
               }"
               end

	g_unichar_isdigit (a_c: NATURAL): INTEGER 
               -- g_unichar_isdigit
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_unichar_isdigit"
               }"
               end

	g_unichar_isgraph (a_c: NATURAL): INTEGER 
               -- g_unichar_isgraph
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_unichar_isgraph"
               }"
               end

	g_unichar_islower (a_c: NATURAL): INTEGER 
               -- g_unichar_islower
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_unichar_islower"
               }"
               end

	g_unichar_ismark (a_c: NATURAL): INTEGER 
               -- g_unichar_ismark
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_unichar_ismark"
               }"
               end

	g_unichar_isprint (a_c: NATURAL): INTEGER 
               -- g_unichar_isprint
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_unichar_isprint"
               }"
               end

	g_unichar_ispunct (a_c: NATURAL): INTEGER 
               -- g_unichar_ispunct
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_unichar_ispunct"
               }"
               end

	g_unichar_isspace (a_c: NATURAL): INTEGER 
               -- g_unichar_isspace
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_unichar_isspace"
               }"
               end

	g_unichar_istitle (a_c: NATURAL): INTEGER 
               -- g_unichar_istitle
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_unichar_istitle"
               }"
               end

	g_unichar_isupper (a_c: NATURAL): INTEGER 
               -- g_unichar_isupper
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_unichar_isupper"
               }"
               end

	g_unichar_iswide (a_c: NATURAL): INTEGER 
               -- g_unichar_iswide
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_unichar_iswide"
               }"
               end

	g_unichar_iswide_cjk (a_c: NATURAL): INTEGER 
               -- g_unichar_iswide_cjk
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_unichar_iswide_cjk"
               }"
               end

	g_unichar_isxdigit (a_c: NATURAL): INTEGER 
               -- g_unichar_isxdigit
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_unichar_isxdigit"
               }"
               end

	g_unichar_iszerowidth (a_c: NATURAL): INTEGER 
               -- g_unichar_iszerowidth
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_unichar_iszerowidth"
               }"
               end

	g_unichar_to_utf8 (a_c: NATURAL; an_outbuf: POINTER): INTEGER 
               -- g_unichar_to_utf8
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_unichar_to_utf8"
               }"
               end

	g_unichar_tolower (a_c: NATURAL): NATURAL 
               -- g_unichar_tolower
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_unichar_tolower"
               }"
               end

	g_unichar_totitle (a_c: NATURAL): NATURAL 
               -- g_unichar_totitle
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_unichar_totitle"
               }"
               end

	g_unichar_toupper (a_c: NATURAL): NATURAL 
               -- g_unichar_toupper
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_unichar_toupper"
               }"
               end

	g_unichar_type (a_c: NATURAL): INTEGER 
               -- g_unichar_type
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_unichar_type"
               }"
               end

	g_unichar_validate (a_ch: NATURAL): INTEGER 
               -- g_unichar_validate
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_unichar_validate"
               }"
               end

	g_unichar_xdigit_value (a_c: NATURAL): INTEGER 
               -- g_unichar_xdigit_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_unichar_xdigit_value"
               }"
               end

	g_unicode_canonical_decomposition (a_ch: NATURAL; a_result_len: POINTER): POINTER 
               -- g_unicode_canonical_decomposition
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_unicode_canonical_decomposition"
               }"
               end

	g_unicode_canonical_ordering (a_string: POINTER; a_len: like long_unsigned) 
               -- g_unicode_canonical_ordering
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_unicode_canonical_ordering"
               }"
               end

	g_unicode_script_from_iso15924 (an_iso15924: NATURAL): INTEGER 
               -- g_unicode_script_from_iso15924
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_unicode_script_from_iso15924"
               }"
               end

	g_unicode_script_to_iso15924 (a_script: INTEGER): NATURAL 
               -- g_unicode_script_to_iso15924
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_unicode_script_to_iso15924"
               }"
               end

	g_utf16_to_ucs4 (a_str: POINTER; a_len: like long; an_items_read: POINTER; an_items_written: POINTER; an_error: POINTER): POINTER 
               -- g_utf16_to_ucs4
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_utf16_to_ucs4"
               }"
               end

	g_utf16_to_utf8 (a_str: POINTER; a_len: like long; an_items_read: POINTER; an_items_written: POINTER; an_error: POINTER): POINTER 
               -- g_utf16_to_utf8
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_utf16_to_utf8"
               }"
               end

	g_utf8_casefold (a_str: POINTER; a_len: like long): POINTER 
               -- g_utf8_casefold
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_utf8_casefold"
               }"
               end

	g_utf8_collate (a_str1: POINTER; a_str2: POINTER): INTEGER 
               -- g_utf8_collate
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_utf8_collate"
               }"
               end

	g_utf8_collate_key (a_str: POINTER; a_len: like long): POINTER 
               -- g_utf8_collate_key
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_utf8_collate_key"
               }"
               end

	g_utf8_collate_key_for_filename (a_str: POINTER; a_len: like long): POINTER 
               -- g_utf8_collate_key_for_filename
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_utf8_collate_key_for_filename"
               }"
               end

	g_utf8_find_next_char (a_p: POINTER; an_end_external: POINTER): POINTER 
               -- g_utf8_find_next_char
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_utf8_find_next_char"
               }"
               end

	g_utf8_find_prev_char (a_str: POINTER; a_p: POINTER): POINTER 
               -- g_utf8_find_prev_char
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_utf8_find_prev_char"
               }"
               end

	g_utf8_get_char (a_p: POINTER): NATURAL 
               -- g_utf8_get_char
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_utf8_get_char"
               }"
               end

	g_utf8_get_char_validated (a_p: POINTER; a_max_len: like long): NATURAL 
               -- g_utf8_get_char_validated
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_utf8_get_char_validated"
               }"
               end

	-- `hidden' function _g_utf8_make_valid skipped.
	g_utf8_normalize (a_str: POINTER; a_len: like long; a_mode: INTEGER): POINTER 
               -- g_utf8_normalize
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_utf8_normalize"
               }"
               end

	g_utf8_offset_to_pointer (a_str: POINTER; an_offset: like long): POINTER 
               -- g_utf8_offset_to_pointer
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_utf8_offset_to_pointer"
               }"
               end

	g_utf8_pointer_to_offset (a_str: POINTER; a_pos: POINTER): like long 
               -- g_utf8_pointer_to_offset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_utf8_pointer_to_offset"
               }"
               end

	g_utf8_prev_char (a_p: POINTER): POINTER 
               -- g_utf8_prev_char
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_utf8_prev_char"
               }"
               end

	g_utf8_skip: POINTER
               -- g_utf8_skip
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_utf8_skip"
               }"
               end

       address_of_g_utf8_skip: POINTER
               -- Address of g_utf8_skip
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&g_utf8_skip"
               }"
               end

       set_g_utf8_skip (a_value: POINTER)
               -- Set variable g_utf8_skip value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_g_utf8_skip"
               }"
               end

	g_utf8_strchr (a_p: POINTER; a_len: like long; a_c: NATURAL): POINTER 
               -- g_utf8_strchr
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_utf8_strchr"
               }"
               end

	g_utf8_strdown (a_str: POINTER; a_len: like long): POINTER 
               -- g_utf8_strdown
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_utf8_strdown"
               }"
               end

	g_utf8_strlen (a_p: POINTER; a_max: like long): like long 
               -- g_utf8_strlen
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_utf8_strlen"
               }"
               end

	g_utf8_strncpy (a_dest: POINTER; a_src: POINTER; a_n: like long_unsigned): POINTER 
               -- g_utf8_strncpy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_utf8_strncpy"
               }"
               end

	g_utf8_strrchr (a_p: POINTER; a_len: like long; a_c: NATURAL): POINTER 
               -- g_utf8_strrchr
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_utf8_strrchr"
               }"
               end

	g_utf8_strreverse (a_str: POINTER; a_len: like long): POINTER 
               -- g_utf8_strreverse
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_utf8_strreverse"
               }"
               end

	g_utf8_strup (a_str: POINTER; a_len: like long): POINTER 
               -- g_utf8_strup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_utf8_strup"
               }"
               end

	g_utf8_substring (a_str: POINTER; a_start_pos: like long; an_end_pos: like long): POINTER 
               -- g_utf8_substring
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_utf8_substring"
               }"
               end

	g_utf8_to_ucs4 (a_str: POINTER; a_len: like long; an_items_read: POINTER; an_items_written: POINTER; an_error: POINTER): POINTER 
               -- g_utf8_to_ucs4
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_utf8_to_ucs4"
               }"
               end

	g_utf8_to_ucs4_fast (a_str: POINTER; a_len: like long; an_items_written: POINTER): POINTER 
               -- g_utf8_to_ucs4_fast
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_utf8_to_ucs4_fast"
               }"
               end

	g_utf8_to_utf16 (a_str: POINTER; a_len: like long; an_items_read: POINTER; an_items_written: POINTER; an_error: POINTER): POINTER 
               -- g_utf8_to_utf16
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_utf8_to_utf16"
               }"
               end

	g_utf8_validate (a_str: POINTER; a_max_len: like long; an_end_external: POINTER): INTEGER 
               -- g_utf8_validate
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_utf8_validate"
               }"
               end


end -- class GUNICODE_EXTERNALS
