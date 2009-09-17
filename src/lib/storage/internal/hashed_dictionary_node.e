class HASHED_DICTIONARY_NODE[V_, K_ -> HASHABLE]
	--
	-- Auxilliary class to implement HASHED_DICTIONARY.
	--

inherit
	ANY_HASHED_DICTIONARY_NODE

creation {HASHED_DICTIONARY}
	make

feature {HASHED_DICTIONARY}
	item: V_

	key: K_

	next: like Current
			-- The `next' one when some clash occurs.

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

	make (i: like item; k: like key; n: like next) is
		do
			item := i
			key := k
			next := n
		ensure
			item = i
			key = k
			next = n
		end

end -- class HASHED_DICTIONARY_NODE
