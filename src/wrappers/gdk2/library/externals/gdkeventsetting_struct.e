-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDKEVENTSETTING_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GDK_TYPES
feature {} -- Low-level setters

	gdkeventsetting_struct_set_type (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for type field of GDKEVENTSETTING_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventsetting_struct_set_type"
		}"
		end

	gdkeventsetting_struct_set_window (a_structure: POINTER; a_value: POINTER) is
			-- Setter for window field of GDKEVENTSETTING_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventsetting_struct_set_window"
		}"
		end

	gdkeventsetting_struct_set_send_event (a_structure: POINTER; a_value: CHARACTER) is
			-- Setter for send_event field of GDKEVENTSETTING_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventsetting_struct_set_send_event"
		}"
		end

	gdkeventsetting_struct_set_action (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for action field of GDKEVENTSETTING_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventsetting_struct_set_action"
		}"
		end

	gdkeventsetting_struct_set_name (a_structure: POINTER; a_value: POINTER) is
			-- Setter for name field of GDKEVENTSETTING_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventsetting_struct_set_name"
		}"
		end

feature {} -- Low-level queries

	gdkeventsetting_struct_get_type (a_structure: POINTER): INTEGER is
			-- Query for type field of GDKEVENTSETTING_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventsetting_struct_get_type"
		}"
		end

	gdkeventsetting_struct_get_window (a_structure: POINTER): POINTER is
			-- Query for window field of GDKEVENTSETTING_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventsetting_struct_get_window"
		}"
		end

	gdkeventsetting_struct_get_send_event (a_structure: POINTER): CHARACTER is
			-- Query for send_event field of GDKEVENTSETTING_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventsetting_struct_get_send_event"
		}"
		end

	gdkeventsetting_struct_get_action (a_structure: POINTER): INTEGER is
			-- Query for action field of GDKEVENTSETTING_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventsetting_struct_get_action"
		}"
		end

	gdkeventsetting_struct_get_name (a_structure: POINTER): POINTER is
			-- Query for name field of GDKEVENTSETTING_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventsetting_struct_get_name"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GdkEventSetting"
		}"
		end

end -- class GDKEVENTSETTING_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

