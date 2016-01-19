-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTESTUTILS_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_test_create_simple_window (a_window_title: POINTER; a_dialog_text: POINTER): POINTER is
 		-- gtk_test_create_simple_window
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_test_create_simple_window"
		}"
		end

	gtk_test_create_widget (a_widget_type: like long_unsigned; a_first_property_name: POINTER): POINTER is
 		-- gtk_test_create_widget (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_test_create_widget"
		}"
		end

	gtk_test_display_button_window (a_window_title: POINTER; a_dialog_text: POINTER): POINTER is
 		-- gtk_test_display_button_window (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_test_display_button_window"
		}"
		end

	gtk_test_find_label (a_widget: POINTER; a_label_pattern: POINTER): POINTER is
 		-- gtk_test_find_label
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_test_find_label"
		}"
		end

	gtk_test_find_sibling (a_base_widget: POINTER; a_widget_type: like long_unsigned): POINTER is
 		-- gtk_test_find_sibling
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_test_find_sibling"
		}"
		end

	gtk_test_find_widget (a_widget: POINTER; a_label_pattern: POINTER; a_widget_type: like long_unsigned): POINTER is
 		-- gtk_test_find_widget
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_test_find_widget"
		}"
		end

	gtk_test_init (an_argcp: POINTER; an_argvp: POINTER) is
 		-- gtk_test_init (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_test_init"
		}"
		end

	gtk_test_list_all_types (a_n_types: POINTER): POINTER is
 		-- gtk_test_list_all_types
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_test_list_all_types"
		}"
		end

	gtk_test_register_all_types is
 		-- gtk_test_register_all_types
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_test_register_all_types()"
		}"
		end

	gtk_test_slider_get_value (a_widget: POINTER): REAL is
 		-- gtk_test_slider_get_value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_test_slider_get_value"
		}"
		end

	gtk_test_slider_set_perc (a_widget: POINTER; a_percentage: REAL) is
 		-- gtk_test_slider_set_perc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_test_slider_set_perc"
		}"
		end

	gtk_test_spin_button_click (a_spinner: POINTER; a_button: NATURAL; an_upwards: INTEGER): INTEGER is
 		-- gtk_test_spin_button_click
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_test_spin_button_click"
		}"
		end

	gtk_test_text_get (a_widget: POINTER): POINTER is
 		-- gtk_test_text_get
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_test_text_get"
		}"
		end

	gtk_test_text_set (a_widget: POINTER; a_string: POINTER) is
 		-- gtk_test_text_set
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_test_text_set"
		}"
		end

	gtk_test_widget_click (a_widget: POINTER; a_button: NATURAL; a_modifiers: INTEGER): INTEGER is
 		-- gtk_test_widget_click
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_test_widget_click"
		}"
		end

	gtk_test_widget_send_key (a_widget: POINTER; a_keyval: NATURAL; a_modifiers: INTEGER): INTEGER is
 		-- gtk_test_widget_send_key
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_test_widget_send_key"
		}"
		end


end -- class GTKTESTUTILS_EXTERNALS
