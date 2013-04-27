-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTABLE_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_table_attach (a_table: POINTER; a_child: POINTER; a_left_attach: NATURAL; a_right_attach: NATURAL; a_top_attach: NATURAL; a_bottom_attach: NATURAL; a_xoptions: INTEGER; a_yoptions: INTEGER; a_xpadding: NATURAL; a_ypadding: NATURAL) is
 		-- gtk_table_attach
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_table_attach"
		}"
		end

	gtk_table_attach_defaults (a_table: POINTER; a_widget: POINTER; a_left_attach: NATURAL; a_right_attach: NATURAL; a_top_attach: NATURAL; a_bottom_attach: NATURAL) is
 		-- gtk_table_attach_defaults
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_table_attach_defaults"
		}"
		end

	gtk_table_get_col_spacing (a_table: POINTER; a_column: NATURAL): NATURAL is
 		-- gtk_table_get_col_spacing
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_table_get_col_spacing"
		}"
		end

	gtk_table_get_default_col_spacing (a_table: POINTER): NATURAL is
 		-- gtk_table_get_default_col_spacing
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_table_get_default_col_spacing"
		}"
		end

	gtk_table_get_default_row_spacing (a_table: POINTER): NATURAL is
 		-- gtk_table_get_default_row_spacing
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_table_get_default_row_spacing"
		}"
		end

	gtk_table_get_homogeneous (a_table: POINTER): INTEGER is
 		-- gtk_table_get_homogeneous
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_table_get_homogeneous"
		}"
		end

	gtk_table_get_row_spacing (a_table: POINTER; a_row: NATURAL): NATURAL is
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

	gtk_table_get_type: like long_unsigned is
 		-- gtk_table_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_table_get_type()"
		}"
		end

	gtk_table_new (a_rows: NATURAL; a_columns: NATURAL; a_homogeneous: INTEGER): POINTER is
 		-- gtk_table_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_table_new"
		}"
		end

	gtk_table_resize (a_table: POINTER; a_rows: NATURAL; a_columns: NATURAL) is
 		-- gtk_table_resize
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_table_resize"
		}"
		end

	gtk_table_set_col_spacing (a_table: POINTER; a_column: NATURAL; a_spacing: NATURAL) is
 		-- gtk_table_set_col_spacing
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_table_set_col_spacing"
		}"
		end

	gtk_table_set_col_spacings (a_table: POINTER; a_spacing: NATURAL) is
 		-- gtk_table_set_col_spacings
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_table_set_col_spacings"
		}"
		end

	gtk_table_set_homogeneous (a_table: POINTER; a_homogeneous: INTEGER) is
 		-- gtk_table_set_homogeneous
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_table_set_homogeneous"
		}"
		end

	gtk_table_set_row_spacing (a_table: POINTER; a_row: NATURAL; a_spacing: NATURAL) is
 		-- gtk_table_set_row_spacing
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_table_set_row_spacing"
		}"
		end

	gtk_table_set_row_spacings (a_table: POINTER; a_spacing: NATURAL) is
 		-- gtk_table_set_row_spacings
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_table_set_row_spacings"
		}"
		end


end -- class GTKTABLE_EXTERNALS
