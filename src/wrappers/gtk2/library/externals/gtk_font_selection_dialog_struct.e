-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_FONT_SELECTION_DIALOG_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_font_selection_dialog_struct_set_fontsel (a_structure: POINTER; a_value: POINTER) is
			-- Setter for fontsel field of GTK_FONT_SELECTION_DIALOG_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_dialog_struct_set_fontsel"
		}"
		end

	gtk_font_selection_dialog_struct_set_main_vbox (a_structure: POINTER; a_value: POINTER) is
			-- Setter for main_vbox field of GTK_FONT_SELECTION_DIALOG_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_dialog_struct_set_main_vbox"
		}"
		end

	gtk_font_selection_dialog_struct_set_action_area (a_structure: POINTER; a_value: POINTER) is
			-- Setter for action_area field of GTK_FONT_SELECTION_DIALOG_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_dialog_struct_set_action_area"
		}"
		end

	gtk_font_selection_dialog_struct_set_ok_button (a_structure: POINTER; a_value: POINTER) is
			-- Setter for ok_button field of GTK_FONT_SELECTION_DIALOG_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_dialog_struct_set_ok_button"
		}"
		end

	gtk_font_selection_dialog_struct_set_apply_button (a_structure: POINTER; a_value: POINTER) is
			-- Setter for apply_button field of GTK_FONT_SELECTION_DIALOG_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_dialog_struct_set_apply_button"
		}"
		end

	gtk_font_selection_dialog_struct_set_cancel_button (a_structure: POINTER; a_value: POINTER) is
			-- Setter for cancel_button field of GTK_FONT_SELECTION_DIALOG_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_dialog_struct_set_cancel_button"
		}"
		end

	gtk_font_selection_dialog_struct_set_dialog_width (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for dialog_width field of GTK_FONT_SELECTION_DIALOG_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_dialog_struct_set_dialog_width"
		}"
		end

	gtk_font_selection_dialog_struct_set_auto_resize (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for auto_resize field of GTK_FONT_SELECTION_DIALOG_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_dialog_struct_set_auto_resize"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gtk_font_selection_dialog_struct_get_fontsel (a_structure: POINTER): POINTER is
			-- Query for fontsel field of GTK_FONT_SELECTION_DIALOG_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_dialog_struct_get_fontsel"
		}"
		end

	gtk_font_selection_dialog_struct_get_main_vbox (a_structure: POINTER): POINTER is
			-- Query for main_vbox field of GTK_FONT_SELECTION_DIALOG_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_dialog_struct_get_main_vbox"
		}"
		end

	gtk_font_selection_dialog_struct_get_action_area (a_structure: POINTER): POINTER is
			-- Query for action_area field of GTK_FONT_SELECTION_DIALOG_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_dialog_struct_get_action_area"
		}"
		end

	gtk_font_selection_dialog_struct_get_ok_button (a_structure: POINTER): POINTER is
			-- Query for ok_button field of GTK_FONT_SELECTION_DIALOG_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_dialog_struct_get_ok_button"
		}"
		end

	gtk_font_selection_dialog_struct_get_apply_button (a_structure: POINTER): POINTER is
			-- Query for apply_button field of GTK_FONT_SELECTION_DIALOG_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_dialog_struct_get_apply_button"
		}"
		end

	gtk_font_selection_dialog_struct_get_cancel_button (a_structure: POINTER): POINTER is
			-- Query for cancel_button field of GTK_FONT_SELECTION_DIALOG_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_dialog_struct_get_cancel_button"
		}"
		end

	gtk_font_selection_dialog_struct_get_dialog_width (a_structure: POINTER): INTEGER is
			-- Query for dialog_width field of GTK_FONT_SELECTION_DIALOG_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_dialog_struct_get_dialog_width"
		}"
		end

	gtk_font_selection_dialog_struct_get_auto_resize (a_structure: POINTER): INTEGER is
			-- Query for auto_resize field of GTK_FONT_SELECTION_DIALOG_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_dialog_struct_get_auto_resize"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkFontSelectionDialog"
		}"
		end

end -- class GTK_FONT_SELECTION_DIALOG_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

