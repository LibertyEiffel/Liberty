-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GMARKUP_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_markup_parse_context_free (a_context: POINTER) is
 		-- g_markup_parse_context_free (node at line 103)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_markup_parse_context_free"
		}"
		end

	g_markup_printf_escaped (a_format: POINTER): POINTER is
 		-- g_markup_printf_escaped (variadic call)  (node at line 444)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_markup_printf_escaped"
		}"
		end

	g_markup_parse_context_get_element (a_context: POINTER): POINTER is
 		-- g_markup_parse_context_get_element (node at line 1221)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_markup_parse_context_get_element"
		}"
		end

	g_markup_parse_context_pop (a_context: POINTER): POINTER is
 		-- g_markup_parse_context_pop (node at line 3036)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_markup_parse_context_pop"
		}"
		end

	g_markup_parse_context_push (a_context: POINTER; a_parser: POINTER; an_user_data: POINTER) is
 		-- g_markup_parse_context_push (node at line 3197)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_markup_parse_context_push"
		}"
		end

	g_markup_parse_context_get_position (a_context: POINTER; a_line_number: POINTER; a_char_number: POINTER) is
 		-- g_markup_parse_context_get_position (node at line 3574)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_markup_parse_context_get_position"
		}"
		end

	g_markup_vprintf_escaped (a_format: POINTER; an_args: POINTER): POINTER is
 		-- g_markup_vprintf_escaped (node at line 3779)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_markup_vprintf_escaped"
		}"
		end

	g_markup_parse_context_get_element_stack (a_context: POINTER): POINTER is
 		-- g_markup_parse_context_get_element_stack (node at line 4347)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_markup_parse_context_get_element_stack"
		}"
		end

	g_markup_collect_attributes (an_element_name: POINTER; an_attribute_names: POINTER; an_attribute_values: POINTER; an_error: POINTER; a_first_type: INTEGER; a_first_attr: POINTER): INTEGER_32 is
 		-- g_markup_collect_attributes (variadic call)  (node at line 4603)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_markup_collect_attributes"
		}"
		end

	g_markup_error_quark: NATURAL_32 is
 		-- g_markup_error_quark (node at line 4877)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_markup_error_quark()"
		}"
		end

	g_markup_escape_text (a_text: POINTER; a_length: INTEGER_32): POINTER is
 		-- g_markup_escape_text (node at line 5015)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_markup_escape_text"
		}"
		end

	g_markup_parse_context_end_parse (a_context: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_markup_parse_context_end_parse (node at line 5636)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_markup_parse_context_end_parse"
		}"
		end

	g_markup_parse_context_new (a_parser: POINTER; a_flags: INTEGER; an_user_data: POINTER; an_user_data_dnotify: POINTER): POINTER is
 		-- g_markup_parse_context_new (node at line 5896)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_markup_parse_context_new"
		}"
		end

	g_markup_parse_context_parse (a_context: POINTER; a_text: POINTER; a_text_len: INTEGER_32; an_error: POINTER): INTEGER_32 is
 		-- g_markup_parse_context_parse (node at line 6402)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_markup_parse_context_parse"
		}"
		end

	g_markup_parse_context_get_user_data (a_context: POINTER): POINTER is
 		-- g_markup_parse_context_get_user_data (node at line 6478)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_markup_parse_context_get_user_data"
		}"
		end


end -- class GMARKUP_EXTERNALS
