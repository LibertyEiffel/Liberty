-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_OPTION_MENU_STRUCT

inherit ANY undefine is_equal, copy end

insert GTK_TYPES
feature {} -- Low-level setters

	gtk_option_menu_struct_set_menu (a_structure: POINTER; a_value: POINTER) is
			-- Setter for menu field of GTK_OPTION_MENU_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_option_menu_struct_set_menu"
		}"
		end

	gtk_option_menu_struct_set_menu_item (a_structure: POINTER; a_value: POINTER) is
			-- Setter for menu_item field of GTK_OPTION_MENU_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_option_menu_struct_set_menu_item"
		}"
		end

	gtk_option_menu_struct_set_width (a_structure: POINTER; a_value: NATURAL_16) is
			-- Setter for width field of GTK_OPTION_MENU_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_option_menu_struct_set_width"
		}"
		end

	gtk_option_menu_struct_set_height (a_structure: POINTER; a_value: NATURAL_16) is
			-- Setter for height field of GTK_OPTION_MENU_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_option_menu_struct_set_height"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field button.
	gtk_option_menu_struct_get_menu (a_structure: POINTER): POINTER is
			-- Query for menu field of GTK_OPTION_MENU_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_option_menu_struct_get_menu"
		}"
		end

	gtk_option_menu_struct_get_menu_item (a_structure: POINTER): POINTER is
			-- Query for menu_item field of GTK_OPTION_MENU_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_option_menu_struct_get_menu_item"
		}"
		end

	gtk_option_menu_struct_get_width (a_structure: POINTER): NATURAL_16 is
			-- Query for width field of GTK_OPTION_MENU_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_option_menu_struct_get_width"
		}"
		end

	gtk_option_menu_struct_get_height (a_structure: POINTER): NATURAL_16 is
			-- Query for height field of GTK_OPTION_MENU_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_option_menu_struct_get_height"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkOptionMenu"
		}"
		end

end -- class GTK_OPTION_MENU_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

