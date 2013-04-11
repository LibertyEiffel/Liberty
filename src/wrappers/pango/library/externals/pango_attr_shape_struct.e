-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class PANGO_ATTR_SHAPE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	PANGO_TYPES
feature {} -- Low-level setters

	pango_attr_shape_struct_set_data (a_structure: POINTER; a_value: POINTER) is
			-- Setter for data field of PANGO_ATTR_SHAPE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_shape_struct_set_data"
		}"
		end

	pango_attr_shape_struct_set_copy_func (a_structure: POINTER; a_value: POINTER) is
			-- Setter for copy_func field of PANGO_ATTR_SHAPE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_shape_struct_set_copy_func"
		}"
		end

	pango_attr_shape_struct_set_destroy_func (a_structure: POINTER; a_value: POINTER) is
			-- Setter for destroy_func field of PANGO_ATTR_SHAPE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_shape_struct_set_destroy_func"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field attr.
	-- Unwrappable field ink_rect.
	-- Unwrappable field logical_rect.
	pango_attr_shape_struct_get_data (a_structure: POINTER): POINTER is
			-- Query for data field of PANGO_ATTR_SHAPE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_shape_struct_get_data"
		}"
		end

	pango_attr_shape_struct_get_copy_func (a_structure: POINTER): POINTER is
			-- Query for copy_func field of PANGO_ATTR_SHAPE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_shape_struct_get_copy_func"
		}"
		end

	pango_attr_shape_struct_get_destroy_func (a_structure: POINTER): POINTER is
			-- Query for destroy_func field of PANGO_ATTR_SHAPE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_shape_struct_get_destroy_func"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__PangoAttrShape"
		}"
		end

end -- class PANGO_ATTR_SHAPE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

