-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKHANDLEBOX_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_handle_box_get_child_detached (a_handle_box: POINTER): INTEGER is
 		-- gtk_handle_box_get_child_detached
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_handle_box_get_child_detached"
		}"
		end

	gtk_handle_box_get_handle_position (a_handle_box: POINTER): INTEGER is
 		-- gtk_handle_box_get_handle_position
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_handle_box_get_handle_position"
		}"
		end

	gtk_handle_box_get_shadow_type (a_handle_box: POINTER): INTEGER is
 		-- gtk_handle_box_get_shadow_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_handle_box_get_shadow_type"
		}"
		end

	gtk_handle_box_get_snap_edge (a_handle_box: POINTER): INTEGER is
 		-- gtk_handle_box_get_snap_edge
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_handle_box_get_snap_edge"
		}"
		end

	gtk_handle_box_get_type: like long_unsigned is
 		-- gtk_handle_box_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_handle_box_get_type()"
		}"
		end

	gtk_handle_box_new: POINTER is
 		-- gtk_handle_box_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_handle_box_new()"
		}"
		end

	gtk_handle_box_set_handle_position (a_handle_box: POINTER; a_position: INTEGER) is
 		-- gtk_handle_box_set_handle_position
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_handle_box_set_handle_position"
		}"
		end

	gtk_handle_box_set_shadow_type (a_handle_box: POINTER; a_type: INTEGER) is
 		-- gtk_handle_box_set_shadow_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_handle_box_set_shadow_type"
		}"
		end

	gtk_handle_box_set_snap_edge (a_handle_box: POINTER; an_edge: INTEGER) is
 		-- gtk_handle_box_set_snap_edge
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_handle_box_set_snap_edge"
		}"
		end


end -- class GTKHANDLEBOX_EXTERNALS
