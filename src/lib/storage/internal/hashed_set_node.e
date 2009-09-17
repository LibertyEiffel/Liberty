class HASHED_SET_NODE[E_ -> HASHABLE]
	--
	-- Auxilliary class to implement HASHED_SET.
	--

inherit
	ANY_HASHED_SET_NODE

creation {HASHED_SET}
	make

feature {HASHED_SET}
	item: E_

	next: like Current
			-- The `next' one when some clash occurs.

	set_next (n: like next) is
		do
			next := n
		ensure
			next = n
		end

feature {HASHED_SET}
	make (i: like item; n: like next) is
		do
			item := i
			next := n
		ensure
			item = i
			next = n
		end

end -- class HASHED_SET_NODE
