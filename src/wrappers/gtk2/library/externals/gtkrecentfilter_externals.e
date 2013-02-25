-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKRECENTFILTER_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_recent_filter_add_age (a_filter: POINTER; a_days: INTEGER_32) is
 		-- gtk_recent_filter_add_age (node at line 4008)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_filter_add_age"
		}"
		end

	gtk_recent_filter_add_pattern (a_filter: POINTER; a_pattern: POINTER) is
 		-- gtk_recent_filter_add_pattern (node at line 7432)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_filter_add_pattern"
		}"
		end

	gtk_recent_filter_get_type: NATURAL_64 is
 		-- gtk_recent_filter_get_type (node at line 12007)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_filter_get_type()"
		}"
		end

	gtk_recent_filter_new: POINTER is
 		-- gtk_recent_filter_new (node at line 15254)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_filter_new()"
		}"
		end

	gtk_recent_filter_add_application (a_filter: POINTER; an_application: POINTER) is
 		-- gtk_recent_filter_add_application (node at line 15358)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_filter_add_application"
		}"
		end

	gtk_recent_filter_filter (a_filter: POINTER; a_filter_info: POINTER): INTEGER_32 is
 		-- gtk_recent_filter_filter (node at line 16302)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_filter_filter"
		}"
		end

	gtk_recent_filter_add_group (a_filter: POINTER; a_group: POINTER) is
 		-- gtk_recent_filter_add_group (node at line 18023)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_filter_add_group"
		}"
		end

	gtk_recent_filter_add_custom (a_filter: POINTER; a_needed: INTEGER; a_func: POINTER; a_data: POINTER; a_data_destroy: POINTER) is
 		-- gtk_recent_filter_add_custom (node at line 20366)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_filter_add_custom"
		}"
		end

	gtk_recent_filter_get_needed (a_filter: POINTER): INTEGER is
 		-- gtk_recent_filter_get_needed (node at line 25167)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_filter_get_needed"
		}"
		end

	gtk_recent_filter_add_pixbuf_formats (a_filter: POINTER) is
 		-- gtk_recent_filter_add_pixbuf_formats (node at line 31341)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_filter_add_pixbuf_formats"
		}"
		end

	gtk_recent_filter_get_name (a_filter: POINTER): POINTER is
 		-- gtk_recent_filter_get_name (node at line 33665)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_filter_get_name"
		}"
		end

	gtk_recent_filter_add_mime_type (a_filter: POINTER; a_mime_type: POINTER) is
 		-- gtk_recent_filter_add_mime_type (node at line 36974)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_filter_add_mime_type"
		}"
		end

	gtk_recent_filter_set_name (a_filter: POINTER; a_name: POINTER) is
 		-- gtk_recent_filter_set_name (node at line 38202)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_filter_set_name"
		}"
		end


end -- class GTKRECENTFILTER_EXTERNALS
