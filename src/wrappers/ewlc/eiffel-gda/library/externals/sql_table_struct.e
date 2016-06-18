-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class SQL_TABLE_STRUCT

inherit ANY undefine is_equal, copy end

feature {} -- Low-level setters
	low_level_set_type (a_structure: POINTER; a_value: INTEGER_32)
		external "C struct sql_table set type use <libgda/libgda.h>"
		end

	low_level_set_as (a_structure: POINTER; a_value: POINTER)
		external "C struct sql_table set as use <libgda/libgda.h>"
		end

	low_level_set_join_type (a_structure: POINTER; a_value: INTEGER_32)
		external "C struct sql_table set join_type use <libgda/libgda.h>"
		end

	low_level_set_join_cond (a_structure: POINTER; a_value: POINTER)
		external "C struct sql_table set join_cond use <libgda/libgda.h>"
		end

feature {} -- Low-level queries
	get_type (a_structure: POINTER): INTEGER_32
		external "C struct sql_table get type use <libgda/libgda.h>"
		end

	-- Unwrappable d: Unhnalded union type
	get_as (a_structure: POINTER): POINTER
		external "C struct sql_table get as use <libgda/libgda.h>"
		end

	get_join_type (a_structure: POINTER): INTEGER_32
		external "C struct sql_table get join_type use <libgda/libgda.h>"
		end

	get_join_cond (a_structure: POINTER): POINTER
		external "C struct sql_table get join_cond use <libgda/libgda.h>"
		end

end
