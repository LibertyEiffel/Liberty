-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTOOLTIP_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	-- `hidden' function _gtk_tooltip_focus_in skipped.
	-- `hidden' function _gtk_tooltip_focus_out skipped.
	gtk_tooltip_get_type: like long_unsigned is
 		-- gtk_tooltip_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tooltip_get_type()"
		}"
		end

	-- `hidden' function _gtk_tooltip_handle_event skipped.
	-- `hidden' function _gtk_tooltip_hide skipped.
	gtk_tooltip_set_custom (a_tooltip: POINTER; a_custom_widget: POINTER) is
 		-- gtk_tooltip_set_custom
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tooltip_set_custom"
		}"
		end

	gtk_tooltip_set_icon (a_tooltip: POINTER; a_pixbuf: POINTER) is
 		-- gtk_tooltip_set_icon
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tooltip_set_icon"
		}"
		end

	gtk_tooltip_set_icon_from_gicon (a_tooltip: POINTER; a_gicon: POINTER; a_size: INTEGER) is
 		-- gtk_tooltip_set_icon_from_gicon
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tooltip_set_icon_from_gicon"
		}"
		end

	gtk_tooltip_set_icon_from_icon_name (a_tooltip: POINTER; an_icon_name: POINTER; a_size: INTEGER) is
 		-- gtk_tooltip_set_icon_from_icon_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tooltip_set_icon_from_icon_name"
		}"
		end

	gtk_tooltip_set_icon_from_stock (a_tooltip: POINTER; a_stock_id: POINTER; a_size: INTEGER) is
 		-- gtk_tooltip_set_icon_from_stock
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tooltip_set_icon_from_stock"
		}"
		end

	gtk_tooltip_set_markup (a_tooltip: POINTER; a_markup: POINTER) is
 		-- gtk_tooltip_set_markup
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tooltip_set_markup"
		}"
		end

	gtk_tooltip_set_text (a_tooltip: POINTER; a_text: POINTER) is
 		-- gtk_tooltip_set_text
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tooltip_set_text"
		}"
		end

	gtk_tooltip_set_tip_area (a_tooltip: POINTER; a_rect: POINTER) is
 		-- gtk_tooltip_set_tip_area
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tooltip_set_tip_area"
		}"
		end

	-- `hidden' function _gtk_tooltip_toggle_keyboard_mode skipped.
	gtk_tooltip_trigger_tooltip_query (a_display: POINTER) is
 		-- gtk_tooltip_trigger_tooltip_query
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tooltip_trigger_tooltip_query"
		}"
		end

	-- `hidden' function _gtk_widget_find_at_coords skipped.

end -- class GTKTOOLTIP_EXTERNALS
