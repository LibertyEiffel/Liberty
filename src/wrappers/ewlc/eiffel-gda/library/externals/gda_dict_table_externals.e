-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_DICT_TABLE_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_dict_table_update_dbms_data (a_table: POINTER; an_error: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_dict_table_get_pk_constraint (a_table: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_dict_table_get_constraints (a_table: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_dict_table_get_parents (a_table: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_dict_table_is_view (a_table: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_dict_table_get_database (a_table: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_dict_table_new (a_dict: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_dict_table_get_type: INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_dict_table_error_quark: INTEGER_32
		external "C use <libgda/libgda.h>"
		end

end
