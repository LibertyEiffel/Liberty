-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTESTUTILS_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_test_slider_get_value (a_widget: POINTER): REAL_64 is
 		-- gtk_test_slider_get_value (node at line 1470)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_test_slider_get_value"
		}"
		end

	gtk_test_register_all_types is
 		-- gtk_test_register_all_types (node at line 2719)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_test_register_all_types()"
		}"
		end

	gtk_test_init (an_argcp: POINTER; an_argvp: POINTER) is
 		-- gtk_test_init (variadic call)  (node at line 4486)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_test_init"
		}"
		end

	gtk_test_display_button_window (a_window_title: POINTER; a_dialog_text: POINTER): POINTER is
 		-- gtk_test_display_button_window (variadic call)  (node at line 7169)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_test_display_button_window"
		}"
		end

	gtk_test_list_all_types (a_n_types: POINTER): POINTER is
 		-- gtk_test_list_all_types (node at line 15871)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_test_list_all_types"
		}"
		end

	gtk_test_widget_send_key (a_widget: POINTER; a_keyval: NATURAL_32; a_modifiers: INTEGER): INTEGER_32 is
 		-- gtk_test_widget_send_key (node at line 16614)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_test_widget_send_key"
		}"
		end

	gtk_test_widget_click (a_widget: POINTER; a_button: NATURAL_32; a_modifiers: INTEGER): INTEGER_32 is
 		-- gtk_test_widget_click (node at line 20404)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_test_widget_click"
		}"
		end

	gtk_test_create_widget (a_widget_type: NATURAL_32; a_first_property_name: POINTER): POINTER is
 		-- gtk_test_create_widget (variadic call)  (node at line 25579)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_test_create_widget"
		}"
		end

	gtk_test_create_simple_window (a_window_title: POINTER; a_dialog_text: POINTER): POINTER is
 		-- gtk_test_create_simple_window (node at line 27533)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_test_create_simple_window"
		}"
		end

	gtk_test_find_widget (a_widget: POINTER; a_label_pattern: POINTER; a_widget_type: NATURAL_32): POINTER is
 		-- gtk_test_find_widget (node at line 30131)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_test_find_widget"
		}"
		end

	gtk_test_text_set (a_widget: POINTER; a_string: POINTER) is
 		-- gtk_test_text_set (node at line 30392)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_test_text_set"
		}"
		end

	gtk_test_slider_set_perc (a_widget: POINTER; a_percentage: REAL_64) is
 		-- gtk_test_slider_set_perc (node at line 30471)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_test_slider_set_perc"
		}"
		end

	gtk_test_find_label (a_widget: POINTER; a_label_pattern: POINTER): POINTER is
 		-- gtk_test_find_label (node at line 31532)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_test_find_label"
		}"
		end

	gtk_test_spin_button_click (a_spinner: POINTER; a_button: NATURAL_32; an_upwards: INTEGER_32): INTEGER_32 is
 		-- gtk_test_spin_button_click (node at line 31631)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_test_spin_button_click"
		}"
		end

	gtk_test_text_get (a_widget: POINTER): POINTER is
 		-- gtk_test_text_get (node at line 36500)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_test_text_get"
		}"
		end

	gtk_test_find_sibling (a_base_widget: POINTER; a_widget_type: NATURAL_32): POINTER is
 		-- gtk_test_find_sibling (node at line 36859)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_test_find_sibling"
		}"
		end


end -- class GTKTESTUTILS_EXTERNALS
