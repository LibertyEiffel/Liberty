-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDKEVENTCONFIGURE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GDK_TYPES
feature {} -- Low-level setters

	gdkeventconfigure_struct_set_type (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for type field of GDKEVENTCONFIGURE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventconfigure_struct_set_type"
		}"
		end

	gdkeventconfigure_struct_set_window (a_structure: POINTER; a_value: POINTER) is
			-- Setter for window field of GDKEVENTCONFIGURE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventconfigure_struct_set_window"
		}"
		end

	gdkeventconfigure_struct_set_send_event (a_structure: POINTER; a_value: CHARACTER) is
			-- Setter for send_event field of GDKEVENTCONFIGURE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventconfigure_struct_set_send_event"
		}"
		end

	gdkeventconfigure_struct_set_x (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for x field of GDKEVENTCONFIGURE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventconfigure_struct_set_x"
		}"
		end

	gdkeventconfigure_struct_set_y (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for y field of GDKEVENTCONFIGURE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventconfigure_struct_set_y"
		}"
		end

	gdkeventconfigure_struct_set_width (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for width field of GDKEVENTCONFIGURE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventconfigure_struct_set_width"
		}"
		end

	gdkeventconfigure_struct_set_height (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for height field of GDKEVENTCONFIGURE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventconfigure_struct_set_height"
		}"
		end

feature {} -- Low-level queries

	gdkeventconfigure_struct_get_type (a_structure: POINTER): INTEGER is
			-- Query for type field of GDKEVENTCONFIGURE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventconfigure_struct_get_type"
		}"
		end

	gdkeventconfigure_struct_get_window (a_structure: POINTER): POINTER is
			-- Query for window field of GDKEVENTCONFIGURE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventconfigure_struct_get_window"
		}"
		end

	gdkeventconfigure_struct_get_send_event (a_structure: POINTER): CHARACTER is
			-- Query for send_event field of GDKEVENTCONFIGURE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventconfigure_struct_get_send_event"
		}"
		end

	gdkeventconfigure_struct_get_x (a_structure: POINTER): INTEGER_32 is
			-- Query for x field of GDKEVENTCONFIGURE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventconfigure_struct_get_x"
		}"
		end

	gdkeventconfigure_struct_get_y (a_structure: POINTER): INTEGER_32 is
			-- Query for y field of GDKEVENTCONFIGURE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventconfigure_struct_get_y"
		}"
		end

	gdkeventconfigure_struct_get_width (a_structure: POINTER): INTEGER_32 is
			-- Query for width field of GDKEVENTCONFIGURE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventconfigure_struct_get_width"
		}"
		end

	gdkeventconfigure_struct_get_height (a_structure: POINTER): INTEGER_32 is
			-- Query for height field of GDKEVENTCONFIGURE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkeventconfigure_struct_get_height"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GdkEventConfigure"
		}"
		end

end -- class GDKEVENTCONFIGURE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

