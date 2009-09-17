class HASHED_BIJECTIVE_DICTIONARY_NODE[V_ -> HASHABLE, K_ -> HASHABLE]
	--
	-- Auxilliary class to implement HASHED_BIJECTIVE_DICTIONARY.
	--

inherit
	ANY_HASHED_BIJECTIVE_DICTIONARY_NODE

creation {HASHED_BIJECTIVE_DICTIONARY}
	make

feature {HASHED_BIJECTIVE_DICTIONARY}
	val: V_

	key: K_

	next_key: like Current
			-- The forward link to the next `key' in case of hash-code clash.

	next_val: like Current
			-- The forward link to the next `val' in case of hash-code clash.

	make (v: like val; nv: like next_val; k: like key; nk: like next_key) is
		require
			v /= Void
			k /= Void
		do
			val := v
			next_val := nv
			key := k
			next_key := nk
		ensure
			val = v
			next_val = nv
			key = k
			next_key = nk
		end

	set_val (v: like val) is
		do
			val := v
		ensure
			val = v
		end

	set_next_val (nv: like next_val) is
		do
			next_val := nv
		ensure
			next_val = nv
		end

	set_key (k: like key) is
		do
			key := k
		ensure
			key = k
		end

	set_next_key (nk: like next_key) is
		do
			next_key := nk
		ensure
			next_key = nk
		end

	set_val_and_key (v: like val; k: like key) is
		do
			val := v
			key := k
		ensure
			val = v
			key = k
		end

invariant
	key /= Void
	val /= Void

end -- class HASHED_BIJECTIVE_DICTIONARY_NODE
