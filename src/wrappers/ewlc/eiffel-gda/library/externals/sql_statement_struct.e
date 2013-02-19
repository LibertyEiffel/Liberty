-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class SQL_STATEMENT_STRUCT

inherit ANY undefine is_equal, copy end

feature {} -- Low-level setters
	low_level_set_type (a_structure: POINTER; a_value: INTEGER_32) is
		external "C struct sql_statement set type use <libgda/libgda.h>"
		end

	low_level_set_full_query (a_structure: POINTER; a_value: POINTER) is
		external "C struct sql_statement set full_query use <libgda/libgda.h>"
		end

	low_level_set_statement (a_structure: POINTER; a_value: POINTER) is
		external "C struct sql_statement set statement use <libgda/libgda.h>"
		end

feature {} -- Low-level queries
	get_type (a_structure: POINTER): INTEGER_32 is
		external "C struct sql_statement get type use <libgda/libgda.h>"
		end

	get_full_query (a_structure: POINTER): POINTER is
		external "C struct sql_statement get full_query use <libgda/libgda.h>"
		end

	get_statement (a_structure: POINTER): POINTER is
		external "C struct sql_statement get statement use <libgda/libgda.h>"
		end

end
