-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class G_TUPLES_STRUCT

inherit ANY undefine is_equal, copy end

feature {} -- Low-level setters

	gtuples_struct_set_len (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for len field of GTuples structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gtuples_struct_set_len"
		}"
		end

feature {} -- Low-level queries

	gtuples_struct_get_len (a_structure: POINTER): NATURAL_32 is
			-- Query for len field of GTuples structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gtuples_struct_get_len"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "sizeof_GTuples"
		}"
		end

end
