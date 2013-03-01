-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKPAGESETUP_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_page_setup_new: POINTER is
 		-- gtk_page_setup_new (node at line 240)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_new()"
		}"
		end

	gtk_page_setup_set_orientation (a_setup: POINTER; an_orientation: INTEGER) is
 		-- gtk_page_setup_set_orientation (node at line 2142)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_set_orientation"
		}"
		end

	gtk_page_setup_set_bottom_margin (a_setup: POINTER; a_margin: REAL_64; an_unit: INTEGER) is
 		-- gtk_page_setup_set_bottom_margin (node at line 4187)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_set_bottom_margin"
		}"
		end

	gtk_page_setup_to_file (a_setup: POINTER; a_file_name: POINTER; an_error: POINTER): INTEGER_32 is
 		-- gtk_page_setup_to_file (node at line 4300)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_to_file"
		}"
		end

	gtk_page_setup_get_orientation (a_setup: POINTER): INTEGER is
 		-- gtk_page_setup_get_orientation (node at line 4893)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_get_orientation"
		}"
		end

	gtk_page_setup_get_page_width (a_setup: POINTER; an_unit: INTEGER): REAL_64 is
 		-- gtk_page_setup_get_page_width (node at line 8629)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_get_page_width"
		}"
		end

	gtk_page_setup_get_right_margin (a_setup: POINTER; an_unit: INTEGER): REAL_64 is
 		-- gtk_page_setup_get_right_margin (node at line 9881)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_get_right_margin"
		}"
		end

	gtk_page_setup_get_paper_width (a_setup: POINTER; an_unit: INTEGER): REAL_64 is
 		-- gtk_page_setup_get_paper_width (node at line 10190)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_get_paper_width"
		}"
		end

	gtk_page_setup_set_right_margin (a_setup: POINTER; a_margin: REAL_64; an_unit: INTEGER) is
 		-- gtk_page_setup_set_right_margin (node at line 11426)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_set_right_margin"
		}"
		end

	gtk_page_setup_get_top_margin (a_setup: POINTER; an_unit: INTEGER): REAL_64 is
 		-- gtk_page_setup_get_top_margin (node at line 12345)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_get_top_margin"
		}"
		end

	gtk_page_setup_set_left_margin (a_setup: POINTER; a_margin: REAL_64; an_unit: INTEGER) is
 		-- gtk_page_setup_set_left_margin (node at line 13220)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_set_left_margin"
		}"
		end

	gtk_page_setup_set_top_margin (a_setup: POINTER; a_margin: REAL_64; an_unit: INTEGER) is
 		-- gtk_page_setup_set_top_margin (node at line 13662)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_set_top_margin"
		}"
		end

	gtk_page_setup_get_left_margin (a_setup: POINTER; an_unit: INTEGER): REAL_64 is
 		-- gtk_page_setup_get_left_margin (node at line 16288)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_get_left_margin"
		}"
		end

	gtk_page_setup_new_from_file (a_file_name: POINTER; an_error: POINTER): POINTER is
 		-- gtk_page_setup_new_from_file (node at line 16691)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_new_from_file"
		}"
		end

	gtk_page_setup_load_file (a_setup: POINTER; a_file_name: POINTER; an_error: POINTER): INTEGER_32 is
 		-- gtk_page_setup_load_file (node at line 16963)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_load_file"
		}"
		end

	gtk_page_setup_set_paper_size_and_default_margins (a_setup: POINTER; a_size: POINTER) is
 		-- gtk_page_setup_set_paper_size_and_default_margins (node at line 23547)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_set_paper_size_and_default_margins"
		}"
		end

	gtk_page_setup_copy (an_other: POINTER): POINTER is
 		-- gtk_page_setup_copy (node at line 24762)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_copy"
		}"
		end

	gtk_page_setup_get_bottom_margin (a_setup: POINTER; an_unit: INTEGER): REAL_64 is
 		-- gtk_page_setup_get_bottom_margin (node at line 26549)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_get_bottom_margin"
		}"
		end

	gtk_page_setup_new_from_key_file (a_key_file: POINTER; a_group_name: POINTER; an_error: POINTER): POINTER is
 		-- gtk_page_setup_new_from_key_file (node at line 27957)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_new_from_key_file"
		}"
		end

	gtk_page_setup_get_page_height (a_setup: POINTER; an_unit: INTEGER): REAL_64 is
 		-- gtk_page_setup_get_page_height (node at line 30566)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_get_page_height"
		}"
		end

	gtk_page_setup_get_paper_height (a_setup: POINTER; an_unit: INTEGER): REAL_64 is
 		-- gtk_page_setup_get_paper_height (node at line 30797)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_get_paper_height"
		}"
		end

	gtk_page_setup_load_key_file (a_setup: POINTER; a_key_file: POINTER; a_group_name: POINTER; an_error: POINTER): INTEGER_32 is
 		-- gtk_page_setup_load_key_file (node at line 33329)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_load_key_file"
		}"
		end

	gtk_page_setup_to_key_file (a_setup: POINTER; a_key_file: POINTER; a_group_name: POINTER) is
 		-- gtk_page_setup_to_key_file (node at line 35527)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_to_key_file"
		}"
		end

	gtk_page_setup_get_paper_size (a_setup: POINTER): POINTER is
 		-- gtk_page_setup_get_paper_size (node at line 35895)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_get_paper_size"
		}"
		end

	gtk_page_setup_set_paper_size (a_setup: POINTER; a_size: POINTER) is
 		-- gtk_page_setup_set_paper_size (node at line 36261)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_set_paper_size"
		}"
		end

	gtk_page_setup_get_type: NATURAL_64 is
 		-- gtk_page_setup_get_type (node at line 36907)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_setup_get_type()"
		}"
		end


end -- class GTKPAGESETUP_EXTERNALS
