-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_ACTION_CLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_action_class_struct_set_activate (a_structure: POINTER; a_value: POINTER) is
			-- Setter for activate field of GTK_ACTION_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_class_struct_set_activate"
		}"
		end

	gtk_action_class_struct_set_menu_item_type (a_structure: POINTER; a_value: like long_unsigned) is
			-- Setter for menu_item_type field of GTK_ACTION_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_class_struct_set_menu_item_type"
		}"
		end

	gtk_action_class_struct_set_toolbar_item_type (a_structure: POINTER; a_value: like long_unsigned) is
			-- Setter for toolbar_item_type field of GTK_ACTION_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_class_struct_set_toolbar_item_type"
		}"
		end

	gtk_action_class_struct_set_create_menu_item (a_structure: POINTER; a_value: POINTER) is
			-- Setter for create_menu_item field of GTK_ACTION_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_class_struct_set_create_menu_item"
		}"
		end

	gtk_action_class_struct_set_create_tool_item (a_structure: POINTER; a_value: POINTER) is
			-- Setter for create_tool_item field of GTK_ACTION_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_class_struct_set_create_tool_item"
		}"
		end

	gtk_action_class_struct_set_connect_proxy (a_structure: POINTER; a_value: POINTER) is
			-- Setter for connect_proxy field of GTK_ACTION_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_class_struct_set_connect_proxy"
		}"
		end

	gtk_action_class_struct_set_disconnect_proxy (a_structure: POINTER; a_value: POINTER) is
			-- Setter for disconnect_proxy field of GTK_ACTION_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_class_struct_set_disconnect_proxy"
		}"
		end

	gtk_action_class_struct_set_create_menu (a_structure: POINTER; a_value: POINTER) is
			-- Setter for create_menu field of GTK_ACTION_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_class_struct_set_create_menu"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
	gtk_action_class_struct_get_activate (a_structure: POINTER): POINTER is
			-- Query for activate field of GTK_ACTION_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_class_struct_get_activate"
		}"
		end

	gtk_action_class_struct_get_menu_item_type (a_structure: POINTER): like long_unsigned is
			-- Query for menu_item_type field of GTK_ACTION_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_class_struct_get_menu_item_type"
		}"
		end

	gtk_action_class_struct_get_toolbar_item_type (a_structure: POINTER): like long_unsigned is
			-- Query for toolbar_item_type field of GTK_ACTION_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_class_struct_get_toolbar_item_type"
		}"
		end

	gtk_action_class_struct_get_create_menu_item (a_structure: POINTER): POINTER is
			-- Query for create_menu_item field of GTK_ACTION_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_class_struct_get_create_menu_item"
		}"
		end

	gtk_action_class_struct_get_create_tool_item (a_structure: POINTER): POINTER is
			-- Query for create_tool_item field of GTK_ACTION_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_class_struct_get_create_tool_item"
		}"
		end

	gtk_action_class_struct_get_connect_proxy (a_structure: POINTER): POINTER is
			-- Query for connect_proxy field of GTK_ACTION_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_class_struct_get_connect_proxy"
		}"
		end

	gtk_action_class_struct_get_disconnect_proxy (a_structure: POINTER): POINTER is
			-- Query for disconnect_proxy field of GTK_ACTION_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_class_struct_get_disconnect_proxy"
		}"
		end

	gtk_action_class_struct_get_create_menu (a_structure: POINTER): POINTER is
			-- Query for create_menu field of GTK_ACTION_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_class_struct_get_create_menu"
		}"
		end

	-- Unwrappable field _gtk_reserved2.
	-- Unwrappable field _gtk_reserved3.
	-- Unwrappable field _gtk_reserved4.
feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkActionClass"
		}"
		end

end -- class GTK_ACTION_CLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

