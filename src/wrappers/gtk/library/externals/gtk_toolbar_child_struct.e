-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_TOOLBAR_CHILD_STRUCT

inherit ANY undefine is_equal, copy end

insert GTK_TYPES
feature {} -- Low-level setters

	gtk_toolbar_child_struct_set_type (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for type field of GTK_TOOLBAR_CHILD_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_child_struct_set_type"
		}"
		end

	gtk_toolbar_child_struct_set_widget (a_structure: POINTER; a_value: POINTER) is
			-- Setter for widget field of GTK_TOOLBAR_CHILD_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_child_struct_set_widget"
		}"
		end

	gtk_toolbar_child_struct_set_icon (a_structure: POINTER; a_value: POINTER) is
			-- Setter for icon field of GTK_TOOLBAR_CHILD_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_child_struct_set_icon"
		}"
		end

	gtk_toolbar_child_struct_set_label (a_structure: POINTER; a_value: POINTER) is
			-- Setter for label field of GTK_TOOLBAR_CHILD_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_child_struct_set_label"
		}"
		end

feature {} -- Low-level queries

	gtk_toolbar_child_struct_get_type (a_structure: POINTER): INTEGER is
			-- Query for type field of GTK_TOOLBAR_CHILD_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_child_struct_get_type"
		}"
		end

	gtk_toolbar_child_struct_get_widget (a_structure: POINTER): POINTER is
			-- Query for widget field of GTK_TOOLBAR_CHILD_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_child_struct_get_widget"
		}"
		end

	gtk_toolbar_child_struct_get_icon (a_structure: POINTER): POINTER is
			-- Query for icon field of GTK_TOOLBAR_CHILD_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_child_struct_get_icon"
		}"
		end

	gtk_toolbar_child_struct_get_label (a_structure: POINTER): POINTER is
			-- Query for label field of GTK_TOOLBAR_CHILD_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_child_struct_get_label"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkToolbarChild"
		}"
		end

end -- class GTK_TOOLBAR_CHILD_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

