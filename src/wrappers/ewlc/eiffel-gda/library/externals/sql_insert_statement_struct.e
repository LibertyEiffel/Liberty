-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class SQL_INSERT_STATEMENT_STRUCT

inherit ANY undefine is_equal, copy end

feature {} -- Low-level setters
	low_level_set_table (a_structure: POINTER; a_value: POINTER) is
		external "C struct sql_insert_statement set table use <libgda/libgda.h>"
		end

	low_level_set_fields (a_structure: POINTER; a_value: POINTER) is
		external "C struct sql_insert_statement set fields use <libgda/libgda.h>"
		end

	low_level_set_values (a_structure: POINTER; a_value: POINTER) is
		external "C struct sql_insert_statement set values use <libgda/libgda.h>"
		end

feature {} -- Low-level queries
	get_table (a_structure: POINTER): POINTER is
		external "C struct sql_insert_statement get table use <libgda/libgda.h>"
		end

	get_fields (a_structure: POINTER): POINTER is
		external "C struct sql_insert_statement get fields use <libgda/libgda.h>"
		end

	get_values (a_structure: POINTER): POINTER is
		external "C struct sql_insert_statement get values use <libgda/libgda.h>"
		end

end
