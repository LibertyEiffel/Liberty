-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKBUTTON_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	-- `hidden' function _gtk_button_set_depressed skipped.
	gtk_button_get_image (a_button: POINTER): POINTER is
 		-- gtk_button_get_image (node at line 1763)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_get_image"
		}"
		end

	gtk_button_get_use_stock (a_button: POINTER): INTEGER_32 is
 		-- gtk_button_get_use_stock (node at line 3665)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_get_use_stock"
		}"
		end

	gtk_button_clicked (a_button: POINTER) is
 		-- gtk_button_clicked (node at line 5360)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_clicked"
		}"
		end

	gtk_button_get_alignment (a_button: POINTER; a_xalign: POINTER; a_yalign: POINTER) is
 		-- gtk_button_get_alignment (node at line 6608)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_get_alignment"
		}"
		end

	gtk_button_set_use_stock (a_button: POINTER; an_use_stock: INTEGER_32) is
 		-- gtk_button_set_use_stock (node at line 7874)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_set_use_stock"
		}"
		end

	gtk_button_set_use_underline (a_button: POINTER; an_use_underline: INTEGER_32) is
 		-- gtk_button_set_use_underline (node at line 9617)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_set_use_underline"
		}"
		end

	gtk_button_get_focus_on_click (a_button: POINTER): INTEGER_32 is
 		-- gtk_button_get_focus_on_click (node at line 10569)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_get_focus_on_click"
		}"
		end

	gtk_button_enter (a_button: POINTER) is
 		-- gtk_button_enter (node at line 10656)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_enter"
		}"
		end

	gtk_button_set_alignment (a_button: POINTER; a_xalign: REAL_32; a_yalign: REAL_32) is
 		-- gtk_button_set_alignment (node at line 11020)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_set_alignment"
		}"
		end

	gtk_button_set_image (a_button: POINTER; an_image: POINTER) is
 		-- gtk_button_set_image (node at line 11228)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_set_image"
		}"
		end

	gtk_button_new: POINTER is
 		-- gtk_button_new (node at line 14286)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_new()"
		}"
		end

	gtk_button_get_type: NATURAL_32 is
 		-- gtk_button_get_type (node at line 17053)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_get_type()"
		}"
		end

	gtk_button_set_image_position (a_button: POINTER; a_position: INTEGER) is
 		-- gtk_button_set_image_position (node at line 17746)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_set_image_position"
		}"
		end

	gtk_button_set_relief (a_button: POINTER; a_newstyle: INTEGER) is
 		-- gtk_button_set_relief (node at line 18862)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_set_relief"
		}"
		end

	gtk_button_set_focus_on_click (a_button: POINTER; a_focus_on_click: INTEGER_32) is
 		-- gtk_button_set_focus_on_click (node at line 18879)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_set_focus_on_click"
		}"
		end

	gtk_button_get_label (a_button: POINTER): POINTER is
 		-- gtk_button_get_label (node at line 19114)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_get_label"
		}"
		end

	gtk_button_get_image_position (a_button: POINTER): INTEGER is
 		-- gtk_button_get_image_position (node at line 19705)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_get_image_position"
		}"
		end

	gtk_button_pressed (a_button: POINTER) is
 		-- gtk_button_pressed (node at line 25455)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_pressed"
		}"
		end

	gtk_button_new_with_mnemonic (a_label: POINTER): POINTER is
 		-- gtk_button_new_with_mnemonic (node at line 26493)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_new_with_mnemonic"
		}"
		end

	gtk_button_set_label (a_button: POINTER; a_label: POINTER) is
 		-- gtk_button_set_label (node at line 27603)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_set_label"
		}"
		end

	gtk_button_leave (a_button: POINTER) is
 		-- gtk_button_leave (node at line 28552)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_leave"
		}"
		end

	gtk_button_new_from_stock (a_stock_id: POINTER): POINTER is
 		-- gtk_button_new_from_stock (node at line 30966)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_new_from_stock"
		}"
		end

	gtk_button_get_relief (a_button: POINTER): INTEGER is
 		-- gtk_button_get_relief (node at line 33860)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_get_relief"
		}"
		end

	gtk_button_get_use_underline (a_button: POINTER): INTEGER_32 is
 		-- gtk_button_get_use_underline (node at line 34737)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_get_use_underline"
		}"
		end

	-- `hidden' function _gtk_button_paint skipped.
	gtk_button_new_with_label (a_label: POINTER): POINTER is
 		-- gtk_button_new_with_label (node at line 37448)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_new_with_label"
		}"
		end

	gtk_button_released (a_button: POINTER) is
 		-- gtk_button_released (node at line 37676)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_released"
		}"
		end


end -- class GTKBUTTON_EXTERNALS
