-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDKEVENTWINDOWSTATE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GDK_TYPES
feature {} -- Low-level setters

	gdkeventwindowstate_struct_set_type (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for type field of GDKEVENTWINDOWSTATE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventwindowstate_struct_set_type"
		}"
		end

	gdkeventwindowstate_struct_set_window (a_structure: POINTER; a_value: POINTER) is
			-- Setter for window field of GDKEVENTWINDOWSTATE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventwindowstate_struct_set_window"
		}"
		end

	gdkeventwindowstate_struct_set_send_event (a_structure: POINTER; a_value: CHARACTER) is
			-- Setter for send_event field of GDKEVENTWINDOWSTATE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventwindowstate_struct_set_send_event"
		}"
		end

	gdkeventwindowstate_struct_set_changed_mask (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for changed_mask field of GDKEVENTWINDOWSTATE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventwindowstate_struct_set_changed_mask"
		}"
		end

	gdkeventwindowstate_struct_set_new_window_state (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for new_window_state field of GDKEVENTWINDOWSTATE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventwindowstate_struct_set_new_window_state"
		}"
		end

feature {} -- Low-level queries

	gdkeventwindowstate_struct_get_type (a_structure: POINTER): INTEGER is
			-- Query for type field of GDKEVENTWINDOWSTATE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventwindowstate_struct_get_type"
		}"
		end

	gdkeventwindowstate_struct_get_window (a_structure: POINTER): POINTER is
			-- Query for window field of GDKEVENTWINDOWSTATE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventwindowstate_struct_get_window"
		}"
		end

	gdkeventwindowstate_struct_get_send_event (a_structure: POINTER): CHARACTER is
			-- Query for send_event field of GDKEVENTWINDOWSTATE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventwindowstate_struct_get_send_event"
		}"
		end

	gdkeventwindowstate_struct_get_changed_mask (a_structure: POINTER): INTEGER is
			-- Query for changed_mask field of GDKEVENTWINDOWSTATE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventwindowstate_struct_get_changed_mask"
		}"
		end

	gdkeventwindowstate_struct_get_new_window_state (a_structure: POINTER): INTEGER is
			-- Query for new_window_state field of GDKEVENTWINDOWSTATE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventwindowstate_struct_get_new_window_state"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GdkEventWindowState"
		}"
		end

end -- class GDKEVENTWINDOWSTATE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

