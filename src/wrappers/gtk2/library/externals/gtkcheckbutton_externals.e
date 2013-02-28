-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCHECKBUTTON_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_check_button_new_with_label (a_label: POINTER): POINTER is
 		-- gtk_check_button_new_with_label (node at line 5616)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_check_button_new_with_label"
		}"
		end

	gtk_check_button_new_with_mnemonic (a_label: POINTER): POINTER is
 		-- gtk_check_button_new_with_mnemonic (node at line 7128)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_check_button_new_with_mnemonic"
		}"
		end

	gtk_check_button_new: POINTER is
 		-- gtk_check_button_new (node at line 13179)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_check_button_new()"
		}"
		end

	-- `hidden' function _gtk_check_button_get_props skipped.
	gtk_check_button_get_type: NATURAL_64 is
 		-- gtk_check_button_get_type (node at line 29154)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_check_button_get_type()"
		}"
		end


end -- class GTKCHECKBUTTON_EXTERNALS
