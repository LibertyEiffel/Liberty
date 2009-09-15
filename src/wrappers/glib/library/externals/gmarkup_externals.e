-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class GMARKUP_EXTERNALS


inherit ANY undefine is_equal, copy end

feature {} -- External calls

	g_markup_parse_context_free (a_context: POINTER) is
 		-- g_markup_parse_context_free
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_markup_parse_context_free"
		}"
		end

	g_markup_printf_escaped (a_format: POINTER; ): POINTER is
 		-- g_markup_printf_escaped			-- Variadic call

		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_markup_printf_escaped"
		}"
		end

	g_markup_parse_context_get_element (a_context: POINTER): POINTER is
 		-- g_markup_parse_context_get_element
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_markup_parse_context_get_element"
		}"
		end

	g_markup_parse_context_pop (a_context: POINTER): POINTER is
 		-- g_markup_parse_context_pop
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_markup_parse_context_pop"
		}"
		end

	g_markup_parse_context_push (a_context: POINTER; a_parser: POINTER; an_user_data: POINTER) is
 		-- g_markup_parse_context_push
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_markup_parse_context_push"
		}"
		end

	g_markup_parse_context_get_position (a_context: POINTER; a_line_number: POINTER; a_char_number: POINTER) is
 		-- g_markup_parse_context_get_position
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_markup_parse_context_get_position"
		}"
		end

	g_markup_vprintf_escaped (a_format: POINTER; an_args: POINTER): POINTER is
 		-- g_markup_vprintf_escaped
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_markup_vprintf_escaped"
		}"
		end

	g_markup_parse_context_get_element_stack (a_context: POINTER): POINTER is
 		-- g_markup_parse_context_get_element_stack
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_markup_parse_context_get_element_stack"
		}"
		end

	g_markup_collect_attributes (an_element_name: POINTER; an_attribute_names: POINTER; an_attribute_values: POINTER; an_error: POINTER; a_first_type: INTEGER_32; a_first_attr: POINTER; ): INTEGER_32 is
 		-- g_markup_collect_attributes			-- Variadic call

		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_markup_collect_attributes"
		}"
		end

	g_markup_error_quark: NATURAL_32 is
 		-- g_markup_error_quark			-- Variadic call

		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_markup_error_quark"
		}"
		end

	g_markup_escape_text (a_text: POINTER; a_length: INTEGER_32): POINTER is
 		-- g_markup_escape_text
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_markup_escape_text"
		}"
		end

	g_markup_parse_context_end_parse (a_context: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_markup_parse_context_end_parse
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_markup_parse_context_end_parse"
		}"
		end

	g_markup_parse_context_new (a_parser: POINTER; a_flags: INTEGER_32; an_user_data: POINTER; an_user_data_dnotify: POINTER): POINTER is
 		-- g_markup_parse_context_new
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_markup_parse_context_new"
		}"
		end

	g_markup_parse_context_parse (a_context: POINTER; a_text: POINTER; a_text_len: INTEGER_32; an_error: POINTER): INTEGER_32 is
 		-- g_markup_parse_context_parse
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_markup_parse_context_parse"
		}"
		end

	g_markup_parse_context_get_user_data (a_context: POINTER): POINTER is
 		-- g_markup_parse_context_get_user_data
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_markup_parse_context_get_user_data"
		}"
		end

end
