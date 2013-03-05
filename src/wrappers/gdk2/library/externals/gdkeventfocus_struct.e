-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDKEVENTFOCUS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GDK_TYPES
feature {} -- Low-level setters

	gdkeventfocus_struct_set_type (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for type field of GDKEVENTFOCUS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventfocus_struct_set_type"
		}"
		end

	gdkeventfocus_struct_set_window (a_structure: POINTER; a_value: POINTER) is
			-- Setter for window field of GDKEVENTFOCUS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventfocus_struct_set_window"
		}"
		end

	gdkeventfocus_struct_set_send_event (a_structure: POINTER; a_value: CHARACTER) is
			-- Setter for send_event field of GDKEVENTFOCUS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventfocus_struct_set_send_event"
		}"
		end

	gdkeventfocus_struct_set_in (a_structure: POINTER; a_value: INTEGER_16) is
			-- Setter for in field of GDKEVENTFOCUS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventfocus_struct_set_in"
		}"
		end

feature {} -- Low-level queries

	gdkeventfocus_struct_get_type (a_structure: POINTER): INTEGER is
			-- Query for type field of GDKEVENTFOCUS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventfocus_struct_get_type"
		}"
		end

	gdkeventfocus_struct_get_window (a_structure: POINTER): POINTER is
			-- Query for window field of GDKEVENTFOCUS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventfocus_struct_get_window"
		}"
		end

	gdkeventfocus_struct_get_send_event (a_structure: POINTER): CHARACTER is
			-- Query for send_event field of GDKEVENTFOCUS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventfocus_struct_get_send_event"
		}"
		end

	gdkeventfocus_struct_get_in (a_structure: POINTER): INTEGER_16 is
			-- Query for in field of GDKEVENTFOCUS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventfocus_struct_get_in"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GdkEventFocus"
		}"
		end

end -- class GDKEVENTFOCUS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

