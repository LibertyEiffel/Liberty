-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKRADIOBUTTON_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_radio_button_get_group (a_radio_button: POINTER): POINTER is
 		-- gtk_radio_button_get_group
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_radio_button_get_group"
		}"
		end

	gtk_radio_button_get_type: like long_unsigned is
 		-- gtk_radio_button_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_radio_button_get_type()"
		}"
		end

	gtk_radio_button_new (a_group: POINTER): POINTER is
 		-- gtk_radio_button_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_radio_button_new"
		}"
		end

	gtk_radio_button_new_from_widget (a_radio_group_member: POINTER): POINTER is
 		-- gtk_radio_button_new_from_widget
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_radio_button_new_from_widget"
		}"
		end

	gtk_radio_button_new_with_label (a_group: POINTER; a_label: POINTER): POINTER is
 		-- gtk_radio_button_new_with_label
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_radio_button_new_with_label"
		}"
		end

	gtk_radio_button_new_with_label_from_widget (a_radio_group_member: POINTER; a_label: POINTER): POINTER is
 		-- gtk_radio_button_new_with_label_from_widget
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_radio_button_new_with_label_from_widget"
		}"
		end

	gtk_radio_button_new_with_mnemonic (a_group: POINTER; a_label: POINTER): POINTER is
 		-- gtk_radio_button_new_with_mnemonic
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_radio_button_new_with_mnemonic"
		}"
		end

	gtk_radio_button_new_with_mnemonic_from_widget (a_radio_group_member: POINTER; a_label: POINTER): POINTER is
 		-- gtk_radio_button_new_with_mnemonic_from_widget
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_radio_button_new_with_mnemonic_from_widget"
		}"
		end

	gtk_radio_button_set_group (a_radio_button: POINTER; a_group: POINTER) is
 		-- gtk_radio_button_set_group
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_radio_button_set_group"
		}"
		end


end -- class GTKRADIOBUTTON_EXTERNALS
