-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCHECKBUTTON_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	-- `hidden' function _gtk_check_button_get_props skipped.
	gtk_check_button_get_type: like long_unsigned is
 		-- gtk_check_button_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_check_button_get_type()"
		}"
		end

	gtk_check_button_new: POINTER is
 		-- gtk_check_button_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_check_button_new()"
		}"
		end

	gtk_check_button_new_with_label (a_label: POINTER): POINTER is
 		-- gtk_check_button_new_with_label
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_check_button_new_with_label"
		}"
		end

	gtk_check_button_new_with_mnemonic (a_label: POINTER): POINTER is
 		-- gtk_check_button_new_with_mnemonic
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_check_button_new_with_mnemonic"
		}"
		end


end -- class GTKCHECKBUTTON_EXTERNALS
