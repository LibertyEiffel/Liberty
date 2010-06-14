-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKMOUNTOPERATION_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_mount_operation_new (a_parent: POINTER): POINTER is
 		-- gtk_mount_operation_new (node at line 3536)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_mount_operation_new"
		}"
		end

	gtk_mount_operation_get_parent (an_op: POINTER): POINTER is
 		-- gtk_mount_operation_get_parent (node at line 8324)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_mount_operation_get_parent"
		}"
		end

	gtk_mount_operation_get_type: NATURAL_32 is
 		-- gtk_mount_operation_get_type (node at line 12023)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_mount_operation_get_type()"
		}"
		end

	gtk_mount_operation_set_screen (an_op: POINTER; a_screen: POINTER) is
 		-- gtk_mount_operation_set_screen (node at line 22171)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_mount_operation_set_screen"
		}"
		end

	gtk_mount_operation_get_screen (an_op: POINTER): POINTER is
 		-- gtk_mount_operation_get_screen (node at line 24183)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_mount_operation_get_screen"
		}"
		end

	gtk_mount_operation_set_parent (an_op: POINTER; a_parent: POINTER) is
 		-- gtk_mount_operation_set_parent (node at line 30363)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_mount_operation_set_parent"
		}"
		end

	gtk_mount_operation_is_showing (an_op: POINTER): INTEGER_32 is
 		-- gtk_mount_operation_is_showing (node at line 34776)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_mount_operation_is_showing"
		}"
		end


end -- class GTKMOUNTOPERATION_EXTERNALS
