-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class SQL_FIELD_ITEM_STRUCT

inherit ANY undefine is_equal, copy end

feature {} -- Low-level setters
	low_level_set_type (a_structure: POINTER; a_value: INTEGER_32) is
		external "C struct sql_field_item set type use <libgda/libgda.h>"
		end

feature {} -- Low-level queries
	get_type (a_structure: POINTER): INTEGER_32 is
		external "C struct sql_field_item get type use <libgda/libgda.h>"
		end

	-- Unwrappable d: Unhnalded union type
end
