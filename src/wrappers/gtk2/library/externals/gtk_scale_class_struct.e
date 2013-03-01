-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_SCALE_CLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_scale_class_struct_set_format_value (a_structure: POINTER; a_value: POINTER) is
			-- Setter for format_value field of GTK_SCALE_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_class_struct_set_format_value"
		}"
		end

	gtk_scale_class_struct_set_draw_value (a_structure: POINTER; a_value: POINTER) is
			-- Setter for draw_value field of GTK_SCALE_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_class_struct_set_draw_value"
		}"
		end

	gtk_scale_class_struct_set_get_layout_offsets (a_structure: POINTER; a_value: POINTER) is
			-- Setter for get_layout_offsets field of GTK_SCALE_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_class_struct_set_get_layout_offsets"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
	gtk_scale_class_struct_get_format_value (a_structure: POINTER): POINTER is
			-- Query for format_value field of GTK_SCALE_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_class_struct_get_format_value"
		}"
		end

	gtk_scale_class_struct_get_draw_value (a_structure: POINTER): POINTER is
			-- Query for draw_value field of GTK_SCALE_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_class_struct_get_draw_value"
		}"
		end

	gtk_scale_class_struct_get_get_layout_offsets (a_structure: POINTER): POINTER is
			-- Query for get_layout_offsets field of GTK_SCALE_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_class_struct_get_get_layout_offsets"
		}"
		end

	-- Unwrappable field _gtk_reserved1.
	-- Unwrappable field _gtk_reserved2.
	-- Unwrappable field _gtk_reserved3.
feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkScaleClass"
		}"
		end

end -- class GTK_SCALE_CLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

