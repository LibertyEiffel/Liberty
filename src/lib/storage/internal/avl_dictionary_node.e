class AVL_DICTIONARY_NODE[V_, K_ -> COMPARABLE]
	--
	-- Auxiliary class to implement AVL_DICTIONARY.
	--

inherit
	AVL_TREE_NODE[K_]
		rename item as key,
			set_item as set_key
		end
	ANY_AVL_DICTIONARY_NODE

creation {AVL_DICTIONARY}
	default_create

feature {AVL_DICTIONARY, AVL_DICTIONARY_NODE}
	value: V_

	set_value (v: like value) is
		do
			value := v
		ensure
			value = v
		end

	fast_at (k: like key): AVL_DICTIONARY_NODE[V_, K_] is
			-- Is element `e' in the tree?
		local
			safe_equal: SAFE_EQUAL[K_]
		do
			if key = k then
				Result := Current
			elseif safe_equal.test(key, k) then
				-- because otherwise there would be an infinite recursion
				--Result := Void
			elseif k < key then
				if left /= Void then
					Result := left.fast_at(k)
				end
			else
				if right /= Void then
					Result := right.fast_at(k)
				end
			end
		end

	occurrences (v: V_): INTEGER is
		do
			Result := occurrences_(v, 0)
		end

	fast_occurrences (v: V_): INTEGER is
		do
			Result := fast_occurrences_(v, 0)
		end

	key_at (v: V_): K_ is
		local
			safe_equal: SAFE_EQUAL[V_]
		do
			if safe_equal.test(v, value) then
				Result := key
			elseif left /= Void then
				Result := left.key_at(v)
			elseif right /= Void then
				Result := right.key_at(v)
			end
		end

	fast_key_at (v: V_): K_ is
		do
			if v = value then
				Result := key
			elseif left /= Void then
				Result := left.fast_key_at(v)
			elseif right /= Void then
				Result := right.fast_key_at(v)
			end
		end

feature {AVL_DICTIONARY_NODE}
	occurrences_ (v: V_; cnt: INTEGER): INTEGER is
		local
			safe_equal: SAFE_EQUAL[V_]
		do
			Result := cnt
			if safe_equal.test(v, value) then
				Result := Result + 1
			end
			if left /= Void then
				Result := left.occurrences_(v, Result)
			end
			if right /= Void then
				Result := right.occurrences_(v, Result)
			end
		ensure
			Result >= cnt
		end

	fast_occurrences_ (v: V_; cnt: INTEGER): INTEGER is
		do
			Result := cnt
			if v = value then
				Result := Result + 1
			end
			if left /= Void then
				Result := left.fast_occurrences_(v, Result)
			end
			if right /= Void then
				Result := right.fast_occurrences_(v, Result)
			end
		ensure
			Result >= cnt
		end

feature {AVL_DICTIONARY} -- Creation:
	make (v: like value; k: like key) is
		do
			set_balance(balanced)
			left := Void
			right := Void
			set_value(v)
			set_key(k)
		ensure
			value = v
			key = k
		end

end -- class AVL_DICTIONARY_NODE
