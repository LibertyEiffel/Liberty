class ITERATOR_ON_LINKED_LIST[E_]
	-- Please do not use this class directly. Look at `ITERATOR'.

inherit
	ITERATOR[E_]

creation {ANY}
	make

feature {}
	linked_list: LINKED_LIST[E_]
			-- The one to be traversed.

	current_link: LINKED_LIST_NODE[E_]
			--  Memorize the current position.

feature {ANY}
	make (ll: LINKED_LIST[E_]) is
		require
			ll /= Void
		do
			linked_list := ll
			current_link := linked_list.first_link
		ensure
			linked_list = ll
		end

	start is
		do
			current_link := linked_list.first_link
		end

	is_off: BOOLEAN is
		do
			Result := current_link = Void
		end

	item: E_ is
		do
			Result := current_link.item
		end

	next is
		do
			current_link := current_link.next
		end

end -- class ITERATOR_ON_LINKED_LIST
