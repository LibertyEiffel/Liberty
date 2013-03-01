-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKHANDLEBOX_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_handle_box_get_type: NATURAL_64 is
 		-- gtk_handle_box_get_type (node at line 726)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_handle_box_get_type()"
		}"
		end

	gtk_handle_box_get_handle_position (a_handle_box: POINTER): INTEGER is
 		-- gtk_handle_box_get_handle_position (node at line 8904)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_handle_box_get_handle_position"
		}"
		end

	gtk_handle_box_get_shadow_type (a_handle_box: POINTER): INTEGER is
 		-- gtk_handle_box_get_shadow_type (node at line 10807)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_handle_box_get_shadow_type"
		}"
		end

	gtk_handle_box_new: POINTER is
 		-- gtk_handle_box_new (node at line 12131)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_handle_box_new()"
		}"
		end

	gtk_handle_box_get_child_detached (a_handle_box: POINTER): INTEGER_32 is
 		-- gtk_handle_box_get_child_detached (node at line 18467)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_handle_box_get_child_detached"
		}"
		end

	gtk_handle_box_get_snap_edge (a_handle_box: POINTER): INTEGER is
 		-- gtk_handle_box_get_snap_edge (node at line 20674)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_handle_box_get_snap_edge"
		}"
		end

	gtk_handle_box_set_snap_edge (a_handle_box: POINTER; an_edge: INTEGER) is
 		-- gtk_handle_box_set_snap_edge (node at line 25023)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_handle_box_set_snap_edge"
		}"
		end

	gtk_handle_box_set_handle_position (a_handle_box: POINTER; a_position: INTEGER) is
 		-- gtk_handle_box_set_handle_position (node at line 37525)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_handle_box_set_handle_position"
		}"
		end

	gtk_handle_box_set_shadow_type (a_handle_box: POINTER; a_type: INTEGER) is
 		-- gtk_handle_box_set_shadow_type (node at line 37604)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_handle_box_set_shadow_type"
		}"
		end


end -- class GTKHANDLEBOX_EXTERNALS
