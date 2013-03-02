-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTYPEINSTANCE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_TYPES
feature {} -- Low-level setters

	gtypeinstance_struct_set_g_class (a_structure: POINTER; a_value: POINTER) is
			-- Setter for g_class field of GTYPEINSTANCE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtypeinstance_struct_set_g_class"
		}"
		end

feature {} -- Low-level queries

	gtypeinstance_struct_get_g_class (a_structure: POINTER): POINTER is
			-- Query for g_class field of GTYPEINSTANCE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtypeinstance_struct_get_g_class"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GTypeInstance"
		}"
		end

end -- class GTYPEINSTANCE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

