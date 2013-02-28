-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKENTRY_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_entry_get_icon_window (an_entry: POINTER; an_icon_pos: INTEGER): POINTER is
 		-- gtk_entry_get_icon_window (node at line 89)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_icon_window"
		}"
		end

	gtk_entry_get_icon_activatable (an_entry: POINTER; an_icon_pos: INTEGER): INTEGER_32 is
 		-- gtk_entry_get_icon_activatable (node at line 683)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_icon_activatable"
		}"
		end

	gtk_entry_get_icon_stock (an_entry: POINTER; an_icon_pos: INTEGER): POINTER is
 		-- gtk_entry_get_icon_stock (node at line 1099)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_icon_stock"
		}"
		end

	gtk_entry_get_activates_default (an_entry: POINTER): INTEGER_32 is
 		-- gtk_entry_get_activates_default (node at line 1548)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_activates_default"
		}"
		end

	gtk_entry_set_icon_from_stock (an_entry: POINTER; an_icon_pos: INTEGER; a_stock_id: POINTER) is
 		-- gtk_entry_set_icon_from_stock (node at line 1712)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_icon_from_stock"
		}"
		end

	gtk_entry_im_context_filter_keypress (an_entry: POINTER; an_event: POINTER): INTEGER_32 is
 		-- gtk_entry_im_context_filter_keypress (node at line 2314)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_im_context_filter_keypress"
		}"
		end

	gtk_entry_get_progress_pulse_step (an_entry: POINTER): REAL_64 is
 		-- gtk_entry_get_progress_pulse_step (node at line 2742)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_progress_pulse_step"
		}"
		end

	gtk_entry_set_progress_pulse_step (an_entry: POINTER; a_fraction: REAL_64) is
 		-- gtk_entry_set_progress_pulse_step (node at line 4126)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_progress_pulse_step"
		}"
		end

	gtk_entry_get_icon_sensitive (an_entry: POINTER; an_icon_pos: INTEGER): INTEGER_32 is
 		-- gtk_entry_get_icon_sensitive (node at line 4242)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_icon_sensitive"
		}"
		end

	gtk_entry_set_width_chars (an_entry: POINTER; a_n_chars: INTEGER_32) is
 		-- gtk_entry_set_width_chars (node at line 4469)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_width_chars"
		}"
		end

	gtk_entry_set_overwrite_mode (an_entry: POINTER; an_overwrite: INTEGER_32) is
 		-- gtk_entry_set_overwrite_mode (node at line 4769)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_overwrite_mode"
		}"
		end

	gtk_entry_set_icon_drag_source (an_entry: POINTER; an_icon_pos: INTEGER; a_target_list: POINTER; an_actions: INTEGER) is
 		-- gtk_entry_set_icon_drag_source (node at line 5590)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_icon_drag_source"
		}"
		end

	gtk_entry_get_icon_storage_type (an_entry: POINTER; an_icon_pos: INTEGER): INTEGER is
 		-- gtk_entry_get_icon_storage_type (node at line 7423)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_icon_storage_type"
		}"
		end

	gtk_entry_progress_pulse (an_entry: POINTER) is
 		-- gtk_entry_progress_pulse (node at line 8034)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_progress_pulse"
		}"
		end

	gtk_entry_get_type: NATURAL_64 is
 		-- gtk_entry_get_type (node at line 8185)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_type()"
		}"
		end

	gtk_entry_set_icon_sensitive (an_entry: POINTER; an_icon_pos: INTEGER; a_sensitive: INTEGER_32) is
 		-- gtk_entry_set_icon_sensitive (node at line 8507)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_icon_sensitive"
		}"
		end

	gtk_entry_get_invisible_char (an_entry: POINTER): NATURAL_32 is
 		-- gtk_entry_get_invisible_char (node at line 8564)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_invisible_char"
		}"
		end

	gtk_entry_get_overwrite_mode (an_entry: POINTER): INTEGER_32 is
 		-- gtk_entry_get_overwrite_mode (node at line 9490)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_overwrite_mode"
		}"
		end

	gtk_entry_get_progress_fraction (an_entry: POINTER): REAL_64 is
 		-- gtk_entry_get_progress_fraction (node at line 9751)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_progress_fraction"
		}"
		end

	gtk_entry_set_icon_activatable (an_entry: POINTER; an_icon_pos: INTEGER; an_activatable: INTEGER_32) is
 		-- gtk_entry_set_icon_activatable (node at line 10357)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_icon_activatable"
		}"
		end

	gtk_entry_set_text (an_entry: POINTER; a_text: POINTER) is
 		-- gtk_entry_set_text (node at line 12076)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_text"
		}"
		end

	gtk_entry_set_buffer (an_entry: POINTER; a_buffer: POINTER) is
 		-- gtk_entry_set_buffer (node at line 12490)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_buffer"
		}"
		end

	gtk_entry_reset_im_context (an_entry: POINTER) is
 		-- gtk_entry_reset_im_context (node at line 13074)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_reset_im_context"
		}"
		end

	gtk_entry_get_layout_offsets (an_entry: POINTER; a_x: POINTER; a_y: POINTER) is
 		-- gtk_entry_get_layout_offsets (node at line 13164)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_layout_offsets"
		}"
		end

	gtk_entry_set_icon_from_icon_name (an_entry: POINTER; an_icon_pos: INTEGER; an_icon_name: POINTER) is
 		-- gtk_entry_set_icon_from_icon_name (node at line 13171)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_icon_from_icon_name"
		}"
		end

	gtk_entry_set_has_frame (an_entry: POINTER; a_setting: INTEGER_32) is
 		-- gtk_entry_set_has_frame (node at line 13333)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_has_frame"
		}"
		end

	gtk_entry_get_buffer (an_entry: POINTER): POINTER is
 		-- gtk_entry_get_buffer (node at line 14684)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_buffer"
		}"
		end

	gtk_entry_set_inner_border (an_entry: POINTER; a_border: POINTER) is
 		-- gtk_entry_set_inner_border (node at line 15401)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_inner_border"
		}"
		end

	gtk_entry_text_index_to_layout_index (an_entry: POINTER; a_text_index: INTEGER_32): INTEGER_32 is
 		-- gtk_entry_text_index_to_layout_index (node at line 16540)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_text_index_to_layout_index"
		}"
		end

	gtk_entry_set_activates_default (an_entry: POINTER; a_setting: INTEGER_32) is
 		-- gtk_entry_set_activates_default (node at line 16623)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_activates_default"
		}"
		end

	gtk_entry_set_invisible_char (an_entry: POINTER; a_ch: NATURAL_32) is
 		-- gtk_entry_set_invisible_char (node at line 19144)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_invisible_char"
		}"
		end

	gtk_entry_get_has_frame (an_entry: POINTER): INTEGER_32 is
 		-- gtk_entry_get_has_frame (node at line 19203)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_has_frame"
		}"
		end

	gtk_entry_get_inner_border (an_entry: POINTER): POINTER is
 		-- gtk_entry_get_inner_border (node at line 20339)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_inner_border"
		}"
		end

	gtk_entry_set_alignment (an_entry: POINTER; a_xalign: REAL_32) is
 		-- gtk_entry_set_alignment (node at line 21121)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_alignment"
		}"
		end

	gtk_entry_get_text_length (an_entry: POINTER): NATURAL_16 is
 		-- gtk_entry_get_text_length (node at line 22205)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_text_length"
		}"
		end

	gtk_entry_get_completion (an_entry: POINTER): POINTER is
 		-- gtk_entry_get_completion (node at line 22904)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_completion"
		}"
		end

	gtk_entry_layout_index_to_text_index (an_entry: POINTER; a_layout_index: INTEGER_32): INTEGER_32 is
 		-- gtk_entry_layout_index_to_text_index (node at line 22978)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_layout_index_to_text_index"
		}"
		end

	gtk_entry_get_text_window (an_entry: POINTER): POINTER is
 		-- gtk_entry_get_text_window (node at line 25162)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_text_window"
		}"
		end

	gtk_entry_new_with_buffer (a_buffer: POINTER): POINTER is
 		-- gtk_entry_new_with_buffer (node at line 26356)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_new_with_buffer"
		}"
		end

	gtk_entry_get_text (an_entry: POINTER): POINTER is
 		-- gtk_entry_get_text (node at line 30918)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_text"
		}"
		end

	gtk_entry_get_layout (an_entry: POINTER): POINTER is
 		-- gtk_entry_get_layout (node at line 31257)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_layout"
		}"
		end

	gtk_entry_unset_invisible_char (an_entry: POINTER) is
 		-- gtk_entry_unset_invisible_char (node at line 31710)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_unset_invisible_char"
		}"
		end

	gtk_entry_get_icon_tooltip_text (an_entry: POINTER; an_icon_pos: INTEGER): POINTER is
 		-- gtk_entry_get_icon_tooltip_text (node at line 32310)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_icon_tooltip_text"
		}"
		end

	gtk_entry_get_max_length (an_entry: POINTER): INTEGER_32 is
 		-- gtk_entry_get_max_length (node at line 32897)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_max_length"
		}"
		end

	gtk_entry_set_icon_tooltip_text (an_entry: POINTER; an_icon_pos: INTEGER; a_tooltip: POINTER) is
 		-- gtk_entry_set_icon_tooltip_text (node at line 33503)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_icon_tooltip_text"
		}"
		end

	gtk_entry_get_alignment (an_entry: POINTER): REAL_32 is
 		-- gtk_entry_get_alignment (node at line 33529)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_alignment"
		}"
		end

	gtk_entry_get_icon_at_pos (an_entry: POINTER; a_x: INTEGER_32; a_y: INTEGER_32): INTEGER_32 is
 		-- gtk_entry_get_icon_at_pos (node at line 33700)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_icon_at_pos"
		}"
		end

	gtk_entry_set_icon_from_pixbuf (an_entry: POINTER; an_icon_pos: INTEGER; a_pixbuf: POINTER) is
 		-- gtk_entry_set_icon_from_pixbuf (node at line 33766)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_icon_from_pixbuf"
		}"
		end

	gtk_entry_get_visibility (an_entry: POINTER): INTEGER_32 is
 		-- gtk_entry_get_visibility (node at line 33855)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_visibility"
		}"
		end

	gtk_entry_get_icon_pixbuf (an_entry: POINTER; an_icon_pos: INTEGER): POINTER is
 		-- gtk_entry_get_icon_pixbuf (node at line 35778)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_icon_pixbuf"
		}"
		end

	gtk_entry_new: POINTER is
 		-- gtk_entry_new (node at line 36784)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_new()"
		}"
		end

	gtk_entry_get_current_icon_drag_source (an_entry: POINTER): INTEGER_32 is
 		-- gtk_entry_get_current_icon_drag_source (node at line 37192)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_current_icon_drag_source"
		}"
		end

	gtk_entry_get_width_chars (an_entry: POINTER): INTEGER_32 is
 		-- gtk_entry_get_width_chars (node at line 37436)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_width_chars"
		}"
		end

	gtk_entry_get_icon_tooltip_markup (an_entry: POINTER; an_icon_pos: INTEGER): POINTER is
 		-- gtk_entry_get_icon_tooltip_markup (node at line 38020)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_icon_tooltip_markup"
		}"
		end

	gtk_entry_set_max_length (an_entry: POINTER; a_max: INTEGER_32) is
 		-- gtk_entry_set_max_length (node at line 38272)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_max_length"
		}"
		end

	gtk_entry_set_completion (an_entry: POINTER; a_completion: POINTER) is
 		-- gtk_entry_set_completion (node at line 38418)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_completion"
		}"
		end

	gtk_entry_get_cursor_hadjustment (an_entry: POINTER): POINTER is
 		-- gtk_entry_get_cursor_hadjustment (node at line 38764)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_cursor_hadjustment"
		}"
		end

	gtk_entry_get_icon_name (an_entry: POINTER; an_icon_pos: INTEGER): POINTER is
 		-- gtk_entry_get_icon_name (node at line 38831)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_icon_name"
		}"
		end

	gtk_entry_set_icon_tooltip_markup (an_entry: POINTER; an_icon_pos: INTEGER; a_tooltip: POINTER) is
 		-- gtk_entry_set_icon_tooltip_markup (node at line 39023)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_icon_tooltip_markup"
		}"
		end

	gtk_entry_set_progress_fraction (an_entry: POINTER; a_fraction: REAL_64) is
 		-- gtk_entry_set_progress_fraction (node at line 39039)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_progress_fraction"
		}"
		end

	gtk_entry_set_visibility (an_entry: POINTER; a_visible: INTEGER_32) is
 		-- gtk_entry_set_visibility (node at line 39145)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_visibility"
		}"
		end

	gtk_entry_get_icon_gicon (an_entry: POINTER; an_icon_pos: INTEGER): POINTER is
 		-- gtk_entry_get_icon_gicon (node at line 39703)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_icon_gicon"
		}"
		end

	gtk_entry_set_icon_from_gicon (an_entry: POINTER; an_icon_pos: INTEGER; an_icon: POINTER) is
 		-- gtk_entry_set_icon_from_gicon (node at line 40188)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_icon_from_gicon"
		}"
		end

	gtk_entry_set_cursor_hadjustment (an_entry: POINTER; an_adjustment: POINTER) is
 		-- gtk_entry_set_cursor_hadjustment (node at line 40965)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_cursor_hadjustment"
		}"
		end


end -- class GTKENTRY_EXTERNALS
