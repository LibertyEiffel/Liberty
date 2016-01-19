-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKIMAGEPIXMAPDATA_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkimagepixmapdata_struct_set_pixmap (a_structure: POINTER; a_value: POINTER) is
			-- Setter for pixmap field of GTKIMAGEPIXMAPDATA_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimagepixmapdata_struct_set_pixmap"
		}"
		end

feature {} -- Low-level queries

	gtkimagepixmapdata_struct_get_pixmap (a_structure: POINTER): POINTER is
			-- Query for pixmap field of GTKIMAGEPIXMAPDATA_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimagepixmapdata_struct_get_pixmap"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkImagePixmapData"
		}"
		end

end -- class GTKIMAGEPIXMAPDATA_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

