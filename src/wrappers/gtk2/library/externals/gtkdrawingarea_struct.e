-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKDRAWINGAREA_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkdrawingarea_struct_set_draw_data (a_structure: POINTER; a_value: POINTER) is
			-- Setter for draw_data field of GTKDRAWINGAREA_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkdrawingarea_struct_set_draw_data"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field widget.
	gtkdrawingarea_struct_get_draw_data (a_structure: POINTER): POINTER is
			-- Query for draw_data field of GTKDRAWINGAREA_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkdrawingarea_struct_get_draw_data"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkDrawingArea"
		}"
		end

end -- class GTKDRAWINGAREA_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

