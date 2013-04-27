-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKPAGESETUP_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_page_setup_copy (an_other: POINTER): POINTER is
 		-- gtk_page_setup_copy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_copy"
		}"
		end

	gtk_page_setup_get_bottom_margin (a_setup: POINTER; an_unit: INTEGER): REAL is
 		-- gtk_page_setup_get_bottom_margin
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_get_bottom_margin"
		}"
		end

	gtk_page_setup_get_left_margin (a_setup: POINTER; an_unit: INTEGER): REAL is
 		-- gtk_page_setup_get_left_margin
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_get_left_margin"
		}"
		end

	gtk_page_setup_get_orientation (a_setup: POINTER): INTEGER is
 		-- gtk_page_setup_get_orientation
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_get_orientation"
		}"
		end

	gtk_page_setup_get_page_height (a_setup: POINTER; an_unit: INTEGER): REAL is
 		-- gtk_page_setup_get_page_height
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_get_page_height"
		}"
		end

	gtk_page_setup_get_page_width (a_setup: POINTER; an_unit: INTEGER): REAL is
 		-- gtk_page_setup_get_page_width
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_get_page_width"
		}"
		end

	gtk_page_setup_get_paper_height (a_setup: POINTER; an_unit: INTEGER): REAL is
 		-- gtk_page_setup_get_paper_height
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_get_paper_height"
		}"
		end

	gtk_page_setup_get_paper_size (a_setup: POINTER): POINTER is
 		-- gtk_page_setup_get_paper_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_get_paper_size"
		}"
		end

	gtk_page_setup_get_paper_width (a_setup: POINTER; an_unit: INTEGER): REAL is
 		-- gtk_page_setup_get_paper_width
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_get_paper_width"
		}"
		end

	gtk_page_setup_get_right_margin (a_setup: POINTER; an_unit: INTEGER): REAL is
 		-- gtk_page_setup_get_right_margin
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_get_right_margin"
		}"
		end

	gtk_page_setup_get_top_margin (a_setup: POINTER; an_unit: INTEGER): REAL is
 		-- gtk_page_setup_get_top_margin
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_get_top_margin"
		}"
		end

	gtk_page_setup_get_type: like long_unsigned is
 		-- gtk_page_setup_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_get_type()"
		}"
		end

	gtk_page_setup_load_file (a_setup: POINTER; a_file_name: POINTER; an_error: POINTER): INTEGER is
 		-- gtk_page_setup_load_file
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_load_file"
		}"
		end

	gtk_page_setup_load_key_file (a_setup: POINTER; a_key_file: POINTER; a_group_name: POINTER; an_error: POINTER): INTEGER is
 		-- gtk_page_setup_load_key_file
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_load_key_file"
		}"
		end

	gtk_page_setup_new: POINTER is
 		-- gtk_page_setup_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_new()"
		}"
		end

	gtk_page_setup_new_from_file (a_file_name: POINTER; an_error: POINTER): POINTER is
 		-- gtk_page_setup_new_from_file
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_new_from_file"
		}"
		end

	gtk_page_setup_new_from_key_file (a_key_file: POINTER; a_group_name: POINTER; an_error: POINTER): POINTER is
 		-- gtk_page_setup_new_from_key_file
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_new_from_key_file"
		}"
		end

	gtk_page_setup_set_bottom_margin (a_setup: POINTER; a_margin: REAL; an_unit: INTEGER) is
 		-- gtk_page_setup_set_bottom_margin
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_set_bottom_margin"
		}"
		end

	gtk_page_setup_set_left_margin (a_setup: POINTER; a_margin: REAL; an_unit: INTEGER) is
 		-- gtk_page_setup_set_left_margin
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_set_left_margin"
		}"
		end

	gtk_page_setup_set_orientation (a_setup: POINTER; an_orientation: INTEGER) is
 		-- gtk_page_setup_set_orientation
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_set_orientation"
		}"
		end

	gtk_page_setup_set_paper_size (a_setup: POINTER; a_size: POINTER) is
 		-- gtk_page_setup_set_paper_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_set_paper_size"
		}"
		end

	gtk_page_setup_set_paper_size_and_default_margins (a_setup: POINTER; a_size: POINTER) is
 		-- gtk_page_setup_set_paper_size_and_default_margins
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_set_paper_size_and_default_margins"
		}"
		end

	gtk_page_setup_set_right_margin (a_setup: POINTER; a_margin: REAL; an_unit: INTEGER) is
 		-- gtk_page_setup_set_right_margin
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_set_right_margin"
		}"
		end

	gtk_page_setup_set_top_margin (a_setup: POINTER; a_margin: REAL; an_unit: INTEGER) is
 		-- gtk_page_setup_set_top_margin
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_set_top_margin"
		}"
		end

	gtk_page_setup_to_file (a_setup: POINTER; a_file_name: POINTER; an_error: POINTER): INTEGER is
 		-- gtk_page_setup_to_file
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_to_file"
		}"
		end

	gtk_page_setup_to_key_file (a_setup: POINTER; a_key_file: POINTER; a_group_name: POINTER) is
 		-- gtk_page_setup_to_key_file
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_to_key_file"
		}"
		end


end -- class GTKPAGESETUP_EXTERNALS
