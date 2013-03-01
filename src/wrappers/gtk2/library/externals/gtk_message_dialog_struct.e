-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_MESSAGE_DIALOG_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_message_dialog_struct_set_image (a_structure: POINTER; a_value: POINTER) is
			-- Setter for image field of GTK_MESSAGE_DIALOG_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_message_dialog_struct_set_image"
		}"
		end

	gtk_message_dialog_struct_set_label (a_structure: POINTER; a_value: POINTER) is
			-- Setter for label field of GTK_MESSAGE_DIALOG_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_message_dialog_struct_set_label"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gtk_message_dialog_struct_get_image (a_structure: POINTER): POINTER is
			-- Query for image field of GTK_MESSAGE_DIALOG_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_message_dialog_struct_get_image"
		}"
		end

	gtk_message_dialog_struct_get_label (a_structure: POINTER): POINTER is
			-- Query for label field of GTK_MESSAGE_DIALOG_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_message_dialog_struct_get_label"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkMessageDialog"
		}"
		end

end -- class GTK_MESSAGE_DIALOG_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

