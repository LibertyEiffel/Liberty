-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_CONFIG_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_config_remove_data_source (a_name: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_config_save_data_source_info (a_dsn_info: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_config_save_data_source (a_name: POINTER; a_provider: POINTER; a_cnc_string: POINTER; a_description: POINTER; an_username: POINTER; a_password: POINTER; an_is_global: INTEGER_32): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_config_can_modify_global_config: INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_config_get_data_source_model: POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_config_free_data_source_list (a_list: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_config_get_data_source_list: POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_data_source_info_free (an_info: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_config_find_data_source (a_name: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_data_source_info_equal (an_info1: POINTER; an_info2: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_data_source_info_copy (a_src: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_data_source_info_get_type: INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_config_get_provider_model: POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_config_get_provider_by_name (a_name: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_config_free_provider_list (a_list: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_config_get_provider_list: POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_provider_info_free (a_provider_info: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_provider_info_copy (a_src: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_provider_info_get_type: INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_config_remove_listener (an_id: INTEGER_32) is
		external "C use <libgda/libgda.h>"
		end

	gda_config_add_listener (a_path: POINTER; a_func: POINTER; an_user_data: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_config_free_list (a_list: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_config_get_type (a_path: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_config_list_keys (a_path: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_config_list_sections (a_path: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_config_has_key (a_path: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_config_has_section (a_path: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_config_remove_key (a_path: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_config_remove_section (a_path: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_config_set_boolean (a_path: POINTER; a_new_value: INTEGER_32): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_config_set_float (a_path: POINTER; a_new_value: REAL_64): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_config_set_int (a_path: POINTER; a_new_value: INTEGER_32): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_config_set_string (a_path: POINTER; a_new_value: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_config_get_boolean (a_path: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_config_get_float (a_path: POINTER): REAL_64 is
		external "C use <libgda/libgda.h>"
		end

	gda_config_get_int (a_path: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_config_get_string (a_path: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

end
