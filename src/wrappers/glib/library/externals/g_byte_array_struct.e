-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class G_BYTE_ARRAY_STRUCT

inherit ANY undefine is_equal, copy end

feature {} -- Low-level setters

	gbytearray_struct_set_data (a_structure: POINTER; a_value: POINTER) is
			-- Setter for data field of GByteArray structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gbytearray_struct_set_data"
		}"
		end

	gbytearray_struct_set_len (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for len field of GByteArray structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gbytearray_struct_set_len"
		}"
		end

feature {} -- Low-level queries

	gbytearray_struct_get_data (a_structure: POINTER): POINTER is
			-- Query for data field of GByteArray structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gbytearray_struct_get_data"
		}"
		end

	gbytearray_struct_get_len (a_structure: POINTER): NATURAL_32 is
			-- Query for len field of GByteArray structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gbytearray_struct_get_len"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "sizeof_GByteArray"
		}"
		end

end
