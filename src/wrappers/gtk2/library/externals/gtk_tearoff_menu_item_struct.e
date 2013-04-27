-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_TEAROFF_MENU_ITEM_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_tearoff_menu_item_struct_set_torn_off (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for torn_off field of GTK_TEAROFF_MENU_ITEM_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tearoff_menu_item_struct_set_torn_off"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field menu_item.
	gtk_tearoff_menu_item_struct_get_torn_off (a_structure: POINTER): NATURAL is
			-- Query for torn_off field of GTK_TEAROFF_MENU_ITEM_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tearoff_menu_item_struct_get_torn_off"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkTearoffMenuItem"
		}"
		end

end -- class GTK_TEAROFF_MENU_ITEM_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

