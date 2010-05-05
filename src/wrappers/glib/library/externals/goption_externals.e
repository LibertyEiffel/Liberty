-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GOPTION_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_option_context_set_summary (a_context: POINTER; a_summary: POINTER) is
 		-- g_option_context_set_summary (node at line 28)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_option_context_set_summary"
		}"
		end

	g_option_group_set_translation_domain (a_group: POINTER; a_domain: POINTER) is
 		-- g_option_group_set_translation_domain (node at line 205)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_option_group_set_translation_domain"
		}"
		end

	g_option_context_add_group (a_context: POINTER; a_group: POINTER) is
 		-- g_option_context_add_group (node at line 390)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_option_context_add_group"
		}"
		end

	g_option_group_set_error_hook (a_group: POINTER; an_error_func: POINTER) is
 		-- g_option_group_set_error_hook (node at line 396)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_option_group_set_error_hook"
		}"
		end

	g_option_group_set_parse_hooks (a_group: POINTER; a_pre_parse_func: POINTER; a_post_parse_func: POINTER) is
 		-- g_option_group_set_parse_hooks (node at line 465)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_option_group_set_parse_hooks"
		}"
		end

	g_option_context_get_ignore_unknown_options (a_context: POINTER): INTEGER_32 is
 		-- g_option_context_get_ignore_unknown_options (node at line 691)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_option_context_get_ignore_unknown_options"
		}"
		end

	g_option_context_free (a_context: POINTER) is
 		-- g_option_context_free (node at line 1638)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_option_context_free"
		}"
		end

	g_option_context_get_summary (a_context: POINTER): POINTER is
 		-- g_option_context_get_summary (node at line 1822)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_option_context_get_summary"
		}"
		end

	g_option_context_get_help_enabled (a_context: POINTER): INTEGER_32 is
 		-- g_option_context_get_help_enabled (node at line 2034)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_option_context_get_help_enabled"
		}"
		end

	g_option_group_new (a_name: POINTER; a_description: POINTER; a_help_description: POINTER; an_user_data: POINTER; a_destroy: POINTER): POINTER is
 		-- g_option_group_new (node at line 2134)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_option_group_new"
		}"
		end

	g_option_context_parse (a_context: POINTER; an_argc: POINTER; an_argv: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_option_context_parse (node at line 2467)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_option_context_parse"
		}"
		end

	g_option_context_get_description (a_context: POINTER): POINTER is
 		-- g_option_context_get_description (node at line 2551)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_option_context_get_description"
		}"
		end

	g_option_context_get_main_group (a_context: POINTER): POINTER is
 		-- g_option_context_get_main_group (node at line 2640)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_option_context_get_main_group"
		}"
		end

	g_option_error_quark: NATURAL_32 is
 		-- g_option_error_quark (node at line 2784)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_option_error_quark()"
		}"
		end

	g_option_context_set_ignore_unknown_options (a_context: POINTER; an_ignore_unknown: INTEGER_32) is
 		-- g_option_context_set_ignore_unknown_options (node at line 3410)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_option_context_set_ignore_unknown_options"
		}"
		end

	g_option_group_add_entries (a_group: POINTER; an_entries: POINTER) is
 		-- g_option_group_add_entries (node at line 3581)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_option_group_add_entries"
		}"
		end

	g_option_group_free (a_group: POINTER) is
 		-- g_option_group_free (node at line 3687)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_option_group_free"
		}"
		end

	g_option_group_set_translate_func (a_group: POINTER; a_func: POINTER; a_data: POINTER; a_destroy_notify: POINTER) is
 		-- g_option_group_set_translate_func (node at line 4121)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_option_group_set_translate_func"
		}"
		end

	g_option_context_get_help (a_context: POINTER; a_main_help: INTEGER_32; a_group: POINTER): POINTER is
 		-- g_option_context_get_help (node at line 4580)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_option_context_get_help"
		}"
		end

	g_option_context_add_main_entries (a_context: POINTER; an_entries: POINTER; a_translation_domain: POINTER) is
 		-- g_option_context_add_main_entries (node at line 4851)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_option_context_add_main_entries"
		}"
		end

	g_option_context_set_description (a_context: POINTER; a_description: POINTER) is
 		-- g_option_context_set_description (node at line 5653)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_option_context_set_description"
		}"
		end

	g_option_context_set_help_enabled (a_context: POINTER; a_help_enabled: INTEGER_32) is
 		-- g_option_context_set_help_enabled (node at line 5661)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_option_context_set_help_enabled"
		}"
		end

	g_option_context_set_translation_domain (a_context: POINTER; a_domain: POINTER) is
 		-- g_option_context_set_translation_domain (node at line 5694)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_option_context_set_translation_domain"
		}"
		end

	g_option_context_set_translate_func (a_context: POINTER; a_func: POINTER; a_data: POINTER; a_destroy_notify: POINTER) is
 		-- g_option_context_set_translate_func (node at line 6510)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_option_context_set_translate_func"
		}"
		end

	g_option_context_set_main_group (a_context: POINTER; a_group: POINTER) is
 		-- g_option_context_set_main_group (node at line 6697)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_option_context_set_main_group"
		}"
		end

	g_option_context_new (a_parameter_string: POINTER): POINTER is
 		-- g_option_context_new (node at line 6814)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_option_context_new"
		}"
		end


end -- class GOPTION_EXTERNALS
