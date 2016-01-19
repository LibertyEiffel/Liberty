-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_TOOLBAR_CLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_toolbar_class_struct_set_orientation_changed (a_structure: POINTER; a_value: POINTER) is
			-- Setter for orientation_changed field of GTK_TOOLBAR_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_class_struct_set_orientation_changed"
		}"
		end

	gtk_toolbar_class_struct_set_style_changed (a_structure: POINTER; a_value: POINTER) is
			-- Setter for style_changed field of GTK_TOOLBAR_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_class_struct_set_style_changed"
		}"
		end

	gtk_toolbar_class_struct_set_popup_context_menu (a_structure: POINTER; a_value: POINTER) is
			-- Setter for popup_context_menu field of GTK_TOOLBAR_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_class_struct_set_popup_context_menu"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
	gtk_toolbar_class_struct_get_orientation_changed (a_structure: POINTER): POINTER is
			-- Query for orientation_changed field of GTK_TOOLBAR_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_class_struct_get_orientation_changed"
		}"
		end

	gtk_toolbar_class_struct_get_style_changed (a_structure: POINTER): POINTER is
			-- Query for style_changed field of GTK_TOOLBAR_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_class_struct_get_style_changed"
		}"
		end

	gtk_toolbar_class_struct_get_popup_context_menu (a_structure: POINTER): POINTER is
			-- Query for popup_context_menu field of GTK_TOOLBAR_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_class_struct_get_popup_context_menu"
		}"
		end

	-- Unwrappable field _gtk_reserved1.
	-- Unwrappable field _gtk_reserved2.
	-- Unwrappable field _gtk_reserved3.
feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkToolbarClass"
		}"
		end

end -- class GTK_TOOLBAR_CLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

