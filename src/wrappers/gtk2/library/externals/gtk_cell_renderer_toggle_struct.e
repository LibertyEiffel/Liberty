-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_CELL_RENDERER_TOGGLE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_cell_renderer_toggle_struct_set_active (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for active field of GTK_CELL_RENDERER_TOGGLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_toggle_struct_set_active"
		}"
		end

	gtk_cell_renderer_toggle_struct_set_activatable (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for activatable field of GTK_CELL_RENDERER_TOGGLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_toggle_struct_set_activatable"
		}"
		end

	gtk_cell_renderer_toggle_struct_set_radio (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for radio field of GTK_CELL_RENDERER_TOGGLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_toggle_struct_set_radio"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent.
	gtk_cell_renderer_toggle_struct_get_active (a_structure: POINTER): NATURAL is
			-- Query for active field of GTK_CELL_RENDERER_TOGGLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_toggle_struct_get_active"
		}"
		end

	gtk_cell_renderer_toggle_struct_get_activatable (a_structure: POINTER): NATURAL is
			-- Query for activatable field of GTK_CELL_RENDERER_TOGGLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_toggle_struct_get_activatable"
		}"
		end

	gtk_cell_renderer_toggle_struct_get_radio (a_structure: POINTER): NATURAL is
			-- Query for radio field of GTK_CELL_RENDERER_TOGGLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_toggle_struct_get_radio"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkCellRendererToggle"
		}"
		end

end -- class GTK_CELL_RENDERER_TOGGLE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

