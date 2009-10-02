-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class G_DEBUG_KEY_STRUCT

inherit ANY undefine is_equal, copy end

feature {} -- Low-level setters

	gdebugkey_struct_set_key (a_structure: POINTER; a_value: POINTER) is
			-- Setter for key field of GDebugKey structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gdebugkey_struct_set_key"
		}"
		end

	gdebugkey_struct_set_value (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for value field of GDebugKey structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gdebugkey_struct_set_value"
		}"
		end

feature {} -- Low-level queries

	gdebugkey_struct_get_key (a_structure: POINTER): POINTER is
			-- Query for key field of GDebugKey structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gdebugkey_struct_get_key"
		}"
		end

	gdebugkey_struct_get_value (a_structure: POINTER): NATURAL_32 is
			-- Query for value field of GDebugKey structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gdebugkey_struct_get_value"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "sizeof_GDebugKey"
		}"
		end

end
