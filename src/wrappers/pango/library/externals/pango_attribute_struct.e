-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class PANGO_ATTRIBUTE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	PANGO_TYPES
feature {} -- Low-level setters

	pango_attribute_struct_set_klass (a_structure: POINTER; a_value: POINTER) is
			-- Setter for klass field of PANGO_ATTRIBUTE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attribute_struct_set_klass"
		}"
		end

	pango_attribute_struct_set_start_index (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for start_index field of PANGO_ATTRIBUTE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attribute_struct_set_start_index"
		}"
		end

	pango_attribute_struct_set_end_index (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for end_index field of PANGO_ATTRIBUTE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attribute_struct_set_end_index"
		}"
		end

feature {} -- Low-level queries

	pango_attribute_struct_get_klass (a_structure: POINTER): POINTER is
			-- Query for klass field of PANGO_ATTRIBUTE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attribute_struct_get_klass"
		}"
		end

	pango_attribute_struct_get_start_index (a_structure: POINTER): NATURAL_32 is
			-- Query for start_index field of PANGO_ATTRIBUTE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attribute_struct_get_start_index"
		}"
		end

	pango_attribute_struct_get_end_index (a_structure: POINTER): NATURAL_32 is
			-- Query for end_index field of PANGO_ATTRIBUTE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attribute_struct_get_end_index"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__PangoAttribute"
		}"
		end

end -- class PANGO_ATTRIBUTE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

