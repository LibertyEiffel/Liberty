-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDKDEVICEKEY_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GDK_TYPES
feature {} -- Low-level setters

	gdkdevicekey_struct_set_keyval (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for keyval field of GDKDEVICEKEY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkdevicekey_struct_set_keyval"
		}"
		end

	gdkdevicekey_struct_set_modifiers (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for modifiers field of GDKDEVICEKEY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkdevicekey_struct_set_modifiers"
		}"
		end

feature {} -- Low-level queries

	gdkdevicekey_struct_get_keyval (a_structure: POINTER): NATURAL_32 is
			-- Query for keyval field of GDKDEVICEKEY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkdevicekey_struct_get_keyval"
		}"
		end

	gdkdevicekey_struct_get_modifiers (a_structure: POINTER): INTEGER is
			-- Query for modifiers field of GDKDEVICEKEY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkdevicekey_struct_get_modifiers"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GdkDeviceKey"
		}"
		end

end -- class GDKDEVICEKEY_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

