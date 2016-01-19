-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKPAGERANGE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkpagerange_struct_set_start (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for start field of GTKPAGERANGE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkpagerange_struct_set_start"
		}"
		end

	gtkpagerange_struct_set_end_field (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for end field of GTKPAGERANGE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkpagerange_struct_set_end_field"
		}"
		end

feature {} -- Low-level queries

	gtkpagerange_struct_get_start (a_structure: POINTER): INTEGER_32 is
			-- Query for start field of GTKPAGERANGE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkpagerange_struct_get_start"
		}"
		end

	gtkpagerange_struct_get_end_field (a_structure: POINTER): INTEGER_32 is
			-- Query for end field of GTKPAGERANGE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkpagerange_struct_get_end_field"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkPageRange"
		}"
		end

end -- class GTKPAGERANGE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

