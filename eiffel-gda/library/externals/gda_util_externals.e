-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_UTIL_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_utility_find_or_create_data_type (a_dict: POINTER; a_prov: POINTER; a_cnc: POINTER; a_dbms_type: POINTER; a_g_type: POINTER; a_created: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_utility_parameter_load_attributes (a_param: POINTER; a_node: POINTER; a_sources: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_utility_data_model_dump_data_to_xml (a_model: POINTER; a_parent: POINTER; a_cols: POINTER; a_nb_cols: INTEGER_32; a_rows: POINTER; a_nb_rows: INTEGER_32; an_use_col_ids: INTEGER_32) is
		external "C use <libgda/libgda.h>"
		end

	gda_utility_check_data_model (a_model: POINTER; a_nbcols: INTEGER_32; ): INTEGER_32 is
			-- Variadic call
		external "C use <libgda/libgda.h>"
		end

	gda_utility_build_decoded_id (a_prefix: POINTER; an_id: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_utility_build_encoded_id (a_prefix: POINTER; an_id: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_utility_table_field_attrs_parse (a_str: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_utility_table_field_attrs_stringify (an_attributes: INTEGER_32): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_file_save (a_filename: POINTER; a_buffer: POINTER; a_len: INTEGER_32): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_file_load (a_filename: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_default_unescape_string (a_string: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_default_escape_string (a_string: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_string_hash_to_list (a_hash_table: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_g_type_from_string (a_str: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_g_type_to_string (a_type: INTEGER_32): POINTER is
		external "C use <libgda/libgda.h>"
		end

end
