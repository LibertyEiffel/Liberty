-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDKDEVICE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GDK_TYPES
feature {} -- Low-level setters

	gdkdevice_struct_set_name (a_structure: POINTER; a_value: POINTER) is
			-- Setter for name field of GDKDEVICE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkdevice_struct_set_name"
		}"
		end

	gdkdevice_struct_set_source (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for source field of GDKDEVICE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkdevice_struct_set_source"
		}"
		end

	gdkdevice_struct_set_mode (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for mode field of GDKDEVICE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkdevice_struct_set_mode"
		}"
		end

	gdkdevice_struct_set_has_cursor (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for has_cursor field of GDKDEVICE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkdevice_struct_set_has_cursor"
		}"
		end

	gdkdevice_struct_set_num_axes (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for num_axes field of GDKDEVICE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkdevice_struct_set_num_axes"
		}"
		end

	gdkdevice_struct_set_axes (a_structure: POINTER; a_value: POINTER) is
			-- Setter for axes field of GDKDEVICE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkdevice_struct_set_axes"
		}"
		end

	gdkdevice_struct_set_num_keys (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for num_keys field of GDKDEVICE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkdevice_struct_set_num_keys"
		}"
		end

	gdkdevice_struct_set_keys (a_structure: POINTER; a_value: POINTER) is
			-- Setter for keys field of GDKDEVICE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkdevice_struct_set_keys"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gdkdevice_struct_get_name (a_structure: POINTER): POINTER is
			-- Query for name field of GDKDEVICE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkdevice_struct_get_name"
		}"
		end

	gdkdevice_struct_get_source (a_structure: POINTER): INTEGER is
			-- Query for source field of GDKDEVICE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkdevice_struct_get_source"
		}"
		end

	gdkdevice_struct_get_mode (a_structure: POINTER): INTEGER is
			-- Query for mode field of GDKDEVICE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkdevice_struct_get_mode"
		}"
		end

	gdkdevice_struct_get_has_cursor (a_structure: POINTER): INTEGER_32 is
			-- Query for has_cursor field of GDKDEVICE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkdevice_struct_get_has_cursor"
		}"
		end

	gdkdevice_struct_get_num_axes (a_structure: POINTER): INTEGER_32 is
			-- Query for num_axes field of GDKDEVICE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkdevice_struct_get_num_axes"
		}"
		end

	gdkdevice_struct_get_axes (a_structure: POINTER): POINTER is
			-- Query for axes field of GDKDEVICE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkdevice_struct_get_axes"
		}"
		end

	gdkdevice_struct_get_num_keys (a_structure: POINTER): INTEGER_32 is
			-- Query for num_keys field of GDKDEVICE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkdevice_struct_get_num_keys"
		}"
		end

	gdkdevice_struct_get_keys (a_structure: POINTER): POINTER is
			-- Query for keys field of GDKDEVICE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkdevice_struct_get_keys"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GdkDevice"
		}"
		end

end -- class GDKDEVICE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

