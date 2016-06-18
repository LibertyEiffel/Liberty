-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_DICT_DATABASE_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_dict_database_get_tables_fk_constraints (a_db: POINTER; a_table1: POINTER; a_table2: POINTER; a_table1_has_fk: INTEGER_32): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_dict_database_get_table_constraints (a_db: POINTER; a_table: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_dict_database_get_all_fk_constraints (a_db: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_dict_database_get_all_constraints (a_db: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_dict_database_add_constraint (a_db: POINTER; a_cstr: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_dict_database_get_field_by_xml_id (a_db: POINTER; a_xml_id: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_dict_database_get_field_by_name (a_db: POINTER; a_fullname: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_dict_database_get_table_by_xml_id (a_db: POINTER; a_xml_id: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_dict_database_get_table_by_name (a_db: POINTER; a_name: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_dict_database_get_tables (a_db: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_dict_database_stop_update_dbms_data (a_db: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_dict_database_update_dbms_data (a_db: POINTER; a_limit_to_type: INTEGER_32; a_limit_obj_name: POINTER; an_error: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_dict_database_get_dict (a_db: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_dict_database_new (a_dict: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_dict_database_get_type: INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_dict_database_error_quark: INTEGER_32
		external "C use <libgda/libgda.h>"
		end

end
