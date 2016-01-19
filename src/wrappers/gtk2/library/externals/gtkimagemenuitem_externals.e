-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKIMAGEMENUITEM_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_image_menu_item_get_always_show_image (an_image_menu_item: POINTER): INTEGER is
 		-- gtk_image_menu_item_get_always_show_image
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_menu_item_get_always_show_image"
		}"
		end

	gtk_image_menu_item_get_image (an_image_menu_item: POINTER): POINTER is
 		-- gtk_image_menu_item_get_image
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_menu_item_get_image"
		}"
		end

	gtk_image_menu_item_get_type: like long_unsigned is
 		-- gtk_image_menu_item_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_menu_item_get_type()"
		}"
		end

	gtk_image_menu_item_get_use_stock (an_image_menu_item: POINTER): INTEGER is
 		-- gtk_image_menu_item_get_use_stock
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_menu_item_get_use_stock"
		}"
		end

	gtk_image_menu_item_new: POINTER is
 		-- gtk_image_menu_item_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_menu_item_new()"
		}"
		end

	gtk_image_menu_item_new_from_stock (a_stock_id: POINTER; an_accel_group: POINTER): POINTER is
 		-- gtk_image_menu_item_new_from_stock
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_menu_item_new_from_stock"
		}"
		end

	gtk_image_menu_item_new_with_label (a_label: POINTER): POINTER is
 		-- gtk_image_menu_item_new_with_label
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_menu_item_new_with_label"
		}"
		end

	gtk_image_menu_item_new_with_mnemonic (a_label: POINTER): POINTER is
 		-- gtk_image_menu_item_new_with_mnemonic
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_menu_item_new_with_mnemonic"
		}"
		end

	gtk_image_menu_item_set_accel_group (an_image_menu_item: POINTER; an_accel_group: POINTER) is
 		-- gtk_image_menu_item_set_accel_group
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_menu_item_set_accel_group"
		}"
		end

	gtk_image_menu_item_set_always_show_image (an_image_menu_item: POINTER; an_always_show: INTEGER) is
 		-- gtk_image_menu_item_set_always_show_image
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_menu_item_set_always_show_image"
		}"
		end

	gtk_image_menu_item_set_image (an_image_menu_item: POINTER; an_image: POINTER) is
 		-- gtk_image_menu_item_set_image
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_menu_item_set_image"
		}"
		end

	gtk_image_menu_item_set_use_stock (an_image_menu_item: POINTER; an_use_stock: INTEGER) is
 		-- gtk_image_menu_item_set_use_stock
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_menu_item_set_use_stock"
		}"
		end


end -- class GTKIMAGEMENUITEM_EXTERNALS
