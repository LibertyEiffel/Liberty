-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKPAPERSIZE_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_paper_size_copy (an_other: POINTER): POINTER is
 		-- gtk_paper_size_copy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_copy"
		}"
		end

	gtk_paper_size_free (a_size: POINTER) is
 		-- gtk_paper_size_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_free"
		}"
		end

	gtk_paper_size_get_default: POINTER is
 		-- gtk_paper_size_get_default
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_get_default()"
		}"
		end

	gtk_paper_size_get_default_bottom_margin (a_size: POINTER; an_unit: INTEGER): REAL is
 		-- gtk_paper_size_get_default_bottom_margin
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_get_default_bottom_margin"
		}"
		end

	gtk_paper_size_get_default_left_margin (a_size: POINTER; an_unit: INTEGER): REAL is
 		-- gtk_paper_size_get_default_left_margin
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_get_default_left_margin"
		}"
		end

	gtk_paper_size_get_default_right_margin (a_size: POINTER; an_unit: INTEGER): REAL is
 		-- gtk_paper_size_get_default_right_margin
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_get_default_right_margin"
		}"
		end

	gtk_paper_size_get_default_top_margin (a_size: POINTER; an_unit: INTEGER): REAL is
 		-- gtk_paper_size_get_default_top_margin
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_get_default_top_margin"
		}"
		end

	gtk_paper_size_get_display_name (a_size: POINTER): POINTER is
 		-- gtk_paper_size_get_display_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_get_display_name"
		}"
		end

	gtk_paper_size_get_height (a_size: POINTER; an_unit: INTEGER): REAL is
 		-- gtk_paper_size_get_height
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_get_height"
		}"
		end

	gtk_paper_size_get_name (a_size: POINTER): POINTER is
 		-- gtk_paper_size_get_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_get_name"
		}"
		end

	gtk_paper_size_get_paper_sizes (an_include_custom: INTEGER): POINTER is
 		-- gtk_paper_size_get_paper_sizes
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_get_paper_sizes"
		}"
		end

	gtk_paper_size_get_ppd_name (a_size: POINTER): POINTER is
 		-- gtk_paper_size_get_ppd_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_get_ppd_name"
		}"
		end

	gtk_paper_size_get_type: like long_unsigned is
 		-- gtk_paper_size_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_get_type()"
		}"
		end

	gtk_paper_size_get_width (a_size: POINTER; an_unit: INTEGER): REAL is
 		-- gtk_paper_size_get_width
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_get_width"
		}"
		end

	gtk_paper_size_is_custom (a_size: POINTER): INTEGER is
 		-- gtk_paper_size_is_custom
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_is_custom"
		}"
		end

	gtk_paper_size_is_equal (a_size1: POINTER; a_size2: POINTER): INTEGER is
 		-- gtk_paper_size_is_equal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_is_equal"
		}"
		end

	gtk_paper_size_new (a_name: POINTER): POINTER is
 		-- gtk_paper_size_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_new"
		}"
		end

	gtk_paper_size_new_custom (a_name: POINTER; a_display_name: POINTER; a_width: REAL; a_height: REAL; an_unit: INTEGER): POINTER is
 		-- gtk_paper_size_new_custom
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_new_custom"
		}"
		end

	gtk_paper_size_new_from_key_file (a_key_file: POINTER; a_group_name: POINTER; an_error: POINTER): POINTER is
 		-- gtk_paper_size_new_from_key_file
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_new_from_key_file"
		}"
		end

	gtk_paper_size_new_from_ppd (a_ppd_name: POINTER; a_ppd_display_name: POINTER; a_width: REAL; a_height: REAL): POINTER is
 		-- gtk_paper_size_new_from_ppd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_new_from_ppd"
		}"
		end

	gtk_paper_size_set_size (a_size: POINTER; a_width: REAL; a_height: REAL; an_unit: INTEGER) is
 		-- gtk_paper_size_set_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_set_size"
		}"
		end

	gtk_paper_size_to_key_file (a_size: POINTER; a_key_file: POINTER; a_group_name: POINTER) is
 		-- gtk_paper_size_to_key_file
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paper_size_to_key_file"
		}"
		end


end -- class GTKPAPERSIZE_EXTERNALS
