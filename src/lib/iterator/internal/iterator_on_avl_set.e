class ITERATOR_ON_AVL_SET[E_]

inherit
	ITERATOR[E_]

insert
	AVL_TREE_ITERATOR[E_]

creation {ABSTRACT_AVL_SET}
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

	item: E_ is
		local
			node: like root
		do
			node ::= cur
			Result := node.item
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

	root: ABSTRACT_AVL_SET_NODE[E_]

end -- class ITERATOR_ON_AVL_SET
