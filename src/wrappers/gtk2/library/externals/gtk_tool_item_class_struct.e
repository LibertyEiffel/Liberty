-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_TOOL_ITEM_CLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_tool_item_class_struct_set_create_menu_proxy (a_structure: POINTER; a_value: POINTER) is
			-- Setter for create_menu_proxy field of GTK_TOOL_ITEM_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_class_struct_set_create_menu_proxy"
		}"
		end

	gtk_tool_item_class_struct_set_toolbar_reconfigured (a_structure: POINTER; a_value: POINTER) is
			-- Setter for toolbar_reconfigured field of GTK_TOOL_ITEM_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_class_struct_set_toolbar_reconfigured"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
	gtk_tool_item_class_struct_get_create_menu_proxy (a_structure: POINTER): POINTER is
			-- Query for create_menu_proxy field of GTK_TOOL_ITEM_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_class_struct_get_create_menu_proxy"
		}"
		end

	gtk_tool_item_class_struct_get_toolbar_reconfigured (a_structure: POINTER): POINTER is
			-- Query for toolbar_reconfigured field of GTK_TOOL_ITEM_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_class_struct_get_toolbar_reconfigured"
		}"
		end

	-- Unwrappable field _set_tooltip.
	-- Unwrappable field _gtk_reserved1.
	-- Unwrappable field _gtk_reserved2.
	-- Unwrappable field _gtk_reserved3.
	-- Unwrappable field _gtk_reserved4.
feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkToolItemClass"
		}"
		end

end -- class GTK_TOOL_ITEM_CLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

