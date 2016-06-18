-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class SQL_ORDER_FIELD_STRUCT

inherit ANY undefine is_equal, copy end

feature {} -- Low-level setters
	low_level_set_order_type (a_structure: POINTER; a_value: INTEGER_32)
		external "C struct sql_order_field set order_type use <libgda/libgda.h>"
		end

	low_level_set_name (a_structure: POINTER; a_value: POINTER)
		external "C struct sql_order_field set name use <libgda/libgda.h>"
		end

feature {} -- Low-level queries
	get_order_type (a_structure: POINTER): INTEGER_32
		external "C struct sql_order_field get order_type use <libgda/libgda.h>"
		end

	get_name (a_structure: POINTER): POINTER
		external "C struct sql_order_field get name use <libgda/libgda.h>"
		end

end
