-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDKKEYMAPKEY_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GDK_TYPES
feature {} -- Low-level setters

	gdkkeymapkey_struct_set_keycode (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for keycode field of GDKKEYMAPKEY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkkeymapkey_struct_set_keycode"
		}"
		end

	gdkkeymapkey_struct_set_group (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for group field of GDKKEYMAPKEY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkkeymapkey_struct_set_group"
		}"
		end

	gdkkeymapkey_struct_set_level (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for level field of GDKKEYMAPKEY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkkeymapkey_struct_set_level"
		}"
		end

feature {} -- Low-level queries

	gdkkeymapkey_struct_get_keycode (a_structure: POINTER): NATURAL_32 is
			-- Query for keycode field of GDKKEYMAPKEY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkkeymapkey_struct_get_keycode"
		}"
		end

	gdkkeymapkey_struct_get_group (a_structure: POINTER): INTEGER_32 is
			-- Query for group field of GDKKEYMAPKEY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkkeymapkey_struct_get_group"
		}"
		end

	gdkkeymapkey_struct_get_level (a_structure: POINTER): INTEGER_32 is
			-- Query for level field of GDKKEYMAPKEY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkkeymapkey_struct_get_level"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GdkKeymapKey"
		}"
		end

end -- class GDKKEYMAPKEY_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

