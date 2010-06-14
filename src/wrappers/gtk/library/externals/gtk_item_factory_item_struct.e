-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_ITEM_FACTORY_ITEM_STRUCT

inherit ANY undefine is_equal, copy end

insert GTK_TYPES
feature {} -- Low-level setters

	gtk_item_factory_item_struct_set_path (a_structure: POINTER; a_value: POINTER) is
			-- Setter for path field of GTK_ITEM_FACTORY_ITEM_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_item_factory_item_struct_set_path"
		}"
		end

	gtk_item_factory_item_struct_set_widgets (a_structure: POINTER; a_value: POINTER) is
			-- Setter for widgets field of GTK_ITEM_FACTORY_ITEM_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_item_factory_item_struct_set_widgets"
		}"
		end

feature {} -- Low-level queries

	gtk_item_factory_item_struct_get_path (a_structure: POINTER): POINTER is
			-- Query for path field of GTK_ITEM_FACTORY_ITEM_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_item_factory_item_struct_get_path"
		}"
		end

	gtk_item_factory_item_struct_get_widgets (a_structure: POINTER): POINTER is
			-- Query for widgets field of GTK_ITEM_FACTORY_ITEM_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_item_factory_item_struct_get_widgets"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkItemFactoryItem"
		}"
		end

end -- class GTK_ITEM_FACTORY_ITEM_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

