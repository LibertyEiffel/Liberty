-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_CELL_RENDERER_PIXBUF_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_cell_renderer_pixbuf_struct_set_pixbuf (a_structure: POINTER; a_value: POINTER) is
			-- Setter for pixbuf field of GTK_CELL_RENDERER_PIXBUF_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_pixbuf_struct_set_pixbuf"
		}"
		end

	gtk_cell_renderer_pixbuf_struct_set_pixbuf_expander_open (a_structure: POINTER; a_value: POINTER) is
			-- Setter for pixbuf_expander_open field of GTK_CELL_RENDERER_PIXBUF_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_pixbuf_struct_set_pixbuf_expander_open"
		}"
		end

	gtk_cell_renderer_pixbuf_struct_set_pixbuf_expander_closed (a_structure: POINTER; a_value: POINTER) is
			-- Setter for pixbuf_expander_closed field of GTK_CELL_RENDERER_PIXBUF_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_pixbuf_struct_set_pixbuf_expander_closed"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent.
	gtk_cell_renderer_pixbuf_struct_get_pixbuf (a_structure: POINTER): POINTER is
			-- Query for pixbuf field of GTK_CELL_RENDERER_PIXBUF_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_pixbuf_struct_get_pixbuf"
		}"
		end

	gtk_cell_renderer_pixbuf_struct_get_pixbuf_expander_open (a_structure: POINTER): POINTER is
			-- Query for pixbuf_expander_open field of GTK_CELL_RENDERER_PIXBUF_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_pixbuf_struct_get_pixbuf_expander_open"
		}"
		end

	gtk_cell_renderer_pixbuf_struct_get_pixbuf_expander_closed (a_structure: POINTER): POINTER is
			-- Query for pixbuf_expander_closed field of GTK_CELL_RENDERER_PIXBUF_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_pixbuf_struct_get_pixbuf_expander_closed"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkCellRendererPixbuf"
		}"
		end

end -- class GTK_CELL_RENDERER_PIXBUF_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

