-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GNODE_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_node_child_index (a_node: POINTER; a_data: POINTER): INTEGER 
               -- g_node_child_index
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_node_child_index"
               }"
               end

	g_node_child_position (a_node: POINTER; a_child: POINTER): INTEGER 
               -- g_node_child_position
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_node_child_position"
               }"
               end

	g_node_children_foreach (a_node: POINTER; a_flags: INTEGER; a_func: POINTER; a_data: POINTER) 
               -- g_node_children_foreach
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_node_children_foreach"
               }"
               end

	g_node_copy (a_node: POINTER): POINTER 
               -- g_node_copy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_node_copy"
               }"
               end

	g_node_copy_deep (a_node: POINTER; a_copy_func: POINTER; a_data: POINTER): POINTER 
               -- g_node_copy_deep
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_node_copy_deep"
               }"
               end

	g_node_depth (a_node: POINTER): NATURAL 
               -- g_node_depth
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_node_depth"
               }"
               end

	g_node_destroy (a_root: POINTER) 
               -- g_node_destroy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_node_destroy"
               }"
               end

	g_node_find (a_root: POINTER; an_order: INTEGER; a_flags: INTEGER; a_data: POINTER): POINTER 
               -- g_node_find
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_node_find"
               }"
               end

	g_node_find_child (a_node: POINTER; a_flags: INTEGER; a_data: POINTER): POINTER 
               -- g_node_find_child
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_node_find_child"
               }"
               end

	g_node_first_sibling (a_node: POINTER): POINTER 
               -- g_node_first_sibling
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_node_first_sibling"
               }"
               end

	g_node_get_root (a_node: POINTER): POINTER 
               -- g_node_get_root
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_node_get_root"
               }"
               end

	g_node_insert (a_parent: POINTER; a_position: INTEGER; a_node: POINTER): POINTER 
               -- g_node_insert
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_node_insert"
               }"
               end

	g_node_insert_after (a_parent: POINTER; a_sibling: POINTER; a_node: POINTER): POINTER 
               -- g_node_insert_after
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_node_insert_after"
               }"
               end

	g_node_insert_before (a_parent: POINTER; a_sibling: POINTER; a_node: POINTER): POINTER 
               -- g_node_insert_before
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_node_insert_before"
               }"
               end

	g_node_is_ancestor (a_node: POINTER; a_descendant: POINTER): INTEGER 
               -- g_node_is_ancestor
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_node_is_ancestor"
               }"
               end

	g_node_last_child (a_node: POINTER): POINTER 
               -- g_node_last_child
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_node_last_child"
               }"
               end

	g_node_last_sibling (a_node: POINTER): POINTER 
               -- g_node_last_sibling
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_node_last_sibling"
               }"
               end

	g_node_max_height (a_root: POINTER): NATURAL 
               -- g_node_max_height
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_node_max_height"
               }"
               end

	g_node_n_children (a_node: POINTER): NATURAL 
               -- g_node_n_children
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_node_n_children"
               }"
               end

	g_node_n_nodes (a_root: POINTER; a_flags: INTEGER): NATURAL 
               -- g_node_n_nodes
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_node_n_nodes"
               }"
               end

	g_node_new (a_data: POINTER): POINTER 
               -- g_node_new
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_node_new"
               }"
               end

	g_node_nth_child (a_node: POINTER; a_n: NATURAL): POINTER 
               -- g_node_nth_child
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_node_nth_child"
               }"
               end

	g_node_prepend (a_parent: POINTER; a_node: POINTER): POINTER 
               -- g_node_prepend
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_node_prepend"
               }"
               end

	g_node_reverse_children (a_node: POINTER) 
               -- g_node_reverse_children
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_node_reverse_children"
               }"
               end

	g_node_traverse (a_root: POINTER; an_order: INTEGER; a_flags: INTEGER; a_max_depth: INTEGER; a_func: POINTER; a_data: POINTER) 
               -- g_node_traverse
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_node_traverse"
               }"
               end

	g_node_unlink (a_node: POINTER) 
               -- g_node_unlink
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_node_unlink"
               }"
               end


end -- class GNODE_EXTERNALS
