-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDKPOINTERWINDOWINFO_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GDK_TYPES
feature {} -- Low-level setters

	gdkpointerwindowinfo_struct_set_toplevel_under_pointer (a_structure: POINTER; a_value: POINTER) is
			-- Setter for toplevel_under_pointer field of GDKPOINTERWINDOWINFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkpointerwindowinfo_struct_set_toplevel_under_pointer"
		}"
		end

	gdkpointerwindowinfo_struct_set_window_under_pointer (a_structure: POINTER; a_value: POINTER) is
			-- Setter for window_under_pointer field of GDKPOINTERWINDOWINFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkpointerwindowinfo_struct_set_window_under_pointer"
		}"
		end

	gdkpointerwindowinfo_struct_set_toplevel_x (a_structure: POINTER; a_value: REAL_64) is
			-- Setter for toplevel_x field of GDKPOINTERWINDOWINFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkpointerwindowinfo_struct_set_toplevel_x"
		}"
		end

	gdkpointerwindowinfo_struct_set_toplevel_y (a_structure: POINTER; a_value: REAL_64) is
			-- Setter for toplevel_y field of GDKPOINTERWINDOWINFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkpointerwindowinfo_struct_set_toplevel_y"
		}"
		end

	gdkpointerwindowinfo_struct_set_state (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for state field of GDKPOINTERWINDOWINFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkpointerwindowinfo_struct_set_state"
		}"
		end

	gdkpointerwindowinfo_struct_set_button (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for button field of GDKPOINTERWINDOWINFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkpointerwindowinfo_struct_set_button"
		}"
		end

	gdkpointerwindowinfo_struct_set_motion_hint_serial (a_structure: POINTER; a_value: NATURAL_64) is
			-- Setter for motion_hint_serial field of GDKPOINTERWINDOWINFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkpointerwindowinfo_struct_set_motion_hint_serial"
		}"
		end

feature {} -- Low-level queries

	gdkpointerwindowinfo_struct_get_toplevel_under_pointer (a_structure: POINTER): POINTER is
			-- Query for toplevel_under_pointer field of GDKPOINTERWINDOWINFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkpointerwindowinfo_struct_get_toplevel_under_pointer"
		}"
		end

	gdkpointerwindowinfo_struct_get_window_under_pointer (a_structure: POINTER): POINTER is
			-- Query for window_under_pointer field of GDKPOINTERWINDOWINFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkpointerwindowinfo_struct_get_window_under_pointer"
		}"
		end

	gdkpointerwindowinfo_struct_get_toplevel_x (a_structure: POINTER): REAL_64 is
			-- Query for toplevel_x field of GDKPOINTERWINDOWINFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkpointerwindowinfo_struct_get_toplevel_x"
		}"
		end

	gdkpointerwindowinfo_struct_get_toplevel_y (a_structure: POINTER): REAL_64 is
			-- Query for toplevel_y field of GDKPOINTERWINDOWINFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkpointerwindowinfo_struct_get_toplevel_y"
		}"
		end

	gdkpointerwindowinfo_struct_get_state (a_structure: POINTER): NATURAL_32 is
			-- Query for state field of GDKPOINTERWINDOWINFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkpointerwindowinfo_struct_get_state"
		}"
		end

	gdkpointerwindowinfo_struct_get_button (a_structure: POINTER): NATURAL_32 is
			-- Query for button field of GDKPOINTERWINDOWINFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkpointerwindowinfo_struct_get_button"
		}"
		end

	gdkpointerwindowinfo_struct_get_motion_hint_serial (a_structure: POINTER): NATURAL_64 is
			-- Query for motion_hint_serial field of GDKPOINTERWINDOWINFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkpointerwindowinfo_struct_get_motion_hint_serial"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_GdkPointerWindowInfo"
		}"
		end

end -- class GDKPOINTERWINDOWINFO_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

