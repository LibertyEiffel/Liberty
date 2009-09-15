-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class GSTRING_EXTERNALS


inherit ANY undefine is_equal, copy end

feature {} -- External calls

	g_string_append_printf (a_string: POINTER; a_format: POINTER; ) is
 		-- g_string_append_printf			-- Variadic call

		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_string_append_printf"
		}"
		end

	g_string_ascii_up (a_string: POINTER): POINTER is
 		-- g_string_ascii_up
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_string_ascii_up"
		}"
		end

	g_string_hash (a_str: POINTER): NATURAL_32 is
 		-- g_string_hash
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_string_hash"
		}"
		end

	g_string_down (a_string: POINTER): POINTER is
 		-- g_string_down
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_string_down"
		}"
		end

	g_string_printf (a_string: POINTER; a_format: POINTER; ) is
 		-- g_string_printf			-- Variadic call

		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_string_printf"
		}"
		end

	g_string_append_uri_escaped (a_string: POINTER; an_unescaped: POINTER; a_reserved_chars_allowed: POINTER; an_allow_utf8: INTEGER_32): POINTER is
 		-- g_string_append_uri_escaped
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_string_append_uri_escaped"
		}"
		end

	g_string_append_c (a_string: POINTER; a_c: CHARACTER): POINTER is
 		-- g_string_append_c
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_string_append_c"
		}"
		end

	g_string_chunk_insert_len (a_chunk: POINTER; a_string: POINTER; a_len: INTEGER_32): POINTER is
 		-- g_string_chunk_insert_len
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_string_chunk_insert_len"
		}"
		end

	g_string_set_size (a_string: POINTER; a_len: NATURAL_32): POINTER is
 		-- g_string_set_size
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_string_set_size"
		}"
		end

	g_string_prepend_len (a_string: POINTER; a_val: POINTER; a_len: INTEGER_32): POINTER is
 		-- g_string_prepend_len
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_string_prepend_len"
		}"
		end

	g_string_chunk_insert (a_chunk: POINTER; a_string: POINTER): POINTER is
 		-- g_string_chunk_insert
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_string_chunk_insert"
		}"
		end

	g_string_overwrite_len (a_string: POINTER; a_pos: NATURAL_32; a_val: POINTER; a_len: INTEGER_32): POINTER is
 		-- g_string_overwrite_len
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_string_overwrite_len"
		}"
		end

	g_string_insert_unichar (a_string: POINTER; a_pos: INTEGER_32; a_wc: NATURAL_32): POINTER is
 		-- g_string_insert_unichar
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_string_insert_unichar"
		}"
		end

	g_string_erase (a_string: POINTER; a_pos: INTEGER_32; a_len: INTEGER_32): POINTER is
 		-- g_string_erase
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_string_erase"
		}"
		end

	g_string_vprintf (a_string: POINTER; a_format: POINTER; an_args: POINTER) is
 		-- g_string_vprintf
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_string_vprintf"
		}"
		end

	g_string_append_len (a_string: POINTER; a_val: POINTER; a_len: INTEGER_32): POINTER is
 		-- g_string_append_len
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_string_append_len"
		}"
		end

	g_string_append (a_string: POINTER; a_val: POINTER): POINTER is
 		-- g_string_append
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_string_append"
		}"
		end

	g_string_chunk_insert_const (a_chunk: POINTER; a_string: POINTER): POINTER is
 		-- g_string_chunk_insert_const
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_string_chunk_insert_const"
		}"
		end

	g_string_sized_new (a_dfl_size: NATURAL_32): POINTER is
 		-- g_string_sized_new
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_string_sized_new"
		}"
		end

	g_string_insert_len (a_string: POINTER; a_pos: INTEGER_32; a_val: POINTER; a_len: INTEGER_32): POINTER is
 		-- g_string_insert_len
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_string_insert_len"
		}"
		end

	g_string_equal (a_v: POINTER; a_v2: POINTER): INTEGER_32 is
 		-- g_string_equal
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_string_equal"
		}"
		end

	g_string_free (a_string: POINTER; a_free_segment: INTEGER_32): POINTER is
 		-- g_string_free
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_string_free"
		}"
		end

	g_string_ascii_down (a_string: POINTER): POINTER is
 		-- g_string_ascii_down
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_string_ascii_down"
		}"
		end

	g_string_prepend (a_string: POINTER; a_val: POINTER): POINTER is
 		-- g_string_prepend
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_string_prepend"
		}"
		end

	g_string_up (a_string: POINTER): POINTER is
 		-- g_string_up
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_string_up"
		}"
		end

	g_string_append_vprintf (a_string: POINTER; a_format: POINTER; an_args: POINTER) is
 		-- g_string_append_vprintf
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_string_append_vprintf"
		}"
		end

	g_string_chunk_new (a_size: NATURAL_32): POINTER is
 		-- g_string_chunk_new
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_string_chunk_new"
		}"
		end

	g_string_append_c_inline (a_gstring: POINTER; a_c: CHARACTER): POINTER is
 		-- g_string_append_c_inline
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_string_append_c_inline"
		}"
		end

	g_string_assign (a_string: POINTER; a_rval: POINTER): POINTER is
 		-- g_string_assign
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_string_assign"
		}"
		end

	g_string_new (an_init: POINTER): POINTER is
 		-- g_string_new
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_string_new"
		}"
		end

	g_string_chunk_clear (a_chunk: POINTER) is
 		-- g_string_chunk_clear
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_string_chunk_clear"
		}"
		end

	g_string_insert (a_string: POINTER; a_pos: INTEGER_32; a_val: POINTER): POINTER is
 		-- g_string_insert
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_string_insert"
		}"
		end

	g_string_append_unichar (a_string: POINTER; a_wc: NATURAL_32): POINTER is
 		-- g_string_append_unichar
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_string_append_unichar"
		}"
		end

	g_string_prepend_unichar (a_string: POINTER; a_wc: NATURAL_32): POINTER is
 		-- g_string_prepend_unichar
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_string_prepend_unichar"
		}"
		end

	g_string_overwrite (a_string: POINTER; a_pos: NATURAL_32; a_val: POINTER): POINTER is
 		-- g_string_overwrite
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_string_overwrite"
		}"
		end

	g_string_insert_c (a_string: POINTER; a_pos: INTEGER_32; a_c: CHARACTER): POINTER is
 		-- g_string_insert_c
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_string_insert_c"
		}"
		end

	g_string_truncate (a_string: POINTER; a_len: NATURAL_32): POINTER is
 		-- g_string_truncate
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_string_truncate"
		}"
		end

	g_string_new_len (an_init: POINTER; a_len: INTEGER_32): POINTER is
 		-- g_string_new_len
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_string_new_len"
		}"
		end

	g_string_chunk_free (a_chunk: POINTER) is
 		-- g_string_chunk_free
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_string_chunk_free"
		}"
		end

	g_string_prepend_c (a_string: POINTER; a_c: CHARACTER): POINTER is
 		-- g_string_prepend_c
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_string_prepend_c"
		}"
		end

end
