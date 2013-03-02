-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTYPEQUERY_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_TYPES
feature {} -- Low-level setters

	gtypequery_struct_set_type (a_structure: POINTER; a_value: NATURAL_64) is
			-- Setter for type field of GTYPEQUERY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtypequery_struct_set_type"
		}"
		end

	gtypequery_struct_set_type_name (a_structure: POINTER; a_value: POINTER) is
			-- Setter for type_name field of GTYPEQUERY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtypequery_struct_set_type_name"
		}"
		end

	gtypequery_struct_set_class_size (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for class_size field of GTYPEQUERY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtypequery_struct_set_class_size"
		}"
		end

	gtypequery_struct_set_instance_size (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for instance_size field of GTYPEQUERY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtypequery_struct_set_instance_size"
		}"
		end

feature {} -- Low-level queries

	gtypequery_struct_get_type (a_structure: POINTER): NATURAL_64 is
			-- Query for type field of GTYPEQUERY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtypequery_struct_get_type"
		}"
		end

	gtypequery_struct_get_type_name (a_structure: POINTER): POINTER is
			-- Query for type_name field of GTYPEQUERY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtypequery_struct_get_type_name"
		}"
		end

	gtypequery_struct_get_class_size (a_structure: POINTER): NATURAL_32 is
			-- Query for class_size field of GTYPEQUERY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtypequery_struct_get_class_size"
		}"
		end

	gtypequery_struct_get_instance_size (a_structure: POINTER): NATURAL_32 is
			-- Query for instance_size field of GTYPEQUERY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtypequery_struct_get_instance_size"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GTypeQuery"
		}"
		end

end -- class GTYPEQUERY_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

