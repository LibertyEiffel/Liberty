-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKMOUNTOPERATION_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_mount_operation_get_parent (an_op: POINTER): POINTER is
 		-- gtk_mount_operation_get_parent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_mount_operation_get_parent"
		}"
		end

	gtk_mount_operation_get_screen (an_op: POINTER): POINTER is
 		-- gtk_mount_operation_get_screen
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_mount_operation_get_screen"
		}"
		end

	gtk_mount_operation_get_type: like long_unsigned is
 		-- gtk_mount_operation_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_mount_operation_get_type()"
		}"
		end

	gtk_mount_operation_is_showing (an_op: POINTER): INTEGER is
 		-- gtk_mount_operation_is_showing
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_mount_operation_is_showing"
		}"
		end

	gtk_mount_operation_new (a_parent: POINTER): POINTER is
 		-- gtk_mount_operation_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_mount_operation_new"
		}"
		end

	gtk_mount_operation_set_parent (an_op: POINTER; a_parent: POINTER) is
 		-- gtk_mount_operation_set_parent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_mount_operation_set_parent"
		}"
		end

	gtk_mount_operation_set_screen (an_op: POINTER; a_screen: POINTER) is
 		-- gtk_mount_operation_set_screen
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_mount_operation_set_screen"
		}"
		end


end -- class GTKMOUNTOPERATION_EXTERNALS
