-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_TOOLTIPS_DATA_STRUCT

inherit ANY undefine is_equal, copy end

insert GTK_TYPES
feature {} -- Low-level setters

	gtk_tooltips_data_struct_set_tooltips (a_structure: POINTER; a_value: POINTER) is
			-- Setter for tooltips field of GTK_TOOLTIPS_DATA_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tooltips_data_struct_set_tooltips"
		}"
		end

	gtk_tooltips_data_struct_set_widget (a_structure: POINTER; a_value: POINTER) is
			-- Setter for widget field of GTK_TOOLTIPS_DATA_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tooltips_data_struct_set_widget"
		}"
		end

	gtk_tooltips_data_struct_set_tip_text (a_structure: POINTER; a_value: POINTER) is
			-- Setter for tip_text field of GTK_TOOLTIPS_DATA_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tooltips_data_struct_set_tip_text"
		}"
		end

	gtk_tooltips_data_struct_set_tip_private (a_structure: POINTER; a_value: POINTER) is
			-- Setter for tip_private field of GTK_TOOLTIPS_DATA_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tooltips_data_struct_set_tip_private"
		}"
		end

feature {} -- Low-level queries

	gtk_tooltips_data_struct_get_tooltips (a_structure: POINTER): POINTER is
			-- Query for tooltips field of GTK_TOOLTIPS_DATA_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tooltips_data_struct_get_tooltips"
		}"
		end

	gtk_tooltips_data_struct_get_widget (a_structure: POINTER): POINTER is
			-- Query for widget field of GTK_TOOLTIPS_DATA_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tooltips_data_struct_get_widget"
		}"
		end

	gtk_tooltips_data_struct_get_tip_text (a_structure: POINTER): POINTER is
			-- Query for tip_text field of GTK_TOOLTIPS_DATA_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tooltips_data_struct_get_tip_text"
		}"
		end

	gtk_tooltips_data_struct_get_tip_private (a_structure: POINTER): POINTER is
			-- Query for tip_private field of GTK_TOOLTIPS_DATA_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tooltips_data_struct_get_tip_private"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkTooltipsData"
		}"
		end

end -- class GTK_TOOLTIPS_DATA_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

