-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDKEVENTEXPOSE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GDK_TYPES
feature {} -- Low-level setters

	gdkeventexpose_struct_set_type (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for type field of GDKEVENTEXPOSE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventexpose_struct_set_type"
		}"
		end

	gdkeventexpose_struct_set_window (a_structure: POINTER; a_value: POINTER) is
			-- Setter for window field of GDKEVENTEXPOSE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventexpose_struct_set_window"
		}"
		end

	gdkeventexpose_struct_set_send_event (a_structure: POINTER; a_value: CHARACTER) is
			-- Setter for send_event field of GDKEVENTEXPOSE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventexpose_struct_set_send_event"
		}"
		end

	gdkeventexpose_struct_set_region (a_structure: POINTER; a_value: POINTER) is
			-- Setter for region field of GDKEVENTEXPOSE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventexpose_struct_set_region"
		}"
		end

	gdkeventexpose_struct_set_count (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for count field of GDKEVENTEXPOSE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventexpose_struct_set_count"
		}"
		end

feature {} -- Low-level queries

	gdkeventexpose_struct_get_type (a_structure: POINTER): INTEGER is
			-- Query for type field of GDKEVENTEXPOSE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventexpose_struct_get_type"
		}"
		end

	gdkeventexpose_struct_get_window (a_structure: POINTER): POINTER is
			-- Query for window field of GDKEVENTEXPOSE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventexpose_struct_get_window"
		}"
		end

	gdkeventexpose_struct_get_send_event (a_structure: POINTER): CHARACTER is
			-- Query for send_event field of GDKEVENTEXPOSE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventexpose_struct_get_send_event"
		}"
		end

	-- Unwrappable field area.
	gdkeventexpose_struct_get_region (a_structure: POINTER): POINTER is
			-- Query for region field of GDKEVENTEXPOSE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventexpose_struct_get_region"
		}"
		end

	gdkeventexpose_struct_get_count (a_structure: POINTER): INTEGER_32 is
			-- Query for count field of GDKEVENTEXPOSE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventexpose_struct_get_count"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GdkEventExpose"
		}"
		end

end -- class GDKEVENTEXPOSE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

