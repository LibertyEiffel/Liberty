-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKSIZEGROUP_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_size_group_add_widget (a_size_group: POINTER; a_widget: POINTER) is
 		-- gtk_size_group_add_widget
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_size_group_add_widget"
		}"
		end

	-- `hidden' function _gtk_size_group_compute_requisition skipped.
	-- `hidden' function _gtk_size_group_get_child_requisition skipped.
	gtk_size_group_get_ignore_hidden (a_size_group: POINTER): INTEGER is
 		-- gtk_size_group_get_ignore_hidden
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_size_group_get_ignore_hidden"
		}"
		end

	gtk_size_group_get_mode (a_size_group: POINTER): INTEGER is
 		-- gtk_size_group_get_mode
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_size_group_get_mode"
		}"
		end

	gtk_size_group_get_type: like long_unsigned is
 		-- gtk_size_group_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_size_group_get_type()"
		}"
		end

	gtk_size_group_get_widgets (a_size_group: POINTER): POINTER is
 		-- gtk_size_group_get_widgets
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_size_group_get_widgets"
		}"
		end

	gtk_size_group_new (a_mode: INTEGER): POINTER is
 		-- gtk_size_group_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_size_group_new"
		}"
		end

	-- `hidden' function _gtk_size_group_queue_resize skipped.
	gtk_size_group_remove_widget (a_size_group: POINTER; a_widget: POINTER) is
 		-- gtk_size_group_remove_widget
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_size_group_remove_widget"
		}"
		end

	gtk_size_group_set_ignore_hidden (a_size_group: POINTER; an_ignore_hidden: INTEGER) is
 		-- gtk_size_group_set_ignore_hidden
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_size_group_set_ignore_hidden"
		}"
		end

	gtk_size_group_set_mode (a_size_group: POINTER; a_mode: INTEGER) is
 		-- gtk_size_group_set_mode
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_size_group_set_mode"
		}"
		end


end -- class GTKSIZEGROUP_EXTERNALS
