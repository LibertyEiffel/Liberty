-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GOPTION_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_option_context_add_group (a_context: POINTER; a_group: POINTER) 
               -- g_option_context_add_group
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_option_context_add_group"
               }"
               end

	g_option_context_add_main_entries (a_context: POINTER; an_entries: POINTER; a_translation_domain: POINTER) 
               -- g_option_context_add_main_entries
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_option_context_add_main_entries"
               }"
               end

	g_option_context_free (a_context: POINTER) 
               -- g_option_context_free
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_option_context_free"
               }"
               end

	g_option_context_get_description (a_context: POINTER): POINTER 
               -- g_option_context_get_description
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_option_context_get_description"
               }"
               end

	g_option_context_get_help (a_context: POINTER; a_main_help: INTEGER; a_group: POINTER): POINTER 
               -- g_option_context_get_help
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_option_context_get_help"
               }"
               end

	g_option_context_get_help_enabled (a_context: POINTER): INTEGER 
               -- g_option_context_get_help_enabled
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_option_context_get_help_enabled"
               }"
               end

	g_option_context_get_ignore_unknown_options (a_context: POINTER): INTEGER 
               -- g_option_context_get_ignore_unknown_options
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_option_context_get_ignore_unknown_options"
               }"
               end

	g_option_context_get_main_group (a_context: POINTER): POINTER 
               -- g_option_context_get_main_group
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_option_context_get_main_group"
               }"
               end

	g_option_context_get_strict_posix (a_context: POINTER): INTEGER 
               -- g_option_context_get_strict_posix
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_option_context_get_strict_posix"
               }"
               end

	g_option_context_get_summary (a_context: POINTER): POINTER 
               -- g_option_context_get_summary
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_option_context_get_summary"
               }"
               end

	g_option_context_new (a_parameter_string: POINTER): POINTER 
               -- g_option_context_new
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_option_context_new"
               }"
               end

	g_option_context_parse (a_context: POINTER; an_argc: POINTER; an_argv: POINTER; an_error: POINTER): INTEGER 
               -- g_option_context_parse
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_option_context_parse"
               }"
               end

	g_option_context_parse_strv (a_context: POINTER; an_arguments: POINTER; an_error: POINTER): INTEGER 
               -- g_option_context_parse_strv
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_option_context_parse_strv"
               }"
               end

	g_option_context_set_description (a_context: POINTER; a_description: POINTER) 
               -- g_option_context_set_description
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_option_context_set_description"
               }"
               end

	g_option_context_set_help_enabled (a_context: POINTER; a_help_enabled: INTEGER) 
               -- g_option_context_set_help_enabled
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_option_context_set_help_enabled"
               }"
               end

	g_option_context_set_ignore_unknown_options (a_context: POINTER; an_ignore_unknown: INTEGER) 
               -- g_option_context_set_ignore_unknown_options
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_option_context_set_ignore_unknown_options"
               }"
               end

	g_option_context_set_main_group (a_context: POINTER; a_group: POINTER) 
               -- g_option_context_set_main_group
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_option_context_set_main_group"
               }"
               end

	g_option_context_set_strict_posix (a_context: POINTER; a_strict_posix: INTEGER) 
               -- g_option_context_set_strict_posix
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_option_context_set_strict_posix"
               }"
               end

	g_option_context_set_summary (a_context: POINTER; a_summary: POINTER) 
               -- g_option_context_set_summary
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_option_context_set_summary"
               }"
               end

	g_option_context_set_translate_func (a_context: POINTER; a_func: POINTER; a_data: POINTER; a_destroy_notify: POINTER) 
               -- g_option_context_set_translate_func
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_option_context_set_translate_func"
               }"
               end

	g_option_context_set_translation_domain (a_context: POINTER; a_domain: POINTER) 
               -- g_option_context_set_translation_domain
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_option_context_set_translation_domain"
               }"
               end

	g_option_error_quark: NATURAL 
               -- g_option_error_quark
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_option_error_quark"
               }"
               end

	g_option_group_add_entries (a_group: POINTER; an_entries: POINTER) 
               -- g_option_group_add_entries
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_option_group_add_entries"
               }"
               end

	g_option_group_free (a_group: POINTER) 
               -- g_option_group_free
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_option_group_free"
               }"
               end

	g_option_group_new (a_name: POINTER; a_description: POINTER; a_help_description: POINTER; an_user_data: POINTER; a_destroy: POINTER): POINTER 
               -- g_option_group_new
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_option_group_new"
               }"
               end

	g_option_group_ref (a_group: POINTER): POINTER 
               -- g_option_group_ref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_option_group_ref"
               }"
               end

	g_option_group_set_error_hook (a_group: POINTER; an_error_func: POINTER) 
               -- g_option_group_set_error_hook
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_option_group_set_error_hook"
               }"
               end

	g_option_group_set_parse_hooks (a_group: POINTER; a_pre_parse_func: POINTER; a_post_parse_func: POINTER) 
               -- g_option_group_set_parse_hooks
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_option_group_set_parse_hooks"
               }"
               end

	g_option_group_set_translate_func (a_group: POINTER; a_func: POINTER; a_data: POINTER; a_destroy_notify: POINTER) 
               -- g_option_group_set_translate_func
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_option_group_set_translate_func"
               }"
               end

	g_option_group_set_translation_domain (a_group: POINTER; a_domain: POINTER) 
               -- g_option_group_set_translation_domain
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_option_group_set_translation_domain"
               }"
               end

	g_option_group_unref (a_group: POINTER) 
               -- g_option_group_unref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_option_group_unref"
               }"
               end


end -- class GOPTION_EXTERNALS
