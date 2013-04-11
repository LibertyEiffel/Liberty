-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTEAROFFMENUITEM_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtktearoffmenuitem_struct_set_torn_off (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for torn_off field of GTKTEAROFFMENUITEM_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktearoffmenuitem_struct_set_torn_off"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field menu_item.
	gtktearoffmenuitem_struct_get_torn_off (a_structure: POINTER): NATURAL_32 is
			-- Query for torn_off field of GTKTEAROFFMENUITEM_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktearoffmenuitem_struct_get_torn_off"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkTearoffMenuItem"
		}"
		end

end -- class GTKTEAROFFMENUITEM_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

