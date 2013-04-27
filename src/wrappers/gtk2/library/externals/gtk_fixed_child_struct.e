-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_FIXED_CHILD_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_fixed_child_struct_set_widget (a_structure: POINTER; a_value: POINTER) is
			-- Setter for widget field of GTK_FIXED_CHILD_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_fixed_child_struct_set_widget"
		}"
		end

	gtk_fixed_child_struct_set_x (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for x field of GTK_FIXED_CHILD_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_fixed_child_struct_set_x"
		}"
		end

	gtk_fixed_child_struct_set_y (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for y field of GTK_FIXED_CHILD_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_fixed_child_struct_set_y"
		}"
		end

feature {} -- Low-level queries

	gtk_fixed_child_struct_get_widget (a_structure: POINTER): POINTER is
			-- Query for widget field of GTK_FIXED_CHILD_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_fixed_child_struct_get_widget"
		}"
		end

	gtk_fixed_child_struct_get_x (a_structure: POINTER): INTEGER is
			-- Query for x field of GTK_FIXED_CHILD_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_fixed_child_struct_get_x"
		}"
		end

	gtk_fixed_child_struct_get_y (a_structure: POINTER): INTEGER is
			-- Query for y field of GTK_FIXED_CHILD_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_fixed_child_struct_get_y"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkFixedChild"
		}"
		end

end -- class GTK_FIXED_CHILD_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

