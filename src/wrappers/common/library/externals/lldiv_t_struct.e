-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class LLDIV_T_STRUCT

inherit ANY undefine is_equal, copy end

insert STANDARD_C_LIBRARY_TYPES
feature {} -- Low-level setters

	lldiv_t_struct_set_quot (a_structure: POINTER; a_value: INTEGER_64) is
			-- Setter for quot field of LLDIV_T_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "lldiv_t_struct_set_quot"
		}"
		end

	lldiv_t_struct_set_rem (a_structure: POINTER; a_value: INTEGER_64) is
			-- Setter for rem field of LLDIV_T_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "lldiv_t_struct_set_rem"
		}"
		end

feature {} -- Low-level queries

	lldiv_t_struct_get_quot (a_structure: POINTER): INTEGER_64 is
			-- Query for quot field of LLDIV_T_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "lldiv_t_struct_get_quot"
		}"
		end

	lldiv_t_struct_get_rem (a_structure: POINTER): INTEGER_64 is
			-- Query for rem field of LLDIV_T_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "lldiv_t_struct_get_rem"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_lldiv_t"
		}"
		end

end -- class LLDIV_T_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

