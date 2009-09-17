class ITERATOR_ON_SET[E_]
	-- Please do not use this class directly. Look at `ITERATOR'.

inherit
	ITERATOR[E_]

creation {ANY}
	make

feature {}
	set: SET[E_]
			-- The one to be traversed.

	item_index: INTEGER

feature {ANY}
	make (d: SET[E_]) is
		require
			d /= Void
		do
			set := d
			item_index := 1
		ensure
			set = d
		end

	start is
		do
			item_index := 1
		end

	is_off: BOOLEAN is
		do
			Result := item_index > set.count
		end

	item: E_ is
		do
			Result := set.item(item_index)
		end

	next is
		do
			item_index := item_index + 1
		end

end -- class ITERATOR_ON_SET
