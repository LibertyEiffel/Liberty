class ITERATOR_ON_TRAVERSABLE[E_]
	-- Please do not use this class directly. Look at `ITERATOR'.
	
inherit
	ITERATOR[E_]
	
creation {ANY}
	make
	
feature {}
	traversable: TRAVERSABLE[E_]
			-- The one to be traversed.
	
	item_index: INTEGER
			--  Memorize the current position.

feature {ANY}
	make (t: like traversable) is
		require
			t /= Void
		do
			traversable := t
			item_index := t.lower
		ensure
			traversable = t
		end

	start is
		do
			item_index := traversable.lower
		end

	is_off: BOOLEAN is
		do
			Result := not traversable.valid_index(item_index)
		end

	item: E_ is
		do
			Result := traversable.item(item_index)
		end

	next is
		do
			item_index := item_index + 1
		end

end -- class ITERATOR_ON_TRAVERSABLE
