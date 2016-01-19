-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKIMAGEMENUITEM_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkimagemenuitem_struct_set_image (a_structure: POINTER; a_value: POINTER) is
			-- Setter for image field of GTKIMAGEMENUITEM_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimagemenuitem_struct_set_image"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field menu_item.
	gtkimagemenuitem_struct_get_image (a_structure: POINTER): POINTER is
			-- Query for image field of GTKIMAGEMENUITEM_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimagemenuitem_struct_get_image"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkImageMenuItem"
		}"
		end

end -- class GTKIMAGEMENUITEM_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

