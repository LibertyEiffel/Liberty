-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSTRING_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	-- function g_string_append_printf (at line 135 in file /usr/include/glib-2.0/glib/gstring.h is not wrappable
	g_string_ascii_up (a_string: POINTER): POINTER is
 		-- g_string_ascii_up (node at line 506)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_string_ascii_up"
		}"
		end

	g_string_hash (a_str: POINTER): NATURAL_32 is
 		-- g_string_hash (node at line 624)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_string_hash"
		}"
		end

	g_string_down (a_string: POINTER): POINTER is
 		-- g_string_down (node at line 670)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_string_down"
		}"
		end

	-- function g_string_printf (at line 129 in file /usr/include/glib-2.0/glib/gstring.h is not wrappable
	g_string_append_uri_escaped (a_string: POINTER; an_unescaped: POINTER; a_reserved_chars_allowed: POINTER; an_allow_utf8: INTEGER_32): POINTER is
 		-- g_string_append_uri_escaped (node at line 884)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_string_append_uri_escaped"
		}"
		end

	g_string_append_c (a_string: POINTER; a_c: CHARACTER): POINTER is
 		-- g_string_append_c (node at line 1547)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_string_append_c"
		}"
		end

	g_string_chunk_insert_len (a_chunk: POINTER; a_string: POINTER; a_len: INTEGER_32): POINTER is
 		-- g_string_chunk_insert_len (node at line 1621)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_string_chunk_insert_len"
		}"
		end

	g_string_set_size (a_string: POINTER; a_len: NATURAL_32): POINTER is
 		-- g_string_set_size (node at line 1650)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_string_set_size"
		}"
		end

	g_string_prepend_len (a_string: POINTER; a_val: POINTER; a_len: INTEGER_32): POINTER is
 		-- g_string_prepend_len (node at line 1679)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_string_prepend_len"
		}"
		end

	g_string_chunk_insert (a_chunk: POINTER; a_string: POINTER): POINTER is
 		-- g_string_chunk_insert (node at line 1870)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_string_chunk_insert"
		}"
		end

	g_string_overwrite_len (a_string: POINTER; a_pos: NATURAL_32; a_val: POINTER; a_len: INTEGER_32): POINTER is
 		-- g_string_overwrite_len (node at line 1945)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_string_overwrite_len"
		}"
		end

	g_string_insert_unichar (a_string: POINTER; a_pos: INTEGER_32; a_wc: NATURAL_32): POINTER is
 		-- g_string_insert_unichar (node at line 2041)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_string_insert_unichar"
		}"
		end

	g_string_erase (a_string: POINTER; a_pos: INTEGER_32; a_len: INTEGER_32): POINTER is
 		-- g_string_erase (node at line 2509)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_string_erase"
		}"
		end

	g_string_vprintf (a_string: POINTER; a_format: POINTER; an_args: POINTER) is
 		-- g_string_vprintf (node at line 2915)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_string_vprintf"
		}"
		end

	g_string_append_len (a_string: POINTER; a_val: POINTER; a_len: INTEGER_32): POINTER is
 		-- g_string_append_len (node at line 3111)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_string_append_len"
		}"
		end

	g_string_append (a_string: POINTER; a_val: POINTER): POINTER is
 		-- g_string_append (node at line 3203)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_string_append"
		}"
		end

	g_string_chunk_insert_const (a_chunk: POINTER; a_string: POINTER): POINTER is
 		-- g_string_chunk_insert_const (node at line 3421)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_string_chunk_insert_const"
		}"
		end

	g_string_sized_new (a_dfl_size: NATURAL_32): POINTER is
 		-- g_string_sized_new (node at line 3635)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_string_sized_new"
		}"
		end

	g_string_insert_len (a_string: POINTER; a_pos: INTEGER_32; a_val: POINTER; a_len: INTEGER_32): POINTER is
 		-- g_string_insert_len (node at line 3681)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_string_insert_len"
		}"
		end

	g_string_equal (a_v: POINTER; a_v2: POINTER): INTEGER_32 is
 		-- g_string_equal (node at line 3866)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_string_equal"
		}"
		end

	g_string_free (a_string: POINTER; a_free_segment: INTEGER_32): POINTER is
 		-- g_string_free (node at line 3904)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_string_free"
		}"
		end

	g_string_ascii_down (a_string: POINTER): POINTER is
 		-- g_string_ascii_down (node at line 4101)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_string_ascii_down"
		}"
		end

	g_string_prepend (a_string: POINTER; a_val: POINTER): POINTER is
 		-- g_string_prepend (node at line 4491)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_string_prepend"
		}"
		end

	g_string_up (a_string: POINTER): POINTER is
 		-- g_string_up (node at line 4632)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_string_up"
		}"
		end

	g_string_append_vprintf (a_string: POINTER; a_format: POINTER; an_args: POINTER) is
 		-- g_string_append_vprintf (node at line 4694)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_string_append_vprintf"
		}"
		end

	g_string_chunk_new (a_size: NATURAL_32): POINTER is
 		-- g_string_chunk_new (node at line 4862)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_string_chunk_new"
		}"
		end

	g_string_append_c_inline (a_gstring: POINTER; a_c: CHARACTER): POINTER is
 		-- g_string_append_c_inline (node at line 4954)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_string_append_c_inline"
		}"
		end

	g_string_assign (a_string: POINTER; a_rval: POINTER): POINTER is
 		-- g_string_assign (node at line 4958)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_string_assign"
		}"
		end

	g_string_new (an_init: POINTER): POINTER is
 		-- g_string_new (node at line 5297)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_string_new"
		}"
		end

	g_string_chunk_clear (a_chunk: POINTER) is
 		-- g_string_chunk_clear (node at line 5381)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_string_chunk_clear"
		}"
		end

	g_string_insert (a_string: POINTER; a_pos: INTEGER_32; a_val: POINTER): POINTER is
 		-- g_string_insert (node at line 5617)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_string_insert"
		}"
		end

	g_string_append_unichar (a_string: POINTER; a_wc: NATURAL_32): POINTER is
 		-- g_string_append_unichar (node at line 5643)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_string_append_unichar"
		}"
		end

	g_string_prepend_unichar (a_string: POINTER; a_wc: NATURAL_32): POINTER is
 		-- g_string_prepend_unichar (node at line 5875)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_string_prepend_unichar"
		}"
		end

	g_string_overwrite (a_string: POINTER; a_pos: NATURAL_32; a_val: POINTER): POINTER is
 		-- g_string_overwrite (node at line 5908)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_string_overwrite"
		}"
		end

	g_string_insert_c (a_string: POINTER; a_pos: INTEGER_32; a_c: CHARACTER): POINTER is
 		-- g_string_insert_c (node at line 6144)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_string_insert_c"
		}"
		end

	g_string_truncate (a_string: POINTER; a_len: NATURAL_32): POINTER is
 		-- g_string_truncate (node at line 6187)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_string_truncate"
		}"
		end

	g_string_new_len (an_init: POINTER; a_len: INTEGER_32): POINTER is
 		-- g_string_new_len (node at line 6244)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_string_new_len"
		}"
		end

	g_string_chunk_free (a_chunk: POINTER) is
 		-- g_string_chunk_free (node at line 6533)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_string_chunk_free"
		}"
		end

	g_string_prepend_c (a_string: POINTER; a_c: CHARACTER): POINTER is
 		-- g_string_prepend_c (node at line 6568)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_string_prepend_c"
		}"
		end


end -- class GSTRING_EXTERNALS
