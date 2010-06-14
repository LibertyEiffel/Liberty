-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKIMAGEMENUITEM_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_image_menu_item_new_with_label (a_label: POINTER): POINTER is
 		-- gtk_image_menu_item_new_with_label (node at line 8327)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_menu_item_new_with_label"
		}"
		end

	gtk_image_menu_item_get_image (an_image_menu_item: POINTER): POINTER is
 		-- gtk_image_menu_item_get_image (node at line 10874)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_menu_item_get_image"
		}"
		end

	gtk_image_menu_item_get_type: NATURAL_32 is
 		-- gtk_image_menu_item_get_type (node at line 10939)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_menu_item_get_type()"
		}"
		end

	gtk_image_menu_item_get_use_stock (an_image_menu_item: POINTER): INTEGER_32 is
 		-- gtk_image_menu_item_get_use_stock (node at line 12427)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_menu_item_get_use_stock"
		}"
		end

	gtk_image_menu_item_get_always_show_image (an_image_menu_item: POINTER): INTEGER_32 is
 		-- gtk_image_menu_item_get_always_show_image (node at line 14907)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_menu_item_get_always_show_image"
		}"
		end

	gtk_image_menu_item_set_use_stock (an_image_menu_item: POINTER; an_use_stock: INTEGER_32) is
 		-- gtk_image_menu_item_set_use_stock (node at line 16465)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_menu_item_set_use_stock"
		}"
		end

	gtk_image_menu_item_new_from_stock (a_stock_id: POINTER; an_accel_group: POINTER): POINTER is
 		-- gtk_image_menu_item_new_from_stock (node at line 16766)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_menu_item_new_from_stock"
		}"
		end

	gtk_image_menu_item_set_always_show_image (an_image_menu_item: POINTER; an_always_show: INTEGER_32) is
 		-- gtk_image_menu_item_set_always_show_image (node at line 19344)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_menu_item_set_always_show_image"
		}"
		end

	gtk_image_menu_item_set_image (an_image_menu_item: POINTER; an_image: POINTER) is
 		-- gtk_image_menu_item_set_image (node at line 19646)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_menu_item_set_image"
		}"
		end

	gtk_image_menu_item_new: POINTER is
 		-- gtk_image_menu_item_new (node at line 20047)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_menu_item_new()"
		}"
		end

	gtk_image_menu_item_new_with_mnemonic (a_label: POINTER): POINTER is
 		-- gtk_image_menu_item_new_with_mnemonic (node at line 36394)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_menu_item_new_with_mnemonic"
		}"
		end

	gtk_image_menu_item_set_accel_group (an_image_menu_item: POINTER; an_accel_group: POINTER) is
 		-- gtk_image_menu_item_set_accel_group (node at line 37373)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_menu_item_set_accel_group"
		}"
		end


end -- class GTKIMAGEMENUITEM_EXTERNALS
