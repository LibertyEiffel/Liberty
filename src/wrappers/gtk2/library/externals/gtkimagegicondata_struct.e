-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKIMAGEGICONDATA_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkimagegicondata_struct_set_icon (a_structure: POINTER; a_value: POINTER) is
			-- Setter for icon field of GTKIMAGEGICONDATA_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimagegicondata_struct_set_icon"
		}"
		end

	gtkimagegicondata_struct_set_pixbuf (a_structure: POINTER; a_value: POINTER) is
			-- Setter for pixbuf field of GTKIMAGEGICONDATA_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimagegicondata_struct_set_pixbuf"
		}"
		end

	gtkimagegicondata_struct_set_theme_change_id (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for theme_change_id field of GTKIMAGEGICONDATA_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimagegicondata_struct_set_theme_change_id"
		}"
		end

feature {} -- Low-level queries

	gtkimagegicondata_struct_get_icon (a_structure: POINTER): POINTER is
			-- Query for icon field of GTKIMAGEGICONDATA_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimagegicondata_struct_get_icon"
		}"
		end

	gtkimagegicondata_struct_get_pixbuf (a_structure: POINTER): POINTER is
			-- Query for pixbuf field of GTKIMAGEGICONDATA_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimagegicondata_struct_get_pixbuf"
		}"
		end

	gtkimagegicondata_struct_get_theme_change_id (a_structure: POINTER): NATURAL_32 is
			-- Query for theme_change_id field of GTKIMAGEGICONDATA_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimagegicondata_struct_get_theme_change_id"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkImageGIconData"
		}"
		end

end -- class GTKIMAGEGICONDATA_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

