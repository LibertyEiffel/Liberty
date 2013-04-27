-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKRADIOMENUITEM_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkradiomenuitem_struct_set_group (a_structure: POINTER; a_value: POINTER) is
			-- Setter for group field of GTKRADIOMENUITEM_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkradiomenuitem_struct_set_group"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field check_menu_item.
	gtkradiomenuitem_struct_get_group (a_structure: POINTER): POINTER is
			-- Query for group field of GTKRADIOMENUITEM_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkradiomenuitem_struct_get_group"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkRadioMenuItem"
		}"
		end

end -- class GTKRADIOMENUITEM_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

