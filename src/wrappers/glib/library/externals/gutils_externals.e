-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GUTILS_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_find_program_in_path (a_program: POINTER): POINTER is
 		-- g_find_program_in_path (node at line 19)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_find_program_in_path"
		}"
		end

	g_parse_debug_string (a_string: POINTER; a_keys: POINTER; a_nkeys: NATURAL_32): NATURAL_32 is
 		-- g_parse_debug_string (node at line 87)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_parse_debug_string"
		}"
		end

	g_get_user_config_dir: POINTER is
 		-- g_get_user_config_dir (node at line 595)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_get_user_config_dir()"
		}"
		end

	g_get_application_name: POINTER is
 		-- g_get_application_name (node at line 967)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_get_application_name()"
		}"
		end

	g_get_real_name: POINTER is
 		-- g_get_real_name (node at line 1089)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_get_real_name()"
		}"
		end

	g_path_skip_root (a_file_name: POINTER): POINTER is
 		-- g_path_skip_root (node at line 1143)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_path_skip_root"
		}"
		end

	g_path_get_dirname (a_file_name: POINTER): POINTER is
 		-- g_path_get_dirname (node at line 1217)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_path_get_dirname"
		}"
		end

	g_nullify_pointer (a_nullify_location: POINTER) is
 		-- g_nullify_pointer (node at line 1376)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_nullify_pointer"
		}"
		end

	g_get_current_dir: POINTER is
 		-- g_get_current_dir (node at line 1411)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_get_current_dir()"
		}"
		end

	g_get_system_config_dirs: POINTER is
 		-- g_get_system_config_dirs (node at line 1543)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_get_system_config_dirs()"
		}"
		end

	g_get_tmp_dir: POINTER is
 		-- g_get_tmp_dir (node at line 1782)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_get_tmp_dir()"
		}"
		end

	-- `hidden' function _g_getenv_nomalloc skipped.
	g_get_home_dir: POINTER is
 		-- g_get_home_dir (node at line 2111)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_get_home_dir()"
		}"
		end

	g_bit_storage (a_number: NATURAL_32): NATURAL_32 is
 		-- g_bit_storage (node at line 2118)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bit_storage"
		}"
		end

	g_snprintf (a_string: POINTER; a_n: NATURAL_32; a_format: POINTER): INTEGER_32 is
 		-- g_snprintf (variadic call)  (node at line 2160)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_snprintf"
		}"
		end

	g_vsnprintf (a_string: POINTER; a_n: NATURAL_32; a_format: POINTER; an_args: POINTER): INTEGER_32 is
 		-- g_vsnprintf (node at line 2250)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_vsnprintf"
		}"
		end

	g_trash_stack_push (a_stack_p: POINTER; a_data_p: POINTER) is
 		-- g_trash_stack_push (node at line 2525)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_trash_stack_push"
		}"
		end

	g_get_user_data_dir: POINTER is
 		-- g_get_user_data_dir (node at line 2548)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_get_user_data_dir()"
		}"
		end

	g_get_user_name: POINTER is
 		-- g_get_user_name (node at line 2559)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_get_user_name()"
		}"
		end

	g_reload_user_special_dirs_cache is
 		-- g_reload_user_special_dirs_cache (node at line 3244)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_reload_user_special_dirs_cache()"
		}"
		end

	g_get_host_name: POINTER is
 		-- g_get_host_name (node at line 3281)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_get_host_name()"
		}"
		end

	g_path_is_absolute (a_file_name: POINTER): INTEGER_32 is
 		-- g_path_is_absolute (node at line 3287)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_path_is_absolute"
		}"
		end

	g_get_user_special_dir (a_directory: INTEGER): POINTER is
 		-- g_get_user_special_dir (node at line 3351)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_get_user_special_dir"
		}"
		end

	g_basename (a_file_name: POINTER): POINTER is
 		-- g_basename (node at line 3404)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_basename"
		}"
		end

	g_listenv: POINTER is
 		-- g_listenv (node at line 3783)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_listenv()"
		}"
		end

	glib_check_version (a_required_major: NATURAL_32; a_required_minor: NATURAL_32; a_required_micro: NATURAL_32): POINTER is
 		-- glib_check_version (node at line 4270)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "glib_check_version"
		}"
		end

	g_unsetenv (a_variable: POINTER) is
 		-- g_unsetenv (node at line 4366)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_unsetenv"
		}"
		end

	g_set_prgname (a_prgname: POINTER) is
 		-- g_set_prgname (node at line 4488)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_set_prgname"
		}"
		end

	g_bit_nth_lsf (a_mask: NATURAL_32; a_nth_bit: INTEGER_32): INTEGER_32 is
 		-- g_bit_nth_lsf (node at line 4555)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bit_nth_lsf"
		}"
		end

	g_path_get_basename (a_file_name: POINTER): POINTER is
 		-- g_path_get_basename (node at line 4618)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_path_get_basename"
		}"
		end

	g_getenv (a_variable: POINTER): POINTER is
 		-- g_getenv (node at line 4807)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_getenv"
		}"
		end

	g_get_system_data_dirs: POINTER is
 		-- g_get_system_data_dirs (node at line 5105)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_get_system_data_dirs()"
		}"
		end

	g_get_language_names: POINTER is
 		-- g_get_language_names (node at line 5377)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_get_language_names()"
		}"
		end

	g_trash_stack_pop (a_stack_p: POINTER): POINTER is
 		-- g_trash_stack_pop (node at line 5378)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_trash_stack_pop"
		}"
		end

	g_atexit (a_func: POINTER) is
 		-- g_atexit (node at line 5818)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_atexit"
		}"
		end

	g_setenv (a_variable: POINTER; a_value: POINTER; an_overwrite: INTEGER_32): INTEGER_32 is
 		-- g_setenv (node at line 5879)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_setenv"
		}"
		end

	g_set_application_name (an_application_name: POINTER) is
 		-- g_set_application_name (node at line 6059)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_set_application_name"
		}"
		end

	g_get_user_cache_dir: POINTER is
 		-- g_get_user_cache_dir (node at line 6243)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_get_user_cache_dir()"
		}"
		end

	g_trash_stack_height (a_stack_p: POINTER): NATURAL_32 is
 		-- g_trash_stack_height (node at line 6373)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_trash_stack_height"
		}"
		end

	g_bit_nth_msf (a_mask: NATURAL_32; a_nth_bit: INTEGER_32): INTEGER_32 is
 		-- g_bit_nth_msf (node at line 6451)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bit_nth_msf"
		}"
		end

	g_trash_stack_peek (a_stack_p: POINTER): POINTER is
 		-- g_trash_stack_peek (node at line 6472)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_trash_stack_peek"
		}"
		end

	g_get_prgname: POINTER is
 		-- g_get_prgname (node at line 6907)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_get_prgname()"
		}"
		end

feature {} -- Variables
	glib_major_version: NATURAL_32 is
 		-- glib_major_version (node at line 423)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "glib_major_version"
		}"
		end

	glib_interface_age: NATURAL_32 is
 		-- glib_interface_age (node at line 426)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "glib_interface_age"
		}"
		end

	glib_micro_version: NATURAL_32 is
 		-- glib_micro_version (node at line 425)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "glib_micro_version"
		}"
		end

	glib_binary_age: NATURAL_32 is
 		-- glib_binary_age (node at line 427)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "glib_binary_age"
		}"
		end

	glib_minor_version: NATURAL_32 is
 		-- glib_minor_version (node at line 424)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "glib_minor_version"
		}"
		end


end -- class GUTILS_EXTERNALS
