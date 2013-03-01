-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKPAPERSIZE_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_paper_size_new_custom (a_name: POINTER; a_display_name: POINTER; a_width: REAL_64; a_height: REAL_64; an_unit: INTEGER): POINTER is
 		-- gtk_paper_size_new_custom (node at line 1779)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_new_custom"
		}"
		end

	gtk_paper_size_to_key_file (a_size: POINTER; a_key_file: POINTER; a_group_name: POINTER) is
 		-- gtk_paper_size_to_key_file (node at line 2933)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_to_key_file"
		}"
		end

	gtk_paper_size_new_from_key_file (a_key_file: POINTER; a_group_name: POINTER; an_error: POINTER): POINTER is
 		-- gtk_paper_size_new_from_key_file (node at line 3444)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_new_from_key_file"
		}"
		end

	gtk_paper_size_set_size (a_size: POINTER; a_width: REAL_64; a_height: REAL_64; an_unit: INTEGER) is
 		-- gtk_paper_size_set_size (node at line 7410)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_set_size"
		}"
		end

	gtk_paper_size_get_name (a_size: POINTER): POINTER is
 		-- gtk_paper_size_get_name (node at line 9045)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_get_name"
		}"
		end

	gtk_paper_size_copy (an_other: POINTER): POINTER is
 		-- gtk_paper_size_copy (node at line 9280)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_copy"
		}"
		end

	gtk_paper_size_get_default_top_margin (a_size: POINTER; an_unit: INTEGER): REAL_64 is
 		-- gtk_paper_size_get_default_top_margin (node at line 10996)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_get_default_top_margin"
		}"
		end

	gtk_paper_size_get_height (a_size: POINTER; an_unit: INTEGER): REAL_64 is
 		-- gtk_paper_size_get_height (node at line 15379)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_get_height"
		}"
		end

	gtk_paper_size_get_width (a_size: POINTER; an_unit: INTEGER): REAL_64 is
 		-- gtk_paper_size_get_width (node at line 15711)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_get_width"
		}"
		end

	gtk_paper_size_get_default: POINTER is
 		-- gtk_paper_size_get_default (node at line 18179)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_get_default()"
		}"
		end

	gtk_paper_size_get_paper_sizes (an_include_custom: INTEGER_32): POINTER is
 		-- gtk_paper_size_get_paper_sizes (node at line 18262)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_get_paper_sizes"
		}"
		end

	gtk_paper_size_new (a_name: POINTER): POINTER is
 		-- gtk_paper_size_new (node at line 19219)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_new"
		}"
		end

	gtk_paper_size_get_default_right_margin (a_size: POINTER; an_unit: INTEGER): REAL_64 is
 		-- gtk_paper_size_get_default_right_margin (node at line 20453)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_get_default_right_margin"
		}"
		end

	gtk_paper_size_new_from_ppd (a_ppd_name: POINTER; a_ppd_display_name: POINTER; a_width: REAL_64; a_height: REAL_64): POINTER is
 		-- gtk_paper_size_new_from_ppd (node at line 22970)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_new_from_ppd"
		}"
		end

	gtk_paper_size_is_equal (a_size1: POINTER; a_size2: POINTER): INTEGER_32 is
 		-- gtk_paper_size_is_equal (node at line 25063)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_is_equal"
		}"
		end

	gtk_paper_size_is_custom (a_size: POINTER): INTEGER_32 is
 		-- gtk_paper_size_is_custom (node at line 25760)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_is_custom"
		}"
		end

	gtk_paper_size_get_default_left_margin (a_size: POINTER; an_unit: INTEGER): REAL_64 is
 		-- gtk_paper_size_get_default_left_margin (node at line 30395)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_get_default_left_margin"
		}"
		end

	gtk_paper_size_get_display_name (a_size: POINTER): POINTER is
 		-- gtk_paper_size_get_display_name (node at line 30914)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_get_display_name"
		}"
		end

	gtk_paper_size_free (a_size: POINTER) is
 		-- gtk_paper_size_free (node at line 34299)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_free"
		}"
		end

	gtk_paper_size_get_default_bottom_margin (a_size: POINTER; an_unit: INTEGER): REAL_64 is
 		-- gtk_paper_size_get_default_bottom_margin (node at line 34671)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_get_default_bottom_margin"
		}"
		end

	gtk_paper_size_get_ppd_name (a_size: POINTER): POINTER is
 		-- gtk_paper_size_get_ppd_name (node at line 38114)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_get_ppd_name"
		}"
		end

	gtk_paper_size_get_type: NATURAL_64 is
 		-- gtk_paper_size_get_type (node at line 39732)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_get_type()"
		}"
		end


end -- class GTKPAPERSIZE_EXTERNALS
