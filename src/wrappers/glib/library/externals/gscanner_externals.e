-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class GSCANNER_EXTERNALS


inherit ANY undefine is_equal, copy end

feature {} -- External calls

	g_scanner_cur_position (a_scanner: POINTER): NATURAL_32 is
 		-- g_scanner_cur_position
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_scanner_cur_position"
		}"
		end

	g_scanner_cur_line (a_scanner: POINTER): NATURAL_32 is
 		-- g_scanner_cur_line
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_scanner_cur_line"
		}"
		end

	g_scanner_scope_foreach_symbol (a_scanner: POINTER; a_scope_id: NATURAL_32; a_func: POINTER; an_user_data: POINTER) is
 		-- g_scanner_scope_foreach_symbol
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_scanner_scope_foreach_symbol"
		}"
		end

	g_scanner_new (a_config_templ: POINTER): POINTER is
 		-- g_scanner_new
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_scanner_new"
		}"
		end

	g_scanner_destroy (a_scanner: POINTER) is
 		-- g_scanner_destroy
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_scanner_destroy"
		}"
		end

	g_scanner_peek_next_token (a_scanner: POINTER): INTEGER_32 is
 		-- g_scanner_peek_next_token
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_scanner_peek_next_token"
		}"
		end

	g_scanner_cur_token (a_scanner: POINTER): INTEGER_32 is
 		-- g_scanner_cur_token
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_scanner_cur_token"
		}"
		end

	g_scanner_scope_lookup_symbol (a_scanner: POINTER; a_scope_id: NATURAL_32; a_symbol: POINTER): POINTER is
 		-- g_scanner_scope_lookup_symbol
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_scanner_scope_lookup_symbol"
		}"
		end

	g_scanner_warn (a_scanner: POINTER; a_format: POINTER; ) is
 		-- g_scanner_warn			-- Variadic call

		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_scanner_warn"
		}"
		end

	g_scanner_get_next_token (a_scanner: POINTER): INTEGER_32 is
 		-- g_scanner_get_next_token
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_scanner_get_next_token"
		}"
		end

	g_scanner_lookup_symbol (a_scanner: POINTER; a_symbol: POINTER): POINTER is
 		-- g_scanner_lookup_symbol
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_scanner_lookup_symbol"
		}"
		end

	g_scanner_scope_add_symbol (a_scanner: POINTER; a_scope_id: NATURAL_32; a_symbol: POINTER; a_value: POINTER) is
 		-- g_scanner_scope_add_symbol
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_scanner_scope_add_symbol"
		}"
		end

	g_scanner_cur_value (a_scanner: POINTER)
			-- unwrappable return type: Unhnalded union type
 is
 		-- g_scanner_cur_value
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_scanner_cur_value"
		}"
		end

	g_scanner_sync_file_offset (a_scanner: POINTER) is
 		-- g_scanner_sync_file_offset
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_scanner_sync_file_offset"
		}"
		end

	g_scanner_input_text (a_scanner: POINTER; a_text: POINTER; a_text_len: NATURAL_32) is
 		-- g_scanner_input_text
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_scanner_input_text"
		}"
		end

	g_scanner_input_file (a_scanner: POINTER; an_input_fd: INTEGER_32) is
 		-- g_scanner_input_file
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_scanner_input_file"
		}"
		end

	g_scanner_eof (a_scanner: POINTER): INTEGER_32 is
 		-- g_scanner_eof
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_scanner_eof"
		}"
		end

	g_scanner_error (a_scanner: POINTER; a_format: POINTER; ) is
 		-- g_scanner_error			-- Variadic call

		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_scanner_error"
		}"
		end

	g_scanner_unexp_token (a_scanner: POINTER; an_expected_token: INTEGER_32; an_identifier_spec: POINTER; a_symbol_spec: POINTER; a_symbol_name: POINTER; a_message: POINTER; an_is_error: INTEGER_32) is
 		-- g_scanner_unexp_token
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_scanner_unexp_token"
		}"
		end

	g_scanner_set_scope (a_scanner: POINTER; a_scope_id: NATURAL_32): NATURAL_32 is
 		-- g_scanner_set_scope
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_scanner_set_scope"
		}"
		end

	g_scanner_scope_remove_symbol (a_scanner: POINTER; a_scope_id: NATURAL_32; a_symbol: POINTER) is
 		-- g_scanner_scope_remove_symbol
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_scanner_scope_remove_symbol"
		}"
		end

end
