-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDKRECTANGLE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GDK_TYPES
feature {} -- Low-level setters

	gdkrectangle_struct_set_x (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for x field of GDKRECTANGLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkrectangle_struct_set_x"
		}"
		end

	gdkrectangle_struct_set_y (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for y field of GDKRECTANGLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkrectangle_struct_set_y"
		}"
		end

	gdkrectangle_struct_set_width (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for width field of GDKRECTANGLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkrectangle_struct_set_width"
		}"
		end

	gdkrectangle_struct_set_height (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for height field of GDKRECTANGLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkrectangle_struct_set_height"
		}"
		end

feature {} -- Low-level queries

	gdkrectangle_struct_get_x (a_structure: POINTER): INTEGER_32 is
			-- Query for x field of GDKRECTANGLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkrectangle_struct_get_x"
		}"
		end

	gdkrectangle_struct_get_y (a_structure: POINTER): INTEGER_32 is
			-- Query for y field of GDKRECTANGLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkrectangle_struct_get_y"
		}"
		end

	gdkrectangle_struct_get_width (a_structure: POINTER): INTEGER_32 is
			-- Query for width field of GDKRECTANGLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkrectangle_struct_get_width"
		}"
		end

	gdkrectangle_struct_get_height (a_structure: POINTER): INTEGER_32 is
			-- Query for height field of GDKRECTANGLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkrectangle_struct_get_height"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GdkRectangle"
		}"
		end

end -- class GDKRECTANGLE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

