class ITERATOR_ON_TWO_WAY_LINKED_LIST[E_]
	-- Please do not use this class directly. Look at `ITERATOR'.

inherit
	ITERATOR[E_]

creation {ANY}
	make

feature {}
	linked_list: TWO_WAY_LINKED_LIST[E_]
			-- The one to be traversed.

	item_link: TWO_WAY_LINKED_LIST_NODE[E_]
			--  Memorize the current position.

feature {ANY}
	make (twll: TWO_WAY_LINKED_LIST[E_]) is
		require
			twll /= Void
		do
			linked_list := twll
			item_link := linked_list.first_link
		ensure
			linked_list = twll
		end

	start is
		do
			item_link := linked_list.first_link
		end

	is_off: BOOLEAN is
		do
			Result := item_link = Void
		end

	item: E_ is
		do
			Result := item_link.item
		end

	next is
		do
			item_link := item_link.next
		end

end -- class ITERATOR_ON_TWO_WAY_LINKED_LIST
