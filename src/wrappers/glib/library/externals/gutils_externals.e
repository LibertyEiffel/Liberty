-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GUTILS_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_atexit (a_func: POINTER) is
 		-- g_atexit
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_atexit"
		}"
		end

	g_bit_nth_lsf (a_mask: NATURAL_64; a_nth_bit: INTEGER_32): INTEGER_32 is
 		-- g_bit_nth_lsf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bit_nth_lsf"
		}"
		end

	g_bit_nth_msf (a_mask: NATURAL_64; a_nth_bit: INTEGER_32): INTEGER_32 is
 		-- g_bit_nth_msf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bit_nth_msf"
		}"
		end

	g_bit_storage (a_number: NATURAL_64): NATURAL_32 is
 		-- g_bit_storage
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bit_storage"
		}"
		end

	g_find_program_in_path (a_program: POINTER): POINTER is
 		-- g_find_program_in_path
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_find_program_in_path"
		}"
		end

	g_format_size (a_size: NATURAL_64): POINTER is
 		-- g_format_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_format_size"
		}"
		end

	g_format_size_for_display (a_size: INTEGER_64): POINTER is
 		-- g_format_size_for_display
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_format_size_for_display"
		}"
		end

	g_format_size_full (a_size: NATURAL_64; a_flags: INTEGER): POINTER is
 		-- g_format_size_full
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_format_size_full"
		}"
		end

	g_get_application_name: POINTER is
 		-- g_get_application_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_get_application_name()"
		}"
		end

	g_get_home_dir: POINTER is
 		-- g_get_home_dir
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_get_home_dir()"
		}"
		end

	g_get_host_name: POINTER is
 		-- g_get_host_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_get_host_name()"
		}"
		end

	g_get_prgname: POINTER is
 		-- g_get_prgname
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_get_prgname()"
		}"
		end

	g_get_real_name: POINTER is
 		-- g_get_real_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_get_real_name()"
		}"
		end

	g_get_system_config_dirs: POINTER is
 		-- g_get_system_config_dirs
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_get_system_config_dirs()"
		}"
		end

	g_get_system_data_dirs: POINTER is
 		-- g_get_system_data_dirs
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_get_system_data_dirs()"
		}"
		end

	g_get_tmp_dir: POINTER is
 		-- g_get_tmp_dir
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_get_tmp_dir()"
		}"
		end

	g_get_user_cache_dir: POINTER is
 		-- g_get_user_cache_dir
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_get_user_cache_dir()"
		}"
		end

	g_get_user_config_dir: POINTER is
 		-- g_get_user_config_dir
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_get_user_config_dir()"
		}"
		end

	g_get_user_data_dir: POINTER is
 		-- g_get_user_data_dir
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_get_user_data_dir()"
		}"
		end

	g_get_user_name: POINTER is
 		-- g_get_user_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_get_user_name()"
		}"
		end

	g_get_user_runtime_dir: POINTER is
 		-- g_get_user_runtime_dir
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_get_user_runtime_dir()"
		}"
		end

	g_get_user_special_dir (a_directory: INTEGER): POINTER is
 		-- g_get_user_special_dir
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_get_user_special_dir"
		}"
		end

	g_nullify_pointer (a_nullify_location: POINTER) is
 		-- g_nullify_pointer
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_nullify_pointer"
		}"
		end

	g_parse_debug_string (a_string: POINTER; a_keys: POINTER; a_nkeys: NATURAL_32): NATURAL_32 is
 		-- g_parse_debug_string
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_parse_debug_string"
		}"
		end

	g_reload_user_special_dirs_cache is
 		-- g_reload_user_special_dirs_cache
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_reload_user_special_dirs_cache()"
		}"
		end

	g_set_application_name (an_application_name: POINTER) is
 		-- g_set_application_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_set_application_name"
		}"
		end

	g_set_prgname (a_prgname: POINTER) is
 		-- g_set_prgname
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_set_prgname"
		}"
		end

	g_snprintf (a_string: POINTER; a_n: NATURAL_64; a_format: POINTER): INTEGER_32 is
 		-- g_snprintf (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_snprintf"
		}"
		end

	g_vsnprintf (a_string: POINTER; a_n: NATURAL_64; a_format: POINTER; an_args: POINTER): INTEGER_32 is
 		-- g_vsnprintf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_vsnprintf"
		}"
		end


end -- class GUTILS_EXTERNALS
