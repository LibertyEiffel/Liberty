-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDKSPAN_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GDK_TYPES
feature {} -- Low-level setters

	gdkspan_struct_set_x (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for x field of GDKSPAN_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkspan_struct_set_x"
		}"
		end

	gdkspan_struct_set_y (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for y field of GDKSPAN_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkspan_struct_set_y"
		}"
		end

	gdkspan_struct_set_width (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for width field of GDKSPAN_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkspan_struct_set_width"
		}"
		end

feature {} -- Low-level queries

	gdkspan_struct_get_x (a_structure: POINTER): INTEGER_32 is
			-- Query for x field of GDKSPAN_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkspan_struct_get_x"
		}"
		end

	gdkspan_struct_get_y (a_structure: POINTER): INTEGER_32 is
			-- Query for y field of GDKSPAN_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkspan_struct_get_y"
		}"
		end

	gdkspan_struct_get_width (a_structure: POINTER): INTEGER_32 is
			-- Query for width field of GDKSPAN_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkspan_struct_get_width"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GdkSpan"
		}"
		end

end -- class GDKSPAN_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

