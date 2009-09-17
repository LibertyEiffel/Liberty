class TWO_WAY_LINKED_LIST_NODE[E_]
	--
	-- To implement TWO_WAY_LINKED_LIST.
	--

inherit
	ANY_TWO_WAY_LINKED_LIST_NODE

creation {TWO_WAY_LINKED_LIST}
	make

feature {ITERATOR_ON_TWO_WAY_LINKED_LIST, TWO_WAY_LINKED_LIST, TWO_WAY_LINKED_LIST_NODE}
	item: E_

	previous, next: like Current

feature {TWO_WAY_LINKED_LIST}
	make (i: like item; p: like previous; n: like next) is
		do
			item := i
			previous := p
			next := n
		ensure
			item = i
			previous = p
			next = n
		end

feature {TWO_WAY_LINKED_LIST, TWO_WAY_LINKED_LIST_NODE}
	set_item (i: like item) is
		do
			item := i
		ensure
			item = i
		end

	set_next (n: like next) is
		do
			next := n
		ensure
			next = n
		end

	set_all_with (v: like item) is
		local
			lnk: like Current
		do
			from
				lnk := Current
			until
				lnk = Void
			loop
				lnk.set_item(v)
				lnk := lnk.next
			end
		end

	set_previous (p: like previous) is
		do
			previous := p
		ensure
			previous = p
		end

end -- class TWO_WAY_LINKED_LIST_NODE
