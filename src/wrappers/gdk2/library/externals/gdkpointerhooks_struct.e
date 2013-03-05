-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDKPOINTERHOOKS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GDK_TYPES
feature {} -- Low-level setters

	gdkpointerhooks_struct_set_get_pointer (a_structure: POINTER; a_value: POINTER) is
			-- Setter for get_pointer field of GDKPOINTERHOOKS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkpointerhooks_struct_set_get_pointer"
		}"
		end

	gdkpointerhooks_struct_set_window_at_pointer (a_structure: POINTER; a_value: POINTER) is
			-- Setter for window_at_pointer field of GDKPOINTERHOOKS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkpointerhooks_struct_set_window_at_pointer"
		}"
		end

feature {} -- Low-level queries

	gdkpointerhooks_struct_get_get_pointer (a_structure: POINTER): POINTER is
			-- Query for get_pointer field of GDKPOINTERHOOKS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkpointerhooks_struct_get_get_pointer"
		}"
		end

	gdkpointerhooks_struct_get_window_at_pointer (a_structure: POINTER): POINTER is
			-- Query for window_at_pointer field of GDKPOINTERHOOKS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkpointerhooks_struct_get_window_at_pointer"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GdkPointerHooks"
		}"
		end

end -- class GDKPOINTERHOOKS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

