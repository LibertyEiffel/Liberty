-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTOGGLEBUTTON_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtktogglebutton_struct_set_active (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for active field of GTKTOGGLEBUTTON_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktogglebutton_struct_set_active"
		}"
		end

	gtktogglebutton_struct_set_draw_indicator (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for draw_indicator field of GTKTOGGLEBUTTON_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktogglebutton_struct_set_draw_indicator"
		}"
		end

	gtktogglebutton_struct_set_inconsistent (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for inconsistent field of GTKTOGGLEBUTTON_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktogglebutton_struct_set_inconsistent"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field button.
	gtktogglebutton_struct_get_active (a_structure: POINTER): NATURAL_32 is
			-- Query for active field of GTKTOGGLEBUTTON_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktogglebutton_struct_get_active"
		}"
		end

	gtktogglebutton_struct_get_draw_indicator (a_structure: POINTER): NATURAL_32 is
			-- Query for draw_indicator field of GTKTOGGLEBUTTON_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktogglebutton_struct_get_draw_indicator"
		}"
		end

	gtktogglebutton_struct_get_inconsistent (a_structure: POINTER): NATURAL_32 is
			-- Query for inconsistent field of GTKTOGGLEBUTTON_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktogglebutton_struct_get_inconsistent"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkToggleButton"
		}"
		end

end -- class GTKTOGGLEBUTTON_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

