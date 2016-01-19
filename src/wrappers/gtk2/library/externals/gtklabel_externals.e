-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKLABEL_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_label_get_angle (a_label: POINTER): REAL is
 		-- gtk_label_get_angle
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_get_angle"
		}"
		end

	gtk_label_get_attributes (a_label: POINTER): POINTER is
 		-- gtk_label_get_attributes
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_get_attributes"
		}"
		end

	gtk_label_get_current_uri (a_label: POINTER): POINTER is
 		-- gtk_label_get_current_uri
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_get_current_uri"
		}"
		end

	gtk_label_get_ellipsize (a_label: POINTER): INTEGER is
 		-- gtk_label_get_ellipsize
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_get_ellipsize"
		}"
		end

	gtk_label_get_justify (a_label: POINTER): INTEGER is
 		-- gtk_label_get_justify
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_get_justify"
		}"
		end

	gtk_label_get_label (a_label: POINTER): POINTER is
 		-- gtk_label_get_label
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_get_label"
		}"
		end

	gtk_label_get_layout (a_label: POINTER): POINTER is
 		-- gtk_label_get_layout
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_get_layout"
		}"
		end

	gtk_label_get_layout_offsets (a_label: POINTER; a_x: POINTER; a_y: POINTER) is
 		-- gtk_label_get_layout_offsets
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_get_layout_offsets"
		}"
		end

	gtk_label_get_line_wrap (a_label: POINTER): INTEGER is
 		-- gtk_label_get_line_wrap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_get_line_wrap"
		}"
		end

	gtk_label_get_line_wrap_mode (a_label: POINTER): INTEGER is
 		-- gtk_label_get_line_wrap_mode
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_get_line_wrap_mode"
		}"
		end

	gtk_label_get_max_width_chars (a_label: POINTER): INTEGER is
 		-- gtk_label_get_max_width_chars
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_get_max_width_chars"
		}"
		end

	gtk_label_get_mnemonic_keyval (a_label: POINTER): NATURAL is
 		-- gtk_label_get_mnemonic_keyval
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_get_mnemonic_keyval"
		}"
		end

	gtk_label_get_mnemonic_widget (a_label: POINTER): POINTER is
 		-- gtk_label_get_mnemonic_widget
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_get_mnemonic_widget"
		}"
		end

	gtk_label_get_selectable (a_label: POINTER): INTEGER is
 		-- gtk_label_get_selectable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_get_selectable"
		}"
		end

	gtk_label_get_selection_bounds (a_label: POINTER; a_start: POINTER; an_end_external: POINTER): INTEGER is
 		-- gtk_label_get_selection_bounds
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_get_selection_bounds"
		}"
		end

	gtk_label_get_single_line_mode (a_label: POINTER): INTEGER is
 		-- gtk_label_get_single_line_mode
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_get_single_line_mode"
		}"
		end

	gtk_label_get_text (a_label: POINTER): POINTER is
 		-- gtk_label_get_text
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_get_text"
		}"
		end

	gtk_label_get_track_visited_links (a_label: POINTER): INTEGER is
 		-- gtk_label_get_track_visited_links
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_get_track_visited_links"
		}"
		end

	gtk_label_get_type: like long_unsigned is
 		-- gtk_label_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_get_type()"
		}"
		end

	gtk_label_get_use_markup (a_label: POINTER): INTEGER is
 		-- gtk_label_get_use_markup
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_get_use_markup"
		}"
		end

	gtk_label_get_use_underline (a_label: POINTER): INTEGER is
 		-- gtk_label_get_use_underline
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_get_use_underline"
		}"
		end

	gtk_label_get_width_chars (a_label: POINTER): INTEGER is
 		-- gtk_label_get_width_chars
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_get_width_chars"
		}"
		end

	-- `hidden' function _gtk_label_mnemonics_visible_apply_recursively skipped.
	gtk_label_new (a_str: POINTER): POINTER is
 		-- gtk_label_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_new"
		}"
		end

	gtk_label_new_with_mnemonic (a_str: POINTER): POINTER is
 		-- gtk_label_new_with_mnemonic
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_new_with_mnemonic"
		}"
		end

	gtk_label_select_region (a_label: POINTER; a_start_offset: INTEGER; an_end_offset: INTEGER) is
 		-- gtk_label_select_region
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_select_region"
		}"
		end

	gtk_label_set_angle (a_label: POINTER; an_angle: REAL) is
 		-- gtk_label_set_angle
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_set_angle"
		}"
		end

	gtk_label_set_attributes (a_label: POINTER; an_attrs: POINTER) is
 		-- gtk_label_set_attributes
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_set_attributes"
		}"
		end

	gtk_label_set_ellipsize (a_label: POINTER; a_mode: INTEGER) is
 		-- gtk_label_set_ellipsize
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_set_ellipsize"
		}"
		end

	gtk_label_set_justify (a_label: POINTER; a_jtype: INTEGER) is
 		-- gtk_label_set_justify
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_set_justify"
		}"
		end

	gtk_label_set_label (a_label: POINTER; a_str: POINTER) is
 		-- gtk_label_set_label
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_set_label"
		}"
		end

	gtk_label_set_line_wrap (a_label: POINTER; a_wrap: INTEGER) is
 		-- gtk_label_set_line_wrap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_set_line_wrap"
		}"
		end

	gtk_label_set_line_wrap_mode (a_label: POINTER; a_wrap_mode: INTEGER) is
 		-- gtk_label_set_line_wrap_mode
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_set_line_wrap_mode"
		}"
		end

	gtk_label_set_markup (a_label: POINTER; a_str: POINTER) is
 		-- gtk_label_set_markup
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_set_markup"
		}"
		end

	gtk_label_set_markup_with_mnemonic (a_label: POINTER; a_str: POINTER) is
 		-- gtk_label_set_markup_with_mnemonic
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_set_markup_with_mnemonic"
		}"
		end

	gtk_label_set_max_width_chars (a_label: POINTER; a_n_chars: INTEGER) is
 		-- gtk_label_set_max_width_chars
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_set_max_width_chars"
		}"
		end

	gtk_label_set_mnemonic_widget (a_label: POINTER; a_widget: POINTER) is
 		-- gtk_label_set_mnemonic_widget
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_set_mnemonic_widget"
		}"
		end

	gtk_label_set_pattern (a_label: POINTER; a_pattern: POINTER) is
 		-- gtk_label_set_pattern
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_set_pattern"
		}"
		end

	gtk_label_set_selectable (a_label: POINTER; a_setting: INTEGER) is
 		-- gtk_label_set_selectable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_set_selectable"
		}"
		end

	gtk_label_set_single_line_mode (a_label: POINTER; a_single_line_mode: INTEGER) is
 		-- gtk_label_set_single_line_mode
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_set_single_line_mode"
		}"
		end

	gtk_label_set_text (a_label: POINTER; a_str: POINTER) is
 		-- gtk_label_set_text
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_set_text"
		}"
		end

	gtk_label_set_text_with_mnemonic (a_label: POINTER; a_str: POINTER) is
 		-- gtk_label_set_text_with_mnemonic
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_set_text_with_mnemonic"
		}"
		end

	gtk_label_set_track_visited_links (a_label: POINTER; a_track_links: INTEGER) is
 		-- gtk_label_set_track_visited_links
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_set_track_visited_links"
		}"
		end

	gtk_label_set_use_markup (a_label: POINTER; a_setting: INTEGER) is
 		-- gtk_label_set_use_markup
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_set_use_markup"
		}"
		end

	gtk_label_set_use_underline (a_label: POINTER; a_setting: INTEGER) is
 		-- gtk_label_set_use_underline
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_set_use_underline"
		}"
		end

	gtk_label_set_width_chars (a_label: POINTER; a_n_chars: INTEGER) is
 		-- gtk_label_set_width_chars
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_set_width_chars"
		}"
		end


end -- class GTKLABEL_EXTERNALS
