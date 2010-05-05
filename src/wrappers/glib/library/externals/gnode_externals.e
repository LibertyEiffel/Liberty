-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GNODE_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_node_copy_deep (a_node: POINTER; a_copy_func: POINTER; a_data: POINTER): POINTER is
 		-- g_node_copy_deep (node at line 297)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_node_copy_deep"
		}"
		end

	g_node_find_child (a_node: POINTER; a_flags: INTEGER; a_data: POINTER): POINTER is
 		-- g_node_find_child (node at line 328)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_node_find_child"
		}"
		end

	g_node_find (a_root: POINTER; an_order: INTEGER; a_flags: INTEGER; a_data: POINTER): POINTER is
 		-- g_node_find (node at line 448)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_node_find"
		}"
		end

	g_node_get_root (a_node: POINTER): POINTER is
 		-- g_node_get_root (node at line 551)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_node_get_root"
		}"
		end

	g_node_traverse (a_root: POINTER; an_order: INTEGER; a_flags: INTEGER; a_max_depth: INTEGER_32; a_func: POINTER; a_data: POINTER) is
 		-- g_node_traverse (node at line 780)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_node_traverse"
		}"
		end

	g_node_first_sibling (a_node: POINTER): POINTER is
 		-- g_node_first_sibling (node at line 836)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_node_first_sibling"
		}"
		end

	g_node_insert (a_parent: POINTER; a_position: INTEGER_32; a_node: POINTER): POINTER is
 		-- g_node_insert (node at line 933)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_node_insert"
		}"
		end

	g_node_last_child (a_node: POINTER): POINTER is
 		-- g_node_last_child (node at line 1249)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_node_last_child"
		}"
		end

	g_node_prepend (a_parent: POINTER; a_node: POINTER): POINTER is
 		-- g_node_prepend (node at line 1423)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_node_prepend"
		}"
		end

	g_node_push_allocator (a_dummy: POINTER) is
 		-- g_node_push_allocator (node at line 1811)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_node_push_allocator"
		}"
		end

	g_node_destroy (a_root: POINTER) is
 		-- g_node_destroy (node at line 2020)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_node_destroy"
		}"
		end

	g_node_last_sibling (a_node: POINTER): POINTER is
 		-- g_node_last_sibling (node at line 2146)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_node_last_sibling"
		}"
		end

	g_node_pop_allocator is
 		-- g_node_pop_allocator (node at line 2418)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_node_pop_allocator()"
		}"
		end

	g_node_max_height (a_root: POINTER): NATURAL_32 is
 		-- g_node_max_height (node at line 2529)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_node_max_height"
		}"
		end

	g_node_child_position (a_node: POINTER; a_child: POINTER): INTEGER_32 is
 		-- g_node_child_position (node at line 2944)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_node_child_position"
		}"
		end

	g_node_nth_child (a_node: POINTER; a_n: NATURAL_32): POINTER is
 		-- g_node_nth_child (node at line 3746)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_node_nth_child"
		}"
		end

	g_node_unlink (a_node: POINTER) is
 		-- g_node_unlink (node at line 4049)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_node_unlink"
		}"
		end

	g_node_depth (a_node: POINTER): NATURAL_32 is
 		-- g_node_depth (node at line 4182)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_node_depth"
		}"
		end

	g_node_child_index (a_node: POINTER; a_data: POINTER): INTEGER_32 is
 		-- g_node_child_index (node at line 4950)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_node_child_index"
		}"
		end

	g_node_children_foreach (a_node: POINTER; a_flags: INTEGER; a_func: POINTER; a_data: POINTER) is
 		-- g_node_children_foreach (node at line 5107)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_node_children_foreach"
		}"
		end

	g_node_copy (a_node: POINTER): POINTER is
 		-- g_node_copy (node at line 5219)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_node_copy"
		}"
		end

	g_node_n_children (a_node: POINTER): NATURAL_32 is
 		-- g_node_n_children (node at line 5407)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_node_n_children"
		}"
		end

	g_node_insert_after (a_parent: POINTER; a_sibling: POINTER; a_node: POINTER): POINTER is
 		-- g_node_insert_after (node at line 5630)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_node_insert_after"
		}"
		end

	g_node_new (a_data: POINTER): POINTER is
 		-- g_node_new (node at line 5678)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_node_new"
		}"
		end

	g_node_n_nodes (a_root: POINTER; a_flags: INTEGER): NATURAL_32 is
 		-- g_node_n_nodes (node at line 5991)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_node_n_nodes"
		}"
		end

	g_node_reverse_children (a_node: POINTER) is
 		-- g_node_reverse_children (node at line 6428)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_node_reverse_children"
		}"
		end

	g_node_is_ancestor (a_node: POINTER; a_descendant: POINTER): INTEGER_32 is
 		-- g_node_is_ancestor (node at line 6572)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_node_is_ancestor"
		}"
		end

	g_node_insert_before (a_parent: POINTER; a_sibling: POINTER; a_node: POINTER): POINTER is
 		-- g_node_insert_before (node at line 6584)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_node_insert_before"
		}"
		end


end -- class GNODE_EXTERNALS
