-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTYPE_CLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_TYPES
feature {} -- Low-level setters

	gtype_class_struct_set_g_type (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for g_type field of GTYPE_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtype_class_struct_set_g_type"
		}"
		end

feature {} -- Low-level queries

	gtype_class_struct_get_g_type (a_structure: POINTER): NATURAL_32 is
			-- Query for g_type field of GTYPE_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtype_class_struct_get_g_type"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GTypeClass"
		}"
		end

end -- class GTYPE_CLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

