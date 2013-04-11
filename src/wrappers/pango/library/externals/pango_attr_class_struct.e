-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class PANGO_ATTR_CLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	PANGO_TYPES
feature {} -- Low-level setters

	pango_attr_class_struct_set_type (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for type field of PANGO_ATTR_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_class_struct_set_type"
		}"
		end

	pango_attr_class_struct_set_copy_external (a_structure: POINTER; a_value: POINTER) is
			-- Setter for copy field of PANGO_ATTR_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_class_struct_set_copy_external"
		}"
		end

	pango_attr_class_struct_set_destroy (a_structure: POINTER; a_value: POINTER) is
			-- Setter for destroy field of PANGO_ATTR_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_class_struct_set_destroy"
		}"
		end

	pango_attr_class_struct_set_equal (a_structure: POINTER; a_value: POINTER) is
			-- Setter for equal field of PANGO_ATTR_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_class_struct_set_equal"
		}"
		end

feature {} -- Low-level queries

	pango_attr_class_struct_get_type (a_structure: POINTER): INTEGER is
			-- Query for type field of PANGO_ATTR_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_class_struct_get_type"
		}"
		end

	pango_attr_class_struct_get_copy_external (a_structure: POINTER): POINTER is
			-- Query for copy field of PANGO_ATTR_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_class_struct_get_copy_external"
		}"
		end

	pango_attr_class_struct_get_destroy (a_structure: POINTER): POINTER is
			-- Query for destroy field of PANGO_ATTR_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_class_struct_get_destroy"
		}"
		end

	pango_attr_class_struct_get_equal (a_structure: POINTER): POINTER is
			-- Query for equal field of PANGO_ATTR_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_class_struct_get_equal"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__PangoAttrClass"
		}"
		end

end -- class PANGO_ATTR_CLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

