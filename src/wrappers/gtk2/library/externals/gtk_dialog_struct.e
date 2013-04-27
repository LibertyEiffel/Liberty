-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_DIALOG_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_dialog_struct_set_vbox (a_structure: POINTER; a_value: POINTER) is
			-- Setter for vbox field of GTK_DIALOG_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_dialog_struct_set_vbox"
		}"
		end

	gtk_dialog_struct_set_action_area (a_structure: POINTER; a_value: POINTER) is
			-- Setter for action_area field of GTK_DIALOG_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_dialog_struct_set_action_area"
		}"
		end

	gtk_dialog_struct_set_separator (a_structure: POINTER; a_value: POINTER) is
			-- Setter for separator field of GTK_DIALOG_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_dialog_struct_set_separator"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field window.
	gtk_dialog_struct_get_vbox (a_structure: POINTER): POINTER is
			-- Query for vbox field of GTK_DIALOG_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_dialog_struct_get_vbox"
		}"
		end

	gtk_dialog_struct_get_action_area (a_structure: POINTER): POINTER is
			-- Query for action_area field of GTK_DIALOG_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_dialog_struct_get_action_area"
		}"
		end

	gtk_dialog_struct_get_separator (a_structure: POINTER): POINTER is
			-- Query for separator field of GTK_DIALOG_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_dialog_struct_get_separator"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkDialog"
		}"
		end

end -- class GTK_DIALOG_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

