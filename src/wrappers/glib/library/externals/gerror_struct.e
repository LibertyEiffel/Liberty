-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GERROR_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GLIB_TYPES
feature {} -- Low-level setters

	gerror_struct_set_domain (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for domain field of GERROR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gerror_struct_set_domain"
		}"
		end

	gerror_struct_set_code (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for code field of GERROR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gerror_struct_set_code"
		}"
		end

	gerror_struct_set_message (a_structure: POINTER; a_value: POINTER) is
			-- Setter for message field of GERROR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gerror_struct_set_message"
		}"
		end

feature {} -- Low-level queries

	gerror_struct_get_domain (a_structure: POINTER): NATURAL_32 is
			-- Query for domain field of GERROR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gerror_struct_get_domain"
		}"
		end

	gerror_struct_get_code (a_structure: POINTER): INTEGER_32 is
			-- Query for code field of GERROR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gerror_struct_get_code"
		}"
		end

	gerror_struct_get_message (a_structure: POINTER): POINTER is
			-- Query for message field of GERROR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gerror_struct_get_message"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GError"
		}"
		end

end -- class GERROR_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

