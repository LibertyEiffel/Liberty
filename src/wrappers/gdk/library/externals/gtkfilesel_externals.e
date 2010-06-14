-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKFILESEL_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_file_selection_get_filename (a_filesel: POINTER): POINTER is
 		-- gtk_file_selection_get_filename (node at line 467)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_selection_get_filename"
		}"
		end

	gtk_file_selection_get_type: NATURAL_32 is
 		-- gtk_file_selection_get_type (node at line 1034)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_selection_get_type()"
		}"
		end

	gtk_file_selection_set_select_multiple (a_filesel: POINTER; a_select_multiple: INTEGER_32) is
 		-- gtk_file_selection_set_select_multiple (node at line 4084)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_selection_set_select_multiple"
		}"
		end

	gtk_file_selection_complete (a_filesel: POINTER; a_pattern: POINTER) is
 		-- gtk_file_selection_complete (node at line 5114)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_selection_complete"
		}"
		end

	gtk_file_selection_new (a_title: POINTER): POINTER is
 		-- gtk_file_selection_new (node at line 5694)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_selection_new"
		}"
		end

	gtk_file_selection_get_selections (a_filesel: POINTER): POINTER is
 		-- gtk_file_selection_get_selections (node at line 13711)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_selection_get_selections"
		}"
		end

	gtk_file_selection_get_select_multiple (a_filesel: POINTER): INTEGER_32 is
 		-- gtk_file_selection_get_select_multiple (node at line 16156)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_selection_get_select_multiple"
		}"
		end

	gtk_file_selection_show_fileop_buttons (a_filesel: POINTER) is
 		-- gtk_file_selection_show_fileop_buttons (node at line 18176)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_selection_show_fileop_buttons"
		}"
		end

	gtk_file_selection_hide_fileop_buttons (a_filesel: POINTER) is
 		-- gtk_file_selection_hide_fileop_buttons (node at line 27430)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_selection_hide_fileop_buttons"
		}"
		end

	gtk_file_selection_set_filename (a_filesel: POINTER; a_filename: POINTER) is
 		-- gtk_file_selection_set_filename (node at line 37129)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_selection_set_filename"
		}"
		end


end -- class GTKFILESEL_EXTERNALS
