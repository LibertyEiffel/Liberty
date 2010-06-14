-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKPRINTSETTINGS_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_print_settings_get_finishings (a_settings: POINTER): POINTER is
 		-- gtk_print_settings_get_finishings (node at line 420)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_finishings"
		}"
		end

	gtk_print_settings_to_key_file (a_settings: POINTER; a_key_file: POINTER; a_group_name: POINTER) is
 		-- gtk_print_settings_to_key_file (node at line 1017)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_to_key_file"
		}"
		end

	gtk_print_settings_set_default_source (a_settings: POINTER; a_default_source: POINTER) is
 		-- gtk_print_settings_set_default_source (node at line 1051)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_default_source"
		}"
		end

	gtk_print_settings_set_quality (a_settings: POINTER; a_quality: INTEGER) is
 		-- gtk_print_settings_set_quality (node at line 1092)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_quality"
		}"
		end

	gtk_print_settings_unset (a_settings: POINTER; a_key: POINTER) is
 		-- gtk_print_settings_unset (node at line 1234)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_unset"
		}"
		end

	gtk_print_settings_set_printer_lpi (a_settings: POINTER; a_lpi: REAL_64) is
 		-- gtk_print_settings_set_printer_lpi (node at line 1378)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_printer_lpi"
		}"
		end

	gtk_print_settings_get_paper_size (a_settings: POINTER): POINTER is
 		-- gtk_print_settings_get_paper_size (node at line 2512)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_paper_size"
		}"
		end

	gtk_print_settings_get_print_pages (a_settings: POINTER): INTEGER is
 		-- gtk_print_settings_get_print_pages (node at line 5084)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_print_pages"
		}"
		end

	gtk_print_settings_set_dither (a_settings: POINTER; a_dither: POINTER) is
 		-- gtk_print_settings_set_dither (node at line 5345)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_dither"
		}"
		end

	gtk_print_settings_set_finishings (a_settings: POINTER; a_finishings: POINTER) is
 		-- gtk_print_settings_set_finishings (node at line 6441)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_finishings"
		}"
		end

	gtk_print_settings_set_paper_size (a_settings: POINTER; a_paper_size: POINTER) is
 		-- gtk_print_settings_set_paper_size (node at line 8217)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_paper_size"
		}"
		end

	gtk_print_settings_set_double (a_settings: POINTER; a_key: POINTER; a_value: REAL_64) is
 		-- gtk_print_settings_set_double (node at line 8302)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_double"
		}"
		end

	gtk_print_settings_get_use_color (a_settings: POINTER): INTEGER_32 is
 		-- gtk_print_settings_get_use_color (node at line 8863)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_use_color"
		}"
		end

	gtk_print_settings_get_length (a_settings: POINTER; a_key: POINTER; an_unit: INTEGER): REAL_64 is
 		-- gtk_print_settings_get_length (node at line 8930)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_length"
		}"
		end

	gtk_print_settings_get_double_with_default (a_settings: POINTER; a_key: POINTER; a_def: REAL_64): REAL_64 is
 		-- gtk_print_settings_get_double_with_default (node at line 9014)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_double_with_default"
		}"
		end

	gtk_print_settings_get_number_up (a_settings: POINTER): INTEGER_32 is
 		-- gtk_print_settings_get_number_up (node at line 9325)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_number_up"
		}"
		end

	gtk_print_settings_set_number_up_layout (a_settings: POINTER; a_number_up_layout: INTEGER) is
 		-- gtk_print_settings_set_number_up_layout (node at line 9854)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_number_up_layout"
		}"
		end

	gtk_print_settings_get_duplex (a_settings: POINTER): INTEGER is
 		-- gtk_print_settings_get_duplex (node at line 9997)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_duplex"
		}"
		end

	gtk_print_settings_get_orientation (a_settings: POINTER): INTEGER is
 		-- gtk_print_settings_get_orientation (node at line 10122)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_orientation"
		}"
		end

	gtk_print_settings_new: POINTER is
 		-- gtk_print_settings_new (node at line 11226)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_new()"
		}"
		end

	gtk_print_settings_get_page_ranges (a_settings: POINTER; a_num_ranges: POINTER): POINTER is
 		-- gtk_print_settings_get_page_ranges (node at line 13132)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_page_ranges"
		}"
		end

	gtk_print_settings_get_scale (a_settings: POINTER): REAL_64 is
 		-- gtk_print_settings_get_scale (node at line 13250)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_scale"
		}"
		end

	gtk_print_settings_set_number_up (a_settings: POINTER; a_number_up: INTEGER_32) is
 		-- gtk_print_settings_set_number_up (node at line 13531)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_number_up"
		}"
		end

	gtk_print_settings_get_resolution (a_settings: POINTER): INTEGER_32 is
 		-- gtk_print_settings_get_resolution (node at line 14145)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_resolution"
		}"
		end

	gtk_print_settings_new_from_file (a_file_name: POINTER; an_error: POINTER): POINTER is
 		-- gtk_print_settings_new_from_file (node at line 14929)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_new_from_file"
		}"
		end

	gtk_print_settings_set_resolution_xy (a_settings: POINTER; a_resolution_x: INTEGER_32; a_resolution_y: INTEGER_32) is
 		-- gtk_print_settings_set_resolution_xy (node at line 14934)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_resolution_xy"
		}"
		end

	gtk_print_settings_foreach (a_settings: POINTER; a_func: POINTER; an_user_data: POINTER) is
 		-- gtk_print_settings_foreach (node at line 15226)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_foreach"
		}"
		end

	gtk_print_settings_get_resolution_x (a_settings: POINTER): INTEGER_32 is
 		-- gtk_print_settings_get_resolution_x (node at line 15895)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_resolution_x"
		}"
		end

	gtk_print_settings_get_resolution_y (a_settings: POINTER): INTEGER_32 is
 		-- gtk_print_settings_get_resolution_y (node at line 15898)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_resolution_y"
		}"
		end

	gtk_print_settings_copy (an_other: POINTER): POINTER is
 		-- gtk_print_settings_copy (node at line 17222)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_copy"
		}"
		end

	gtk_print_settings_get_printer (a_settings: POINTER): POINTER is
 		-- gtk_print_settings_get_printer (node at line 17448)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_printer"
		}"
		end

	gtk_print_settings_get_reverse (a_settings: POINTER): INTEGER_32 is
 		-- gtk_print_settings_get_reverse (node at line 18064)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_reverse"
		}"
		end

	gtk_print_settings_to_file (a_settings: POINTER; a_file_name: POINTER; an_error: POINTER): INTEGER_32 is
 		-- gtk_print_settings_to_file (node at line 18312)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_to_file"
		}"
		end

	gtk_print_settings_set_int (a_settings: POINTER; a_key: POINTER; a_value: INTEGER_32) is
 		-- gtk_print_settings_set_int (node at line 18486)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_int"
		}"
		end

	gtk_print_settings_get_bool (a_settings: POINTER; a_key: POINTER): INTEGER_32 is
 		-- gtk_print_settings_get_bool (node at line 19293)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_bool"
		}"
		end

	gtk_print_settings_set_resolution (a_settings: POINTER; a_resolution: INTEGER_32) is
 		-- gtk_print_settings_set_resolution (node at line 19509)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_resolution"
		}"
		end

	gtk_print_settings_set_page_set (a_settings: POINTER; a_page_set: INTEGER) is
 		-- gtk_print_settings_set_page_set (node at line 20006)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_page_set"
		}"
		end

	gtk_print_settings_get_paper_width (a_settings: POINTER; an_unit: INTEGER): REAL_64 is
 		-- gtk_print_settings_get_paper_width (node at line 20661)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_paper_width"
		}"
		end

	gtk_print_settings_get_page_set (a_settings: POINTER): INTEGER is
 		-- gtk_print_settings_get_page_set (node at line 21041)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_page_set"
		}"
		end

	gtk_print_settings_get_dither (a_settings: POINTER): POINTER is
 		-- gtk_print_settings_get_dither (node at line 21313)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_dither"
		}"
		end

	gtk_print_settings_set_printer (a_settings: POINTER; a_printer: POINTER) is
 		-- gtk_print_settings_set_printer (node at line 23289)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_printer"
		}"
		end

	gtk_print_settings_set (a_settings: POINTER; a_key: POINTER; a_value: POINTER) is
 		-- gtk_print_settings_set (node at line 23804)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set"
		}"
		end

	gtk_print_settings_set_reverse (a_settings: POINTER; a_reverse: INTEGER_32) is
 		-- gtk_print_settings_set_reverse (node at line 23825)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_reverse"
		}"
		end

	gtk_print_settings_get_double (a_settings: POINTER; a_key: POINTER): REAL_64 is
 		-- gtk_print_settings_get_double (node at line 23897)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_double"
		}"
		end

	gtk_print_settings_get_output_bin (a_settings: POINTER): POINTER is
 		-- gtk_print_settings_get_output_bin (node at line 24404)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_output_bin"
		}"
		end

	gtk_print_settings_set_paper_height (a_settings: POINTER; a_height: REAL_64; an_unit: INTEGER) is
 		-- gtk_print_settings_set_paper_height (node at line 26818)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_paper_height"
		}"
		end

	gtk_print_settings_get_media_type (a_settings: POINTER): POINTER is
 		-- gtk_print_settings_get_media_type (node at line 27290)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_media_type"
		}"
		end

	gtk_print_settings_set_paper_width (a_settings: POINTER; a_width: REAL_64; an_unit: INTEGER) is
 		-- gtk_print_settings_set_paper_width (node at line 28096)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_paper_width"
		}"
		end

	gtk_print_settings_get_collate (a_settings: POINTER): INTEGER_32 is
 		-- gtk_print_settings_get_collate (node at line 29122)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_collate"
		}"
		end

	gtk_print_settings_get_int_with_default (a_settings: POINTER; a_key: POINTER; a_def: INTEGER_32): INTEGER_32 is
 		-- gtk_print_settings_get_int_with_default (node at line 29732)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_int_with_default"
		}"
		end

	gtk_print_settings_load_key_file (a_settings: POINTER; a_key_file: POINTER; a_group_name: POINTER; an_error: POINTER): INTEGER_32 is
 		-- gtk_print_settings_load_key_file (node at line 29797)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_load_key_file"
		}"
		end

	gtk_print_settings_set_print_pages (a_settings: POINTER; a_pages: INTEGER) is
 		-- gtk_print_settings_set_print_pages (node at line 29900)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_print_pages"
		}"
		end

	gtk_print_settings_set_output_bin (a_settings: POINTER; an_output_bin: POINTER) is
 		-- gtk_print_settings_set_output_bin (node at line 29955)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_output_bin"
		}"
		end

	gtk_print_settings_get_type: NATURAL_32 is
 		-- gtk_print_settings_get_type (node at line 30086)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_type()"
		}"
		end

	gtk_print_settings_get (a_settings: POINTER; a_key: POINTER): POINTER is
 		-- gtk_print_settings_get (node at line 30541)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get"
		}"
		end

	gtk_print_settings_get_number_up_layout (a_settings: POINTER): INTEGER is
 		-- gtk_print_settings_get_number_up_layout (node at line 30864)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_number_up_layout"
		}"
		end

	gtk_print_settings_set_length (a_settings: POINTER; a_key: POINTER; a_value: REAL_64; an_unit: INTEGER) is
 		-- gtk_print_settings_set_length (node at line 30997)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_length"
		}"
		end

	gtk_print_settings_get_default_source (a_settings: POINTER): POINTER is
 		-- gtk_print_settings_get_default_source (node at line 31031)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_default_source"
		}"
		end

	gtk_print_settings_get_paper_height (a_settings: POINTER; an_unit: INTEGER): REAL_64 is
 		-- gtk_print_settings_get_paper_height (node at line 31245)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_paper_height"
		}"
		end

	gtk_print_settings_set_duplex (a_settings: POINTER; a_duplex: INTEGER) is
 		-- gtk_print_settings_set_duplex (node at line 31646)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_duplex"
		}"
		end

	gtk_print_settings_set_media_type (a_settings: POINTER; a_media_type: POINTER) is
 		-- gtk_print_settings_set_media_type (node at line 32548)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_media_type"
		}"
		end

	gtk_print_settings_new_from_key_file (a_key_file: POINTER; a_group_name: POINTER; an_error: POINTER): POINTER is
 		-- gtk_print_settings_new_from_key_file (node at line 32683)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_new_from_key_file"
		}"
		end

	gtk_print_settings_set_use_color (a_settings: POINTER; an_use_color: INTEGER_32) is
 		-- gtk_print_settings_set_use_color (node at line 32782)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_use_color"
		}"
		end

	gtk_print_settings_get_quality (a_settings: POINTER): INTEGER is
 		-- gtk_print_settings_get_quality (node at line 32928)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_quality"
		}"
		end

	gtk_print_settings_load_file (a_settings: POINTER; a_file_name: POINTER; an_error: POINTER): INTEGER_32 is
 		-- gtk_print_settings_load_file (node at line 33668)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_load_file"
		}"
		end

	gtk_print_settings_set_orientation (a_settings: POINTER; an_orientation: INTEGER) is
 		-- gtk_print_settings_set_orientation (node at line 34137)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_orientation"
		}"
		end

	gtk_print_settings_get_printer_lpi (a_settings: POINTER): REAL_64 is
 		-- gtk_print_settings_get_printer_lpi (node at line 34334)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_printer_lpi"
		}"
		end

	gtk_print_settings_set_n_copies (a_settings: POINTER; a_num_copies: INTEGER_32) is
 		-- gtk_print_settings_set_n_copies (node at line 34407)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_n_copies"
		}"
		end

	gtk_print_settings_has_key (a_settings: POINTER; a_key: POINTER): INTEGER_32 is
 		-- gtk_print_settings_has_key (node at line 34714)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_has_key"
		}"
		end

	gtk_print_settings_set_collate (a_settings: POINTER; a_collate: INTEGER_32) is
 		-- gtk_print_settings_set_collate (node at line 34718)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_collate"
		}"
		end

	gtk_print_settings_set_scale (a_settings: POINTER; a_scale: REAL_64) is
 		-- gtk_print_settings_set_scale (node at line 34769)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_scale"
		}"
		end

	gtk_print_settings_get_n_copies (a_settings: POINTER): INTEGER_32 is
 		-- gtk_print_settings_get_n_copies (node at line 35327)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_n_copies"
		}"
		end

	gtk_print_settings_set_bool (a_settings: POINTER; a_key: POINTER; a_value: INTEGER_32) is
 		-- gtk_print_settings_set_bool (node at line 35480)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_bool"
		}"
		end

	gtk_print_settings_set_page_ranges (a_settings: POINTER; a_page_ranges: POINTER; a_num_ranges: INTEGER_32) is
 		-- gtk_print_settings_set_page_ranges (node at line 36797)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_page_ranges"
		}"
		end

	gtk_print_settings_get_int (a_settings: POINTER; a_key: POINTER): INTEGER_32 is
 		-- gtk_print_settings_get_int (node at line 37479)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_int"
		}"
		end


end -- class GTKPRINTSETTINGS_EXTERNALS
