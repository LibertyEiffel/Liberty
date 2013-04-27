-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_BORDER_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_border_struct_set_left (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for left field of GTK_BORDER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_border_struct_set_left"
		}"
		end

	gtk_border_struct_set_right (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for right field of GTK_BORDER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_border_struct_set_right"
		}"
		end

	gtk_border_struct_set_top (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for top field of GTK_BORDER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_border_struct_set_top"
		}"
		end

	gtk_border_struct_set_bottom (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for bottom field of GTK_BORDER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_border_struct_set_bottom"
		}"
		end

feature {} -- Low-level queries

	gtk_border_struct_get_left (a_structure: POINTER): INTEGER is
			-- Query for left field of GTK_BORDER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_border_struct_get_left"
		}"
		end

	gtk_border_struct_get_right (a_structure: POINTER): INTEGER is
			-- Query for right field of GTK_BORDER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_border_struct_get_right"
		}"
		end

	gtk_border_struct_get_top (a_structure: POINTER): INTEGER is
			-- Query for top field of GTK_BORDER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_border_struct_get_top"
		}"
		end

	gtk_border_struct_get_bottom (a_structure: POINTER): INTEGER is
			-- Query for bottom field of GTK_BORDER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_border_struct_get_bottom"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkBorder"
		}"
		end

end -- class GTK_BORDER_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

