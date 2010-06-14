-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKSIZEGROUP_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	-- `hidden' function _gtk_size_group_queue_resize skipped.
	gtk_size_group_get_ignore_hidden (a_size_group: POINTER): INTEGER_32 is
 		-- gtk_size_group_get_ignore_hidden (node at line 8657)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_size_group_get_ignore_hidden"
		}"
		end

	gtk_size_group_set_mode (a_size_group: POINTER; a_mode: INTEGER) is
 		-- gtk_size_group_set_mode (node at line 8766)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_size_group_set_mode"
		}"
		end

	gtk_size_group_add_widget (a_size_group: POINTER; a_widget: POINTER) is
 		-- gtk_size_group_add_widget (node at line 10320)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_size_group_add_widget"
		}"
		end

	gtk_size_group_new (a_mode: INTEGER): POINTER is
 		-- gtk_size_group_new (node at line 12189)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_size_group_new"
		}"
		end

	gtk_size_group_get_type: NATURAL_32 is
 		-- gtk_size_group_get_type (node at line 17834)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_size_group_get_type()"
		}"
		end

	gtk_size_group_remove_widget (a_size_group: POINTER; a_widget: POINTER) is
 		-- gtk_size_group_remove_widget (node at line 19057)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_size_group_remove_widget"
		}"
		end

	-- `hidden' function _gtk_size_group_compute_requisition skipped.
	gtk_size_group_get_mode (a_size_group: POINTER): INTEGER is
 		-- gtk_size_group_get_mode (node at line 29363)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_size_group_get_mode"
		}"
		end

	gtk_size_group_get_widgets (a_size_group: POINTER): POINTER is
 		-- gtk_size_group_get_widgets (node at line 31735)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_size_group_get_widgets"
		}"
		end

	gtk_size_group_set_ignore_hidden (a_size_group: POINTER; an_ignore_hidden: INTEGER_32) is
 		-- gtk_size_group_set_ignore_hidden (node at line 36192)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_size_group_set_ignore_hidden"
		}"
		end

	-- `hidden' function _gtk_size_group_get_child_requisition skipped.

end -- class GTKSIZEGROUP_EXTERNALS
