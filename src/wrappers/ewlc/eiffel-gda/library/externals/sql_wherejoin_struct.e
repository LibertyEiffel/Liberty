-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class SQL_WHEREJOIN_STRUCT

inherit ANY undefine is_equal, copy end

feature {} -- Low-level setters
	low_level_set_leftfield (a_structure: POINTER; a_value: POINTER) is
		external "C struct sql_wherejoin set leftfield use <libgda/libgda.h>"
		end

	low_level_set_rightfield (a_structure: POINTER; a_value: POINTER) is
		external "C struct sql_wherejoin set rightfield use <libgda/libgda.h>"
		end

	low_level_set_condopr (a_structure: POINTER; a_value: INTEGER_32) is
		external "C struct sql_wherejoin set condopr use <libgda/libgda.h>"
		end

	low_level_set_rightconstaint (a_structure: POINTER; a_value: INTEGER_32) is
		external "C struct sql_wherejoin set rightconstaint use <libgda/libgda.h>"
		end

	low_level_set_leftconstaint (a_structure: POINTER; a_value: INTEGER_32) is
		external "C struct sql_wherejoin set leftconstaint use <libgda/libgda.h>"
		end

	low_level_set_isajoin (a_structure: POINTER; a_value: INTEGER_32) is
		external "C struct sql_wherejoin set isajoin use <libgda/libgda.h>"
		end

	low_level_set_orginalwhere (a_structure: POINTER; a_value: POINTER) is
		external "C struct sql_wherejoin set orginalwhere use <libgda/libgda.h>"
		end

feature {} -- Low-level queries
	get_leftfield (a_structure: POINTER): POINTER is
		external "C struct sql_wherejoin get leftfield use <libgda/libgda.h>"
		end

	get_rightfield (a_structure: POINTER): POINTER is
		external "C struct sql_wherejoin get rightfield use <libgda/libgda.h>"
		end

	get_condopr (a_structure: POINTER): INTEGER_32 is
		external "C struct sql_wherejoin get condopr use <libgda/libgda.h>"
		end

	get_rightconstaint (a_structure: POINTER): INTEGER_32 is
		external "C struct sql_wherejoin get rightconstaint use <libgda/libgda.h>"
		end

	get_leftconstaint (a_structure: POINTER): INTEGER_32 is
		external "C struct sql_wherejoin get leftconstaint use <libgda/libgda.h>"
		end

	get_isajoin (a_structure: POINTER): INTEGER_32 is
		external "C struct sql_wherejoin get isajoin use <libgda/libgda.h>"
		end

	get_orginalwhere (a_structure: POINTER): POINTER is
		external "C struct sql_wherejoin get orginalwhere use <libgda/libgda.h>"
		end

end
