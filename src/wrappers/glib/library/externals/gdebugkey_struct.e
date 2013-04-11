-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDEBUGKEY_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GLIB_TYPES
feature {} -- Low-level setters

	gdebugkey_struct_set_key (a_structure: POINTER; a_value: POINTER) is
			-- Setter for key field of GDEBUGKEY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdebugkey_struct_set_key"
		}"
		end

	gdebugkey_struct_set_value (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for value field of GDEBUGKEY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdebugkey_struct_set_value"
		}"
		end

feature {} -- Low-level queries

	gdebugkey_struct_get_key (a_structure: POINTER): POINTER is
			-- Query for key field of GDEBUGKEY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdebugkey_struct_get_key"
		}"
		end

	gdebugkey_struct_get_value (a_structure: POINTER): NATURAL_32 is
			-- Query for value field of GDEBUGKEY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdebugkey_struct_get_value"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GDebugKey"
		}"
		end

end -- class GDEBUGKEY_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

