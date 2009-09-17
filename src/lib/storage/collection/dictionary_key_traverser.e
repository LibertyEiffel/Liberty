class DICTIONARY_KEY_TRAVERSER[V_, K_]
	-- This class allows you to view a DICTIONARY[V_, K_] as a TRAVERSABLE[K_].  Note that there is no need for
	-- a DICTIONARY_ITEM_TRAVERSER because DICTIONARY[V_, K_] is already a TRAVERSABLE[V_].

inherit
	TRAVERSABLE[K_]

creation {ANY}
	from_dictionary

feature {ANY}
	from_dictionary (dictionary_: like dictionary) is
		do
			dictionary := dictionary_
		end

feature {ANY}
	lower: INTEGER is
		do
			Result := dictionary.lower
		end

	upper: INTEGER is
		do
			Result := dictionary.upper
		end

feature {ANY}
	count: INTEGER is
		do
			Result := dictionary.count
		end

	is_empty: BOOLEAN is
		do
			Result := dictionary.is_empty
		end

feature {ANY}
	item (i: INTEGER): K_ is
		do
			Result := dictionary.key(i)
		end

	first: like item is
		do
			Result := item(lower)
		end

	last: like item is
		do
			Result := item(upper)
		end

feature {ANY}
	new_iterator: ITERATOR[K_] is
		do
			Result := dictionary.new_iterator_on_keys
		end

feature {}
	dictionary: DICTIONARY[V_, K_]

end -- class DICTIONARY_KEY_TRAVERSER
