-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class G_TRASH_STACK_STRUCT

inherit ANY undefine is_equal, copy end

feature {} -- Low-level setters

	gtrashstack_struct_set_next (a_structure: POINTER; a_value: POINTER) is
			-- Setter for next field of GTrashStack structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gtrashstack_struct_set_next"
		}"
		end

feature {} -- Low-level queries

	gtrashstack_struct_get_next (a_structure: POINTER): POINTER is
			-- Query for next field of GTrashStack structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gtrashstack_struct_get_next"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "sizeof_GTrashStack"
		}"
		end

end
