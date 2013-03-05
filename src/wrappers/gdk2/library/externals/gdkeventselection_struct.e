-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDKEVENTSELECTION_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GDK_TYPES
feature {} -- Low-level setters

	gdkeventselection_struct_set_type (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for type field of GDKEVENTSELECTION_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventselection_struct_set_type"
		}"
		end

	gdkeventselection_struct_set_window (a_structure: POINTER; a_value: POINTER) is
			-- Setter for window field of GDKEVENTSELECTION_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventselection_struct_set_window"
		}"
		end

	gdkeventselection_struct_set_send_event (a_structure: POINTER; a_value: CHARACTER) is
			-- Setter for send_event field of GDKEVENTSELECTION_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventselection_struct_set_send_event"
		}"
		end

	gdkeventselection_struct_set_selection (a_structure: POINTER; a_value: POINTER) is
			-- Setter for selection field of GDKEVENTSELECTION_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventselection_struct_set_selection"
		}"
		end

	gdkeventselection_struct_set_target (a_structure: POINTER; a_value: POINTER) is
			-- Setter for target field of GDKEVENTSELECTION_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventselection_struct_set_target"
		}"
		end

	gdkeventselection_struct_set_property (a_structure: POINTER; a_value: POINTER) is
			-- Setter for property field of GDKEVENTSELECTION_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventselection_struct_set_property"
		}"
		end

	gdkeventselection_struct_set_time (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for time field of GDKEVENTSELECTION_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventselection_struct_set_time"
		}"
		end

	gdkeventselection_struct_set_requestor (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for requestor field of GDKEVENTSELECTION_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventselection_struct_set_requestor"
		}"
		end

feature {} -- Low-level queries

	gdkeventselection_struct_get_type (a_structure: POINTER): INTEGER is
			-- Query for type field of GDKEVENTSELECTION_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventselection_struct_get_type"
		}"
		end

	gdkeventselection_struct_get_window (a_structure: POINTER): POINTER is
			-- Query for window field of GDKEVENTSELECTION_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventselection_struct_get_window"
		}"
		end

	gdkeventselection_struct_get_send_event (a_structure: POINTER): CHARACTER is
			-- Query for send_event field of GDKEVENTSELECTION_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventselection_struct_get_send_event"
		}"
		end

	gdkeventselection_struct_get_selection (a_structure: POINTER): POINTER is
			-- Query for selection field of GDKEVENTSELECTION_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventselection_struct_get_selection"
		}"
		end

	gdkeventselection_struct_get_target (a_structure: POINTER): POINTER is
			-- Query for target field of GDKEVENTSELECTION_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventselection_struct_get_target"
		}"
		end

	gdkeventselection_struct_get_property (a_structure: POINTER): POINTER is
			-- Query for property field of GDKEVENTSELECTION_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventselection_struct_get_property"
		}"
		end

	gdkeventselection_struct_get_time (a_structure: POINTER): NATURAL_32 is
			-- Query for time field of GDKEVENTSELECTION_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventselection_struct_get_time"
		}"
		end

	gdkeventselection_struct_get_requestor (a_structure: POINTER): NATURAL_32 is
			-- Query for requestor field of GDKEVENTSELECTION_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventselection_struct_get_requestor"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GdkEventSelection"
		}"
		end

end -- class GDKEVENTSELECTION_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

