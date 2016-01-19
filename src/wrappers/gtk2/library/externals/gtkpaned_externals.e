-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKPANED_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_paned_add1 (a_paned: POINTER; a_child: POINTER) is
 		-- gtk_paned_add1
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paned_add1"
		}"
		end

	gtk_paned_add2 (a_paned: POINTER; a_child: POINTER) is
 		-- gtk_paned_add2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paned_add2"
		}"
		end

	gtk_paned_get_child1 (a_paned: POINTER): POINTER is
 		-- gtk_paned_get_child1
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paned_get_child1"
		}"
		end

	gtk_paned_get_child2 (a_paned: POINTER): POINTER is
 		-- gtk_paned_get_child2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paned_get_child2"
		}"
		end

	gtk_paned_get_handle_window (a_paned: POINTER): POINTER is
 		-- gtk_paned_get_handle_window
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paned_get_handle_window"
		}"
		end

	gtk_paned_get_position (a_paned: POINTER): INTEGER is
 		-- gtk_paned_get_position
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paned_get_position"
		}"
		end

	gtk_paned_get_type: like long_unsigned is
 		-- gtk_paned_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paned_get_type()"
		}"
		end

	gtk_paned_pack1 (a_paned: POINTER; a_child: POINTER; a_resize: INTEGER; a_shrink: INTEGER) is
 		-- gtk_paned_pack1
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paned_pack1"
		}"
		end

	gtk_paned_pack2 (a_paned: POINTER; a_child: POINTER; a_resize: INTEGER; a_shrink: INTEGER) is
 		-- gtk_paned_pack2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paned_pack2"
		}"
		end

	gtk_paned_set_position (a_paned: POINTER; a_position: INTEGER) is
 		-- gtk_paned_set_position
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paned_set_position"
		}"
		end


end -- class GTKPANED_EXTERNALS
