-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_WIDGET_SHAPE_INFO_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_widget_shape_info_struct_set_offset_x (a_structure: POINTER; a_value: INTEGER_16) is
			-- Setter for offset_x field of GTK_WIDGET_SHAPE_INFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_shape_info_struct_set_offset_x"
		}"
		end

	gtk_widget_shape_info_struct_set_offset_y (a_structure: POINTER; a_value: INTEGER_16) is
			-- Setter for offset_y field of GTK_WIDGET_SHAPE_INFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_shape_info_struct_set_offset_y"
		}"
		end

	gtk_widget_shape_info_struct_set_shape_mask (a_structure: POINTER; a_value: POINTER) is
			-- Setter for shape_mask field of GTK_WIDGET_SHAPE_INFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_shape_info_struct_set_shape_mask"
		}"
		end

feature {} -- Low-level queries

	gtk_widget_shape_info_struct_get_offset_x (a_structure: POINTER): INTEGER_16 is
			-- Query for offset_x field of GTK_WIDGET_SHAPE_INFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_shape_info_struct_get_offset_x"
		}"
		end

	gtk_widget_shape_info_struct_get_offset_y (a_structure: POINTER): INTEGER_16 is
			-- Query for offset_y field of GTK_WIDGET_SHAPE_INFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_shape_info_struct_get_offset_y"
		}"
		end

	gtk_widget_shape_info_struct_get_shape_mask (a_structure: POINTER): POINTER is
			-- Query for shape_mask field of GTK_WIDGET_SHAPE_INFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_shape_info_struct_get_shape_mask"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkWidgetShapeInfo"
		}"
		end

end -- class GTK_WIDGET_SHAPE_INFO_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

