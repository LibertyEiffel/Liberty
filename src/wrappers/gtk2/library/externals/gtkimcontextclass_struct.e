-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKIMCONTEXTCLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkimcontextclass_struct_set_preedit_start (a_structure: POINTER; a_value: POINTER) is
			-- Setter for preedit_start field of GTKIMCONTEXTCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimcontextclass_struct_set_preedit_start"
		}"
		end

	gtkimcontextclass_struct_set_preedit_end (a_structure: POINTER; a_value: POINTER) is
			-- Setter for preedit_end field of GTKIMCONTEXTCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimcontextclass_struct_set_preedit_end"
		}"
		end

	gtkimcontextclass_struct_set_preedit_changed (a_structure: POINTER; a_value: POINTER) is
			-- Setter for preedit_changed field of GTKIMCONTEXTCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimcontextclass_struct_set_preedit_changed"
		}"
		end

	gtkimcontextclass_struct_set_commit (a_structure: POINTER; a_value: POINTER) is
			-- Setter for commit field of GTKIMCONTEXTCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimcontextclass_struct_set_commit"
		}"
		end

	gtkimcontextclass_struct_set_retrieve_surrounding (a_structure: POINTER; a_value: POINTER) is
			-- Setter for retrieve_surrounding field of GTKIMCONTEXTCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimcontextclass_struct_set_retrieve_surrounding"
		}"
		end

	gtkimcontextclass_struct_set_delete_surrounding (a_structure: POINTER; a_value: POINTER) is
			-- Setter for delete_surrounding field of GTKIMCONTEXTCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimcontextclass_struct_set_delete_surrounding"
		}"
		end

	gtkimcontextclass_struct_set_set_client_window (a_structure: POINTER; a_value: POINTER) is
			-- Setter for set_client_window field of GTKIMCONTEXTCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimcontextclass_struct_set_set_client_window"
		}"
		end

	gtkimcontextclass_struct_set_get_preedit_string (a_structure: POINTER; a_value: POINTER) is
			-- Setter for get_preedit_string field of GTKIMCONTEXTCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimcontextclass_struct_set_get_preedit_string"
		}"
		end

	gtkimcontextclass_struct_set_filter_keypress (a_structure: POINTER; a_value: POINTER) is
			-- Setter for filter_keypress field of GTKIMCONTEXTCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimcontextclass_struct_set_filter_keypress"
		}"
		end

	gtkimcontextclass_struct_set_focus_in (a_structure: POINTER; a_value: POINTER) is
			-- Setter for focus_in field of GTKIMCONTEXTCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimcontextclass_struct_set_focus_in"
		}"
		end

	gtkimcontextclass_struct_set_focus_out (a_structure: POINTER; a_value: POINTER) is
			-- Setter for focus_out field of GTKIMCONTEXTCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimcontextclass_struct_set_focus_out"
		}"
		end

	gtkimcontextclass_struct_set_reset (a_structure: POINTER; a_value: POINTER) is
			-- Setter for reset field of GTKIMCONTEXTCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimcontextclass_struct_set_reset"
		}"
		end

	gtkimcontextclass_struct_set_set_cursor_location (a_structure: POINTER; a_value: POINTER) is
			-- Setter for set_cursor_location field of GTKIMCONTEXTCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimcontextclass_struct_set_set_cursor_location"
		}"
		end

	gtkimcontextclass_struct_set_set_use_preedit (a_structure: POINTER; a_value: POINTER) is
			-- Setter for set_use_preedit field of GTKIMCONTEXTCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimcontextclass_struct_set_set_use_preedit"
		}"
		end

	gtkimcontextclass_struct_set_set_surrounding (a_structure: POINTER; a_value: POINTER) is
			-- Setter for set_surrounding field of GTKIMCONTEXTCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimcontextclass_struct_set_set_surrounding"
		}"
		end

	gtkimcontextclass_struct_set_get_surrounding (a_structure: POINTER; a_value: POINTER) is
			-- Setter for get_surrounding field of GTKIMCONTEXTCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimcontextclass_struct_set_get_surrounding"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
	gtkimcontextclass_struct_get_preedit_start (a_structure: POINTER): POINTER is
			-- Query for preedit_start field of GTKIMCONTEXTCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimcontextclass_struct_get_preedit_start"
		}"
		end

	gtkimcontextclass_struct_get_preedit_end (a_structure: POINTER): POINTER is
			-- Query for preedit_end field of GTKIMCONTEXTCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimcontextclass_struct_get_preedit_end"
		}"
		end

	gtkimcontextclass_struct_get_preedit_changed (a_structure: POINTER): POINTER is
			-- Query for preedit_changed field of GTKIMCONTEXTCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimcontextclass_struct_get_preedit_changed"
		}"
		end

	gtkimcontextclass_struct_get_commit (a_structure: POINTER): POINTER is
			-- Query for commit field of GTKIMCONTEXTCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimcontextclass_struct_get_commit"
		}"
		end

	gtkimcontextclass_struct_get_retrieve_surrounding (a_structure: POINTER): POINTER is
			-- Query for retrieve_surrounding field of GTKIMCONTEXTCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimcontextclass_struct_get_retrieve_surrounding"
		}"
		end

	gtkimcontextclass_struct_get_delete_surrounding (a_structure: POINTER): POINTER is
			-- Query for delete_surrounding field of GTKIMCONTEXTCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimcontextclass_struct_get_delete_surrounding"
		}"
		end

	gtkimcontextclass_struct_get_set_client_window (a_structure: POINTER): POINTER is
			-- Query for set_client_window field of GTKIMCONTEXTCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimcontextclass_struct_get_set_client_window"
		}"
		end

	gtkimcontextclass_struct_get_get_preedit_string (a_structure: POINTER): POINTER is
			-- Query for get_preedit_string field of GTKIMCONTEXTCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimcontextclass_struct_get_get_preedit_string"
		}"
		end

	gtkimcontextclass_struct_get_filter_keypress (a_structure: POINTER): POINTER is
			-- Query for filter_keypress field of GTKIMCONTEXTCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimcontextclass_struct_get_filter_keypress"
		}"
		end

	gtkimcontextclass_struct_get_focus_in (a_structure: POINTER): POINTER is
			-- Query for focus_in field of GTKIMCONTEXTCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimcontextclass_struct_get_focus_in"
		}"
		end

	gtkimcontextclass_struct_get_focus_out (a_structure: POINTER): POINTER is
			-- Query for focus_out field of GTKIMCONTEXTCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimcontextclass_struct_get_focus_out"
		}"
		end

	gtkimcontextclass_struct_get_reset (a_structure: POINTER): POINTER is
			-- Query for reset field of GTKIMCONTEXTCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimcontextclass_struct_get_reset"
		}"
		end

	gtkimcontextclass_struct_get_set_cursor_location (a_structure: POINTER): POINTER is
			-- Query for set_cursor_location field of GTKIMCONTEXTCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimcontextclass_struct_get_set_cursor_location"
		}"
		end

	gtkimcontextclass_struct_get_set_use_preedit (a_structure: POINTER): POINTER is
			-- Query for set_use_preedit field of GTKIMCONTEXTCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimcontextclass_struct_get_set_use_preedit"
		}"
		end

	gtkimcontextclass_struct_get_set_surrounding (a_structure: POINTER): POINTER is
			-- Query for set_surrounding field of GTKIMCONTEXTCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimcontextclass_struct_get_set_surrounding"
		}"
		end

	gtkimcontextclass_struct_get_get_surrounding (a_structure: POINTER): POINTER is
			-- Query for get_surrounding field of GTKIMCONTEXTCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimcontextclass_struct_get_get_surrounding"
		}"
		end

	-- Unwrappable field _gtk_reserved1.
	-- Unwrappable field _gtk_reserved2.
	-- Unwrappable field _gtk_reserved3.
	-- Unwrappable field _gtk_reserved4.
	-- Unwrappable field _gtk_reserved5.
	-- Unwrappable field _gtk_reserved6.
feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkIMContextClass"
		}"
		end

end -- class GTKIMCONTEXTCLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

