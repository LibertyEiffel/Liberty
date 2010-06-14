-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTOOLTIP_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_tooltip_set_icon_from_icon_name (a_tooltip: POINTER; an_icon_name: POINTER; a_size: INTEGER) is
 		-- gtk_tooltip_set_icon_from_icon_name (node at line 4684)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tooltip_set_icon_from_icon_name"
		}"
		end

	gtk_tooltip_trigger_tooltip_query (a_display: POINTER) is
 		-- gtk_tooltip_trigger_tooltip_query (node at line 6210)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tooltip_trigger_tooltip_query"
		}"
		end

	gtk_tooltip_set_icon_from_gicon (a_tooltip: POINTER; a_gicon: POINTER; a_size: INTEGER) is
 		-- gtk_tooltip_set_icon_from_gicon (node at line 7136)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tooltip_set_icon_from_gicon"
		}"
		end

	gtk_tooltip_set_tip_area (a_tooltip: POINTER; a_rect: POINTER) is
 		-- gtk_tooltip_set_tip_area (node at line 7555)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tooltip_set_tip_area"
		}"
		end

	gtk_tooltip_set_icon_from_stock (a_tooltip: POINTER; a_stock_id: POINTER; a_size: INTEGER) is
 		-- gtk_tooltip_set_icon_from_stock (node at line 10193)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tooltip_set_icon_from_stock"
		}"
		end

	gtk_tooltip_set_text (a_tooltip: POINTER; a_text: POINTER) is
 		-- gtk_tooltip_set_text (node at line 13695)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tooltip_set_text"
		}"
		end

	gtk_tooltip_set_markup (a_tooltip: POINTER; a_markup: POINTER) is
 		-- gtk_tooltip_set_markup (node at line 18883)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tooltip_set_markup"
		}"
		end

	gtk_tooltip_set_icon (a_tooltip: POINTER; a_pixbuf: POINTER) is
 		-- gtk_tooltip_set_icon (node at line 19873)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tooltip_set_icon"
		}"
		end

	-- `hidden' function _gtk_tooltip_focus_out skipped.
	-- `hidden' function _gtk_tooltip_handle_event skipped.
	-- `hidden' function _gtk_tooltip_focus_in skipped.
	gtk_tooltip_get_type: NATURAL_32 is
 		-- gtk_tooltip_get_type (node at line 27831)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tooltip_get_type()"
		}"
		end

	-- `hidden' function _gtk_tooltip_hide skipped.
	-- `hidden' function _gtk_tooltip_toggle_keyboard_mode skipped.
	gtk_tooltip_set_custom (a_tooltip: POINTER; a_custom_widget: POINTER) is
 		-- gtk_tooltip_set_custom (node at line 32853)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tooltip_set_custom"
		}"
		end


end -- class GTKTOOLTIP_EXTERNALS
