-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKIMAGEIMAGEDATA_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkimageimagedata_struct_set_image (a_structure: POINTER; a_value: POINTER) is
			-- Setter for image field of GTKIMAGEIMAGEDATA_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimageimagedata_struct_set_image"
		}"
		end

feature {} -- Low-level queries

	gtkimageimagedata_struct_get_image (a_structure: POINTER): POINTER is
			-- Query for image field of GTKIMAGEIMAGEDATA_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimageimagedata_struct_get_image"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkImageImageData"
		}"
		end

end -- class GTKIMAGEIMAGEDATA_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

