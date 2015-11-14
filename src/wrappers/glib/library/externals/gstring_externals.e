-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GSTRING_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_string_append (a_string: POINTER; a_val: POINTER): POINTER 
               -- g_string_append
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_string_append"
               }"
               end

	g_string_append_c (a_string: POINTER; a_c: CHARACTER): POINTER 
               -- g_string_append_c
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_string_append_c"
               }"
               end

	g_string_append_c_inline (a_gstring: POINTER; a_c: CHARACTER): POINTER 
               -- g_string_append_c_inline
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_string_append_c_inline"
               }"
               end

	g_string_append_len (a_string: POINTER; a_val: POINTER; a_len: like long): POINTER 
               -- g_string_append_len
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_string_append_len"
               }"
               end

	g_string_append_printf (a_string: POINTER; a_format: POINTER) 
               -- g_string_append_printf (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_string_append_printf"
               }"
               end

	g_string_append_unichar (a_string: POINTER; a_wc: NATURAL): POINTER 
               -- g_string_append_unichar
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_string_append_unichar"
               }"
               end

	g_string_append_uri_escaped (a_string: POINTER; an_unescaped: POINTER; a_reserved_chars_allowed: POINTER; an_allow_utf8: INTEGER): POINTER 
               -- g_string_append_uri_escaped
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_string_append_uri_escaped"
               }"
               end

	g_string_append_vprintf (a_string: POINTER; a_format: POINTER; an_args: POINTER) 
               -- g_string_append_vprintf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_string_append_vprintf"
               }"
               end

	g_string_ascii_down (a_string: POINTER): POINTER 
               -- g_string_ascii_down
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_string_ascii_down"
               }"
               end

	g_string_ascii_up (a_string: POINTER): POINTER 
               -- g_string_ascii_up
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_string_ascii_up"
               }"
               end

	g_string_assign (a_string: POINTER; a_rval: POINTER): POINTER 
               -- g_string_assign
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_string_assign"
               }"
               end

	g_string_down (a_string: POINTER): POINTER 
               -- g_string_down
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_string_down"
               }"
               end

	g_string_equal (a_v: POINTER; a_v2: POINTER): INTEGER 
               -- g_string_equal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_string_equal"
               }"
               end

	g_string_erase (a_string: POINTER; a_pos: like long; a_len: like long): POINTER 
               -- g_string_erase
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_string_erase"
               }"
               end

	g_string_free (a_string: POINTER; a_free_segment: INTEGER): POINTER 
               -- g_string_free
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_string_free"
               }"
               end

	g_string_free_to_bytes (a_string: POINTER): POINTER 
               -- g_string_free_to_bytes
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_string_free_to_bytes"
               }"
               end

	g_string_hash (a_str: POINTER): NATURAL 
               -- g_string_hash
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_string_hash"
               }"
               end

	g_string_insert (a_string: POINTER; a_pos: like long; a_val: POINTER): POINTER 
               -- g_string_insert
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_string_insert"
               }"
               end

	g_string_insert_c (a_string: POINTER; a_pos: like long; a_c: CHARACTER): POINTER 
               -- g_string_insert_c
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_string_insert_c"
               }"
               end

	g_string_insert_len (a_string: POINTER; a_pos: like long; a_val: POINTER; a_len: like long): POINTER 
               -- g_string_insert_len
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_string_insert_len"
               }"
               end

	g_string_insert_unichar (a_string: POINTER; a_pos: like long; a_wc: NATURAL): POINTER 
               -- g_string_insert_unichar
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_string_insert_unichar"
               }"
               end

	g_string_new (an_init: POINTER): POINTER 
               -- g_string_new
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_string_new"
               }"
               end

	g_string_new_len (an_init: POINTER; a_len: like long): POINTER 
               -- g_string_new_len
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_string_new_len"
               }"
               end

	g_string_overwrite (a_string: POINTER; a_pos: like long_unsigned; a_val: POINTER): POINTER 
               -- g_string_overwrite
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_string_overwrite"
               }"
               end

	g_string_overwrite_len (a_string: POINTER; a_pos: like long_unsigned; a_val: POINTER; a_len: like long): POINTER 
               -- g_string_overwrite_len
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_string_overwrite_len"
               }"
               end

	g_string_prepend (a_string: POINTER; a_val: POINTER): POINTER 
               -- g_string_prepend
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_string_prepend"
               }"
               end

	g_string_prepend_c (a_string: POINTER; a_c: CHARACTER): POINTER 
               -- g_string_prepend_c
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_string_prepend_c"
               }"
               end

	g_string_prepend_len (a_string: POINTER; a_val: POINTER; a_len: like long): POINTER 
               -- g_string_prepend_len
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_string_prepend_len"
               }"
               end

	g_string_prepend_unichar (a_string: POINTER; a_wc: NATURAL): POINTER 
               -- g_string_prepend_unichar
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_string_prepend_unichar"
               }"
               end

	g_string_printf (a_string: POINTER; a_format: POINTER) 
               -- g_string_printf (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_string_printf"
               }"
               end

	g_string_set_size (a_string: POINTER; a_len: like long_unsigned): POINTER 
               -- g_string_set_size
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_string_set_size"
               }"
               end

	g_string_sized_new (a_dfl_size: like long_unsigned): POINTER 
               -- g_string_sized_new
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_string_sized_new"
               }"
               end

	g_string_truncate (a_string: POINTER; a_len: like long_unsigned): POINTER 
               -- g_string_truncate
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_string_truncate"
               }"
               end

	g_string_up (a_string: POINTER): POINTER 
               -- g_string_up
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_string_up"
               }"
               end

	g_string_vprintf (a_string: POINTER; a_format: POINTER; an_args: POINTER) 
               -- g_string_vprintf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_string_vprintf"
               }"
               end


end -- class GSTRING_EXTERNALS
