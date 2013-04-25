-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKFONTBUTTONCLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkfontbuttonclass_struct_set_font_set (a_structure: POINTER; a_value: POINTER) is
			-- Setter for font_set field of GTKFONTBUTTONCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkfontbuttonclass_struct_set_font_set"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
	gtkfontbuttonclass_struct_get_font_set (a_structure: POINTER): POINTER is
			-- Query for font_set field of GTKFONTBUTTONCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkfontbuttonclass_struct_get_font_set"
		}"
		end

	-- Unwrappable field _gtk_reserved1.
	-- Unwrappable field _gtk_reserved2.
	-- Unwrappable field _gtk_reserved3.
	-- Unwrappable field _gtk_reserved4.
feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkFontButtonClass"
		}"
		end

end -- class GTKFONTBUTTONCLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

