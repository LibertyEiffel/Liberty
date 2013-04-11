-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class LDIV_T_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	STANDARD_C_LIBRARY_TYPES
feature {} -- Low-level setters

	ldiv_t_struct_set_quot (a_structure: POINTER; a_value: INTEGER_64) is
			-- Setter for quot field of LDIV_T_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ldiv_t_struct_set_quot"
		}"
		end

	ldiv_t_struct_set_rem (a_structure: POINTER; a_value: INTEGER_64) is
			-- Setter for rem field of LDIV_T_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ldiv_t_struct_set_rem"
		}"
		end

feature {} -- Low-level queries

	ldiv_t_struct_get_quot (a_structure: POINTER): INTEGER_64 is
			-- Query for quot field of LDIV_T_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ldiv_t_struct_get_quot"
		}"
		end

	ldiv_t_struct_get_rem (a_structure: POINTER): INTEGER_64 is
			-- Query for rem field of LDIV_T_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ldiv_t_struct_get_rem"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_ldiv_t"
		}"
		end

end -- class LDIV_T_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

