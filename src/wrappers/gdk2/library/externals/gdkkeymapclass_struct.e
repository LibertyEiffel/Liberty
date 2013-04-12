-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDKKEYMAPCLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GDK_TYPES
feature {} -- Low-level setters

	gdkkeymapclass_struct_set_direction_changed (a_structure: POINTER; a_value: POINTER) is
			-- Setter for direction_changed field of GDKKEYMAPCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkkeymapclass_struct_set_direction_changed"
		}"
		end

	gdkkeymapclass_struct_set_keys_changed (a_structure: POINTER; a_value: POINTER) is
			-- Setter for keys_changed field of GDKKEYMAPCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkkeymapclass_struct_set_keys_changed"
		}"
		end

	gdkkeymapclass_struct_set_state_changed (a_structure: POINTER; a_value: POINTER) is
			-- Setter for state_changed field of GDKKEYMAPCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkkeymapclass_struct_set_state_changed"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
	gdkkeymapclass_struct_get_direction_changed (a_structure: POINTER): POINTER is
			-- Query for direction_changed field of GDKKEYMAPCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkkeymapclass_struct_get_direction_changed"
		}"
		end

	gdkkeymapclass_struct_get_keys_changed (a_structure: POINTER): POINTER is
			-- Query for keys_changed field of GDKKEYMAPCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkkeymapclass_struct_get_keys_changed"
		}"
		end

	gdkkeymapclass_struct_get_state_changed (a_structure: POINTER): POINTER is
			-- Query for state_changed field of GDKKEYMAPCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkkeymapclass_struct_get_state_changed"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GdkKeymapClass"
		}"
		end

end -- class GDKKEYMAPCLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

