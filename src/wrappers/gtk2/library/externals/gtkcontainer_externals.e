-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCONTAINER_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_container_add (a_container: POINTER; a_widget: POINTER) is
 		-- gtk_container_add
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_add"
		}"
		end

	gtk_container_add_with_properties (a_container: POINTER; a_widget: POINTER; a_first_prop_name: POINTER) is
 		-- gtk_container_add_with_properties (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_add_with_properties"
		}"
		end

	gtk_container_check_resize (a_container: POINTER) is
 		-- gtk_container_check_resize
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_check_resize"
		}"
		end

	-- `hidden' function _gtk_container_child_composite_name skipped.
	gtk_container_child_get (a_container: POINTER; a_child: POINTER; a_first_prop_name: POINTER) is
 		-- gtk_container_child_get (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_child_get"
		}"
		end

	gtk_container_child_get_property (a_container: POINTER; a_child: POINTER; a_property_name: POINTER; a_value: POINTER) is
 		-- gtk_container_child_get_property
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_child_get_property"
		}"
		end

	gtk_container_child_get_valist (a_container: POINTER; a_child: POINTER; a_first_property_name: POINTER; a_var_args: POINTER) is
 		-- gtk_container_child_get_valist
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_child_get_valist"
		}"
		end

	gtk_container_child_set (a_container: POINTER; a_child: POINTER; a_first_prop_name: POINTER) is
 		-- gtk_container_child_set (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_child_set"
		}"
		end

	gtk_container_child_set_property (a_container: POINTER; a_child: POINTER; a_property_name: POINTER; a_value: POINTER) is
 		-- gtk_container_child_set_property
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_child_set_property"
		}"
		end

	gtk_container_child_set_valist (a_container: POINTER; a_child: POINTER; a_first_property_name: POINTER; a_var_args: POINTER) is
 		-- gtk_container_child_set_valist
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_child_set_valist"
		}"
		end

	gtk_container_child_type (a_container: POINTER): like long_unsigned is
 		-- gtk_container_child_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_child_type"
		}"
		end

	gtk_container_class_find_child_property (a_cclass: POINTER; a_property_name: POINTER): POINTER is
 		-- gtk_container_class_find_child_property
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_class_find_child_property"
		}"
		end

	gtk_container_class_install_child_property (a_cclass: POINTER; a_property_id: NATURAL; a_pspec: POINTER) is
 		-- gtk_container_class_install_child_property
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_class_install_child_property"
		}"
		end

	gtk_container_class_list_child_properties (a_cclass: POINTER; a_n_properties: POINTER): POINTER is
 		-- gtk_container_class_list_child_properties
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_class_list_child_properties"
		}"
		end

	-- `hidden' function _gtk_container_clear_resize_widgets skipped.
	-- `hidden' function _gtk_container_dequeue_resize_handler skipped.
	-- `hidden' function _gtk_container_focus_sort skipped.
	gtk_container_forall (a_container: POINTER; a_callback: POINTER; a_callback_data: POINTER) is
 		-- gtk_container_forall
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_forall"
		}"
		end

	gtk_container_foreach (a_container: POINTER; a_callback: POINTER; a_callback_data: POINTER) is
 		-- gtk_container_foreach
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_foreach"
		}"
		end

	gtk_container_get_border_width (a_container: POINTER): NATURAL is
 		-- gtk_container_get_border_width
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_get_border_width"
		}"
		end

	gtk_container_get_children (a_container: POINTER): POINTER is
 		-- gtk_container_get_children
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_get_children"
		}"
		end

	gtk_container_get_focus_chain (a_container: POINTER; a_focusable_widgets: POINTER): INTEGER is
 		-- gtk_container_get_focus_chain
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_get_focus_chain"
		}"
		end

	gtk_container_get_focus_child (a_container: POINTER): POINTER is
 		-- gtk_container_get_focus_child
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_get_focus_child"
		}"
		end

	gtk_container_get_focus_hadjustment (a_container: POINTER): POINTER is
 		-- gtk_container_get_focus_hadjustment
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_get_focus_hadjustment"
		}"
		end

	gtk_container_get_focus_vadjustment (a_container: POINTER): POINTER is
 		-- gtk_container_get_focus_vadjustment
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_get_focus_vadjustment"
		}"
		end

	gtk_container_get_resize_mode (a_container: POINTER): INTEGER is
 		-- gtk_container_get_resize_mode
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_get_resize_mode"
		}"
		end

	gtk_container_get_type: like long_unsigned is
 		-- gtk_container_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_get_type()"
		}"
		end

	gtk_container_propagate_expose (a_container: POINTER; a_child: POINTER; an_event: POINTER) is
 		-- gtk_container_propagate_expose
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_propagate_expose"
		}"
		end

	-- `hidden' function _gtk_container_queue_resize skipped.
	gtk_container_remove (a_container: POINTER; a_widget: POINTER) is
 		-- gtk_container_remove
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_remove"
		}"
		end

	gtk_container_resize_children (a_container: POINTER) is
 		-- gtk_container_resize_children
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_resize_children"
		}"
		end

	gtk_container_set_border_width (a_container: POINTER; a_border_width: NATURAL) is
 		-- gtk_container_set_border_width
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_set_border_width"
		}"
		end

	gtk_container_set_focus_chain (a_container: POINTER; a_focusable_widgets: POINTER) is
 		-- gtk_container_set_focus_chain
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_set_focus_chain"
		}"
		end

	gtk_container_set_focus_child (a_container: POINTER; a_child: POINTER) is
 		-- gtk_container_set_focus_child
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_set_focus_child"
		}"
		end

	gtk_container_set_focus_hadjustment (a_container: POINTER; an_adjustment: POINTER) is
 		-- gtk_container_set_focus_hadjustment
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_set_focus_hadjustment"
		}"
		end

	gtk_container_set_focus_vadjustment (a_container: POINTER; an_adjustment: POINTER) is
 		-- gtk_container_set_focus_vadjustment
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_set_focus_vadjustment"
		}"
		end

	gtk_container_set_reallocate_redraws (a_container: POINTER; a_needs_redraws: INTEGER) is
 		-- gtk_container_set_reallocate_redraws
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_set_reallocate_redraws"
		}"
		end

	gtk_container_set_resize_mode (a_container: POINTER; a_resize_mode: INTEGER) is
 		-- gtk_container_set_resize_mode
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_set_resize_mode"
		}"
		end

	gtk_container_unset_focus_chain (a_container: POINTER) is
 		-- gtk_container_unset_focus_chain
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_container_unset_focus_chain"
		}"
		end


end -- class GTKCONTAINER_EXTERNALS
