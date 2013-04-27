-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKRECENTFILTER_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_recent_filter_add_age (a_filter: POINTER; a_days: INTEGER) is
 		-- gtk_recent_filter_add_age
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_filter_add_age"
		}"
		end

	gtk_recent_filter_add_application (a_filter: POINTER; an_application: POINTER) is
 		-- gtk_recent_filter_add_application
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_filter_add_application"
		}"
		end

	gtk_recent_filter_add_custom (a_filter: POINTER; a_needed: INTEGER; a_func: POINTER; a_data: POINTER; a_data_destroy: POINTER) is
 		-- gtk_recent_filter_add_custom
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_filter_add_custom"
		}"
		end

	gtk_recent_filter_add_group (a_filter: POINTER; a_group: POINTER) is
 		-- gtk_recent_filter_add_group
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_filter_add_group"
		}"
		end

	gtk_recent_filter_add_mime_type (a_filter: POINTER; a_mime_type: POINTER) is
 		-- gtk_recent_filter_add_mime_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_filter_add_mime_type"
		}"
		end

	gtk_recent_filter_add_pattern (a_filter: POINTER; a_pattern: POINTER) is
 		-- gtk_recent_filter_add_pattern
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_filter_add_pattern"
		}"
		end

	gtk_recent_filter_add_pixbuf_formats (a_filter: POINTER) is
 		-- gtk_recent_filter_add_pixbuf_formats
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_filter_add_pixbuf_formats"
		}"
		end

	gtk_recent_filter_filter (a_filter: POINTER; a_filter_info: POINTER): INTEGER is
 		-- gtk_recent_filter_filter
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_filter_filter"
		}"
		end

	gtk_recent_filter_get_name (a_filter: POINTER): POINTER is
 		-- gtk_recent_filter_get_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_filter_get_name"
		}"
		end

	gtk_recent_filter_get_needed (a_filter: POINTER): INTEGER is
 		-- gtk_recent_filter_get_needed
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_filter_get_needed"
		}"
		end

	gtk_recent_filter_get_type: like long_unsigned is
 		-- gtk_recent_filter_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_filter_get_type()"
		}"
		end

	gtk_recent_filter_new: POINTER is
 		-- gtk_recent_filter_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_filter_new()"
		}"
		end

	gtk_recent_filter_set_name (a_filter: POINTER; a_name: POINTER) is
 		-- gtk_recent_filter_set_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_filter_set_name"
		}"
		end


end -- class GTKRECENTFILTER_EXTERNALS
