-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDKEVENTNOEXPOSE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GDK_TYPES
feature {} -- Low-level setters

	gdkeventnoexpose_struct_set_type (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for type field of GDKEVENTNOEXPOSE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventnoexpose_struct_set_type"
		}"
		end

	gdkeventnoexpose_struct_set_window (a_structure: POINTER; a_value: POINTER) is
			-- Setter for window field of GDKEVENTNOEXPOSE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventnoexpose_struct_set_window"
		}"
		end

	gdkeventnoexpose_struct_set_send_event (a_structure: POINTER; a_value: CHARACTER) is
			-- Setter for send_event field of GDKEVENTNOEXPOSE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventnoexpose_struct_set_send_event"
		}"
		end

feature {} -- Low-level queries

	gdkeventnoexpose_struct_get_type (a_structure: POINTER): INTEGER is
			-- Query for type field of GDKEVENTNOEXPOSE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventnoexpose_struct_get_type"
		}"
		end

	gdkeventnoexpose_struct_get_window (a_structure: POINTER): POINTER is
			-- Query for window field of GDKEVENTNOEXPOSE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventnoexpose_struct_get_window"
		}"
		end

	gdkeventnoexpose_struct_get_send_event (a_structure: POINTER): CHARACTER is
			-- Query for send_event field of GDKEVENTNOEXPOSE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventnoexpose_struct_get_send_event"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GdkEventNoExpose"
		}"
		end

end -- class GDKEVENTNOEXPOSE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

