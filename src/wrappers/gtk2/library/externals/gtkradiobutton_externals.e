-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKRADIOBUTTON_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_radio_button_new_with_mnemonic_from_widget (a_radio_group_member: POINTER; a_label: POINTER): POINTER is
 		-- gtk_radio_button_new_with_mnemonic_from_widget (node at line 4722)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_radio_button_new_with_mnemonic_from_widget"
		}"
		end

	gtk_radio_button_new_from_widget (a_radio_group_member: POINTER): POINTER is
 		-- gtk_radio_button_new_from_widget (node at line 14620)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_radio_button_new_from_widget"
		}"
		end

	gtk_radio_button_new (a_group: POINTER): POINTER is
 		-- gtk_radio_button_new (node at line 16748)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_radio_button_new"
		}"
		end

	gtk_radio_button_get_group (a_radio_button: POINTER): POINTER is
 		-- gtk_radio_button_get_group (node at line 23136)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_radio_button_get_group"
		}"
		end

	gtk_radio_button_get_type: NATURAL_64 is
 		-- gtk_radio_button_get_type (node at line 25534)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_radio_button_get_type()"
		}"
		end

	gtk_radio_button_new_with_label (a_group: POINTER; a_label: POINTER): POINTER is
 		-- gtk_radio_button_new_with_label (node at line 31490)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_radio_button_new_with_label"
		}"
		end

	gtk_radio_button_new_with_label_from_widget (a_radio_group_member: POINTER; a_label: POINTER): POINTER is
 		-- gtk_radio_button_new_with_label_from_widget (node at line 32124)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_radio_button_new_with_label_from_widget"
		}"
		end

	gtk_radio_button_set_group (a_radio_button: POINTER; a_group: POINTER) is
 		-- gtk_radio_button_set_group (node at line 32927)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_radio_button_set_group"
		}"
		end

	gtk_radio_button_new_with_mnemonic (a_group: POINTER; a_label: POINTER): POINTER is
 		-- gtk_radio_button_new_with_mnemonic (node at line 34037)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_radio_button_new_with_mnemonic"
		}"
		end


end -- class GTKRADIOBUTTON_EXTERNALS
