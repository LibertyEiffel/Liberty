-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_STOCK_ITEM_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_stock_item_struct_set_stock_id (a_structure: POINTER; a_value: POINTER) is
			-- Setter for stock_id field of GTK_STOCK_ITEM_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_stock_item_struct_set_stock_id"
		}"
		end

	gtk_stock_item_struct_set_label (a_structure: POINTER; a_value: POINTER) is
			-- Setter for label field of GTK_STOCK_ITEM_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_stock_item_struct_set_label"
		}"
		end

	gtk_stock_item_struct_set_modifier (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for modifier field of GTK_STOCK_ITEM_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_stock_item_struct_set_modifier"
		}"
		end

	gtk_stock_item_struct_set_keyval (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for keyval field of GTK_STOCK_ITEM_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_stock_item_struct_set_keyval"
		}"
		end

	gtk_stock_item_struct_set_translation_domain (a_structure: POINTER; a_value: POINTER) is
			-- Setter for translation_domain field of GTK_STOCK_ITEM_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_stock_item_struct_set_translation_domain"
		}"
		end

feature {} -- Low-level queries

	gtk_stock_item_struct_get_stock_id (a_structure: POINTER): POINTER is
			-- Query for stock_id field of GTK_STOCK_ITEM_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_stock_item_struct_get_stock_id"
		}"
		end

	gtk_stock_item_struct_get_label (a_structure: POINTER): POINTER is
			-- Query for label field of GTK_STOCK_ITEM_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_stock_item_struct_get_label"
		}"
		end

	gtk_stock_item_struct_get_modifier (a_structure: POINTER): INTEGER is
			-- Query for modifier field of GTK_STOCK_ITEM_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_stock_item_struct_get_modifier"
		}"
		end

	gtk_stock_item_struct_get_keyval (a_structure: POINTER): NATURAL is
			-- Query for keyval field of GTK_STOCK_ITEM_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_stock_item_struct_get_keyval"
		}"
		end

	gtk_stock_item_struct_get_translation_domain (a_structure: POINTER): POINTER is
			-- Query for translation_domain field of GTK_STOCK_ITEM_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_stock_item_struct_get_translation_domain"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkStockItem"
		}"
		end

end -- class GTK_STOCK_ITEM_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

