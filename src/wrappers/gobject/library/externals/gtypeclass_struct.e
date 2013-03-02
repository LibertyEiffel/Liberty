-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTYPECLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_TYPES
feature {} -- Low-level setters

	gtypeclass_struct_set_g_type (a_structure: POINTER; a_value: NATURAL_64) is
			-- Setter for g_type field of GTYPECLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtypeclass_struct_set_g_type"
		}"
		end

feature {} -- Low-level queries

	gtypeclass_struct_get_g_type (a_structure: POINTER): NATURAL_64 is
			-- Query for g_type field of GTYPECLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtypeclass_struct_get_g_type"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GTypeClass"
		}"
		end

end -- class GTYPECLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

