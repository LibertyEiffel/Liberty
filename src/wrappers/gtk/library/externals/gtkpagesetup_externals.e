-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKPAGESETUP_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_page_setup_new: POINTER is
 		-- gtk_page_setup_new (node at line 232)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_new()"
		}"
		end

	gtk_page_setup_set_orientation (a_setup: POINTER; an_orientation: INTEGER) is
 		-- gtk_page_setup_set_orientation (node at line 2267)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_set_orientation"
		}"
		end

	gtk_page_setup_get_paper_height (a_setup: POINTER; an_unit: INTEGER): REAL_64 is
 		-- gtk_page_setup_get_paper_height (node at line 3961)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_get_paper_height"
		}"
		end

	gtk_page_setup_to_file (a_setup: POINTER; a_file_name: POINTER; an_error: POINTER): INTEGER_32 is
 		-- gtk_page_setup_to_file (node at line 4095)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_to_file"
		}"
		end

	gtk_page_setup_set_right_margin (a_setup: POINTER; a_margin: REAL_64; an_unit: INTEGER) is
 		-- gtk_page_setup_set_right_margin (node at line 4499)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_set_right_margin"
		}"
		end

	gtk_page_setup_get_right_margin (a_setup: POINTER; an_unit: INTEGER): REAL_64 is
 		-- gtk_page_setup_get_right_margin (node at line 9091)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_get_right_margin"
		}"
		end

	gtk_page_setup_get_paper_width (a_setup: POINTER; an_unit: INTEGER): REAL_64 is
 		-- gtk_page_setup_get_paper_width (node at line 9438)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_get_paper_width"
		}"
		end

	gtk_page_setup_set_top_margin (a_setup: POINTER; a_margin: REAL_64; an_unit: INTEGER) is
 		-- gtk_page_setup_set_top_margin (node at line 12555)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_set_top_margin"
		}"
		end

	gtk_page_setup_get_page_width (a_setup: POINTER; an_unit: INTEGER): REAL_64 is
 		-- gtk_page_setup_get_page_width (node at line 14965)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_get_page_width"
		}"
		end

	gtk_page_setup_new_from_file (a_file_name: POINTER; an_error: POINTER): POINTER is
 		-- gtk_page_setup_new_from_file (node at line 15378)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_new_from_file"
		}"
		end

	gtk_page_setup_load_file (a_setup: POINTER; a_file_name: POINTER; an_error: POINTER): INTEGER_32 is
 		-- gtk_page_setup_load_file (node at line 15643)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_load_file"
		}"
		end

	gtk_page_setup_get_orientation (a_setup: POINTER): INTEGER is
 		-- gtk_page_setup_get_orientation (node at line 15970)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_get_orientation"
		}"
		end

	gtk_page_setup_set_paper_size_and_default_margins (a_setup: POINTER; a_size: POINTER) is
 		-- gtk_page_setup_set_paper_size_and_default_margins (node at line 21339)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_set_paper_size_and_default_margins"
		}"
		end

	gtk_page_setup_copy (an_other: POINTER): POINTER is
 		-- gtk_page_setup_copy (node at line 22490)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_copy"
		}"
		end

	gtk_page_setup_get_bottom_margin (a_setup: POINTER; an_unit: INTEGER): REAL_64 is
 		-- gtk_page_setup_get_bottom_margin (node at line 24042)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_get_bottom_margin"
		}"
		end

	gtk_page_setup_set_left_margin (a_setup: POINTER; a_margin: REAL_64; an_unit: INTEGER) is
 		-- gtk_page_setup_set_left_margin (node at line 24608)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_set_left_margin"
		}"
		end

	gtk_page_setup_new_from_key_file (a_key_file: POINTER; a_group_name: POINTER; an_error: POINTER): POINTER is
 		-- gtk_page_setup_new_from_key_file (node at line 25226)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_new_from_key_file"
		}"
		end

	gtk_page_setup_get_top_margin (a_setup: POINTER; an_unit: INTEGER): REAL_64 is
 		-- gtk_page_setup_get_top_margin (node at line 27559)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_get_top_margin"
		}"
		end

	gtk_page_setup_set_bottom_margin (a_setup: POINTER; a_margin: REAL_64; an_unit: INTEGER) is
 		-- gtk_page_setup_set_bottom_margin (node at line 29932)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_set_bottom_margin"
		}"
		end

	gtk_page_setup_load_key_file (a_setup: POINTER; a_key_file: POINTER; a_group_name: POINTER; an_error: POINTER): INTEGER_32 is
 		-- gtk_page_setup_load_key_file (node at line 30202)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_load_key_file"
		}"
		end

	gtk_page_setup_to_key_file (a_setup: POINTER; a_key_file: POINTER; a_group_name: POINTER) is
 		-- gtk_page_setup_to_key_file (node at line 32183)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_to_key_file"
		}"
		end

	gtk_page_setup_get_paper_size (a_setup: POINTER): POINTER is
 		-- gtk_page_setup_get_paper_size (node at line 32526)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_get_paper_size"
		}"
		end

	gtk_page_setup_get_page_height (a_setup: POINTER; an_unit: INTEGER): REAL_64 is
 		-- gtk_page_setup_get_page_height (node at line 33249)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_get_page_height"
		}"
		end

	gtk_page_setup_get_type: NATURAL_32 is
 		-- gtk_page_setup_get_type (node at line 33420)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_get_type()"
		}"
		end

	gtk_page_setup_get_left_margin (a_setup: POINTER; an_unit: INTEGER): REAL_64 is
 		-- gtk_page_setup_get_left_margin (node at line 37079)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_get_left_margin"
		}"
		end

	gtk_page_setup_set_paper_size (a_setup: POINTER; a_size: POINTER) is
 		-- gtk_page_setup_set_paper_size (node at line 37440)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_set_paper_size"
		}"
		end


end -- class GTKPAGESETUP_EXTERNALS
