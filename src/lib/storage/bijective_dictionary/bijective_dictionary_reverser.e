class BIJECTIVE_DICTIONARY_REVERSER[V_, K_]
	-- Allows to view a BIJECTIVE_DICTIONARY[V_, K_] as a BIJECTIVE_DICTIONARY[K_, V_]

inherit
	BIJECTIVE_DICTIONARY[V_, K_]

creation {ANY}
	from_bijective_dictionary

feature {ANY}
	from_bijective_dictionary (bijective_dictionary_: like bijective_dictionary) is
		do
			bijective_dictionary := bijective_dictionary_
		end

	count: INTEGER is
		do
			Result := bijective_dictionary.count
		end

	has (k: K_): BOOLEAN is
		do
			Result := bijective_dictionary.has_value(k)
		end

	at (k: K_): V_ is
		do
			Result := bijective_dictionary.key_at(k)
		end

	reference_at (k: K_): V_ is
		do
			if has(k) then
				Result := at(k)
			end
		end

	fast_has (k: K_): BOOLEAN is
		do
			Result := bijective_dictionary.fast_has_value(k)
		end

	fast_at (k: K_): V_ is
		do
			Result := bijective_dictionary.fast_key_at(k)
		end

	fast_reference_at (k: K_): V_ is
		do
			if fast_has(k) then
				Result := fast_at(k)
			end
		end

	has_value (v: V_): BOOLEAN is
		do
			Result := bijective_dictionary.has(v)
		end

	key_at (v: V_): K_ is
		do
			Result := bijective_dictionary.at(v)
		end

	fast_has_value (v: V_): BOOLEAN is
		do
			Result := bijective_dictionary.fast_has(v)
		end

	fast_key_at (v: V_): K_ is
		do
			Result := bijective_dictionary.fast_at(v)
		end

	put (v: V_; k: K_) is
		do
			remove(k)
			add(v, k)
		end

	add (v: V_; k: K_) is
		do
			bijective_dictionary.add(k, v)
		end

	remove (k: K_) is
		local
			v: V_
		do
			if has(k) then
				v := at(k)
				bijective_dictionary.remove(v)
			end
		end

	clear_count is
		do
			bijective_dictionary.clear_count
		end

	clear_count_and_capacity is
		do
			bijective_dictionary.clear_count_and_capacity
		end

	capacity: INTEGER is
		do
			Result := bijective_dictionary.capacity
		end

	item (index: INTEGER): V_ is
		do
			Result := bijective_dictionary.key(index)
		end

	key (index: INTEGER): K_ is
		do
			Result := bijective_dictionary.item(index)
		end

	copy (other: like Current) is
		do
			bijective_dictionary := other.bijective_dictionary
		end

	internal_key (k: K_): K_ is
		do
			Result := key_at(at(k))
		end

feature {BIJECTIVE_DICTIONARY}
	bijective_dictionary: BIJECTIVE_DICTIONARY[K_, V_]

end -- class BIJECTIVE_DICTIONARY_REVERSER
