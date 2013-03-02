-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTYPEFUNDAMENTALINFO_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_TYPES
feature {} -- Low-level setters

	gtypefundamentalinfo_struct_set_type_flags (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for type_flags field of GTYPEFUNDAMENTALINFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtypefundamentalinfo_struct_set_type_flags"
		}"
		end

feature {} -- Low-level queries

	gtypefundamentalinfo_struct_get_type_flags (a_structure: POINTER): INTEGER is
			-- Query for type_flags field of GTYPEFUNDAMENTALINFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtypefundamentalinfo_struct_get_type_flags"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GTypeFundamentalInfo"
		}"
		end

end -- class GTYPEFUNDAMENTALINFO_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

