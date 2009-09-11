-- See the Copyright notice at the end of this file.
--
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
--
-- ------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- This file is part of the SmartEiffel standard library.
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
-- documentation files (the "Software"), to deal in the Software without restriction, including without
-- limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
-- the Software, and to permit persons to whom the Software is furnished to do so, subject to the following
-- conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
-- AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
-- OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------
