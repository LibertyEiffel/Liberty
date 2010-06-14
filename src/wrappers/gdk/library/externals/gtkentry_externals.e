-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKENTRY_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_entry_get_icon_window (an_entry: POINTER; an_icon_pos: INTEGER): POINTER is
 		-- gtk_entry_get_icon_window (node at line 100)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_icon_window"
		}"
		end

	gtk_entry_set_position (an_entry: POINTER; a_position: INTEGER_32) is
 		-- gtk_entry_set_position (node at line 888)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_position"
		}"
		end

	gtk_entry_get_icon_stock (an_entry: POINTER; an_icon_pos: INTEGER): POINTER is
 		-- gtk_entry_get_icon_stock (node at line 1147)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_icon_stock"
		}"
		end

	gtk_entry_get_icon_activatable (an_entry: POINTER; an_icon_pos: INTEGER): INTEGER_32 is
 		-- gtk_entry_get_icon_activatable (node at line 1269)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_icon_activatable"
		}"
		end

	gtk_entry_set_icon_from_stock (an_entry: POINTER; an_icon_pos: INTEGER; a_stock_id: POINTER) is
 		-- gtk_entry_set_icon_from_stock (node at line 1795)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_icon_from_stock"
		}"
		end

	gtk_entry_get_overwrite_mode (an_entry: POINTER): INTEGER_32 is
 		-- gtk_entry_get_overwrite_mode (node at line 2326)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_overwrite_mode"
		}"
		end

	gtk_entry_get_progress_pulse_step (an_entry: POINTER): REAL_64 is
 		-- gtk_entry_get_progress_pulse_step (node at line 2783)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_progress_pulse_step"
		}"
		end

	gtk_entry_set_progress_pulse_step (an_entry: POINTER; a_fraction: REAL_64) is
 		-- gtk_entry_set_progress_pulse_step (node at line 3951)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_progress_pulse_step"
		}"
		end

	gtk_entry_set_alignment (an_entry: POINTER; a_xalign: REAL_32) is
 		-- gtk_entry_set_alignment (node at line 3974)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_alignment"
		}"
		end

	gtk_entry_set_width_chars (an_entry: POINTER; a_n_chars: INTEGER_32) is
 		-- gtk_entry_set_width_chars (node at line 4287)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_width_chars"
		}"
		end

	gtk_entry_new: POINTER is
 		-- gtk_entry_new (node at line 4467)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_new()"
		}"
		end

	gtk_entry_set_overwrite_mode (an_entry: POINTER; an_overwrite: INTEGER_32) is
 		-- gtk_entry_set_overwrite_mode (node at line 4577)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_overwrite_mode"
		}"
		end

	gtk_entry_set_icon_drag_source (an_entry: POINTER; an_icon_pos: INTEGER; a_target_list: POINTER; an_actions: INTEGER) is
 		-- gtk_entry_set_icon_drag_source (node at line 5328)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_icon_drag_source"
		}"
		end

	gtk_entry_set_invisible_char (an_entry: POINTER; a_ch: NATURAL_32) is
 		-- gtk_entry_set_invisible_char (node at line 5810)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_invisible_char"
		}"
		end

	gtk_entry_get_icon_storage_type (an_entry: POINTER; an_icon_pos: INTEGER): INTEGER is
 		-- gtk_entry_get_icon_storage_type (node at line 6793)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_icon_storage_type"
		}"
		end

	gtk_entry_progress_pulse (an_entry: POINTER) is
 		-- gtk_entry_progress_pulse (node at line 7336)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_progress_pulse"
		}"
		end

	gtk_entry_text_index_to_layout_index (an_entry: POINTER; a_text_index: INTEGER_32): INTEGER_32 is
 		-- gtk_entry_text_index_to_layout_index (node at line 7342)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_text_index_to_layout_index"
		}"
		end

	gtk_entry_get_type: NATURAL_32 is
 		-- gtk_entry_get_type (node at line 7481)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_type()"
		}"
		end

	gtk_entry_get_has_frame (an_entry: POINTER): INTEGER_32 is
 		-- gtk_entry_get_has_frame (node at line 7883)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_has_frame"
		}"
		end

	gtk_entry_append_text (an_entry: POINTER; a_text: POINTER) is
 		-- gtk_entry_append_text (node at line 8041)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_append_text"
		}"
		end

	gtk_entry_get_progress_fraction (an_entry: POINTER): REAL_64 is
 		-- gtk_entry_get_progress_fraction (node at line 8991)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_progress_fraction"
		}"
		end

	gtk_entry_prepend_text (an_entry: POINTER; a_text: POINTER) is
 		-- gtk_entry_prepend_text (node at line 9981)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_prepend_text"
		}"
		end

	gtk_entry_new_with_max_length (a_max: INTEGER_32): POINTER is
 		-- gtk_entry_new_with_max_length (node at line 10109)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_new_with_max_length"
		}"
		end

	gtk_entry_get_icon_at_pos (an_entry: POINTER; a_x: INTEGER_32; a_y: INTEGER_32): INTEGER_32 is
 		-- gtk_entry_get_icon_at_pos (node at line 10460)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_icon_at_pos"
		}"
		end

	gtk_entry_get_activates_default (an_entry: POINTER): INTEGER_32 is
 		-- gtk_entry_get_activates_default (node at line 10709)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_activates_default"
		}"
		end

	gtk_entry_set_text (an_entry: POINTER; a_text: POINTER) is
 		-- gtk_entry_set_text (node at line 11119)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_text"
		}"
		end

	gtk_entry_set_buffer (an_entry: POINTER; a_buffer: POINTER) is
 		-- gtk_entry_set_buffer (node at line 11466)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_buffer"
		}"
		end

	gtk_entry_get_layout_offsets (an_entry: POINTER; a_x: POINTER; a_y: POINTER) is
 		-- gtk_entry_get_layout_offsets (node at line 12086)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_layout_offsets"
		}"
		end

	gtk_entry_set_icon_from_icon_name (an_entry: POINTER; an_icon_pos: INTEGER; an_icon_name: POINTER) is
 		-- gtk_entry_set_icon_from_icon_name (node at line 12093)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_icon_from_icon_name"
		}"
		end

	gtk_entry_set_editable (an_entry: POINTER; an_editable: INTEGER_32) is
 		-- gtk_entry_set_editable (node at line 12487)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_editable"
		}"
		end

	gtk_entry_set_icon_activatable (an_entry: POINTER; an_icon_pos: INTEGER; an_activatable: INTEGER_32) is
 		-- gtk_entry_set_icon_activatable (node at line 14083)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_icon_activatable"
		}"
		end

	gtk_entry_set_inner_border (an_entry: POINTER; a_border: POINTER) is
 		-- gtk_entry_set_inner_border (node at line 14267)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_inner_border"
		}"
		end

	gtk_entry_set_has_frame (an_entry: POINTER; a_setting: INTEGER_32) is
 		-- gtk_entry_set_has_frame (node at line 14533)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_has_frame"
		}"
		end

	gtk_entry_set_activates_default (an_entry: POINTER; a_setting: INTEGER_32) is
 		-- gtk_entry_set_activates_default (node at line 15324)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_activates_default"
		}"
		end

	gtk_entry_get_inner_border (an_entry: POINTER): POINTER is
 		-- gtk_entry_get_inner_border (node at line 18631)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_inner_border"
		}"
		end

	gtk_entry_get_text_length (an_entry: POINTER): NATURAL_16 is
 		-- gtk_entry_get_text_length (node at line 20157)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_text_length"
		}"
		end

	gtk_entry_layout_index_to_text_index (an_entry: POINTER; a_layout_index: INTEGER_32): INTEGER_32 is
 		-- gtk_entry_layout_index_to_text_index (node at line 20859)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_layout_index_to_text_index"
		}"
		end

	gtk_entry_new_with_buffer (a_buffer: POINTER): POINTER is
 		-- gtk_entry_new_with_buffer (node at line 23894)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_new_with_buffer"
		}"
		end

	gtk_entry_get_icon_sensitive (an_entry: POINTER; an_icon_pos: INTEGER): INTEGER_32 is
 		-- gtk_entry_get_icon_sensitive (node at line 25969)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_icon_sensitive"
		}"
		end

	gtk_entry_get_layout (an_entry: POINTER): POINTER is
 		-- gtk_entry_get_layout (node at line 28220)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_layout"
		}"
		end

	gtk_entry_unset_invisible_char (an_entry: POINTER) is
 		-- gtk_entry_unset_invisible_char (node at line 28666)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_unset_invisible_char"
		}"
		end

	gtk_entry_get_icon_tooltip_text (an_entry: POINTER; an_icon_pos: INTEGER): POINTER is
 		-- gtk_entry_get_icon_tooltip_text (node at line 29264)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_icon_tooltip_text"
		}"
		end

	gtk_entry_get_max_length (an_entry: POINTER): INTEGER_32 is
 		-- gtk_entry_get_max_length (node at line 29843)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_max_length"
		}"
		end

	gtk_entry_get_alignment (an_entry: POINTER): REAL_32 is
 		-- gtk_entry_get_alignment (node at line 30375)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_alignment"
		}"
		end

	gtk_entry_set_icon_from_pixbuf (an_entry: POINTER; an_icon_pos: INTEGER; a_pixbuf: POINTER) is
 		-- gtk_entry_set_icon_from_pixbuf (node at line 30561)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_icon_from_pixbuf"
		}"
		end

	gtk_entry_get_visibility (an_entry: POINTER): INTEGER_32 is
 		-- gtk_entry_get_visibility (node at line 30619)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_visibility"
		}"
		end

	gtk_entry_get_text_window (an_entry: POINTER): POINTER is
 		-- gtk_entry_get_text_window (node at line 31431)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_text_window"
		}"
		end

	gtk_entry_get_text (an_entry: POINTER): POINTER is
 		-- gtk_entry_get_text (node at line 31488)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_text"
		}"
		end

	gtk_entry_get_buffer (an_entry: POINTER): POINTER is
 		-- gtk_entry_get_buffer (node at line 31524)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_buffer"
		}"
		end

	gtk_entry_get_invisible_char (an_entry: POINTER): NATURAL_32 is
 		-- gtk_entry_get_invisible_char (node at line 32385)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_invisible_char"
		}"
		end

	gtk_entry_get_icon_pixbuf (an_entry: POINTER; an_icon_pos: INTEGER): POINTER is
 		-- gtk_entry_get_icon_pixbuf (node at line 32408)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_icon_pixbuf"
		}"
		end

	gtk_entry_get_completion (an_entry: POINTER): POINTER is
 		-- gtk_entry_get_completion (node at line 33417)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_completion"
		}"
		end

	gtk_entry_set_icon_tooltip_text (an_entry: POINTER; an_icon_pos: INTEGER; a_tooltip: POINTER) is
 		-- gtk_entry_set_icon_tooltip_text (node at line 33473)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_icon_tooltip_text"
		}"
		end

	gtk_entry_get_current_icon_drag_source (an_entry: POINTER): INTEGER_32 is
 		-- gtk_entry_get_current_icon_drag_source (node at line 33690)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_current_icon_drag_source"
		}"
		end

	gtk_entry_get_width_chars (an_entry: POINTER): INTEGER_32 is
 		-- gtk_entry_get_width_chars (node at line 33916)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_width_chars"
		}"
		end

	gtk_entry_set_icon_sensitive (an_entry: POINTER; an_icon_pos: INTEGER; a_sensitive: INTEGER_32) is
 		-- gtk_entry_set_icon_sensitive (node at line 33927)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_icon_sensitive"
		}"
		end

	gtk_entry_get_icon_tooltip_markup (an_entry: POINTER; an_icon_pos: INTEGER): POINTER is
 		-- gtk_entry_get_icon_tooltip_markup (node at line 34503)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_icon_tooltip_markup"
		}"
		end

	gtk_entry_set_max_length (an_entry: POINTER; a_max: INTEGER_32) is
 		-- gtk_entry_set_max_length (node at line 34740)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_max_length"
		}"
		end

	gtk_entry_set_completion (an_entry: POINTER; a_completion: POINTER) is
 		-- gtk_entry_set_completion (node at line 34830)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_completion"
		}"
		end

	gtk_entry_get_cursor_hadjustment (an_entry: POINTER): POINTER is
 		-- gtk_entry_get_cursor_hadjustment (node at line 35156)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_cursor_hadjustment"
		}"
		end

	gtk_entry_get_icon_name (an_entry: POINTER; an_icon_pos: INTEGER): POINTER is
 		-- gtk_entry_get_icon_name (node at line 35219)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_icon_name"
		}"
		end

	gtk_entry_set_icon_tooltip_markup (an_entry: POINTER; an_icon_pos: INTEGER; a_tooltip: POINTER) is
 		-- gtk_entry_set_icon_tooltip_markup (node at line 35443)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_icon_tooltip_markup"
		}"
		end

	gtk_entry_set_progress_fraction (an_entry: POINTER; a_fraction: REAL_64) is
 		-- gtk_entry_set_progress_fraction (node at line 35466)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_progress_fraction"
		}"
		end

	gtk_entry_set_visibility (an_entry: POINTER; a_visible: INTEGER_32) is
 		-- gtk_entry_set_visibility (node at line 35571)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_visibility"
		}"
		end

	gtk_entry_select_region (an_entry: POINTER; a_start: INTEGER_32; an_end_external: INTEGER_32) is
 		-- gtk_entry_select_region (node at line 35782)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_select_region"
		}"
		end

	gtk_entry_get_icon_gicon (an_entry: POINTER; an_icon_pos: INTEGER): POINTER is
 		-- gtk_entry_get_icon_gicon (node at line 36094)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_get_icon_gicon"
		}"
		end

	gtk_entry_set_icon_from_gicon (an_entry: POINTER; an_icon_pos: INTEGER; an_icon: POINTER) is
 		-- gtk_entry_set_icon_from_gicon (node at line 36533)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_icon_from_gicon"
		}"
		end

	gtk_entry_set_cursor_hadjustment (an_entry: POINTER; an_adjustment: POINTER) is
 		-- gtk_entry_set_cursor_hadjustment (node at line 37290)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_set_cursor_hadjustment"
		}"
		end


end -- class GTKENTRY_EXTERNALS
