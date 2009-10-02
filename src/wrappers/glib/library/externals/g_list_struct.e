-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class G_LIST_STRUCT

inherit ANY undefine is_equal, copy end

feature {} -- Low-level setters

	glist_struct_set_data (a_structure: POINTER; a_value: POINTER) is
			-- Setter for data field of GList structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "glist_struct_set_data"
		}"
		end

	glist_struct_set_next (a_structure: POINTER; a_value: POINTER) is
			-- Setter for next field of GList structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "glist_struct_set_next"
		}"
		end

	glist_struct_set_prev (a_structure: POINTER; a_value: POINTER) is
			-- Setter for prev field of GList structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "glist_struct_set_prev"
		}"
		end

feature {} -- Low-level queries

	glist_struct_get_data (a_structure: POINTER): POINTER is
			-- Query for data field of GList structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "glist_struct_get_data"
		}"
		end

	glist_struct_get_next (a_structure: POINTER): POINTER is
			-- Query for next field of GList structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "glist_struct_get_next"
		}"
		end

	glist_struct_get_prev (a_structure: POINTER): POINTER is
			-- Query for prev field of GList structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "glist_struct_get_prev"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "sizeof_GList"
		}"
		end

end
