class LINKED_LIST_NODE[E_]
	--
	-- To implement LINKED_LIST.
	--

inherit
	ANY_LINKED_LIST_NODE

creation {LINKED_LIST}
	make

feature {LINKED_LIST_NODE, ITERATOR_ON_LINKED_LIST, LINKED_LIST}
	item: E_

	next: like Current

feature {LINKED_LIST}
	make (i: like item; n: like next) is
		do
			item := i
			next := n
		ensure
			item = i
			next = n
		end

feature {LINKED_LIST_NODE, LINKED_LIST}
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

end -- class LINKED_LIST_NODE
