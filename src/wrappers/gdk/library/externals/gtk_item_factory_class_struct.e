-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_ITEM_FACTORY_CLASS_STRUCT

inherit ANY undefine is_equal, copy end

insert GTK_TYPES
feature {} -- Low-level setters

	gtk_item_factory_class_struct_set_item_ht (a_structure: POINTER; a_value: POINTER) is
			-- Setter for item_ht field of GTK_ITEM_FACTORY_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_item_factory_class_struct_set_item_ht"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field object_class.
	gtk_item_factory_class_struct_get_item_ht (a_structure: POINTER): POINTER is
			-- Query for item_ht field of GTK_ITEM_FACTORY_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_item_factory_class_struct_get_item_ht"
		}"
		end

	-- Unwrappable field _gtk_reserved1.
	-- Unwrappable field _gtk_reserved2.
	-- Unwrappable field _gtk_reserved3.
	-- Unwrappable field _gtk_reserved4.
feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkItemFactoryClass"
		}"
		end

end -- class GTK_ITEM_FACTORY_CLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

