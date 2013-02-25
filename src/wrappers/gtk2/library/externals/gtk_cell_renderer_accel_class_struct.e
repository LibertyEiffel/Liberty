-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_CELL_RENDERER_ACCEL_CLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_cell_renderer_accel_class_struct_set_accel_edited (a_structure: POINTER; a_value: POINTER) is
			-- Setter for accel_edited field of GTK_CELL_RENDERER_ACCEL_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_accel_class_struct_set_accel_edited"
		}"
		end

	gtk_cell_renderer_accel_class_struct_set_accel_cleared (a_structure: POINTER; a_value: POINTER) is
			-- Setter for accel_cleared field of GTK_CELL_RENDERER_ACCEL_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_accel_class_struct_set_accel_cleared"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
	gtk_cell_renderer_accel_class_struct_get_accel_edited (a_structure: POINTER): POINTER is
			-- Query for accel_edited field of GTK_CELL_RENDERER_ACCEL_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_accel_class_struct_get_accel_edited"
		}"
		end

	gtk_cell_renderer_accel_class_struct_get_accel_cleared (a_structure: POINTER): POINTER is
			-- Query for accel_cleared field of GTK_CELL_RENDERER_ACCEL_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_accel_class_struct_get_accel_cleared"
		}"
		end

	-- Unwrappable field _gtk_reserved0.
	-- Unwrappable field _gtk_reserved1.
	-- Unwrappable field _gtk_reserved2.
	-- Unwrappable field _gtk_reserved3.
	-- Unwrappable field _gtk_reserved4.
feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkCellRendererAccelClass"
		}"
		end

end -- class GTK_CELL_RENDERER_ACCEL_CLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

