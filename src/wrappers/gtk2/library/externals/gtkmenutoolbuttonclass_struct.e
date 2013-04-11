-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKMENUTOOLBUTTONCLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkmenutoolbuttonclass_struct_set_show_menu (a_structure: POINTER; a_value: POINTER) is
			-- Setter for show_menu field of GTKMENUTOOLBUTTONCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkmenutoolbuttonclass_struct_set_show_menu"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
	gtkmenutoolbuttonclass_struct_get_show_menu (a_structure: POINTER): POINTER is
			-- Query for show_menu field of GTKMENUTOOLBUTTONCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkmenutoolbuttonclass_struct_get_show_menu"
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
			feature_name: "sizeof__GtkMenuToolButtonClass"
		}"
		end

end -- class GTKMENUTOOLBUTTONCLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

