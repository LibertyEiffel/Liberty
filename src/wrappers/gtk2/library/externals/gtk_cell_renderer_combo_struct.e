-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_CELL_RENDERER_COMBO_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_cell_renderer_combo_struct_set_model (a_structure: POINTER; a_value: POINTER) is
			-- Setter for model field of GTK_CELL_RENDERER_COMBO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_combo_struct_set_model"
		}"
		end

	gtk_cell_renderer_combo_struct_set_text_column (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for text_column field of GTK_CELL_RENDERER_COMBO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_combo_struct_set_text_column"
		}"
		end

	gtk_cell_renderer_combo_struct_set_has_entry (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for has_entry field of GTK_CELL_RENDERER_COMBO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_combo_struct_set_has_entry"
		}"
		end

	gtk_cell_renderer_combo_struct_set_focus_out_id (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for focus_out_id field of GTK_CELL_RENDERER_COMBO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_combo_struct_set_focus_out_id"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent.
	gtk_cell_renderer_combo_struct_get_model (a_structure: POINTER): POINTER is
			-- Query for model field of GTK_CELL_RENDERER_COMBO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_combo_struct_get_model"
		}"
		end

	gtk_cell_renderer_combo_struct_get_text_column (a_structure: POINTER): INTEGER is
			-- Query for text_column field of GTK_CELL_RENDERER_COMBO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_combo_struct_get_text_column"
		}"
		end

	gtk_cell_renderer_combo_struct_get_has_entry (a_structure: POINTER): INTEGER is
			-- Query for has_entry field of GTK_CELL_RENDERER_COMBO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_combo_struct_get_has_entry"
		}"
		end

	gtk_cell_renderer_combo_struct_get_focus_out_id (a_structure: POINTER): NATURAL is
			-- Query for focus_out_id field of GTK_CELL_RENDERER_COMBO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_combo_struct_get_focus_out_id"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkCellRendererCombo"
		}"
		end

end -- class GTK_CELL_RENDERER_COMBO_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

