-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class PARSE_DATA_STRUCT

inherit ANY undefine is_equal, copy end

feature {} -- Low-level setters
	low_level_set_prev_targets (a_structure: POINTER; a_value: POINTER) is
		external "C struct ParseData set prev_targets use <libgda/libgda.h>"
		end

	low_level_set_prev_fields (a_structure: POINTER; a_value: POINTER) is
		external "C struct ParseData set prev_fields use <libgda/libgda.h>"
		end

	low_level_set_parsed_targets (a_structure: POINTER; a_value: POINTER) is
		external "C struct ParseData set parsed_targets use <libgda/libgda.h>"
		end

	low_level_set_new_targets (a_structure: POINTER; a_value: POINTER) is
		external "C struct ParseData set new_targets use <libgda/libgda.h>"
		end

	low_level_set_sql_table_targets (a_structure: POINTER; a_value: POINTER) is
		external "C struct ParseData set sql_table_targets use <libgda/libgda.h>"
		end

feature {} -- Low-level queries
	get_prev_targets (a_structure: POINTER): POINTER is
		external "C struct ParseData get prev_targets use <libgda/libgda.h>"
		end

	get_prev_fields (a_structure: POINTER): POINTER is
		external "C struct ParseData get prev_fields use <libgda/libgda.h>"
		end

	get_parsed_targets (a_structure: POINTER): POINTER is
		external "C struct ParseData get parsed_targets use <libgda/libgda.h>"
		end

	get_new_targets (a_structure: POINTER): POINTER is
		external "C struct ParseData get new_targets use <libgda/libgda.h>"
		end

	get_sql_table_targets (a_structure: POINTER): POINTER is
		external "C struct ParseData get sql_table_targets use <libgda/libgda.h>"
		end

end
