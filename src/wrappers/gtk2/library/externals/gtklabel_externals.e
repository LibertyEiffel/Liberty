-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKLABEL_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_label_get_current_uri (a_label: POINTER): POINTER is
 		-- gtk_label_get_current_uri (node at line 730)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_get_current_uri"
		}"
		end

	gtk_label_set_line_wrap (a_label: POINTER; a_wrap: INTEGER_32) is
 		-- gtk_label_set_line_wrap (node at line 1733)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_set_line_wrap"
		}"
		end

	gtk_label_get_use_underline (a_label: POINTER): INTEGER_32 is
 		-- gtk_label_get_use_underline (node at line 2600)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_get_use_underline"
		}"
		end

	gtk_label_get_layout_offsets (a_label: POINTER; a_x: POINTER; a_y: POINTER) is
 		-- gtk_label_get_layout_offsets (node at line 3719)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_get_layout_offsets"
		}"
		end

	gtk_label_get_mnemonic_widget (a_label: POINTER): POINTER is
 		-- gtk_label_get_mnemonic_widget (node at line 4165)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_get_mnemonic_widget"
		}"
		end

	-- `hidden' function _gtk_label_mnemonics_visible_apply_recursively skipped.
	gtk_label_get_width_chars (a_label: POINTER): INTEGER_32 is
 		-- gtk_label_get_width_chars (node at line 5825)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_get_width_chars"
		}"
		end

	gtk_label_get_max_width_chars (a_label: POINTER): INTEGER_32 is
 		-- gtk_label_get_max_width_chars (node at line 6020)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_get_max_width_chars"
		}"
		end

	gtk_label_set_label (a_label: POINTER; a_str: POINTER) is
 		-- gtk_label_set_label (node at line 9055)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_set_label"
		}"
		end

	gtk_label_set_use_underline (a_label: POINTER; a_setting: INTEGER_32) is
 		-- gtk_label_set_use_underline (node at line 9361)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_set_use_underline"
		}"
		end

	gtk_label_set_line_wrap_mode (a_label: POINTER; a_wrap_mode: INTEGER) is
 		-- gtk_label_set_line_wrap_mode (node at line 11384)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_set_line_wrap_mode"
		}"
		end

	gtk_label_get_mnemonic_keyval (a_label: POINTER): NATURAL_32 is
 		-- gtk_label_get_mnemonic_keyval (node at line 12197)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_get_mnemonic_keyval"
		}"
		end

	gtk_label_get_layout (a_label: POINTER): POINTER is
 		-- gtk_label_get_layout (node at line 14206)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_get_layout"
		}"
		end

	gtk_label_get_text (a_label: POINTER): POINTER is
 		-- gtk_label_get_text (node at line 14550)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_get_text"
		}"
		end

	gtk_label_get_single_line_mode (a_label: POINTER): INTEGER_32 is
 		-- gtk_label_get_single_line_mode (node at line 16011)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_get_single_line_mode"
		}"
		end

	gtk_label_get_justify (a_label: POINTER): INTEGER is
 		-- gtk_label_get_justify (node at line 16127)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_get_justify"
		}"
		end

	gtk_label_set_attributes (a_label: POINTER; an_attrs: POINTER) is
 		-- gtk_label_set_attributes (node at line 16987)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_set_attributes"
		}"
		end

	gtk_label_set_use_markup (a_label: POINTER; a_setting: INTEGER_32) is
 		-- gtk_label_set_use_markup (node at line 21382)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_set_use_markup"
		}"
		end

	gtk_label_get_use_markup (a_label: POINTER): INTEGER_32 is
 		-- gtk_label_get_use_markup (node at line 21530)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_get_use_markup"
		}"
		end

	gtk_label_set_pattern (a_label: POINTER; a_pattern: POINTER) is
 		-- gtk_label_set_pattern (node at line 21786)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_set_pattern"
		}"
		end

	gtk_label_set_text_with_mnemonic (a_label: POINTER; a_str: POINTER) is
 		-- gtk_label_set_text_with_mnemonic (node at line 21965)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_set_text_with_mnemonic"
		}"
		end

	gtk_label_get_track_visited_links (a_label: POINTER): INTEGER_32 is
 		-- gtk_label_get_track_visited_links (node at line 22409)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_get_track_visited_links"
		}"
		end

	gtk_label_set_justify (a_label: POINTER; a_jtype: INTEGER) is
 		-- gtk_label_set_justify (node at line 23047)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_set_justify"
		}"
		end

	gtk_label_set_track_visited_links (a_label: POINTER; a_track_links: INTEGER_32) is
 		-- gtk_label_set_track_visited_links (node at line 23607)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_set_track_visited_links"
		}"
		end

	gtk_label_set_markup_with_mnemonic (a_label: POINTER; a_str: POINTER) is
 		-- gtk_label_set_markup_with_mnemonic (node at line 24921)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_set_markup_with_mnemonic"
		}"
		end

	gtk_label_new_with_mnemonic (a_str: POINTER): POINTER is
 		-- gtk_label_new_with_mnemonic (node at line 26491)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_new_with_mnemonic"
		}"
		end

	gtk_label_get_selectable (a_label: POINTER): INTEGER_32 is
 		-- gtk_label_get_selectable (node at line 27280)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_get_selectable"
		}"
		end

	gtk_label_get_angle (a_label: POINTER): REAL_64 is
 		-- gtk_label_get_angle (node at line 29226)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_get_angle"
		}"
		end

	gtk_label_get_line_wrap_mode (a_label: POINTER): INTEGER is
 		-- gtk_label_get_line_wrap_mode (node at line 30581)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_get_line_wrap_mode"
		}"
		end

	gtk_label_new (a_str: POINTER): POINTER is
 		-- gtk_label_new (node at line 30735)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_new"
		}"
		end

	gtk_label_set_markup (a_label: POINTER; a_str: POINTER) is
 		-- gtk_label_set_markup (node at line 33204)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_set_markup"
		}"
		end

	gtk_label_set_selectable (a_label: POINTER; a_setting: INTEGER_32) is
 		-- gtk_label_set_selectable (node at line 33396)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_set_selectable"
		}"
		end

	gtk_label_set_mnemonic_widget (a_label: POINTER; a_widget: POINTER) is
 		-- gtk_label_set_mnemonic_widget (node at line 33413)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_set_mnemonic_widget"
		}"
		end

	gtk_label_set_width_chars (a_label: POINTER; a_n_chars: INTEGER_32) is
 		-- gtk_label_set_width_chars (node at line 33468)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_set_width_chars"
		}"
		end

	gtk_label_get_attributes (a_label: POINTER): POINTER is
 		-- gtk_label_get_attributes (node at line 33705)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_get_attributes"
		}"
		end

	gtk_label_set_single_line_mode (a_label: POINTER; a_single_line_mode: INTEGER_32) is
 		-- gtk_label_set_single_line_mode (node at line 33980)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_set_single_line_mode"
		}"
		end

	gtk_label_select_region (a_label: POINTER; a_start_offset: INTEGER_32; an_end_offset: INTEGER_32) is
 		-- gtk_label_select_region (node at line 34088)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_select_region"
		}"
		end

	gtk_label_set_max_width_chars (a_label: POINTER; a_n_chars: INTEGER_32) is
 		-- gtk_label_set_max_width_chars (node at line 35151)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_set_max_width_chars"
		}"
		end

	gtk_label_get_ellipsize (a_label: POINTER): INTEGER is
 		-- gtk_label_get_ellipsize (node at line 35486)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_get_ellipsize"
		}"
		end

	gtk_label_get_type: NATURAL_64 is
 		-- gtk_label_get_type (node at line 37023)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_get_type()"
		}"
		end

	gtk_label_set_angle (a_label: POINTER; an_angle: REAL_64) is
 		-- gtk_label_set_angle (node at line 38255)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_set_angle"
		}"
		end

	gtk_label_get_selection_bounds (a_label: POINTER; a_start: POINTER; an_end_external: POINTER): INTEGER_32 is
 		-- gtk_label_get_selection_bounds (node at line 38599)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_get_selection_bounds"
		}"
		end

	gtk_label_get_line_wrap (a_label: POINTER): INTEGER_32 is
 		-- gtk_label_get_line_wrap (node at line 38966)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_get_line_wrap"
		}"
		end

	gtk_label_set_ellipsize (a_label: POINTER; a_mode: INTEGER) is
 		-- gtk_label_set_ellipsize (node at line 39329)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_set_ellipsize"
		}"
		end

	gtk_label_set_text (a_label: POINTER; a_str: POINTER) is
 		-- gtk_label_set_text (node at line 40254)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_set_text"
		}"
		end

	gtk_label_get_label (a_label: POINTER): POINTER is
 		-- gtk_label_get_label (node at line 40326)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_label_get_label"
		}"
		end


end -- class GTKLABEL_EXTERNALS
