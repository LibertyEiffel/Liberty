-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class G_ERROR_STRUCT

inherit ANY undefine is_equal, copy end

feature {} -- Low-level setters

	gerror_struct_set_domain (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for domain field of GError structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gerror_struct_set_domain"
		}"
		end

	gerror_struct_set_code (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for code field of GError structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gerror_struct_set_code"
		}"
		end

	gerror_struct_set_message (a_structure: POINTER; a_value: POINTER) is
			-- Setter for message field of GError structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gerror_struct_set_message"
		}"
		end

feature {} -- Low-level queries

	gerror_struct_get_domain (a_structure: POINTER): NATURAL_32 is
			-- Query for domain field of GError structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gerror_struct_get_domain"
		}"
		end

	gerror_struct_get_code (a_structure: POINTER): INTEGER_32 is
			-- Query for code field of GError structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gerror_struct_get_code"
		}"
		end

	gerror_struct_get_message (a_structure: POINTER): POINTER is
			-- Query for message field of GError structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gerror_struct_get_message"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "sizeof_GError"
		}"
		end

end
