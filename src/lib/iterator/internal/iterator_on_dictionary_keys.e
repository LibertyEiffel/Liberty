class ITERATOR_ON_DICTIONARY_KEYS[V_, K_]
	-- Please do not use this class directly. Look at `ITERATOR'.

inherit
	ITERATOR[K_]

creation {ANY}
	make

feature {}
	dictionary: DICTIONARY[V_, K_]
			-- The one to be traversed.

	item_index: INTEGER

feature {ANY}
	make (d: like dictionary) is
		require
			d /= Void
		do
			dictionary := d
			item_index := 1
		ensure
			dictionary = d
		end

	start is
		do
			item_index := 1
		end

	is_off: BOOLEAN is
		do
			Result := item_index > dictionary.count
		end

	item: K_ is
		do
			Result := dictionary.key(item_index)
		end

	next is
		do
			item_index := item_index + 1
		end

end -- class ITERATOR_ON_DICTIONARY_KEYS
