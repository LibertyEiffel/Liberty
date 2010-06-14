-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKPANED_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_paned_get_type: NATURAL_32 is
 		-- gtk_paned_get_type (node at line 7335)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paned_get_type()"
		}"
		end

	gtk_paned_compute_position (a_paned: POINTER; an_allocation: INTEGER_32; a_child1_req: INTEGER_32; a_child2_req: INTEGER_32) is
 		-- gtk_paned_compute_position (node at line 12133)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paned_compute_position"
		}"
		end

	gtk_paned_pack1 (a_paned: POINTER; a_child: POINTER; a_resize: INTEGER_32; a_shrink: INTEGER_32) is
 		-- gtk_paned_pack1 (node at line 17594)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paned_pack1"
		}"
		end

	gtk_paned_pack2 (a_paned: POINTER; a_child: POINTER; a_resize: INTEGER_32; a_shrink: INTEGER_32) is
 		-- gtk_paned_pack2 (node at line 17600)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paned_pack2"
		}"
		end

	gtk_paned_set_position (a_paned: POINTER; a_position: INTEGER_32) is
 		-- gtk_paned_set_position (node at line 22320)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paned_set_position"
		}"
		end

	gtk_paned_add1 (a_paned: POINTER; a_child: POINTER) is
 		-- gtk_paned_add1 (node at line 22703)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paned_add1"
		}"
		end

	gtk_paned_add2 (a_paned: POINTER; a_child: POINTER) is
 		-- gtk_paned_add2 (node at line 22707)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paned_add2"
		}"
		end

	gtk_paned_get_position (a_paned: POINTER): INTEGER_32 is
 		-- gtk_paned_get_position (node at line 23205)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paned_get_position"
		}"
		end

	gtk_paned_get_child1 (a_paned: POINTER): POINTER is
 		-- gtk_paned_get_child1 (node at line 26926)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paned_get_child1"
		}"
		end

	gtk_paned_get_child2 (a_paned: POINTER): POINTER is
 		-- gtk_paned_get_child2 (node at line 26929)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paned_get_child2"
		}"
		end

	gtk_paned_get_handle_window (a_paned: POINTER): POINTER is
 		-- gtk_paned_get_handle_window (node at line 37664)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paned_get_handle_window"
		}"
		end


end -- class GTKPANED_EXTERNALS
