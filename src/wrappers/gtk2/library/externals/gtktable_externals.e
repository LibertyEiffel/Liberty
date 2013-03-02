-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTABLE_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_table_attach (a_table: POINTER; a_child: POINTER; a_left_attach: NATURAL_32; a_right_attach: NATURAL_32; a_top_attach: NATURAL_32; a_bottom_attach: NATURAL_32; a_xoptions: INTEGER; a_yoptions: INTEGER; a_xpadding: NATURAL_32; a_ypadding: NATURAL_32) is
 		-- gtk_table_attach
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_table_attach"
		}"
		end

	gtk_table_attach_defaults (a_table: POINTER; a_widget: POINTER; a_left_attach: NATURAL_32; a_right_attach: NATURAL_32; a_top_attach: NATURAL_32; a_bottom_attach: NATURAL_32) is
 		-- gtk_table_attach_defaults
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_table_attach_defaults"
		}"
		end

	gtk_table_get_col_spacing (a_table: POINTER; a_column: NATURAL_32): NATURAL_32 is
 		-- gtk_table_get_col_spacing
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_table_get_col_spacing"
		}"
		end

	gtk_table_get_default_col_spacing (a_table: POINTER): NATURAL_32 is
 		-- gtk_table_get_default_col_spacing
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_table_get_default_col_spacing"
		}"
		end

	gtk_table_get_default_row_spacing (a_table: POINTER): NATURAL_32 is
 		-- gtk_table_get_default_row_spacing
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_table_get_default_row_spacing"
		}"
		end

	gtk_table_get_homogeneous (a_table: POINTER): INTEGER_32 is
 		-- gtk_table_get_homogeneous
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_table_get_homogeneous"
		}"
		end

	gtk_table_get_row_spacing (a_table: POINTER; a_row: NATURAL_32): NATURAL_32 is
 		-- gtk_table_get_row_spacing
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_table_get_row_spacing"
		}"
		end

	gtk_table_get_size (a_table: POINTER; a_rows: POINTER; a_columns: POINTER) is
 		-- gtk_table_get_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_table_get_size"
		}"
		end

	gtk_table_get_type: NATURAL_64 is
 		-- gtk_table_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_table_get_type()"
		}"
		end

	gtk_table_new (a_rows: NATURAL_32; a_columns: NATURAL_32; a_homogeneous: INTEGER_32): POINTER is
 		-- gtk_table_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_table_new"
		}"
		end

	gtk_table_resize (a_table: POINTER; a_rows: NATURAL_32; a_columns: NATURAL_32) is
 		-- gtk_table_resize
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_table_resize"
		}"
		end

	gtk_table_set_col_spacing (a_table: POINTER; a_column: NATURAL_32; a_spacing: NATURAL_32) is
 		-- gtk_table_set_col_spacing
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_table_set_col_spacing"
		}"
		end

	gtk_table_set_col_spacings (a_table: POINTER; a_spacing: NATURAL_32) is
 		-- gtk_table_set_col_spacings
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_table_set_col_spacings"
		}"
		end

	gtk_table_set_homogeneous (a_table: POINTER; a_homogeneous: INTEGER_32) is
 		-- gtk_table_set_homogeneous
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_table_set_homogeneous"
		}"
		end

	gtk_table_set_row_spacing (a_table: POINTER; a_row: NATURAL_32; a_spacing: NATURAL_32) is
 		-- gtk_table_set_row_spacing
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_table_set_row_spacing"
		}"
		end

	gtk_table_set_row_spacings (a_table: POINTER; a_spacing: NATURAL_32) is
 		-- gtk_table_set_row_spacings
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_table_set_row_spacings"
		}"
		end


end -- class GTKTABLE_EXTERNALS
