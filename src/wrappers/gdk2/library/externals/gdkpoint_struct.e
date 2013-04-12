-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDKPOINT_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GDK_TYPES
feature {} -- Low-level setters

	gdkpoint_struct_set_x (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for x field of GDKPOINT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkpoint_struct_set_x"
		}"
		end

	gdkpoint_struct_set_y (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for y field of GDKPOINT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkpoint_struct_set_y"
		}"
		end

feature {} -- Low-level queries

	gdkpoint_struct_get_x (a_structure: POINTER): INTEGER_32 is
			-- Query for x field of GDKPOINT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkpoint_struct_get_x"
		}"
		end

	gdkpoint_struct_get_y (a_structure: POINTER): INTEGER_32 is
			-- Query for y field of GDKPOINT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkpoint_struct_get_y"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GdkPoint"
		}"
		end

end -- class GDKPOINT_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

