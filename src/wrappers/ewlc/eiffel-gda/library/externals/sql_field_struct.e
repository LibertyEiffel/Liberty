-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class SQL_FIELD_STRUCT

inherit ANY undefine is_equal, copy end

feature {} -- Low-level setters
	low_level_set_item (a_structure: POINTER; a_value: POINTER) is
		external "C struct sql_field set item use <libgda/libgda.h>"
		end

	low_level_set_as (a_structure: POINTER; a_value: POINTER) is
		external "C struct sql_field set as use <libgda/libgda.h>"
		end

	low_level_set_param_spec (a_structure: POINTER; a_value: POINTER) is
		external "C struct sql_field set param_spec use <libgda/libgda.h>"
		end

feature {} -- Low-level queries
	get_item (a_structure: POINTER): POINTER is
		external "C struct sql_field get item use <libgda/libgda.h>"
		end

	get_as (a_structure: POINTER): POINTER is
		external "C struct sql_field get as use <libgda/libgda.h>"
		end

	get_param_spec (a_structure: POINTER): POINTER is
		external "C struct sql_field get param_spec use <libgda/libgda.h>"
		end

end
