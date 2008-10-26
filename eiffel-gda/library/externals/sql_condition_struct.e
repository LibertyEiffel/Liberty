-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class SQL_CONDITION_STRUCT

inherit ANY undefine is_equal, copy end

feature {} -- Low-level setters
	low_level_set_op (a_structure: POINTER; a_value: INTEGER_32) is
		external "C struct sql_condition set op use <libgda/libgda.h>"
		end

	low_level_set_negated (a_structure: POINTER; a_value: INTEGER_32) is
		external "C struct sql_condition set negated use <libgda/libgda.h>"
		end

feature {} -- Low-level queries
	get_op (a_structure: POINTER): INTEGER_32 is
		external "C struct sql_condition get op use <libgda/libgda.h>"
		end

	get_negated (a_structure: POINTER): INTEGER_32 is
		external "C struct sql_condition get negated use <libgda/libgda.h>"
		end

	-- Unwrappable d: Unhnalded union type
end
