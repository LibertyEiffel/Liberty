-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class GUTILS_EXTERNALS


inherit ANY undefine is_equal, copy end

feature {} -- External calls

	g_find_program_in_path (a_program: POINTER): POINTER is
 		-- g_find_program_in_path
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_find_program_in_path"
		}"
		end

	g_parse_debug_string (a_string: POINTER; a_keys: POINTER; a_nkeys: NATURAL_32): NATURAL_32 is
 		-- g_parse_debug_string
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_parse_debug_string"
		}"
		end

	g_get_user_config_dir: POINTER is
 		-- g_get_user_config_dir
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_get_user_config_dir"
		}"
		end

	g_get_application_name: POINTER is
 		-- g_get_application_name
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_get_application_name"
		}"
		end

	g_get_real_name: POINTER is
 		-- g_get_real_name
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_get_real_name"
		}"
		end

	g_path_skip_root (a_file_name: POINTER): POINTER is
 		-- g_path_skip_root
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_path_skip_root"
		}"
		end

	g_path_get_dirname (a_file_name: POINTER): POINTER is
 		-- g_path_get_dirname
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_path_get_dirname"
		}"
		end

	g_nullify_pointer (a_nullify_location: POINTER) is
 		-- g_nullify_pointer
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_nullify_pointer"
		}"
		end

	g_get_current_dir: POINTER is
 		-- g_get_current_dir
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_get_current_dir"
		}"
		end

	g_get_system_config_dirs: POINTER is
 		-- g_get_system_config_dirs
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_get_system_config_dirs"
		}"
		end

	g_get_tmp_dir: POINTER is
 		-- g_get_tmp_dir
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_get_tmp_dir"
		}"
		end

	g_get_home_dir: POINTER is
 		-- g_get_home_dir
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_get_home_dir"
		}"
		end

	g_bit_storage (a_number: NATURAL_32): NATURAL_32 is
 		-- g_bit_storage
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_bit_storage"
		}"
		end

	g_snprintf (a_string: POINTER; a_n: NATURAL_32; a_format: POINTER; ): INTEGER_32 is
 		-- g_snprintf			-- Variadic call

		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_snprintf"
		}"
		end

	g_vsnprintf (a_string: POINTER; a_n: NATURAL_32; a_format: POINTER; an_args: POINTER): INTEGER_32 is
 		-- g_vsnprintf
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_vsnprintf"
		}"
		end

	g_trash_stack_push (a_stack_p: POINTER; a_data_p: POINTER) is
 		-- g_trash_stack_push
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_trash_stack_push"
		}"
		end

	g_get_user_data_dir: POINTER is
 		-- g_get_user_data_dir
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_get_user_data_dir"
		}"
		end

	g_get_user_name: POINTER is
 		-- g_get_user_name
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_get_user_name"
		}"
		end

	g_reload_user_special_dirs_cache is
 		-- g_reload_user_special_dirs_cache
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_reload_user_special_dirs_cache"
		}"
		end

	g_get_host_name: POINTER is
 		-- g_get_host_name
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_get_host_name"
		}"
		end

	g_path_is_absolute (a_file_name: POINTER): INTEGER_32 is
 		-- g_path_is_absolute
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_path_is_absolute"
		}"
		end

	g_get_user_special_dir (a_directory: INTEGER_32): POINTER is
 		-- g_get_user_special_dir
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_get_user_special_dir"
		}"
		end

	g_basename (a_file_name: POINTER): POINTER is
 		-- g_basename
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_basename"
		}"
		end

	g_listenv: POINTER is
 		-- g_listenv
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_listenv"
		}"
		end

	glib_check_version (a_required_major: NATURAL_32; a_required_minor: NATURAL_32; a_required_micro: NATURAL_32): POINTER is
 		-- glib_check_version
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "glib_check_version"
		}"
		end

	g_unsetenv (a_variable: POINTER) is
 		-- g_unsetenv
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_unsetenv"
		}"
		end

	g_set_prgname (a_prgname: POINTER) is
 		-- g_set_prgname
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_set_prgname"
		}"
		end

	g_bit_nth_lsf (a_mask: NATURAL_32; a_nth_bit: INTEGER_32): INTEGER_32 is
 		-- g_bit_nth_lsf
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_bit_nth_lsf"
		}"
		end

	g_path_get_basename (a_file_name: POINTER): POINTER is
 		-- g_path_get_basename
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_path_get_basename"
		}"
		end

	g_getenv (a_variable: POINTER): POINTER is
 		-- g_getenv
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_getenv"
		}"
		end

	g_get_system_data_dirs: POINTER is
 		-- g_get_system_data_dirs
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_get_system_data_dirs"
		}"
		end

	g_get_language_names: POINTER is
 		-- g_get_language_names
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_get_language_names"
		}"
		end

	g_trash_stack_pop (a_stack_p: POINTER): POINTER is
 		-- g_trash_stack_pop
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_trash_stack_pop"
		}"
		end

	g_atexit (a_func: POINTER) is
 		-- g_atexit
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_atexit"
		}"
		end

	g_setenv (a_variable: POINTER; a_value: POINTER; an_overwrite: INTEGER_32): INTEGER_32 is
 		-- g_setenv
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_setenv"
		}"
		end

	g_set_application_name (an_application_name: POINTER) is
 		-- g_set_application_name
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_set_application_name"
		}"
		end

	g_get_user_cache_dir: POINTER is
 		-- g_get_user_cache_dir
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_get_user_cache_dir"
		}"
		end

	g_trash_stack_height (a_stack_p: POINTER): NATURAL_32 is
 		-- g_trash_stack_height
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_trash_stack_height"
		}"
		end

	g_bit_nth_msf (a_mask: NATURAL_32; a_nth_bit: INTEGER_32): INTEGER_32 is
 		-- g_bit_nth_msf
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_bit_nth_msf"
		}"
		end

	g_trash_stack_peek (a_stack_p: POINTER): POINTER is
 		-- g_trash_stack_peek
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_trash_stack_peek"
		}"
		end

	g_get_prgname: POINTER is
 		-- g_get_prgname
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_get_prgname"
		}"
		end

end
