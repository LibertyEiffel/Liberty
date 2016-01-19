-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKBUTTON_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_button_clicked (a_button: POINTER) is
 		-- gtk_button_clicked
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_clicked"
		}"
		end

	gtk_button_get_alignment (a_button: POINTER; a_xalign: POINTER; a_yalign: POINTER) is
 		-- gtk_button_get_alignment
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_get_alignment"
		}"
		end

	gtk_button_get_event_window (a_button: POINTER): POINTER is
 		-- gtk_button_get_event_window
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_get_event_window"
		}"
		end

	gtk_button_get_focus_on_click (a_button: POINTER): INTEGER is
 		-- gtk_button_get_focus_on_click
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_get_focus_on_click"
		}"
		end

	gtk_button_get_image (a_button: POINTER): POINTER is
 		-- gtk_button_get_image
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_get_image"
		}"
		end

	gtk_button_get_image_position (a_button: POINTER): INTEGER is
 		-- gtk_button_get_image_position
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_get_image_position"
		}"
		end

	gtk_button_get_label (a_button: POINTER): POINTER is
 		-- gtk_button_get_label
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_get_label"
		}"
		end

	gtk_button_get_relief (a_button: POINTER): INTEGER is
 		-- gtk_button_get_relief
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_get_relief"
		}"
		end

	gtk_button_get_type: like long_unsigned is
 		-- gtk_button_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_get_type()"
		}"
		end

	gtk_button_get_use_stock (a_button: POINTER): INTEGER is
 		-- gtk_button_get_use_stock
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_get_use_stock"
		}"
		end

	gtk_button_get_use_underline (a_button: POINTER): INTEGER is
 		-- gtk_button_get_use_underline
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_get_use_underline"
		}"
		end

	gtk_button_new: POINTER is
 		-- gtk_button_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_new()"
		}"
		end

	gtk_button_new_from_stock (a_stock_id: POINTER): POINTER is
 		-- gtk_button_new_from_stock
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_new_from_stock"
		}"
		end

	gtk_button_new_with_label (a_label: POINTER): POINTER is
 		-- gtk_button_new_with_label
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_new_with_label"
		}"
		end

	gtk_button_new_with_mnemonic (a_label: POINTER): POINTER is
 		-- gtk_button_new_with_mnemonic
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_new_with_mnemonic"
		}"
		end

	-- `hidden' function _gtk_button_paint skipped.
	gtk_button_set_alignment (a_button: POINTER; a_xalign: REAL_32; a_yalign: REAL_32) is
 		-- gtk_button_set_alignment
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_set_alignment"
		}"
		end

	-- `hidden' function _gtk_button_set_depressed skipped.
	gtk_button_set_focus_on_click (a_button: POINTER; a_focus_on_click: INTEGER) is
 		-- gtk_button_set_focus_on_click
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_set_focus_on_click"
		}"
		end

	gtk_button_set_image (a_button: POINTER; an_image: POINTER) is
 		-- gtk_button_set_image
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_set_image"
		}"
		end

	gtk_button_set_image_position (a_button: POINTER; a_position: INTEGER) is
 		-- gtk_button_set_image_position
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_set_image_position"
		}"
		end

	gtk_button_set_label (a_button: POINTER; a_label: POINTER) is
 		-- gtk_button_set_label
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_set_label"
		}"
		end

	gtk_button_set_relief (a_button: POINTER; a_newstyle: INTEGER) is
 		-- gtk_button_set_relief
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_set_relief"
		}"
		end

	gtk_button_set_use_stock (a_button: POINTER; an_use_stock: INTEGER) is
 		-- gtk_button_set_use_stock
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_set_use_stock"
		}"
		end

	gtk_button_set_use_underline (a_button: POINTER; an_use_underline: INTEGER) is
 		-- gtk_button_set_use_underline
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_set_use_underline"
		}"
		end


end -- class GTKBUTTON_EXTERNALS
