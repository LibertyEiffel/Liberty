-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKPANED_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_paned_get_position (a_paned: POINTER): INTEGER_32 is
 		-- gtk_paned_get_position (node at line 2126)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paned_get_position"
		}"
		end

	gtk_paned_get_type: NATURAL_64 is
 		-- gtk_paned_get_type (node at line 8033)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paned_get_type()"
		}"
		end

	gtk_paned_pack1 (a_paned: POINTER; a_child: POINTER; a_resize: INTEGER_32; a_shrink: INTEGER_32) is
 		-- gtk_paned_pack1 (node at line 19288)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paned_pack1"
		}"
		end

	gtk_paned_set_position (a_paned: POINTER; a_position: INTEGER_32) is
 		-- gtk_paned_set_position (node at line 24586)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paned_set_position"
		}"
		end

	gtk_paned_add1 (a_paned: POINTER; a_child: POINTER) is
 		-- gtk_paned_add1 (node at line 25004)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paned_add1"
		}"
		end

	gtk_paned_add2 (a_paned: POINTER; a_child: POINTER) is
 		-- gtk_paned_add2 (node at line 25008)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paned_add2"
		}"
		end

	gtk_paned_get_child1 (a_paned: POINTER): POINTER is
 		-- gtk_paned_get_child1 (node at line 29727)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paned_get_child1"
		}"
		end

	gtk_paned_get_child2 (a_paned: POINTER): POINTER is
 		-- gtk_paned_get_child2 (node at line 29730)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paned_get_child2"
		}"
		end

	gtk_paned_pack2 (a_paned: POINTER; a_child: POINTER; a_resize: INTEGER_32; a_shrink: INTEGER_32) is
 		-- gtk_paned_pack2 (node at line 36637)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paned_pack2"
		}"
		end

	gtk_paned_get_handle_window (a_paned: POINTER): POINTER is
 		-- gtk_paned_get_handle_window (node at line 41375)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paned_get_handle_window"
		}"
		end


end -- class GTKPANED_EXTERNALS
