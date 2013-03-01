-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKSIZEGROUP_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_size_group_get_ignore_hidden (a_size_group: POINTER): INTEGER_32 is
 		-- gtk_size_group_get_ignore_hidden (node at line 9370)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_size_group_get_ignore_hidden"
		}"
		end

	gtk_size_group_set_mode (a_size_group: POINTER; a_mode: INTEGER) is
 		-- gtk_size_group_set_mode (node at line 9518)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_size_group_set_mode"
		}"
		end

	gtk_size_group_add_widget (a_size_group: POINTER; a_widget: POINTER) is
 		-- gtk_size_group_add_widget (node at line 11147)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_size_group_add_widget"
		}"
		end

	gtk_size_group_new (a_mode: INTEGER): POINTER is
 		-- gtk_size_group_new (node at line 13261)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_size_group_new"
		}"
		end

	gtk_size_group_get_type: NATURAL_64 is
 		-- gtk_size_group_get_type (node at line 19521)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_size_group_get_type()"
		}"
		end

	gtk_size_group_remove_widget (a_size_group: POINTER; a_widget: POINTER) is
 		-- gtk_size_group_remove_widget (node at line 20837)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_size_group_remove_widget"
		}"
		end

	-- `hidden' function _gtk_size_group_compute_requisition skipped.
	gtk_size_group_get_mode (a_size_group: POINTER): INTEGER is
 		-- gtk_size_group_get_mode (node at line 32409)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_size_group_get_mode"
		}"
		end

	gtk_size_group_get_widgets (a_size_group: POINTER): POINTER is
 		-- gtk_size_group_get_widgets (node at line 35113)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_size_group_get_widgets"
		}"
		end

	gtk_size_group_set_ignore_hidden (a_size_group: POINTER; an_ignore_hidden: INTEGER_32) is
 		-- gtk_size_group_set_ignore_hidden (node at line 39805)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_size_group_set_ignore_hidden"
		}"
		end

	-- `hidden' function _gtk_size_group_get_child_requisition skipped.
	-- `hidden' function _gtk_size_group_queue_resize skipped.

end -- class GTKSIZEGROUP_EXTERNALS
