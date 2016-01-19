-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_IMAGE_PIXBUF_DATA_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_image_pixbuf_data_struct_set_pixbuf (a_structure: POINTER; a_value: POINTER) is
			-- Setter for pixbuf field of GTK_IMAGE_PIXBUF_DATA_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_pixbuf_data_struct_set_pixbuf"
		}"
		end

feature {} -- Low-level queries

	gtk_image_pixbuf_data_struct_get_pixbuf (a_structure: POINTER): POINTER is
			-- Query for pixbuf field of GTK_IMAGE_PIXBUF_DATA_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_pixbuf_data_struct_get_pixbuf"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkImagePixbufData"
		}"
		end

end -- class GTK_IMAGE_PIXBUF_DATA_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

