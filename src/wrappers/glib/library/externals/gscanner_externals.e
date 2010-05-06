-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSCANNER_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_scanner_cur_position (a_scanner: POINTER): NATURAL_32 is
 		-- g_scanner_cur_position (node at line 343)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_scanner_cur_position"
		}"
		end

	g_scanner_cur_line (a_scanner: POINTER): NATURAL_32 is
 		-- g_scanner_cur_line (node at line 903)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_scanner_cur_line"
		}"
		end

	g_scanner_scope_foreach_symbol (a_scanner: POINTER; a_scope_id: NATURAL_32; a_func: POINTER; an_user_data: POINTER) is
 		-- g_scanner_scope_foreach_symbol (node at line 1056)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_scanner_scope_foreach_symbol"
		}"
		end

	g_scanner_new (a_config_templ: POINTER): POINTER is
 		-- g_scanner_new (node at line 1094)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_scanner_new"
		}"
		end

	g_scanner_destroy (a_scanner: POINTER) is
 		-- g_scanner_destroy (node at line 1388)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_scanner_destroy"
		}"
		end

	g_scanner_peek_next_token (a_scanner: POINTER): INTEGER is
 		-- g_scanner_peek_next_token (node at line 1391)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_scanner_peek_next_token"
		}"
		end

	g_scanner_cur_token (a_scanner: POINTER): INTEGER is
 		-- g_scanner_cur_token (node at line 1714)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_scanner_cur_token"
		}"
		end

	g_scanner_scope_lookup_symbol (a_scanner: POINTER; a_scope_id: NATURAL_32; a_symbol: POINTER): POINTER is
 		-- g_scanner_scope_lookup_symbol (node at line 1789)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_scanner_scope_lookup_symbol"
		}"
		end

	-- function g_scanner_warn (at line 254 in file /usr/include/glib-2.0/glib/gscanner.h is not wrappable
	g_scanner_get_next_token (a_scanner: POINTER): INTEGER is
 		-- g_scanner_get_next_token (node at line 2061)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_scanner_get_next_token"
		}"
		end

	g_scanner_lookup_symbol (a_scanner: POINTER; a_symbol: POINTER): POINTER is
 		-- g_scanner_lookup_symbol (node at line 2191)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_scanner_lookup_symbol"
		}"
		end

	g_scanner_scope_add_symbol (a_scanner: POINTER; a_scope_id: NATURAL_32; a_symbol: POINTER; a_value: POINTER) is
 		-- g_scanner_scope_add_symbol (node at line 2634)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_scanner_scope_add_symbol"
		}"
		end

	-- function g_scanner_cur_value (at line 220 in file /usr/include/glib-2.0/glib/gscanner.h is not wrappable
	g_scanner_sync_file_offset (a_scanner: POINTER) is
 		-- g_scanner_sync_file_offset (node at line 3920)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_scanner_sync_file_offset"
		}"
		end

	g_scanner_input_text (a_scanner: POINTER; a_text: POINTER; a_text_len: NATURAL_32) is
 		-- g_scanner_input_text (node at line 3940)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_scanner_input_text"
		}"
		end

	g_scanner_input_file (a_scanner: POINTER; an_input_fd: INTEGER_32) is
 		-- g_scanner_input_file (node at line 4917)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_scanner_input_file"
		}"
		end

	g_scanner_eof (a_scanner: POINTER): INTEGER_32 is
 		-- g_scanner_eof (node at line 5033)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_scanner_eof"
		}"
		end

	-- function g_scanner_error (at line 251 in file /usr/include/glib-2.0/glib/gscanner.h is not wrappable
	g_scanner_unexp_token (a_scanner: POINTER; an_expected_token: INTEGER; an_identifier_spec: POINTER; a_symbol_spec: POINTER; a_symbol_name: POINTER; a_message: POINTER; an_is_error: INTEGER_32) is
 		-- g_scanner_unexp_token (node at line 6539)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_scanner_unexp_token"
		}"
		end

	g_scanner_set_scope (a_scanner: POINTER; a_scope_id: NATURAL_32): NATURAL_32 is
 		-- g_scanner_set_scope (node at line 6856)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_scanner_set_scope"
		}"
		end

	g_scanner_scope_remove_symbol (a_scanner: POINTER; a_scope_id: NATURAL_32; a_symbol: POINTER) is
 		-- g_scanner_scope_remove_symbol (node at line 6920)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_scanner_scope_remove_symbol"
		}"
		end


end -- class GSCANNER_EXTERNALS
