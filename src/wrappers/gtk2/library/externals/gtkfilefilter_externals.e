-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKFILEFILTER_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_file_filter_add_mime_type (a_filter: POINTER; a_mime_type: POINTER) is
 		-- gtk_file_filter_add_mime_type (node at line 472)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_filter_add_mime_type"
		}"
		end

	gtk_file_filter_set_name (a_filter: POINTER; a_name: POINTER) is
 		-- gtk_file_filter_set_name (node at line 2907)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_filter_set_name"
		}"
		end

	gtk_file_filter_new: POINTER is
 		-- gtk_file_filter_new (node at line 6228)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_filter_new()"
		}"
		end

	gtk_file_filter_filter (a_filter: POINTER; a_filter_info: POINTER): INTEGER_32 is
 		-- gtk_file_filter_filter (node at line 21417)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_filter_filter"
		}"
		end

	gtk_file_filter_add_pattern (a_filter: POINTER; a_pattern: POINTER) is
 		-- gtk_file_filter_add_pattern (node at line 24623)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_filter_add_pattern"
		}"
		end

	gtk_file_filter_get_name (a_filter: POINTER): POINTER is
 		-- gtk_file_filter_get_name (node at line 26226)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_filter_get_name"
		}"
		end

	gtk_file_filter_get_needed (a_filter: POINTER): INTEGER is
 		-- gtk_file_filter_get_needed (node at line 29403)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_filter_get_needed"
		}"
		end

	gtk_file_filter_add_custom (a_filter: POINTER; a_needed: INTEGER; a_func: POINTER; a_data: POINTER; a_notify: POINTER) is
 		-- gtk_file_filter_add_custom (node at line 33536)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_filter_add_custom"
		}"
		end

	gtk_file_filter_get_type: NATURAL_64 is
 		-- gtk_file_filter_get_type (node at line 33897)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_filter_get_type()"
		}"
		end

	gtk_file_filter_add_pixbuf_formats (a_filter: POINTER) is
 		-- gtk_file_filter_add_pixbuf_formats (node at line 37038)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_filter_add_pixbuf_formats"
		}"
		end


end -- class GTKFILEFILTER_EXTERNALS
