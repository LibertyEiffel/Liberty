-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKMENUSHELL_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkmenushell_struct_set_children (a_structure: POINTER; a_value: POINTER) is
			-- Setter for children field of GTKMENUSHELL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkmenushell_struct_set_children"
		}"
		end

	gtkmenushell_struct_set_active_menu_item (a_structure: POINTER; a_value: POINTER) is
			-- Setter for active_menu_item field of GTKMENUSHELL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkmenushell_struct_set_active_menu_item"
		}"
		end

	gtkmenushell_struct_set_parent_menu_shell (a_structure: POINTER; a_value: POINTER) is
			-- Setter for parent_menu_shell field of GTKMENUSHELL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkmenushell_struct_set_parent_menu_shell"
		}"
		end

	gtkmenushell_struct_set_button (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for button field of GTKMENUSHELL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkmenushell_struct_set_button"
		}"
		end

	gtkmenushell_struct_set_activate_time (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for activate_time field of GTKMENUSHELL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkmenushell_struct_set_activate_time"
		}"
		end

	gtkmenushell_struct_set_active (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for active field of GTKMENUSHELL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkmenushell_struct_set_active"
		}"
		end

	gtkmenushell_struct_set_have_grab (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for have_grab field of GTKMENUSHELL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkmenushell_struct_set_have_grab"
		}"
		end

	gtkmenushell_struct_set_have_xgrab (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for have_xgrab field of GTKMENUSHELL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkmenushell_struct_set_have_xgrab"
		}"
		end

	gtkmenushell_struct_set_ignore_leave (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for ignore_leave field of GTKMENUSHELL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkmenushell_struct_set_ignore_leave"
		}"
		end

	gtkmenushell_struct_set_menu_flag (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for menu_flag field of GTKMENUSHELL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkmenushell_struct_set_menu_flag"
		}"
		end

	gtkmenushell_struct_set_ignore_enter (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for ignore_enter field of GTKMENUSHELL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkmenushell_struct_set_ignore_enter"
		}"
		end

	gtkmenushell_struct_set_keyboard_mode (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for keyboard_mode field of GTKMENUSHELL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkmenushell_struct_set_keyboard_mode"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field container.
	gtkmenushell_struct_get_children (a_structure: POINTER): POINTER is
			-- Query for children field of GTKMENUSHELL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkmenushell_struct_get_children"
		}"
		end

	gtkmenushell_struct_get_active_menu_item (a_structure: POINTER): POINTER is
			-- Query for active_menu_item field of GTKMENUSHELL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkmenushell_struct_get_active_menu_item"
		}"
		end

	gtkmenushell_struct_get_parent_menu_shell (a_structure: POINTER): POINTER is
			-- Query for parent_menu_shell field of GTKMENUSHELL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkmenushell_struct_get_parent_menu_shell"
		}"
		end

	gtkmenushell_struct_get_button (a_structure: POINTER): NATURAL_32 is
			-- Query for button field of GTKMENUSHELL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkmenushell_struct_get_button"
		}"
		end

	gtkmenushell_struct_get_activate_time (a_structure: POINTER): NATURAL_32 is
			-- Query for activate_time field of GTKMENUSHELL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkmenushell_struct_get_activate_time"
		}"
		end

	gtkmenushell_struct_get_active (a_structure: POINTER): NATURAL_32 is
			-- Query for active field of GTKMENUSHELL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkmenushell_struct_get_active"
		}"
		end

	gtkmenushell_struct_get_have_grab (a_structure: POINTER): NATURAL_32 is
			-- Query for have_grab field of GTKMENUSHELL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkmenushell_struct_get_have_grab"
		}"
		end

	gtkmenushell_struct_get_have_xgrab (a_structure: POINTER): NATURAL_32 is
			-- Query for have_xgrab field of GTKMENUSHELL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkmenushell_struct_get_have_xgrab"
		}"
		end

	gtkmenushell_struct_get_ignore_leave (a_structure: POINTER): NATURAL_32 is
			-- Query for ignore_leave field of GTKMENUSHELL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkmenushell_struct_get_ignore_leave"
		}"
		end

	gtkmenushell_struct_get_menu_flag (a_structure: POINTER): NATURAL_32 is
			-- Query for menu_flag field of GTKMENUSHELL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkmenushell_struct_get_menu_flag"
		}"
		end

	gtkmenushell_struct_get_ignore_enter (a_structure: POINTER): NATURAL_32 is
			-- Query for ignore_enter field of GTKMENUSHELL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkmenushell_struct_get_ignore_enter"
		}"
		end

	gtkmenushell_struct_get_keyboard_mode (a_structure: POINTER): NATURAL_32 is
			-- Query for keyboard_mode field of GTKMENUSHELL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkmenushell_struct_get_keyboard_mode"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkMenuShell"
		}"
		end

end -- class GTKMENUSHELL_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

