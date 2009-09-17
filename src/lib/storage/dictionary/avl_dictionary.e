-- See the Copyright notice at the end of this file.
--
class AVL_DICTIONARY[V_, K_ -> COMPARABLE]
	--
	-- Associative memory. Values of type `V_' are stored using Keys of type `K_'.
	--
	-- Efficient implementation of DICTIONARY using an AVL balanced tree. AVL stands for the names of G. M. Adel'son-Velskii
	-- and E. M. Landis, two Russian mathematicians who first came up with this method of keeping the tree balanced.
	--

inherit
	SIMPLE_DICTIONARY[V_, K_]
		redefine occurrences, fast_occurrences, key_at, fast_key_at, copy
		end

insert
	AVL_TREE[K_]
		rename item_memory as key_memory
		end

creation {ANY}
	make, manifest_creation

feature {ANY}
	capacity: INTEGER is
		do
			Result := count
		end

	at (k: K_): V_ is
		do
			Result := root.at(k).value
		end

	fast_at (k: K_): V_ is
		do
			Result := root.fast_at(k).value
		end

	reference_at (k: K_): V_ is
		local
			n: AVL_DICTIONARY_NODE[V_, K_]
		do
			if root /= Void then
				n := root.at(k)
				if n /= Void then
					Result := n.value
				end
			end
		end

	fast_reference_at (k: K_): V_ is
		local
			n: AVL_DICTIONARY_NODE[V_, K_]
		do
			if root /= Void then
				n := root.fast_at(k)
				if n /= Void then
					Result := n.value
				end
			end
		end

	put, add (v: V_; k: K_) is
		do
			value_memory := v
			key_memory := k
			root := do_insert(root)
		end

	fast_put (v: V_; k: K_) is
		do
			value_memory := v
			key_memory := k
			root := fast_do_insert(root)
		end

	occurrences (v: V_): INTEGER is
		do
			if root /= Void then
				Result := root.occurrences(v)
			end
		end

	fast_occurrences (v: V_): INTEGER is
		do
			if root /= Void then
				Result := root.fast_occurrences(v)
			end
		end

	key_at (v: V_): K_ is
		do
			Result := root.key_at(v)
		end

	fast_key_at (v: V_): K_ is
		do
			Result := root.fast_key_at(v)
		end

	clear_count, clear_count_and_capacity is
		do
			if not is_empty then
				clear_nodes(root)
				root := Void
				count := 0
				map_dirty := True
			end
		end

	item (index: INTEGER): V_ is
		do
			if map_dirty then
				build_map
			end
			Result := map.item(index - 1).value
		end

	key (index: INTEGER): K_ is
		do
			if map_dirty then
				build_map
			end
			Result := map.item(index - 1).key
		end

	new_iterator_on_keys: ITERATOR[K_] is
		do
			create {ITERATOR_ON_DICTIONARY_KEYS[V_, K_]} Result.make(Current)
		end

	internal_key (k: K_): K_ is
		do
			Result := root.at(k).key
		end

	copy (other: like Current) is
		do
			make
			Precursor(other)
		end

feature {}
	value_memory: V_

	set_value_and_key (n: like a_new_node) is
		do
			n.make(value_memory, key_memory)
		end

	set_value (n: like a_new_node) is
		do
			n.set_value(value_memory)
		end

	exchange_and_discard (n1, n2: like root) is
		do
			n1.set_key(n2.key)
			n1.set_value(n2.value)
			rebalance := True
			count := count - 1
			discard_node(n2)
		end

	discard_node (n: like a_new_node) is
		local
			v: V_; k: K_
		do
			n.make(v, k)
			n.set_left(lost_nodes.item)
			lost_nodes.set_item(n)
		end

	common_lost_nodes: DICTIONARY[WEAK_REFERENCE[ANY_AVL_DICTIONARY_NODE], STRING] is
		once
			create {HASHED_DICTIONARY[WEAK_REFERENCE[ANY_AVL_DICTIONARY_NODE], STRING]} Result.make
		end

	a_new_node: AVL_DICTIONARY_NODE[V_, K_] is
		do
			create Result
		end

	make is
		do
			create map.make(0)
			lost_nodes ::= common_lost_nodes.reference_at(generating_type)
			if lost_nodes = Void then
				create lost_nodes.set_item(Void)
				common_lost_nodes.add(lost_nodes, generating_type)
			end
		end

invariant
	lost_nodes /= Void
	lost_nodes = common_lost_nodes.at(generating_type)

end -- class AVL_DICTIONARY
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
