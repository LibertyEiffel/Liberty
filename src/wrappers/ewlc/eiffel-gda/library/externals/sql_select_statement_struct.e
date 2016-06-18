-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class SQL_SELECT_STATEMENT_STRUCT

inherit ANY undefine is_equal, copy end

feature {} -- Low-level setters
	low_level_set_distinct (a_structure: POINTER; a_value: INTEGER_32)
		external "C struct sql_select_statement set distinct use <libgda/libgda.h>"
		end

	low_level_set_fields (a_structure: POINTER; a_value: POINTER)
		external "C struct sql_select_statement set fields use <libgda/libgda.h>"
		end

	low_level_set_from_external (a_structure: POINTER; a_value: POINTER)
		external "C struct sql_select_statement set from_external use <libgda/libgda.h>"
		end

	low_level_set_where (a_structure: POINTER; a_value: POINTER)
		external "C struct sql_select_statement set where use <libgda/libgda.h>"
		end

	low_level_set_order (a_structure: POINTER; a_value: POINTER)
		external "C struct sql_select_statement set order use <libgda/libgda.h>"
		end

	low_level_set_group (a_structure: POINTER; a_value: POINTER)
		external "C struct sql_select_statement set group use <libgda/libgda.h>"
		end

feature {} -- Low-level queries
	get_distinct (a_structure: POINTER): INTEGER_32
		external "C struct sql_select_statement get distinct use <libgda/libgda.h>"
		end

	get_fields (a_structure: POINTER): POINTER
		external "C struct sql_select_statement get fields use <libgda/libgda.h>"
		end

	get_from_external (a_structure: POINTER): POINTER
		external "C struct sql_select_statement get from_external use <libgda/libgda.h>"
		end

	get_where (a_structure: POINTER): POINTER
		external "C struct sql_select_statement get where use <libgda/libgda.h>"
		end

	get_order (a_structure: POINTER): POINTER
		external "C struct sql_select_statement get order use <libgda/libgda.h>"
		end

	get_group (a_structure: POINTER): POINTER
		external "C struct sql_select_statement get group use <libgda/libgda.h>"
		end

end
