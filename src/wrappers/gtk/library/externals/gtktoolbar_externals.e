-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTOOLBAR_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_toolbar_insert_widget (a_toolbar: POINTER; a_widget: POINTER; a_tooltip_text: POINTER; a_tooltip_private_text: POINTER; a_position: INTEGER_32) is
 		-- gtk_toolbar_insert_widget (node at line 1194)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_insert_widget"
		}"
		end

	gtk_toolbar_get_type: NATURAL_32 is
 		-- gtk_toolbar_get_type (node at line 3087)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_get_type()"
		}"
		end

	gtk_toolbar_prepend_element (a_toolbar: POINTER; a_type: INTEGER; a_widget: POINTER; a_text: POINTER; a_tooltip_text: POINTER; a_tooltip_private_text: POINTER; an_icon: POINTER; a_callback: POINTER; an_user_data: POINTER): POINTER is
 		-- gtk_toolbar_prepend_element (node at line 3475)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_prepend_element"
		}"
		end

	gtk_toolbar_unset_style (a_toolbar: POINTER) is
 		-- gtk_toolbar_unset_style (node at line 5206)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_unset_style"
		}"
		end

	gtk_toolbar_set_drop_highlight_item (a_toolbar: POINTER; a_tool_item: POINTER; an_index: INTEGER_32) is
 		-- gtk_toolbar_set_drop_highlight_item (node at line 5234)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_set_drop_highlight_item"
		}"
		end

	gtk_toolbar_set_style (a_toolbar: POINTER; a_style: INTEGER) is
 		-- gtk_toolbar_set_style (node at line 5859)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_set_style"
		}"
		end

	gtk_toolbar_remove_space (a_toolbar: POINTER; a_position: INTEGER_32) is
 		-- gtk_toolbar_remove_space (node at line 6198)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_remove_space"
		}"
		end

	gtk_toolbar_get_item_index (a_toolbar: POINTER; an_item: POINTER): INTEGER_32 is
 		-- gtk_toolbar_get_item_index (node at line 6966)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_get_item_index"
		}"
		end

	gtk_toolbar_insert_item (a_toolbar: POINTER; a_text: POINTER; a_tooltip_text: POINTER; a_tooltip_private_text: POINTER; an_icon: POINTER; a_callback: POINTER; an_user_data: POINTER; a_position: INTEGER_32): POINTER is
 		-- gtk_toolbar_insert_item (node at line 7815)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_insert_item"
		}"
		end

	gtk_toolbar_insert_space (a_toolbar: POINTER; a_position: INTEGER_32) is
 		-- gtk_toolbar_insert_space (node at line 10204)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_insert_space"
		}"
		end

	gtk_toolbar_append_item (a_toolbar: POINTER; a_text: POINTER; a_tooltip_text: POINTER; a_tooltip_private_text: POINTER; an_icon: POINTER; a_callback: POINTER; an_user_data: POINTER): POINTER is
 		-- gtk_toolbar_append_item (node at line 10220)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_append_item"
		}"
		end

	gtk_toolbar_set_tooltips (a_toolbar: POINTER; an_enable: INTEGER_32) is
 		-- gtk_toolbar_set_tooltips (node at line 10737)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_set_tooltips"
		}"
		end

	gtk_toolbar_prepend_space (a_toolbar: POINTER) is
 		-- gtk_toolbar_prepend_space (node at line 11822)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_prepend_space"
		}"
		end

	gtk_toolbar_get_tooltips (a_toolbar: POINTER): INTEGER_32 is
 		-- gtk_toolbar_get_tooltips (node at line 11871)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_get_tooltips"
		}"
		end

	gtk_toolbar_new: POINTER is
 		-- gtk_toolbar_new (node at line 13226)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_new()"
		}"
		end

	-- `hidden' function _gtk_toolbar_paint_space_line skipped.
	gtk_toolbar_get_icon_size (a_toolbar: POINTER): INTEGER is
 		-- gtk_toolbar_get_icon_size (node at line 14658)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_get_icon_size"
		}"
		end

	gtk_toolbar_get_show_arrow (a_toolbar: POINTER): INTEGER_32 is
 		-- gtk_toolbar_get_show_arrow (node at line 15905)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_get_show_arrow"
		}"
		end

	gtk_toolbar_get_orientation (a_toolbar: POINTER): INTEGER is
 		-- gtk_toolbar_get_orientation (node at line 18333)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_get_orientation"
		}"
		end

	gtk_toolbar_set_icon_size (a_toolbar: POINTER; an_icon_size: INTEGER) is
 		-- gtk_toolbar_set_icon_size (node at line 18610)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_set_icon_size"
		}"
		end

	gtk_toolbar_append_widget (a_toolbar: POINTER; a_widget: POINTER; a_tooltip_text: POINTER; a_tooltip_private_text: POINTER) is
 		-- gtk_toolbar_append_widget (node at line 19153)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_append_widget"
		}"
		end

	gtk_toolbar_set_show_arrow (a_toolbar: POINTER; a_show_arrow: INTEGER_32) is
 		-- gtk_toolbar_set_show_arrow (node at line 21162)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_set_show_arrow"
		}"
		end

	gtk_toolbar_insert_stock (a_toolbar: POINTER; a_stock_id: POINTER; a_tooltip_text: POINTER; a_tooltip_private_text: POINTER; a_callback: POINTER; an_user_data: POINTER; a_position: INTEGER_32): POINTER is
 		-- gtk_toolbar_insert_stock (node at line 22012)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_insert_stock"
		}"
		end

	gtk_toolbar_get_nth_item (a_toolbar: POINTER; a_n: INTEGER_32): POINTER is
 		-- gtk_toolbar_get_nth_item (node at line 23208)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_get_nth_item"
		}"
		end

	gtk_toolbar_unset_icon_size (a_toolbar: POINTER) is
 		-- gtk_toolbar_unset_icon_size (node at line 24882)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_unset_icon_size"
		}"
		end

	gtk_toolbar_append_space (a_toolbar: POINTER) is
 		-- gtk_toolbar_append_space (node at line 25809)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_append_space"
		}"
		end

	gtk_toolbar_get_n_items (a_toolbar: POINTER): INTEGER_32 is
 		-- gtk_toolbar_get_n_items (node at line 26188)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_get_n_items"
		}"
		end

	gtk_toolbar_get_relief_style (a_toolbar: POINTER): INTEGER is
 		-- gtk_toolbar_get_relief_style (node at line 28013)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_get_relief_style"
		}"
		end

	gtk_toolbar_prepend_item (a_toolbar: POINTER; a_text: POINTER; a_tooltip_text: POINTER; a_tooltip_private_text: POINTER; an_icon: POINTER; a_callback: POINTER; an_user_data: POINTER): POINTER is
 		-- gtk_toolbar_prepend_item (node at line 32156)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_prepend_item"
		}"
		end

	gtk_toolbar_insert (a_toolbar: POINTER; an_item: POINTER; a_pos: INTEGER_32) is
 		-- gtk_toolbar_insert (node at line 32450)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_insert"
		}"
		end

	gtk_toolbar_get_style (a_toolbar: POINTER): INTEGER is
 		-- gtk_toolbar_get_style (node at line 34453)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_get_style"
		}"
		end

	gtk_toolbar_set_orientation (a_toolbar: POINTER; an_orientation: INTEGER) is
 		-- gtk_toolbar_set_orientation (node at line 35337)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_set_orientation"
		}"
		end

	gtk_toolbar_append_element (a_toolbar: POINTER; a_type: INTEGER; a_widget: POINTER; a_text: POINTER; a_tooltip_text: POINTER; a_tooltip_private_text: POINTER; an_icon: POINTER; a_callback: POINTER; an_user_data: POINTER): POINTER is
 		-- gtk_toolbar_append_element (node at line 35521)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_append_element"
		}"
		end

	gtk_toolbar_get_drop_index (a_toolbar: POINTER; a_x: INTEGER_32; a_y: INTEGER_32): INTEGER_32 is
 		-- gtk_toolbar_get_drop_index (node at line 35679)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_get_drop_index"
		}"
		end

	gtk_toolbar_insert_element (a_toolbar: POINTER; a_type: INTEGER; a_widget: POINTER; a_text: POINTER; a_tooltip_text: POINTER; a_tooltip_private_text: POINTER; an_icon: POINTER; a_callback: POINTER; an_user_data: POINTER; a_position: INTEGER_32): POINTER is
 		-- gtk_toolbar_insert_element (node at line 35792)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_insert_element"
		}"
		end

	gtk_toolbar_prepend_widget (a_toolbar: POINTER; a_widget: POINTER; a_tooltip_text: POINTER; a_tooltip_private_text: POINTER) is
 		-- gtk_toolbar_prepend_widget (node at line 36590)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_prepend_widget"
		}"
		end

	-- `hidden' function _gtk_toolbar_elide_underscores skipped.
	-- `hidden' function _gtk_toolbar_get_default_space_size skipped.

end -- class GTKTOOLBAR_EXTERNALS
