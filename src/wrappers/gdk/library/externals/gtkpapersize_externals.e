-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKPAPERSIZE_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_paper_size_new_custom (a_name: POINTER; a_display_name: POINTER; a_width: REAL_64; a_height: REAL_64; an_unit: INTEGER): POINTER is
 		-- gtk_paper_size_new_custom (node at line 1912)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_new_custom"
		}"
		end

	gtk_paper_size_to_key_file (a_size: POINTER; a_key_file: POINTER; a_group_name: POINTER) is
 		-- gtk_paper_size_to_key_file (node at line 2891)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_to_key_file"
		}"
		end

	gtk_paper_size_set_size (a_size: POINTER; a_width: REAL_64; a_height: REAL_64; an_unit: INTEGER) is
 		-- gtk_paper_size_set_size (node at line 6776)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_set_size"
		}"
		end

	gtk_paper_size_get_name (a_size: POINTER): POINTER is
 		-- gtk_paper_size_get_name (node at line 8356)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_get_name"
		}"
		end

	gtk_paper_size_get_default_top_margin (a_size: POINTER; an_unit: INTEGER): REAL_64 is
 		-- gtk_paper_size_get_default_top_margin (node at line 14221)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_get_default_top_margin"
		}"
		end

	gtk_paper_size_get_width (a_size: POINTER; an_unit: INTEGER): REAL_64 is
 		-- gtk_paper_size_get_width (node at line 14529)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_get_width"
		}"
		end

	gtk_paper_size_get_type: NATURAL_32 is
 		-- gtk_paper_size_get_type (node at line 15687)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_get_type()"
		}"
		end

	gtk_paper_size_get_default: POINTER is
 		-- gtk_paper_size_get_default (node at line 16709)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_get_default()"
		}"
		end

	gtk_paper_size_get_paper_sizes (an_include_custom: INTEGER_32): POINTER is
 		-- gtk_paper_size_get_paper_sizes (node at line 16760)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_get_paper_sizes"
		}"
		end

	gtk_paper_size_new (a_name: POINTER): POINTER is
 		-- gtk_paper_size_new (node at line 17543)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_new"
		}"
		end

	gtk_paper_size_new_from_ppd (a_ppd_name: POINTER; a_ppd_display_name: POINTER; a_width: REAL_64; a_height: REAL_64): POINTER is
 		-- gtk_paper_size_new_from_ppd (node at line 20853)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_new_from_ppd"
		}"
		end

	gtk_paper_size_is_equal (a_size1: POINTER; a_size2: POINTER): INTEGER_32 is
 		-- gtk_paper_size_is_equal (node at line 22778)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_is_equal"
		}"
		end

	gtk_paper_size_is_custom (a_size: POINTER): INTEGER_32 is
 		-- gtk_paper_size_is_custom (node at line 23396)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_is_custom"
		}"
		end

	gtk_paper_size_get_default_left_margin (a_size: POINTER; an_unit: INTEGER): REAL_64 is
 		-- gtk_paper_size_get_default_left_margin (node at line 27528)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_get_default_left_margin"
		}"
		end

	gtk_paper_size_get_display_name (a_size: POINTER): POINTER is
 		-- gtk_paper_size_get_display_name (node at line 27961)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_get_display_name"
		}"
		end

	gtk_paper_size_get_default_bottom_margin (a_size: POINTER; an_unit: INTEGER): REAL_64 is
 		-- gtk_paper_size_get_default_bottom_margin (node at line 29474)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_get_default_bottom_margin"
		}"
		end

	gtk_paper_size_new_from_key_file (a_key_file: POINTER; a_group_name: POINTER; an_error: POINTER): POINTER is
 		-- gtk_paper_size_new_from_key_file (node at line 29904)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_new_from_key_file"
		}"
		end

	gtk_paper_size_get_height (a_size: POINTER; an_unit: INTEGER): REAL_64 is
 		-- gtk_paper_size_get_height (node at line 31354)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_get_height"
		}"
		end

	gtk_paper_size_get_ppd_name (a_size: POINTER): POINTER is
 		-- gtk_paper_size_get_ppd_name (node at line 34594)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_get_ppd_name"
		}"
		end

	gtk_paper_size_free (a_size: POINTER) is
 		-- gtk_paper_size_free (node at line 35575)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_free"
		}"
		end

	gtk_paper_size_copy (an_other: POINTER): POINTER is
 		-- gtk_paper_size_copy (node at line 36907)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_copy"
		}"
		end

	gtk_paper_size_get_default_right_margin (a_size: POINTER; an_unit: INTEGER): REAL_64 is
 		-- gtk_paper_size_get_default_right_margin (node at line 37189)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_get_default_right_margin"
		}"
		end


end -- class GTKPAPERSIZE_EXTERNALS
