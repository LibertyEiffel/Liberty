-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_ABOUT_DIALOG_CLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_about_dialog_class_struct_set_activate_link (a_structure: POINTER; a_value: POINTER) is
			-- Setter for activate_link field of GTK_ABOUT_DIALOG_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_about_dialog_class_struct_set_activate_link"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
	gtk_about_dialog_class_struct_get_activate_link (a_structure: POINTER): POINTER is
			-- Query for activate_link field of GTK_ABOUT_DIALOG_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_about_dialog_class_struct_get_activate_link"
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
			feature_name: "sizeof__GtkAboutDialogClass"
		}"
		end

end -- class GTK_ABOUT_DIALOG_CLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

