-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTUPLES_STRUCT

inherit ANY undefine is_equal, copy end

insert GLIB_TYPES
feature {} -- Low-level setters

	gtuples_struct_set_len (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for len field of GTUPLES_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtuples_struct_set_len"
		}"
		end

feature {} -- Low-level queries

	gtuples_struct_get_len (a_structure: POINTER): NATURAL_32 is
			-- Query for len field of GTUPLES_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtuples_struct_get_len"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GTuples"
		}"
		end

end -- class GTUPLES_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

