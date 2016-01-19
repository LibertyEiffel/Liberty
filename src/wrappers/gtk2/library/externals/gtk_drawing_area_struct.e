-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_DRAWING_AREA_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_drawing_area_struct_set_draw_data (a_structure: POINTER; a_value: POINTER) is
			-- Setter for draw_data field of GTK_DRAWING_AREA_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drawing_area_struct_set_draw_data"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field widget.
	gtk_drawing_area_struct_get_draw_data (a_structure: POINTER): POINTER is
			-- Query for draw_data field of GTK_DRAWING_AREA_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drawing_area_struct_get_draw_data"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkDrawingArea"
		}"
		end

end -- class GTK_DRAWING_AREA_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

