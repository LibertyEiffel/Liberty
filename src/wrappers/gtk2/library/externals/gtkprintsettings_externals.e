-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKPRINTSETTINGS_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_print_settings_copy (an_other: POINTER): POINTER is
 		-- gtk_print_settings_copy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_copy"
		}"
		end

	gtk_print_settings_foreach (a_settings: POINTER; a_func: POINTER; an_user_data: POINTER) is
 		-- gtk_print_settings_foreach
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_foreach"
		}"
		end

	gtk_print_settings_get (a_settings: POINTER; a_key: POINTER): POINTER is
 		-- gtk_print_settings_get
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get"
		}"
		end

	gtk_print_settings_get_bool (a_settings: POINTER; a_key: POINTER): INTEGER is
 		-- gtk_print_settings_get_bool
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_bool"
		}"
		end

	gtk_print_settings_get_collate (a_settings: POINTER): INTEGER is
 		-- gtk_print_settings_get_collate
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_collate"
		}"
		end

	gtk_print_settings_get_default_source (a_settings: POINTER): POINTER is
 		-- gtk_print_settings_get_default_source
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_default_source"
		}"
		end

	gtk_print_settings_get_dither (a_settings: POINTER): POINTER is
 		-- gtk_print_settings_get_dither
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_dither"
		}"
		end

	gtk_print_settings_get_double (a_settings: POINTER; a_key: POINTER): REAL is
 		-- gtk_print_settings_get_double
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_double"
		}"
		end

	gtk_print_settings_get_double_with_default (a_settings: POINTER; a_key: POINTER; a_def: REAL): REAL is
 		-- gtk_print_settings_get_double_with_default
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_double_with_default"
		}"
		end

	gtk_print_settings_get_duplex (a_settings: POINTER): INTEGER is
 		-- gtk_print_settings_get_duplex
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_duplex"
		}"
		end

	gtk_print_settings_get_finishings (a_settings: POINTER): POINTER is
 		-- gtk_print_settings_get_finishings
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_finishings"
		}"
		end

	gtk_print_settings_get_int (a_settings: POINTER; a_key: POINTER): INTEGER is
 		-- gtk_print_settings_get_int
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_int"
		}"
		end

	gtk_print_settings_get_int_with_default (a_settings: POINTER; a_key: POINTER; a_def: INTEGER): INTEGER is
 		-- gtk_print_settings_get_int_with_default
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_int_with_default"
		}"
		end

	gtk_print_settings_get_length (a_settings: POINTER; a_key: POINTER; an_unit: INTEGER): REAL is
 		-- gtk_print_settings_get_length
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_length"
		}"
		end

	gtk_print_settings_get_media_type (a_settings: POINTER): POINTER is
 		-- gtk_print_settings_get_media_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_media_type"
		}"
		end

	gtk_print_settings_get_n_copies (a_settings: POINTER): INTEGER is
 		-- gtk_print_settings_get_n_copies
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_n_copies"
		}"
		end

	gtk_print_settings_get_number_up (a_settings: POINTER): INTEGER is
 		-- gtk_print_settings_get_number_up
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_number_up"
		}"
		end

	gtk_print_settings_get_number_up_layout (a_settings: POINTER): INTEGER is
 		-- gtk_print_settings_get_number_up_layout
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_number_up_layout"
		}"
		end

	gtk_print_settings_get_orientation (a_settings: POINTER): INTEGER is
 		-- gtk_print_settings_get_orientation
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_orientation"
		}"
		end

	gtk_print_settings_get_output_bin (a_settings: POINTER): POINTER is
 		-- gtk_print_settings_get_output_bin
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_output_bin"
		}"
		end

	gtk_print_settings_get_page_ranges (a_settings: POINTER; a_num_ranges: POINTER): POINTER is
 		-- gtk_print_settings_get_page_ranges
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_page_ranges"
		}"
		end

	gtk_print_settings_get_page_set (a_settings: POINTER): INTEGER is
 		-- gtk_print_settings_get_page_set
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_page_set"
		}"
		end

	gtk_print_settings_get_paper_height (a_settings: POINTER; an_unit: INTEGER): REAL is
 		-- gtk_print_settings_get_paper_height
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_paper_height"
		}"
		end

	gtk_print_settings_get_paper_size (a_settings: POINTER): POINTER is
 		-- gtk_print_settings_get_paper_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_paper_size"
		}"
		end

	gtk_print_settings_get_paper_width (a_settings: POINTER; an_unit: INTEGER): REAL is
 		-- gtk_print_settings_get_paper_width
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_paper_width"
		}"
		end

	gtk_print_settings_get_print_pages (a_settings: POINTER): INTEGER is
 		-- gtk_print_settings_get_print_pages
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_print_pages"
		}"
		end

	gtk_print_settings_get_printer (a_settings: POINTER): POINTER is
 		-- gtk_print_settings_get_printer
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_printer"
		}"
		end

	gtk_print_settings_get_printer_lpi (a_settings: POINTER): REAL is
 		-- gtk_print_settings_get_printer_lpi
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_printer_lpi"
		}"
		end

	gtk_print_settings_get_quality (a_settings: POINTER): INTEGER is
 		-- gtk_print_settings_get_quality
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_quality"
		}"
		end

	gtk_print_settings_get_resolution (a_settings: POINTER): INTEGER is
 		-- gtk_print_settings_get_resolution
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_resolution"
		}"
		end

	gtk_print_settings_get_resolution_x (a_settings: POINTER): INTEGER is
 		-- gtk_print_settings_get_resolution_x
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_resolution_x"
		}"
		end

	gtk_print_settings_get_resolution_y (a_settings: POINTER): INTEGER is
 		-- gtk_print_settings_get_resolution_y
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_resolution_y"
		}"
		end

	gtk_print_settings_get_reverse (a_settings: POINTER): INTEGER is
 		-- gtk_print_settings_get_reverse
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_reverse"
		}"
		end

	gtk_print_settings_get_scale (a_settings: POINTER): REAL is
 		-- gtk_print_settings_get_scale
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_scale"
		}"
		end

	gtk_print_settings_get_type: like long_unsigned is
 		-- gtk_print_settings_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_type()"
		}"
		end

	gtk_print_settings_get_use_color (a_settings: POINTER): INTEGER is
 		-- gtk_print_settings_get_use_color
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_get_use_color"
		}"
		end

	gtk_print_settings_has_key (a_settings: POINTER; a_key: POINTER): INTEGER is
 		-- gtk_print_settings_has_key
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_has_key"
		}"
		end

	gtk_print_settings_load_file (a_settings: POINTER; a_file_name: POINTER; an_error: POINTER): INTEGER is
 		-- gtk_print_settings_load_file
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_load_file"
		}"
		end

	gtk_print_settings_load_key_file (a_settings: POINTER; a_key_file: POINTER; a_group_name: POINTER; an_error: POINTER): INTEGER is
 		-- gtk_print_settings_load_key_file
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_load_key_file"
		}"
		end

	gtk_print_settings_new: POINTER is
 		-- gtk_print_settings_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_new()"
		}"
		end

	gtk_print_settings_new_from_file (a_file_name: POINTER; an_error: POINTER): POINTER is
 		-- gtk_print_settings_new_from_file
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_new_from_file"
		}"
		end

	gtk_print_settings_new_from_key_file (a_key_file: POINTER; a_group_name: POINTER; an_error: POINTER): POINTER is
 		-- gtk_print_settings_new_from_key_file
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_new_from_key_file"
		}"
		end

	gtk_print_settings_set (a_settings: POINTER; a_key: POINTER; a_value: POINTER) is
 		-- gtk_print_settings_set
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set"
		}"
		end

	gtk_print_settings_set_bool (a_settings: POINTER; a_key: POINTER; a_value: INTEGER) is
 		-- gtk_print_settings_set_bool
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_bool"
		}"
		end

	gtk_print_settings_set_collate (a_settings: POINTER; a_collate: INTEGER) is
 		-- gtk_print_settings_set_collate
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_collate"
		}"
		end

	gtk_print_settings_set_default_source (a_settings: POINTER; a_default_source: POINTER) is
 		-- gtk_print_settings_set_default_source
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_default_source"
		}"
		end

	gtk_print_settings_set_dither (a_settings: POINTER; a_dither: POINTER) is
 		-- gtk_print_settings_set_dither
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_dither"
		}"
		end

	gtk_print_settings_set_double (a_settings: POINTER; a_key: POINTER; a_value: REAL) is
 		-- gtk_print_settings_set_double
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_double"
		}"
		end

	gtk_print_settings_set_duplex (a_settings: POINTER; a_duplex: INTEGER) is
 		-- gtk_print_settings_set_duplex
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_duplex"
		}"
		end

	gtk_print_settings_set_finishings (a_settings: POINTER; a_finishings: POINTER) is
 		-- gtk_print_settings_set_finishings
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_finishings"
		}"
		end

	gtk_print_settings_set_int (a_settings: POINTER; a_key: POINTER; a_value: INTEGER) is
 		-- gtk_print_settings_set_int
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_int"
		}"
		end

	gtk_print_settings_set_length (a_settings: POINTER; a_key: POINTER; a_value: REAL; an_unit: INTEGER) is
 		-- gtk_print_settings_set_length
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_length"
		}"
		end

	gtk_print_settings_set_media_type (a_settings: POINTER; a_media_type: POINTER) is
 		-- gtk_print_settings_set_media_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_media_type"
		}"
		end

	gtk_print_settings_set_n_copies (a_settings: POINTER; a_num_copies: INTEGER) is
 		-- gtk_print_settings_set_n_copies
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_n_copies"
		}"
		end

	gtk_print_settings_set_number_up (a_settings: POINTER; a_number_up: INTEGER) is
 		-- gtk_print_settings_set_number_up
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_number_up"
		}"
		end

	gtk_print_settings_set_number_up_layout (a_settings: POINTER; a_number_up_layout: INTEGER) is
 		-- gtk_print_settings_set_number_up_layout
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_number_up_layout"
		}"
		end

	gtk_print_settings_set_orientation (a_settings: POINTER; an_orientation: INTEGER) is
 		-- gtk_print_settings_set_orientation
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_orientation"
		}"
		end

	gtk_print_settings_set_output_bin (a_settings: POINTER; an_output_bin: POINTER) is
 		-- gtk_print_settings_set_output_bin
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_output_bin"
		}"
		end

	gtk_print_settings_set_page_ranges (a_settings: POINTER; a_page_ranges: POINTER; a_num_ranges: INTEGER) is
 		-- gtk_print_settings_set_page_ranges
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_page_ranges"
		}"
		end

	gtk_print_settings_set_page_set (a_settings: POINTER; a_page_set: INTEGER) is
 		-- gtk_print_settings_set_page_set
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_page_set"
		}"
		end

	gtk_print_settings_set_paper_height (a_settings: POINTER; a_height: REAL; an_unit: INTEGER) is
 		-- gtk_print_settings_set_paper_height
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_paper_height"
		}"
		end

	gtk_print_settings_set_paper_size (a_settings: POINTER; a_paper_size: POINTER) is
 		-- gtk_print_settings_set_paper_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_paper_size"
		}"
		end

	gtk_print_settings_set_paper_width (a_settings: POINTER; a_width: REAL; an_unit: INTEGER) is
 		-- gtk_print_settings_set_paper_width
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_paper_width"
		}"
		end

	gtk_print_settings_set_print_pages (a_settings: POINTER; a_pages: INTEGER) is
 		-- gtk_print_settings_set_print_pages
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_print_pages"
		}"
		end

	gtk_print_settings_set_printer (a_settings: POINTER; a_printer: POINTER) is
 		-- gtk_print_settings_set_printer
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_printer"
		}"
		end

	gtk_print_settings_set_printer_lpi (a_settings: POINTER; a_lpi: REAL) is
 		-- gtk_print_settings_set_printer_lpi
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_printer_lpi"
		}"
		end

	gtk_print_settings_set_quality (a_settings: POINTER; a_quality: INTEGER) is
 		-- gtk_print_settings_set_quality
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_quality"
		}"
		end

	gtk_print_settings_set_resolution (a_settings: POINTER; a_resolution: INTEGER) is
 		-- gtk_print_settings_set_resolution
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_resolution"
		}"
		end

	gtk_print_settings_set_resolution_xy (a_settings: POINTER; a_resolution_x: INTEGER; a_resolution_y: INTEGER) is
 		-- gtk_print_settings_set_resolution_xy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_resolution_xy"
		}"
		end

	gtk_print_settings_set_reverse (a_settings: POINTER; a_reverse: INTEGER) is
 		-- gtk_print_settings_set_reverse
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_reverse"
		}"
		end

	gtk_print_settings_set_scale (a_settings: POINTER; a_scale: REAL) is
 		-- gtk_print_settings_set_scale
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_scale"
		}"
		end

	gtk_print_settings_set_use_color (a_settings: POINTER; an_use_color: INTEGER) is
 		-- gtk_print_settings_set_use_color
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_set_use_color"
		}"
		end

	gtk_print_settings_to_file (a_settings: POINTER; a_file_name: POINTER; an_error: POINTER): INTEGER is
 		-- gtk_print_settings_to_file
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_to_file"
		}"
		end

	gtk_print_settings_to_key_file (a_settings: POINTER; a_key_file: POINTER; a_group_name: POINTER) is
 		-- gtk_print_settings_to_key_file
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_to_key_file"
		}"
		end

	gtk_print_settings_unset (a_settings: POINTER; a_key: POINTER) is
 		-- gtk_print_settings_unset
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_settings_unset"
		}"
		end


end -- class GTKPRINTSETTINGS_EXTERNALS
