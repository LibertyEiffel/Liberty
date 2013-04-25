-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCOLORSELECTIONDIALOG_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkcolorselectiondialog_struct_set_colorsel (a_structure: POINTER; a_value: POINTER) is
			-- Setter for colorsel field of GTKCOLORSELECTIONDIALOG_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcolorselectiondialog_struct_set_colorsel"
		}"
		end

	gtkcolorselectiondialog_struct_set_ok_button (a_structure: POINTER; a_value: POINTER) is
			-- Setter for ok_button field of GTKCOLORSELECTIONDIALOG_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcolorselectiondialog_struct_set_ok_button"
		}"
		end

	gtkcolorselectiondialog_struct_set_cancel_button (a_structure: POINTER; a_value: POINTER) is
			-- Setter for cancel_button field of GTKCOLORSELECTIONDIALOG_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcolorselectiondialog_struct_set_cancel_button"
		}"
		end

	gtkcolorselectiondialog_struct_set_help_button (a_structure: POINTER; a_value: POINTER) is
			-- Setter for help_button field of GTKCOLORSELECTIONDIALOG_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcolorselectiondialog_struct_set_help_button"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gtkcolorselectiondialog_struct_get_colorsel (a_structure: POINTER): POINTER is
			-- Query for colorsel field of GTKCOLORSELECTIONDIALOG_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcolorselectiondialog_struct_get_colorsel"
		}"
		end

	gtkcolorselectiondialog_struct_get_ok_button (a_structure: POINTER): POINTER is
			-- Query for ok_button field of GTKCOLORSELECTIONDIALOG_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcolorselectiondialog_struct_get_ok_button"
		}"
		end

	gtkcolorselectiondialog_struct_get_cancel_button (a_structure: POINTER): POINTER is
			-- Query for cancel_button field of GTKCOLORSELECTIONDIALOG_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcolorselectiondialog_struct_get_cancel_button"
		}"
		end

	gtkcolorselectiondialog_struct_get_help_button (a_structure: POINTER): POINTER is
			-- Query for help_button field of GTKCOLORSELECTIONDIALOG_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcolorselectiondialog_struct_get_help_button"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkColorSelectionDialog"
		}"
		end

end -- class GTKCOLORSELECTIONDIALOG_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

