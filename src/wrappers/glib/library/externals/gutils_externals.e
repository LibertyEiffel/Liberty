-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GUTILS_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_atexit (a_func: POINTER) 
               -- g_atexit
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_atexit"
               }"
               end

	g_bit_nth_lsf (a_mask: like long_unsigned; a_nth_bit: INTEGER): INTEGER 
               -- g_bit_nth_lsf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_bit_nth_lsf"
               }"
               end

	g_bit_nth_msf (a_mask: like long_unsigned; a_nth_bit: INTEGER): INTEGER 
               -- g_bit_nth_msf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_bit_nth_msf"
               }"
               end

	g_bit_storage (a_number: like long_unsigned): NATURAL 
               -- g_bit_storage
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_bit_storage"
               }"
               end

	g_find_program_in_path (a_program: POINTER): POINTER 
               -- g_find_program_in_path
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_find_program_in_path"
               }"
               end

	g_format_size (a_size: like long_unsigned): POINTER 
               -- g_format_size
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_format_size"
               }"
               end

	g_format_size_for_display (a_size: like long): POINTER 
               -- g_format_size_for_display
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_format_size_for_display"
               }"
               end

	g_format_size_full (a_size: like long_unsigned; a_flags: INTEGER): POINTER 
               -- g_format_size_full
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_format_size_full"
               }"
               end

	g_get_application_name: POINTER 
               -- g_get_application_name
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_get_application_name"
               }"
               end

	g_get_home_dir: POINTER 
               -- g_get_home_dir
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_get_home_dir"
               }"
               end

	g_get_host_name: POINTER 
               -- g_get_host_name
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_get_host_name"
               }"
               end

	g_get_prgname: POINTER 
               -- g_get_prgname
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_get_prgname"
               }"
               end

	g_get_real_name: POINTER 
               -- g_get_real_name
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_get_real_name"
               }"
               end

	g_get_system_config_dirs: POINTER 
               -- g_get_system_config_dirs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_get_system_config_dirs"
               }"
               end

	g_get_system_data_dirs: POINTER 
               -- g_get_system_data_dirs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_get_system_data_dirs"
               }"
               end

	g_get_tmp_dir: POINTER 
               -- g_get_tmp_dir
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_get_tmp_dir"
               }"
               end

	g_get_user_cache_dir: POINTER 
               -- g_get_user_cache_dir
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_get_user_cache_dir"
               }"
               end

	g_get_user_config_dir: POINTER 
               -- g_get_user_config_dir
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_get_user_config_dir"
               }"
               end

	g_get_user_data_dir: POINTER 
               -- g_get_user_data_dir
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_get_user_data_dir"
               }"
               end

	g_get_user_name: POINTER 
               -- g_get_user_name
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_get_user_name"
               }"
               end

	g_get_user_runtime_dir: POINTER 
               -- g_get_user_runtime_dir
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_get_user_runtime_dir"
               }"
               end

	g_get_user_special_dir (a_directory: INTEGER): POINTER 
               -- g_get_user_special_dir
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_get_user_special_dir"
               }"
               end

	g_nullify_pointer (a_nullify_location: POINTER) 
               -- g_nullify_pointer
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_nullify_pointer"
               }"
               end

	g_parse_debug_string (a_string: POINTER; a_keys: POINTER; a_nkeys: NATURAL): NATURAL 
               -- g_parse_debug_string
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_parse_debug_string"
               }"
               end

	g_reload_user_special_dirs_cache 
               -- g_reload_user_special_dirs_cache
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_reload_user_special_dirs_cache"
               }"
               end

	g_set_application_name (an_application_name: POINTER) 
               -- g_set_application_name
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_set_application_name"
               }"
               end

	g_set_prgname (a_prgname: POINTER) 
               -- g_set_prgname
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_set_prgname"
               }"
               end

	g_snprintf (a_string: POINTER; a_n: like long_unsigned; a_format: POINTER): INTEGER 
               -- g_snprintf (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_snprintf"
               }"
               end

	g_vsnprintf (a_string: POINTER; a_n: like long_unsigned; a_format: POINTER; an_args: POINTER): INTEGER 
               -- g_vsnprintf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_vsnprintf"
               }"
               end


end -- class GUTILS_EXTERNALS
