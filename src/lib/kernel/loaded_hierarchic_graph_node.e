class LOADED_HIERARCHIC_GRAPH_NODE[E -> HASHABLE, LOAD]

inherit
	HIERARCHIC_GRAPH_NODE[E]
		redefine make, add_parent, add_child, remove_parent, remove_child
		end

creation {ANY}
	make

feature {ANY}
	make (i: like item) is
		do
			if parents_edge_load = Void then
				create parents_edge_load.make(0)
				create children_edge_load.make(0)
			end
			Precursor(i)
		end

feature {ANY}
	parent_edge_load (i: INTEGER): LOAD is
		require
			i.in_range(1, parents_count)
		do
			Result := parents_edge_load.item(i - 1)
		end

	child_edge_load (i: INTEGER): LOAD is
		require
			i.in_range(1, children_count)
		do
			Result := children_edge_load.item(i - 1)
		end

	add_parent (node: like Current) is
		local
			null: LOAD
		do
			Precursor(node)
			parents_edge_load.add_last(null)
		end

	add_child (node: like Current) is
		local
			null: LOAD
		do
			Precursor(node)
			children_edge_load.add_last(null)
		end

	remove_parent (node: like Current) is
		local
			i: INTEGER
		do
			-- possible improvement
			i := node.children.fast_first_index_of(Current)
			Precursor(node)
			parents_edge_load.remove(i)
		end

	remove_child (node: like Current) is
		local
			i: INTEGER
		do
			-- possible improvement
			i := node.parents.fast_first_index_of(Current)
			Precursor(node)
			children_edge_load.remove(i)
		end

feature {LOADED_HIERARCHIC_GRAPH_NODE}
	parents_edge_load: FAST_ARRAY[LOAD]

	children_edge_load: FAST_ARRAY[LOAD]

end -- class LOADED_HIERARCHIC_GRAPH_NODE
