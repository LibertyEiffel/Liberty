-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTYPE_FUNDAMENTAL_INFO_STRUCT

inherit ANY undefine is_equal, copy end

insert GOBJECT_TYPES
feature {} -- Low-level setters

	gtype_fundamental_info_struct_set_type_flags (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for type_flags field of GTYPE_FUNDAMENTAL_INFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtype_fundamental_info_struct_set_type_flags"
		}"
		end

feature {} -- Low-level queries

	gtype_fundamental_info_struct_get_type_flags (a_structure: POINTER): INTEGER is
			-- Query for type_flags field of GTYPE_FUNDAMENTAL_INFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtype_fundamental_info_struct_get_type_flags"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GTypeFundamentalInfo"
		}"
		end

end -- class GTYPE_FUNDAMENTAL_INFO_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

