class ITERATOR_ON_AVL_DICTIONARY_KEYS[V_, K_]

inherit
	ITERATOR[K_]

insert
	AVL_TREE_ITERATOR[K_]

creation {ABSTRACT_AVL_DICTIONARY}
	make

feature {ANY}
	start is
		do
			if root /= Void then
				nodes.push(root)
				go_first
			end
		end

	is_off: BOOLEAN is
		do
			Result := cur = Void
		end

	item: K_ is
		local
			node: like root
		do
			node ::= cur
			Result := node.key
		end

	next is
		do
			go_next
		end

feature {}
	make (a_root: like root) is
		do
			root := a_root
			create nodes.make
		ensure
			root = a_root
		end

	root: ABSTRACT_AVL_DICTIONARY_NODE[V_, K_]

end -- class ITERATOR_ON_AVL_DICTIONARY_KEYS
