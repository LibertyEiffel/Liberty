-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKITEMFACTORY_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_item_factory_popup (an_ifactory: POINTER; a_x: NATURAL_32; a_y: NATURAL_32; a_mouse_button: NATURAL_32; a_time: NATURAL_32) is
 		-- gtk_item_factory_popup (node at line 431)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_item_factory_popup"
		}"
		end

	gtk_item_factory_from_widget (a_widget: POINTER): POINTER is
 		-- gtk_item_factory_from_widget (node at line 650)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_item_factory_from_widget"
		}"
		end

	gtk_item_factory_set_translate_func (an_ifactory: POINTER; a_func: POINTER; a_data: POINTER; a_notify: POINTER) is
 		-- gtk_item_factory_set_translate_func (node at line 5182)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_item_factory_set_translate_func"
		}"
		end

	gtk_item_factory_get_widget (an_ifactory: POINTER; a_path: POINTER): POINTER is
 		-- gtk_item_factory_get_widget (node at line 6218)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_item_factory_get_widget"
		}"
		end

	gtk_item_factory_create_items_ac (an_ifactory: POINTER; a_n_entries: NATURAL_32; an_entries: POINTER; a_callback_data: POINTER; a_callback_type: NATURAL_32) is
 		-- gtk_item_factory_create_items_ac (node at line 11777)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_item_factory_create_items_ac"
		}"
		end

	gtk_item_factory_popup_data (an_ifactory: POINTER): POINTER is
 		-- gtk_item_factory_popup_data (node at line 13642)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_item_factory_popup_data"
		}"
		end

	gtk_item_factory_from_path (a_path: POINTER): POINTER is
 		-- gtk_item_factory_from_path (node at line 16322)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_item_factory_from_path"
		}"
		end

	gtk_item_factory_create_item (an_ifactory: POINTER; an_entry: POINTER; a_callback_data: POINTER; a_callback_type: NATURAL_32) is
 		-- gtk_item_factory_create_item (node at line 16700)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_item_factory_create_item"
		}"
		end

	gtk_item_factory_delete_item (an_ifactory: POINTER; a_path: POINTER) is
 		-- gtk_item_factory_delete_item (node at line 18359)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_item_factory_delete_item"
		}"
		end

	gtk_item_factory_get_item_by_action (an_ifactory: POINTER; an_action: NATURAL_32): POINTER is
 		-- gtk_item_factory_get_item_by_action (node at line 21427)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_item_factory_get_item_by_action"
		}"
		end

	gtk_item_factory_delete_entries (an_ifactory: POINTER; a_n_entries: NATURAL_32; an_entries: POINTER) is
 		-- gtk_item_factory_delete_entries (node at line 22299)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_item_factory_delete_entries"
		}"
		end

	gtk_item_factory_delete_entry (an_ifactory: POINTER; an_entry: POINTER) is
 		-- gtk_item_factory_delete_entry (node at line 23712)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_item_factory_delete_entry"
		}"
		end

	gtk_item_factory_get_item (an_ifactory: POINTER; a_path: POINTER): POINTER is
 		-- gtk_item_factory_get_item (node at line 25089)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_item_factory_get_item"
		}"
		end

	gtk_item_factory_get_type: NATURAL_32 is
 		-- gtk_item_factory_get_type (node at line 26855)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_item_factory_get_type()"
		}"
		end

	gtk_item_factories_path_delete (an_ifactory_path: POINTER; a_path: POINTER) is
 		-- gtk_item_factories_path_delete (node at line 27541)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_item_factories_path_delete"
		}"
		end

	gtk_item_factory_popup_data_from_widget (a_widget: POINTER): POINTER is
 		-- gtk_item_factory_popup_data_from_widget (node at line 27619)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_item_factory_popup_data_from_widget"
		}"
		end

	gtk_item_factory_create_items (an_ifactory: POINTER; a_n_entries: NATURAL_32; an_entries: POINTER; a_callback_data: POINTER) is
 		-- gtk_item_factory_create_items (node at line 29166)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_item_factory_create_items"
		}"
		end

	gtk_item_factory_add_foreign (an_accel_widget: POINTER; a_full_path: POINTER; an_accel_group: POINTER; a_keyval: NATURAL_32; a_modifiers: INTEGER) is
 		-- gtk_item_factory_add_foreign (node at line 30294)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_item_factory_add_foreign"
		}"
		end

	gtk_item_factory_new (a_container_type: NATURAL_32; a_path: POINTER; an_accel_group: POINTER): POINTER is
 		-- gtk_item_factory_new (node at line 32103)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_item_factory_new"
		}"
		end

	gtk_item_factory_create_menu_entries (a_n_entries: NATURAL_32; an_entries: POINTER) is
 		-- gtk_item_factory_create_menu_entries (node at line 33402)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_item_factory_create_menu_entries"
		}"
		end

	gtk_item_factory_construct (an_ifactory: POINTER; a_container_type: NATURAL_32; a_path: POINTER; an_accel_group: POINTER) is
 		-- gtk_item_factory_construct (node at line 33746)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_item_factory_construct"
		}"
		end

	gtk_item_factory_popup_with_data (an_ifactory: POINTER; a_popup_data: POINTER; a_destroy: POINTER; a_x: NATURAL_32; a_y: NATURAL_32; a_mouse_button: NATURAL_32; a_time: NATURAL_32) is
 		-- gtk_item_factory_popup_with_data (node at line 35380)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_item_factory_popup_with_data"
		}"
		end

	gtk_item_factory_path_from_widget (a_widget: POINTER): POINTER is
 		-- gtk_item_factory_path_from_widget (node at line 35403)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_item_factory_path_from_widget"
		}"
		end

	gtk_item_factory_get_widget_by_action (an_ifactory: POINTER; an_action: NATURAL_32): POINTER is
 		-- gtk_item_factory_get_widget_by_action (node at line 36964)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_item_factory_get_widget_by_action"
		}"
		end


end -- class GTKITEMFACTORY_EXTERNALS
