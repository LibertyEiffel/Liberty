-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_CELL_RENDERER_ACCEL_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_cell_renderer_accel_struct_set_accel_key (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for accel_key field of GTK_CELL_RENDERER_ACCEL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_accel_struct_set_accel_key"
		}"
		end

	gtk_cell_renderer_accel_struct_set_accel_mods (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for accel_mods field of GTK_CELL_RENDERER_ACCEL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_accel_struct_set_accel_mods"
		}"
		end

	gtk_cell_renderer_accel_struct_set_keycode (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for keycode field of GTK_CELL_RENDERER_ACCEL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_accel_struct_set_keycode"
		}"
		end

	gtk_cell_renderer_accel_struct_set_accel_mode (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for accel_mode field of GTK_CELL_RENDERER_ACCEL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_accel_struct_set_accel_mode"
		}"
		end

	gtk_cell_renderer_accel_struct_set_edit_widget (a_structure: POINTER; a_value: POINTER) is
			-- Setter for edit_widget field of GTK_CELL_RENDERER_ACCEL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_accel_struct_set_edit_widget"
		}"
		end

	gtk_cell_renderer_accel_struct_set_grab_widget (a_structure: POINTER; a_value: POINTER) is
			-- Setter for grab_widget field of GTK_CELL_RENDERER_ACCEL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_accel_struct_set_grab_widget"
		}"
		end

	gtk_cell_renderer_accel_struct_set_sizing_label (a_structure: POINTER; a_value: POINTER) is
			-- Setter for sizing_label field of GTK_CELL_RENDERER_ACCEL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_accel_struct_set_sizing_label"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent.
	gtk_cell_renderer_accel_struct_get_accel_key (a_structure: POINTER): NATURAL is
			-- Query for accel_key field of GTK_CELL_RENDERER_ACCEL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_accel_struct_get_accel_key"
		}"
		end

	gtk_cell_renderer_accel_struct_get_accel_mods (a_structure: POINTER): INTEGER is
			-- Query for accel_mods field of GTK_CELL_RENDERER_ACCEL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_accel_struct_get_accel_mods"
		}"
		end

	gtk_cell_renderer_accel_struct_get_keycode (a_structure: POINTER): NATURAL is
			-- Query for keycode field of GTK_CELL_RENDERER_ACCEL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_accel_struct_get_keycode"
		}"
		end

	gtk_cell_renderer_accel_struct_get_accel_mode (a_structure: POINTER): INTEGER is
			-- Query for accel_mode field of GTK_CELL_RENDERER_ACCEL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_accel_struct_get_accel_mode"
		}"
		end

	gtk_cell_renderer_accel_struct_get_edit_widget (a_structure: POINTER): POINTER is
			-- Query for edit_widget field of GTK_CELL_RENDERER_ACCEL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_accel_struct_get_edit_widget"
		}"
		end

	gtk_cell_renderer_accel_struct_get_grab_widget (a_structure: POINTER): POINTER is
			-- Query for grab_widget field of GTK_CELL_RENDERER_ACCEL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_accel_struct_get_grab_widget"
		}"
		end

	gtk_cell_renderer_accel_struct_get_sizing_label (a_structure: POINTER): POINTER is
			-- Query for sizing_label field of GTK_CELL_RENDERER_ACCEL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_accel_struct_get_sizing_label"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkCellRendererAccel"
		}"
		end

end -- class GTK_CELL_RENDERER_ACCEL_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

