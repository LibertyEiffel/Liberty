-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKBUTTON_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_button_get_image (a_button: POINTER): POINTER is
 		-- gtk_button_get_image (node at line 1695)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_get_image"
		}"
		end

	gtk_button_get_use_stock (a_button: POINTER): INTEGER_32 is
 		-- gtk_button_get_use_stock (node at line 3773)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_get_use_stock"
		}"
		end

	gtk_button_clicked (a_button: POINTER) is
 		-- gtk_button_clicked (node at line 5622)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_clicked"
		}"
		end

	gtk_button_get_alignment (a_button: POINTER; a_xalign: POINTER; a_yalign: POINTER) is
 		-- gtk_button_get_alignment (node at line 7215)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_get_alignment"
		}"
		end

	gtk_button_set_use_stock (a_button: POINTER; an_use_stock: INTEGER_32) is
 		-- gtk_button_set_use_stock (node at line 8560)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_set_use_stock"
		}"
		end

	gtk_button_set_use_underline (a_button: POINTER; an_use_underline: INTEGER_32) is
 		-- gtk_button_set_use_underline (node at line 10403)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_set_use_underline"
		}"
		end

	gtk_button_get_focus_on_click (a_button: POINTER): INTEGER_32 is
 		-- gtk_button_get_focus_on_click (node at line 11494)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_get_focus_on_click"
		}"
		end

	gtk_button_set_image (a_button: POINTER; an_image: POINTER) is
 		-- gtk_button_set_image (node at line 12212)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_set_image"
		}"
		end

	gtk_button_new: POINTER is
 		-- gtk_button_new (node at line 15420)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_new()"
		}"
		end

	gtk_button_get_event_window (a_button: POINTER): POINTER is
 		-- gtk_button_get_event_window (node at line 17399)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_get_event_window"
		}"
		end

	gtk_button_set_image_position (a_button: POINTER; a_position: INTEGER) is
 		-- gtk_button_set_image_position (node at line 19444)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_set_image_position"
		}"
		end

	gtk_button_set_relief (a_button: POINTER; a_newstyle: INTEGER) is
 		-- gtk_button_set_relief (node at line 20589)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_set_relief"
		}"
		end

	gtk_button_set_focus_on_click (a_button: POINTER; a_focus_on_click: INTEGER_32) is
 		-- gtk_button_set_focus_on_click (node at line 20614)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_set_focus_on_click"
		}"
		end

	gtk_button_get_label (a_button: POINTER): POINTER is
 		-- gtk_button_get_label (node at line 20894)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_get_label"
		}"
		end

	-- `hidden' function _gtk_button_set_depressed skipped.
	gtk_button_new_with_mnemonic (a_label: POINTER): POINTER is
 		-- gtk_button_new_with_mnemonic (node at line 29281)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_new_with_mnemonic"
		}"
		end

	gtk_button_set_label (a_button: POINTER; a_label: POINTER) is
 		-- gtk_button_set_label (node at line 30488)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_set_label"
		}"
		end

	gtk_button_set_alignment (a_button: POINTER; a_xalign: REAL_32; a_yalign: REAL_32) is
 		-- gtk_button_set_alignment (node at line 33565)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_set_alignment"
		}"
		end

	gtk_button_new_from_stock (a_stock_id: POINTER): POINTER is
 		-- gtk_button_new_from_stock (node at line 34179)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_new_from_stock"
		}"
		end

	gtk_button_get_type: NATURAL_64 is
 		-- gtk_button_get_type (node at line 36453)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_get_type()"
		}"
		end

	gtk_button_get_relief (a_button: POINTER): INTEGER is
 		-- gtk_button_get_relief (node at line 37387)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_get_relief"
		}"
		end

	gtk_button_get_use_underline (a_button: POINTER): INTEGER_32 is
 		-- gtk_button_get_use_underline (node at line 38269)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_get_use_underline"
		}"
		end

	gtk_button_get_image_position (a_button: POINTER): INTEGER is
 		-- gtk_button_get_image_position (node at line 38301)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_get_image_position"
		}"
		end

	-- `hidden' function _gtk_button_paint skipped.
	gtk_button_new_with_label (a_label: POINTER): POINTER is
 		-- gtk_button_new_with_label (node at line 41125)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_new_with_label"
		}"
		end


end -- class GTKBUTTON_EXTERNALS
