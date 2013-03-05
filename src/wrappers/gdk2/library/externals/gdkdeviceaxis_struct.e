-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDKDEVICEAXIS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GDK_TYPES
feature {} -- Low-level setters

	gdkdeviceaxis_struct_set_use (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for use field of GDKDEVICEAXIS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkdeviceaxis_struct_set_use"
		}"
		end

	gdkdeviceaxis_struct_set_min (a_structure: POINTER; a_value: REAL_64) is
			-- Setter for min field of GDKDEVICEAXIS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkdeviceaxis_struct_set_min"
		}"
		end

	gdkdeviceaxis_struct_set_max (a_structure: POINTER; a_value: REAL_64) is
			-- Setter for max field of GDKDEVICEAXIS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkdeviceaxis_struct_set_max"
		}"
		end

feature {} -- Low-level queries

	gdkdeviceaxis_struct_get_use (a_structure: POINTER): INTEGER is
			-- Query for use field of GDKDEVICEAXIS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkdeviceaxis_struct_get_use"
		}"
		end

	gdkdeviceaxis_struct_get_min (a_structure: POINTER): REAL_64 is
			-- Query for min field of GDKDEVICEAXIS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkdeviceaxis_struct_get_min"
		}"
		end

	gdkdeviceaxis_struct_get_max (a_structure: POINTER): REAL_64 is
			-- Query for max field of GDKDEVICEAXIS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkdeviceaxis_struct_get_max"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GdkDeviceAxis"
		}"
		end

end -- class GDKDEVICEAXIS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

