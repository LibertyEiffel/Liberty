-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDKKEYBOARDGRABINFO_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GDK_TYPES
feature {} -- Low-level setters

	gdkkeyboardgrabinfo_struct_set_window (a_structure: POINTER; a_value: POINTER) is
			-- Setter for window field of GDKKEYBOARDGRABINFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkkeyboardgrabinfo_struct_set_window"
		}"
		end

	gdkkeyboardgrabinfo_struct_set_native_window (a_structure: POINTER; a_value: POINTER) is
			-- Setter for native_window field of GDKKEYBOARDGRABINFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkkeyboardgrabinfo_struct_set_native_window"
		}"
		end

	gdkkeyboardgrabinfo_struct_set_serial (a_structure: POINTER; a_value: NATURAL_64) is
			-- Setter for serial field of GDKKEYBOARDGRABINFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkkeyboardgrabinfo_struct_set_serial"
		}"
		end

	gdkkeyboardgrabinfo_struct_set_owner_events (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for owner_events field of GDKKEYBOARDGRABINFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkkeyboardgrabinfo_struct_set_owner_events"
		}"
		end

	gdkkeyboardgrabinfo_struct_set_time (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for time field of GDKKEYBOARDGRABINFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkkeyboardgrabinfo_struct_set_time"
		}"
		end

feature {} -- Low-level queries

	gdkkeyboardgrabinfo_struct_get_window (a_structure: POINTER): POINTER is
			-- Query for window field of GDKKEYBOARDGRABINFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkkeyboardgrabinfo_struct_get_window"
		}"
		end

	gdkkeyboardgrabinfo_struct_get_native_window (a_structure: POINTER): POINTER is
			-- Query for native_window field of GDKKEYBOARDGRABINFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkkeyboardgrabinfo_struct_get_native_window"
		}"
		end

	gdkkeyboardgrabinfo_struct_get_serial (a_structure: POINTER): NATURAL_64 is
			-- Query for serial field of GDKKEYBOARDGRABINFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkkeyboardgrabinfo_struct_get_serial"
		}"
		end

	gdkkeyboardgrabinfo_struct_get_owner_events (a_structure: POINTER): INTEGER_32 is
			-- Query for owner_events field of GDKKEYBOARDGRABINFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkkeyboardgrabinfo_struct_get_owner_events"
		}"
		end

	gdkkeyboardgrabinfo_struct_get_time (a_structure: POINTER): NATURAL_32 is
			-- Query for time field of GDKKEYBOARDGRABINFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkkeyboardgrabinfo_struct_get_time"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_GdkKeyboardGrabInfo"
		}"
		end

end -- class GDKKEYBOARDGRABINFO_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

