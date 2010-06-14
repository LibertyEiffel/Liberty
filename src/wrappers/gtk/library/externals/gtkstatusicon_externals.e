-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKSTATUSICON_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_status_icon_get_visible (a_status_icon: POINTER): INTEGER_32 is
 		-- gtk_status_icon_get_visible (node at line 2278)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_status_icon_get_visible"
		}"
		end

	gtk_status_icon_get_tooltip_markup (a_status_icon: POINTER): POINTER is
 		-- gtk_status_icon_get_tooltip_markup (node at line 2831)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_status_icon_get_tooltip_markup"
		}"
		end

	gtk_status_icon_set_title (a_status_icon: POINTER; a_title: POINTER) is
 		-- gtk_status_icon_set_title (node at line 4597)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_status_icon_set_title"
		}"
		end

	gtk_status_icon_get_x11_window_id (a_status_icon: POINTER): NATURAL_32 is
 		-- gtk_status_icon_get_x11_window_id (node at line 4789)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_status_icon_get_x11_window_id"
		}"
		end

	gtk_status_icon_get_blinking (a_status_icon: POINTER): INTEGER_32 is
 		-- gtk_status_icon_get_blinking (node at line 5937)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_status_icon_get_blinking"
		}"
		end

	gtk_status_icon_get_pixbuf (a_status_icon: POINTER): POINTER is
 		-- gtk_status_icon_get_pixbuf (node at line 6484)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_status_icon_get_pixbuf"
		}"
		end

	gtk_status_icon_set_tooltip (a_status_icon: POINTER; a_tooltip_text: POINTER) is
 		-- gtk_status_icon_set_tooltip (node at line 7649)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_status_icon_set_tooltip"
		}"
		end

	gtk_status_icon_set_from_gicon (a_status_icon: POINTER; an_icon: POINTER) is
 		-- gtk_status_icon_set_from_gicon (node at line 7837)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_status_icon_set_from_gicon"
		}"
		end

	gtk_status_icon_get_storage_type (a_status_icon: POINTER): INTEGER is
 		-- gtk_status_icon_get_storage_type (node at line 8678)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_status_icon_get_storage_type"
		}"
		end

	gtk_status_icon_set_from_stock (a_status_icon: POINTER; a_stock_id: POINTER) is
 		-- gtk_status_icon_set_from_stock (node at line 10841)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_status_icon_set_from_stock"
		}"
		end

	gtk_status_icon_get_has_tooltip (a_status_icon: POINTER): INTEGER_32 is
 		-- gtk_status_icon_get_has_tooltip (node at line 11005)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_status_icon_get_has_tooltip"
		}"
		end

	gtk_status_icon_set_has_tooltip (a_status_icon: POINTER; a_has_tooltip: INTEGER_32) is
 		-- gtk_status_icon_set_has_tooltip (node at line 11564)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_status_icon_set_has_tooltip"
		}"
		end

	gtk_status_icon_new: POINTER is
 		-- gtk_status_icon_new (node at line 12084)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_status_icon_new()"
		}"
		end

	gtk_status_icon_set_screen (a_status_icon: POINTER; a_screen: POINTER) is
 		-- gtk_status_icon_set_screen (node at line 13339)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_status_icon_set_screen"
		}"
		end

	gtk_status_icon_new_from_gicon (an_icon: POINTER): POINTER is
 		-- gtk_status_icon_new_from_gicon (node at line 15078)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_status_icon_new_from_gicon"
		}"
		end

	gtk_status_icon_get_type: NATURAL_32 is
 		-- gtk_status_icon_get_type (node at line 15751)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_status_icon_get_type()"
		}"
		end

	gtk_status_icon_get_geometry (a_status_icon: POINTER; a_screen: POINTER; an_area: POINTER; an_orientation: POINTER): INTEGER_32 is
 		-- gtk_status_icon_get_geometry (node at line 17283)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_status_icon_get_geometry"
		}"
		end

	gtk_status_icon_new_from_stock (a_stock_id: POINTER): POINTER is
 		-- gtk_status_icon_new_from_stock (node at line 17772)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_status_icon_new_from_stock"
		}"
		end

	gtk_status_icon_get_gicon (a_status_icon: POINTER): POINTER is
 		-- gtk_status_icon_get_gicon (node at line 18047)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_status_icon_get_gicon"
		}"
		end

	gtk_status_icon_get_stock (a_status_icon: POINTER): POINTER is
 		-- gtk_status_icon_get_stock (node at line 20683)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_status_icon_get_stock"
		}"
		end

	gtk_status_icon_new_from_icon_name (an_icon_name: POINTER): POINTER is
 		-- gtk_status_icon_new_from_icon_name (node at line 22486)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_status_icon_new_from_icon_name"
		}"
		end

	gtk_status_icon_set_tooltip_text (a_status_icon: POINTER; a_text: POINTER) is
 		-- gtk_status_icon_set_tooltip_text (node at line 23293)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_status_icon_set_tooltip_text"
		}"
		end

	gtk_status_icon_set_from_pixbuf (a_status_icon: POINTER; a_pixbuf: POINTER) is
 		-- gtk_status_icon_set_from_pixbuf (node at line 23645)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_status_icon_set_from_pixbuf"
		}"
		end

	gtk_status_icon_set_tooltip_markup (a_status_icon: POINTER; a_markup: POINTER) is
 		-- gtk_status_icon_set_tooltip_markup (node at line 27049)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_status_icon_set_tooltip_markup"
		}"
		end

	gtk_status_icon_position_menu (a_menu: POINTER; a_x: POINTER; a_y: POINTER; a_push_in: POINTER; an_user_data: POINTER) is
 		-- gtk_status_icon_position_menu (node at line 27103)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_status_icon_position_menu"
		}"
		end

	gtk_status_icon_get_size (a_status_icon: POINTER): INTEGER_32 is
 		-- gtk_status_icon_get_size (node at line 27625)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_status_icon_get_size"
		}"
		end

	gtk_status_icon_get_tooltip_text (a_status_icon: POINTER): POINTER is
 		-- gtk_status_icon_get_tooltip_text (node at line 27739)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_status_icon_get_tooltip_text"
		}"
		end

	gtk_status_icon_get_screen (a_status_icon: POINTER): POINTER is
 		-- gtk_status_icon_get_screen (node at line 28620)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_status_icon_get_screen"
		}"
		end

	gtk_status_icon_set_name (a_status_icon: POINTER; a_name: POINTER) is
 		-- gtk_status_icon_set_name (node at line 31941)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_status_icon_set_name"
		}"
		end

	gtk_status_icon_set_visible (a_status_icon: POINTER; a_visible: INTEGER_32) is
 		-- gtk_status_icon_set_visible (node at line 32637)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_status_icon_set_visible"
		}"
		end

	gtk_status_icon_set_from_icon_name (a_status_icon: POINTER; an_icon_name: POINTER) is
 		-- gtk_status_icon_set_from_icon_name (node at line 33007)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_status_icon_set_from_icon_name"
		}"
		end

	gtk_status_icon_new_from_pixbuf (a_pixbuf: POINTER): POINTER is
 		-- gtk_status_icon_new_from_pixbuf (node at line 33042)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_status_icon_new_from_pixbuf"
		}"
		end

	gtk_status_icon_get_title (a_status_icon: POINTER): POINTER is
 		-- gtk_status_icon_get_title (node at line 33382)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_status_icon_get_title"
		}"
		end

	gtk_status_icon_get_icon_name (a_status_icon: POINTER): POINTER is
 		-- gtk_status_icon_get_icon_name (node at line 33524)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_status_icon_get_icon_name"
		}"
		end

	gtk_status_icon_set_from_file (a_status_icon: POINTER; a_filename: POINTER) is
 		-- gtk_status_icon_set_from_file (node at line 34192)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_status_icon_set_from_file"
		}"
		end

	gtk_status_icon_is_embedded (a_status_icon: POINTER): INTEGER_32 is
 		-- gtk_status_icon_is_embedded (node at line 35123)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_status_icon_is_embedded"
		}"
		end

	gtk_status_icon_set_blinking (a_status_icon: POINTER; a_blinking: INTEGER_32) is
 		-- gtk_status_icon_set_blinking (node at line 35422)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_status_icon_set_blinking"
		}"
		end

	gtk_status_icon_new_from_file (a_filename: POINTER): POINTER is
 		-- gtk_status_icon_new_from_file (node at line 36373)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_status_icon_new_from_file"
		}"
		end


end -- class GTKSTATUSICON_EXTERNALS
