-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_FILE_CHOOSER_BUTTON_CLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_file_chooser_button_class_struct_set_file_set (a_structure: POINTER; a_value: POINTER) is
			-- Setter for file_set field of GTK_FILE_CHOOSER_BUTTON_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_button_class_struct_set_file_set"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
	gtk_file_chooser_button_class_struct_get_file_set (a_structure: POINTER): POINTER is
			-- Query for file_set field of GTK_FILE_CHOOSER_BUTTON_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_button_class_struct_get_file_set"
		}"
		end

	-- Unwrappable field __gtk_reserved1.
	-- Unwrappable field __gtk_reserved2.
	-- Unwrappable field __gtk_reserved3.
	-- Unwrappable field __gtk_reserved4.
	-- Unwrappable field __gtk_reserved5.
	-- Unwrappable field __gtk_reserved6.
	-- Unwrappable field __gtk_reserved7.
feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkFileChooserButtonClass"
		}"
		end

end -- class GTK_FILE_CHOOSER_BUTTON_CLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

