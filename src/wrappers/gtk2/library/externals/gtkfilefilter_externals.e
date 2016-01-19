-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKFILEFILTER_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_file_filter_add_custom (a_filter: POINTER; a_needed: INTEGER; a_func: POINTER; a_data: POINTER; a_notify: POINTER) is
 		-- gtk_file_filter_add_custom
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_filter_add_custom"
		}"
		end

	gtk_file_filter_add_mime_type (a_filter: POINTER; a_mime_type: POINTER) is
 		-- gtk_file_filter_add_mime_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_filter_add_mime_type"
		}"
		end

	gtk_file_filter_add_pattern (a_filter: POINTER; a_pattern: POINTER) is
 		-- gtk_file_filter_add_pattern
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_filter_add_pattern"
		}"
		end

	gtk_file_filter_add_pixbuf_formats (a_filter: POINTER) is
 		-- gtk_file_filter_add_pixbuf_formats
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_filter_add_pixbuf_formats"
		}"
		end

	gtk_file_filter_filter (a_filter: POINTER; a_filter_info: POINTER): INTEGER is
 		-- gtk_file_filter_filter
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_filter_filter"
		}"
		end

	gtk_file_filter_get_name (a_filter: POINTER): POINTER is
 		-- gtk_file_filter_get_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_filter_get_name"
		}"
		end

	gtk_file_filter_get_needed (a_filter: POINTER): INTEGER is
 		-- gtk_file_filter_get_needed
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_filter_get_needed"
		}"
		end

	gtk_file_filter_get_type: like long_unsigned is
 		-- gtk_file_filter_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_filter_get_type()"
		}"
		end

	gtk_file_filter_new: POINTER is
 		-- gtk_file_filter_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_filter_new()"
		}"
		end

	gtk_file_filter_set_name (a_filter: POINTER; a_name: POINTER) is
 		-- gtk_file_filter_set_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_filter_set_name"
		}"
		end


end -- class GTKFILEFILTER_EXTERNALS
