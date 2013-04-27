-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_TOGGLE_BUTTON_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_toggle_button_struct_set_active (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for active field of GTK_TOGGLE_BUTTON_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_button_struct_set_active"
		}"
		end

	gtk_toggle_button_struct_set_draw_indicator (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for draw_indicator field of GTK_TOGGLE_BUTTON_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_button_struct_set_draw_indicator"
		}"
		end

	gtk_toggle_button_struct_set_inconsistent (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for inconsistent field of GTK_TOGGLE_BUTTON_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_button_struct_set_inconsistent"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field button.
	gtk_toggle_button_struct_get_active (a_structure: POINTER): NATURAL is
			-- Query for active field of GTK_TOGGLE_BUTTON_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_button_struct_get_active"
		}"
		end

	gtk_toggle_button_struct_get_draw_indicator (a_structure: POINTER): NATURAL is
			-- Query for draw_indicator field of GTK_TOGGLE_BUTTON_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_button_struct_get_draw_indicator"
		}"
		end

	gtk_toggle_button_struct_get_inconsistent (a_structure: POINTER): NATURAL is
			-- Query for inconsistent field of GTK_TOGGLE_BUTTON_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_button_struct_get_inconsistent"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkToggleButton"
		}"
		end

end -- class GTK_TOGGLE_BUTTON_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

