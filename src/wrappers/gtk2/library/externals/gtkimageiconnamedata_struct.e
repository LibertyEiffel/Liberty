-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKIMAGEICONNAMEDATA_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkimageiconnamedata_struct_set_icon_name (a_structure: POINTER; a_value: POINTER) is
			-- Setter for icon_name field of GTKIMAGEICONNAMEDATA_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimageiconnamedata_struct_set_icon_name"
		}"
		end

	gtkimageiconnamedata_struct_set_pixbuf (a_structure: POINTER; a_value: POINTER) is
			-- Setter for pixbuf field of GTKIMAGEICONNAMEDATA_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimageiconnamedata_struct_set_pixbuf"
		}"
		end

	gtkimageiconnamedata_struct_set_theme_change_id (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for theme_change_id field of GTKIMAGEICONNAMEDATA_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimageiconnamedata_struct_set_theme_change_id"
		}"
		end

feature {} -- Low-level queries

	gtkimageiconnamedata_struct_get_icon_name (a_structure: POINTER): POINTER is
			-- Query for icon_name field of GTKIMAGEICONNAMEDATA_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimageiconnamedata_struct_get_icon_name"
		}"
		end

	gtkimageiconnamedata_struct_get_pixbuf (a_structure: POINTER): POINTER is
			-- Query for pixbuf field of GTKIMAGEICONNAMEDATA_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimageiconnamedata_struct_get_pixbuf"
		}"
		end

	gtkimageiconnamedata_struct_get_theme_change_id (a_structure: POINTER): NATURAL_32 is
			-- Query for theme_change_id field of GTKIMAGEICONNAMEDATA_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimageiconnamedata_struct_get_theme_change_id"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkImageIconNameData"
		}"
		end

end -- class GTKIMAGEICONNAMEDATA_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

