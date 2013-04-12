-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDKEVENTGRABBROKEN_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GDK_TYPES
feature {} -- Low-level setters

	gdkeventgrabbroken_struct_set_type (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for type field of GDKEVENTGRABBROKEN_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventgrabbroken_struct_set_type"
		}"
		end

	gdkeventgrabbroken_struct_set_window (a_structure: POINTER; a_value: POINTER) is
			-- Setter for window field of GDKEVENTGRABBROKEN_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventgrabbroken_struct_set_window"
		}"
		end

	gdkeventgrabbroken_struct_set_send_event (a_structure: POINTER; a_value: CHARACTER) is
			-- Setter for send_event field of GDKEVENTGRABBROKEN_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventgrabbroken_struct_set_send_event"
		}"
		end

	gdkeventgrabbroken_struct_set_keyboard (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for keyboard field of GDKEVENTGRABBROKEN_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventgrabbroken_struct_set_keyboard"
		}"
		end

	gdkeventgrabbroken_struct_set_implicit (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for implicit field of GDKEVENTGRABBROKEN_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventgrabbroken_struct_set_implicit"
		}"
		end

	gdkeventgrabbroken_struct_set_grab_window (a_structure: POINTER; a_value: POINTER) is
			-- Setter for grab_window field of GDKEVENTGRABBROKEN_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventgrabbroken_struct_set_grab_window"
		}"
		end

feature {} -- Low-level queries

	gdkeventgrabbroken_struct_get_type (a_structure: POINTER): INTEGER is
			-- Query for type field of GDKEVENTGRABBROKEN_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventgrabbroken_struct_get_type"
		}"
		end

	gdkeventgrabbroken_struct_get_window (a_structure: POINTER): POINTER is
			-- Query for window field of GDKEVENTGRABBROKEN_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventgrabbroken_struct_get_window"
		}"
		end

	gdkeventgrabbroken_struct_get_send_event (a_structure: POINTER): CHARACTER is
			-- Query for send_event field of GDKEVENTGRABBROKEN_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventgrabbroken_struct_get_send_event"
		}"
		end

	gdkeventgrabbroken_struct_get_keyboard (a_structure: POINTER): INTEGER_32 is
			-- Query for keyboard field of GDKEVENTGRABBROKEN_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventgrabbroken_struct_get_keyboard"
		}"
		end

	gdkeventgrabbroken_struct_get_implicit (a_structure: POINTER): INTEGER_32 is
			-- Query for implicit field of GDKEVENTGRABBROKEN_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventgrabbroken_struct_get_implicit"
		}"
		end

	gdkeventgrabbroken_struct_get_grab_window (a_structure: POINTER): POINTER is
			-- Query for grab_window field of GDKEVENTGRABBROKEN_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventgrabbroken_struct_get_grab_window"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GdkEventGrabBroken"
		}"
		end

end -- class GDKEVENTGRABBROKEN_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

