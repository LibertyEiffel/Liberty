-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GONCE_STRUCT

inherit ANY undefine is_equal, copy end

insert GLIB_TYPES
feature {} -- Low-level setters

	gonce_struct_set_status (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for status field of GONCE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gonce_struct_set_status"
		}"
		end

	gonce_struct_set_retval (a_structure: POINTER; a_value: POINTER) is
			-- Setter for retval field of GONCE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gonce_struct_set_retval"
		}"
		end

feature {} -- Low-level queries

	gonce_struct_get_status (a_structure: POINTER): INTEGER is
			-- Query for status field of GONCE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gonce_struct_get_status"
		}"
		end

	gonce_struct_get_retval (a_structure: POINTER): POINTER is
			-- Query for retval field of GONCE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gonce_struct_get_retval"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GOnce"
		}"
		end

end -- class GONCE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

