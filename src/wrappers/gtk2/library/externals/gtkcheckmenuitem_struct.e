-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCHECKMENUITEM_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkcheckmenuitem_struct_set_active (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for active field of GTKCHECKMENUITEM_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcheckmenuitem_struct_set_active"
		}"
		end

	gtkcheckmenuitem_struct_set_always_show_toggle (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for always_show_toggle field of GTKCHECKMENUITEM_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcheckmenuitem_struct_set_always_show_toggle"
		}"
		end

	gtkcheckmenuitem_struct_set_inconsistent (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for inconsistent field of GTKCHECKMENUITEM_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcheckmenuitem_struct_set_inconsistent"
		}"
		end

	gtkcheckmenuitem_struct_set_draw_as_radio (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for draw_as_radio field of GTKCHECKMENUITEM_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcheckmenuitem_struct_set_draw_as_radio"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field menu_item.
	gtkcheckmenuitem_struct_get_active (a_structure: POINTER): NATURAL_32 is
			-- Query for active field of GTKCHECKMENUITEM_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcheckmenuitem_struct_get_active"
		}"
		end

	gtkcheckmenuitem_struct_get_always_show_toggle (a_structure: POINTER): NATURAL_32 is
			-- Query for always_show_toggle field of GTKCHECKMENUITEM_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcheckmenuitem_struct_get_always_show_toggle"
		}"
		end

	gtkcheckmenuitem_struct_get_inconsistent (a_structure: POINTER): NATURAL_32 is
			-- Query for inconsistent field of GTKCHECKMENUITEM_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcheckmenuitem_struct_get_inconsistent"
		}"
		end

	gtkcheckmenuitem_struct_get_draw_as_radio (a_structure: POINTER): NATURAL_32 is
			-- Query for draw_as_radio field of GTKCHECKMENUITEM_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcheckmenuitem_struct_get_draw_as_radio"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkCheckMenuItem"
		}"
		end

end -- class GTKCHECKMENUITEM_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

