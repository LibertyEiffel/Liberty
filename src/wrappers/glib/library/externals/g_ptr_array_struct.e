-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class G_PTR_ARRAY_STRUCT

inherit ANY undefine is_equal, copy end

feature {} -- Low-level setters

	gptrarray_struct_set_pdata (a_structure: POINTER; a_value: POINTER) is
			-- Setter for pdata field of GPtrArray structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gptrarray_struct_set_pdata"
		}"
		end

	gptrarray_struct_set_len (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for len field of GPtrArray structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gptrarray_struct_set_len"
		}"
		end

feature {} -- Low-level queries

	gptrarray_struct_get_pdata (a_structure: POINTER): POINTER is
			-- Query for pdata field of GPtrArray structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gptrarray_struct_get_pdata"
		}"
		end

	gptrarray_struct_get_len (a_structure: POINTER): NATURAL_32 is
			-- Query for len field of GPtrArray structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gptrarray_struct_get_len"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "sizeof_GPtrArray"
		}"
		end

end
