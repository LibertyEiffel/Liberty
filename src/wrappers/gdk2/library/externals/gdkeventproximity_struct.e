-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDKEVENTPROXIMITY_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GDK_TYPES
feature {} -- Low-level setters

	gdkeventproximity_struct_set_type (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for type field of GDKEVENTPROXIMITY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventproximity_struct_set_type"
		}"
		end

	gdkeventproximity_struct_set_window (a_structure: POINTER; a_value: POINTER) is
			-- Setter for window field of GDKEVENTPROXIMITY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventproximity_struct_set_window"
		}"
		end

	gdkeventproximity_struct_set_send_event (a_structure: POINTER; a_value: CHARACTER) is
			-- Setter for send_event field of GDKEVENTPROXIMITY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventproximity_struct_set_send_event"
		}"
		end

	gdkeventproximity_struct_set_time (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for time field of GDKEVENTPROXIMITY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventproximity_struct_set_time"
		}"
		end

	gdkeventproximity_struct_set_device (a_structure: POINTER; a_value: POINTER) is
			-- Setter for device field of GDKEVENTPROXIMITY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventproximity_struct_set_device"
		}"
		end

feature {} -- Low-level queries

	gdkeventproximity_struct_get_type (a_structure: POINTER): INTEGER is
			-- Query for type field of GDKEVENTPROXIMITY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventproximity_struct_get_type"
		}"
		end

	gdkeventproximity_struct_get_window (a_structure: POINTER): POINTER is
			-- Query for window field of GDKEVENTPROXIMITY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventproximity_struct_get_window"
		}"
		end

	gdkeventproximity_struct_get_send_event (a_structure: POINTER): CHARACTER is
			-- Query for send_event field of GDKEVENTPROXIMITY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventproximity_struct_get_send_event"
		}"
		end

	gdkeventproximity_struct_get_time (a_structure: POINTER): NATURAL_32 is
			-- Query for time field of GDKEVENTPROXIMITY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventproximity_struct_get_time"
		}"
		end

	gdkeventproximity_struct_get_device (a_structure: POINTER): POINTER is
			-- Query for device field of GDKEVENTPROXIMITY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventproximity_struct_get_device"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GdkEventProximity"
		}"
		end

end -- class GDKEVENTPROXIMITY_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

