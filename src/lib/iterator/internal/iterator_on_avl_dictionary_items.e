class ITERATOR_ON_AVL_DICTIONARY_ITEMS[V_, K_]

inherit
	ITERATOR[V_]

insert
	AVL_TREE_ITERATOR[K_]

creation {ABSTRACT_AVL_DICTIONARY}
	make

feature {ANY}
	start is
		do
			if dico.root /= Void then
				nodes.push(dico.root)
				generation := iterable_generation
				go_first
			end
		end

	is_off: BOOLEAN is
		do
			Result := cur = Void
		end

	item: V_ is
		local
			node: like root
		do
			node ::= cur
			Result := node.value
		end

	next is
		do
			go_next
		end

feature {}
	make (a_dico: like dico) is
		do
			dico := a_dico
			create nodes.make
			start
		ensure
			dico = a_dico
		end

	dico: ABSTRACT_AVL_DICTIONARY[V_, K_]

	iterable_generation: INTEGER is
		do
			Result := dico.generation
		end

end -- class ITERATOR_ON_AVL_DICTIONARY_ITEMS
