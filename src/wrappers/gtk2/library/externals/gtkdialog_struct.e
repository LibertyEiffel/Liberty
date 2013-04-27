-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKDIALOG_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkdialog_struct_set_vbox (a_structure: POINTER; a_value: POINTER) is
			-- Setter for vbox field of GTKDIALOG_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkdialog_struct_set_vbox"
		}"
		end

	gtkdialog_struct_set_action_area (a_structure: POINTER; a_value: POINTER) is
			-- Setter for action_area field of GTKDIALOG_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkdialog_struct_set_action_area"
		}"
		end

	gtkdialog_struct_set_separator (a_structure: POINTER; a_value: POINTER) is
			-- Setter for separator field of GTKDIALOG_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkdialog_struct_set_separator"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field window.
	gtkdialog_struct_get_vbox (a_structure: POINTER): POINTER is
			-- Query for vbox field of GTKDIALOG_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkdialog_struct_get_vbox"
		}"
		end

	gtkdialog_struct_get_action_area (a_structure: POINTER): POINTER is
			-- Query for action_area field of GTKDIALOG_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkdialog_struct_get_action_area"
		}"
		end

	gtkdialog_struct_get_separator (a_structure: POINTER): POINTER is
			-- Query for separator field of GTKDIALOG_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkdialog_struct_get_separator"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkDialog"
		}"
		end

end -- class GTKDIALOG_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

