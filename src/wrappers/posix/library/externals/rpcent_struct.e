-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class RPCENT_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

	rpcent_struct_set_r_name (a_structure: POINTER; a_value: POINTER) is
			-- Setter for r_name field of RPCENT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rpcent_struct_set_r_name"
		}"
		end

	rpcent_struct_set_r_aliases (a_structure: POINTER; a_value: POINTER) is
			-- Setter for r_aliases field of RPCENT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rpcent_struct_set_r_aliases"
		}"
		end

	rpcent_struct_set_r_number (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for r_number field of RPCENT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rpcent_struct_set_r_number"
		}"
		end

feature {} -- Low-level queries

	rpcent_struct_get_r_name (a_structure: POINTER): POINTER is
			-- Query for r_name field of RPCENT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rpcent_struct_get_r_name"
		}"
		end

	rpcent_struct_get_r_aliases (a_structure: POINTER): POINTER is
			-- Query for r_aliases field of RPCENT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rpcent_struct_get_r_aliases"
		}"
		end

	rpcent_struct_get_r_number (a_structure: POINTER): INTEGER is
			-- Query for r_number field of RPCENT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rpcent_struct_get_r_number"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_rpcent"
		}"
		end

end -- class RPCENT_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

