-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCONTAINER_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_container_get_focus_hadjustment (a_container: POINTER): POINTER is
 		-- gtk_container_get_focus_hadjustment (node at line 2319)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_get_focus_hadjustment"
		}"
		end

	gtk_container_child_type (a_container: POINTER): NATURAL_32 is
 		-- gtk_container_child_type (node at line 2874)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_child_type"
		}"
		end

	gtk_container_get_focus_vadjustment (a_container: POINTER): POINTER is
 		-- gtk_container_get_focus_vadjustment (node at line 3302)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_get_focus_vadjustment"
		}"
		end

	gtk_container_set_focus_chain (a_container: POINTER; a_focusable_widgets: POINTER) is
 		-- gtk_container_set_focus_chain (node at line 3439)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_set_focus_chain"
		}"
		end

	-- `hidden' function _gtk_container_focus_sort skipped.
	gtk_container_set_reallocate_redraws (a_container: POINTER; a_needs_redraws: INTEGER_32) is
 		-- gtk_container_set_reallocate_redraws (node at line 4046)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_set_reallocate_redraws"
		}"
		end

	gtk_container_get_type: NATURAL_32 is
 		-- gtk_container_get_type (node at line 5106)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_get_type()"
		}"
		end

	gtk_container_set_focus_hadjustment (a_container: POINTER; an_adjustment: POINTER) is
 		-- gtk_container_set_focus_hadjustment (node at line 7174)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_set_focus_hadjustment"
		}"
		end

	-- `hidden' function _gtk_container_dequeue_resize_handler skipped.
	gtk_container_get_resize_mode (a_container: POINTER): INTEGER is
 		-- gtk_container_get_resize_mode (node at line 7631)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_get_resize_mode"
		}"
		end

	gtk_container_set_focus_vadjustment (a_container: POINTER; an_adjustment: POINTER) is
 		-- gtk_container_set_focus_vadjustment (node at line 8072)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_set_focus_vadjustment"
		}"
		end

	gtk_container_remove (a_container: POINTER; a_widget: POINTER) is
 		-- gtk_container_remove (node at line 8665)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_remove"
		}"
		end

	gtk_container_class_find_child_property (a_cclass: POINTER; a_property_name: POINTER): POINTER is
 		-- gtk_container_class_find_child_property (node at line 8826)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_class_find_child_property"
		}"
		end

	gtk_container_get_border_width (a_container: POINTER): NATURAL_32 is
 		-- gtk_container_get_border_width (node at line 9088)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_get_border_width"
		}"
		end

	gtk_container_class_list_child_properties (a_cclass: POINTER; a_n_properties: POINTER): POINTER is
 		-- gtk_container_class_list_child_properties (node at line 13201)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_class_list_child_properties"
		}"
		end

	gtk_container_unset_focus_chain (a_container: POINTER) is
 		-- gtk_container_unset_focus_chain (node at line 13259)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_unset_focus_chain"
		}"
		end

	gtk_container_get_children (a_container: POINTER): POINTER is
 		-- gtk_container_get_children (node at line 13977)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_get_children"
		}"
		end

	-- `hidden' function _gtk_container_clear_resize_widgets skipped.
	gtk_container_child_get_valist (a_container: POINTER; a_child: POINTER; a_first_property_name: POINTER; a_var_args: POINTER) is
 		-- gtk_container_child_get_valist (node at line 16109)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_child_get_valist"
		}"
		end

	gtk_container_child_get_property (a_container: POINTER; a_child: POINTER; a_property_name: POINTER; a_value: POINTER) is
 		-- gtk_container_child_get_property (node at line 16202)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_child_get_property"
		}"
		end

	gtk_container_get_focus_chain (a_container: POINTER; a_focusable_widgets: POINTER): INTEGER_32 is
 		-- gtk_container_get_focus_chain (node at line 17012)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_get_focus_chain"
		}"
		end

	-- `hidden' function _gtk_container_queue_resize skipped.
	gtk_container_resize_children (a_container: POINTER) is
 		-- gtk_container_resize_children (node at line 18825)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_resize_children"
		}"
		end

	gtk_container_check_resize (a_container: POINTER) is
 		-- gtk_container_check_resize (node at line 20152)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_check_resize"
		}"
		end

	gtk_container_class_install_child_property (a_cclass: POINTER; a_property_id: NATURAL_32; a_pspec: POINTER) is
 		-- gtk_container_class_install_child_property (node at line 20367)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_class_install_child_property"
		}"
		end

	gtk_container_foreach (a_container: POINTER; a_callback: POINTER; a_callback_data: POINTER) is
 		-- gtk_container_foreach (node at line 21482)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_foreach"
		}"
		end

	gtk_container_set_focus_child (a_container: POINTER; a_child: POINTER) is
 		-- gtk_container_set_focus_child (node at line 24351)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_set_focus_child"
		}"
		end

	gtk_container_foreach_full (a_container: POINTER; a_callback: POINTER; a_marshal: POINTER; a_callback_data: POINTER; a_notify: POINTER) is
 		-- gtk_container_foreach_full (node at line 25022)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_foreach_full"
		}"
		end

	gtk_container_child_set (a_container: POINTER; a_child: POINTER; a_first_prop_name: POINTER) is
 		-- gtk_container_child_set (variadic call)  (node at line 28968)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_child_set"
		}"
		end

	gtk_container_add (a_container: POINTER; a_widget: POINTER) is
 		-- gtk_container_add (node at line 30192)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_add"
		}"
		end

	gtk_container_child_set_property (a_container: POINTER; a_child: POINTER; a_property_name: POINTER; a_value: POINTER) is
 		-- gtk_container_child_set_property (node at line 30234)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_child_set_property"
		}"
		end

	gtk_container_add_with_properties (a_container: POINTER; a_widget: POINTER; a_first_prop_name: POINTER) is
 		-- gtk_container_add_with_properties (variadic call)  (node at line 30818)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_add_with_properties"
		}"
		end

	gtk_container_propagate_expose (a_container: POINTER; a_child: POINTER; an_event: POINTER) is
 		-- gtk_container_propagate_expose (node at line 31777)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_propagate_expose"
		}"
		end

	gtk_container_set_resize_mode (a_container: POINTER; a_resize_mode: INTEGER) is
 		-- gtk_container_set_resize_mode (node at line 32234)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_set_resize_mode"
		}"
		end

	gtk_container_forall (a_container: POINTER; a_callback: POINTER; a_callback_data: POINTER) is
 		-- gtk_container_forall (node at line 33819)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_forall"
		}"
		end

	-- `hidden' function _gtk_container_child_composite_name skipped.
	gtk_container_child_get (a_container: POINTER; a_child: POINTER; a_first_prop_name: POINTER) is
 		-- gtk_container_child_get (variadic call)  (node at line 35092)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_child_get"
		}"
		end

	gtk_container_set_border_width (a_container: POINTER; a_border_width: NATURAL_32) is
 		-- gtk_container_set_border_width (node at line 35753)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_set_border_width"
		}"
		end

	gtk_container_get_focus_child (a_container: POINTER): POINTER is
 		-- gtk_container_get_focus_child (node at line 36751)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_get_focus_child"
		}"
		end

	gtk_container_child_set_valist (a_container: POINTER; a_child: POINTER; a_first_property_name: POINTER; a_var_args: POINTER) is
 		-- gtk_container_child_set_valist (node at line 37102)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_child_set_valist"
		}"
		end


end -- class GTKCONTAINER_EXTERNALS
