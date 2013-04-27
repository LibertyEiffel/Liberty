-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_TOOLBAR_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_toolbar_struct_set_num_children (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for num_children field of GTK_TOOLBAR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_struct_set_num_children"
		}"
		end

	gtk_toolbar_struct_set_children (a_structure: POINTER; a_value: POINTER) is
			-- Setter for children field of GTK_TOOLBAR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_struct_set_children"
		}"
		end

	gtk_toolbar_struct_set_orientation (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for orientation field of GTK_TOOLBAR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_struct_set_orientation"
		}"
		end

	gtk_toolbar_struct_set_style (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for style field of GTK_TOOLBAR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_struct_set_style"
		}"
		end

	gtk_toolbar_struct_set_icon_size (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for icon_size field of GTK_TOOLBAR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_struct_set_icon_size"
		}"
		end

	gtk_toolbar_struct_set_button_maxw (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for button_maxw field of GTK_TOOLBAR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_struct_set_button_maxw"
		}"
		end

	gtk_toolbar_struct_set_button_maxh (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for button_maxh field of GTK_TOOLBAR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_struct_set_button_maxh"
		}"
		end

	gtk_toolbar_struct_set_style_set (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for style_set field of GTK_TOOLBAR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_struct_set_style_set"
		}"
		end

	gtk_toolbar_struct_set_icon_size_set (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for icon_size_set field of GTK_TOOLBAR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_struct_set_icon_size_set"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field container.
	gtk_toolbar_struct_get_num_children (a_structure: POINTER): INTEGER is
			-- Query for num_children field of GTK_TOOLBAR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_struct_get_num_children"
		}"
		end

	gtk_toolbar_struct_get_children (a_structure: POINTER): POINTER is
			-- Query for children field of GTK_TOOLBAR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_struct_get_children"
		}"
		end

	gtk_toolbar_struct_get_orientation (a_structure: POINTER): INTEGER is
			-- Query for orientation field of GTK_TOOLBAR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_struct_get_orientation"
		}"
		end

	gtk_toolbar_struct_get_style (a_structure: POINTER): INTEGER is
			-- Query for style field of GTK_TOOLBAR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_struct_get_style"
		}"
		end

	gtk_toolbar_struct_get_icon_size (a_structure: POINTER): INTEGER is
			-- Query for icon_size field of GTK_TOOLBAR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_struct_get_icon_size"
		}"
		end

	-- Unwrappable field _tooltips.
	gtk_toolbar_struct_get_button_maxw (a_structure: POINTER): INTEGER is
			-- Query for button_maxw field of GTK_TOOLBAR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_struct_get_button_maxw"
		}"
		end

	gtk_toolbar_struct_get_button_maxh (a_structure: POINTER): INTEGER is
			-- Query for button_maxh field of GTK_TOOLBAR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_struct_get_button_maxh"
		}"
		end

	-- Unwrappable field _gtk_reserved1.
	-- Unwrappable field _gtk_reserved2.
	gtk_toolbar_struct_get_style_set (a_structure: POINTER): NATURAL is
			-- Query for style_set field of GTK_TOOLBAR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_struct_get_style_set"
		}"
		end

	gtk_toolbar_struct_get_icon_size_set (a_structure: POINTER): NATURAL is
			-- Query for icon_size_set field of GTK_TOOLBAR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_struct_get_icon_size_set"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkToolbar"
		}"
		end

end -- class GTK_TOOLBAR_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

