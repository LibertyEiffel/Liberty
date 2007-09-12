indexing
	description: "."
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class ITERATOR_ON_G_LIST [ITEM->SHARED_C_STRUCT]

inherit
	ITERATOR [ITEM]
	WRAPPER_HANDLER

insert
	G_LIST_EXTERNALS
	
creation make
	
feature {} -- Creation
	make (a_list: G_LIST[ITEM]) is
		require valid_list: a_list/=Void
		do
			list := a_list
		end
	
feature {} -- Implementation
	list:  G_LIST[ITEM]
	
	current_element: POINTER
feature -- Iterator's features
	start is
		do
			current_element := list.handle
		end
	
	is_off: BOOLEAN is
		do
			Result:=(current_element.is_null)
		end
	
	item: ITEM is
		local ptr: POINTER
		do
			ptr := g_list_get_data (current_element)
			if ptr.is_not_null then Result:=list.factory.wrapper(ptr) end
		end
	
	next is
		do
			current_element := g_list_next (current_element)
		end

feature -- Bi-directional iterator features.
	start_from_end is
			-- Positions the iterator to the last object of traversed
			-- aggregate
		do
			current_element := g_list_last (list.handle)
		end
	
	previous is
		require not is_off 
		do
			current_element := g_list_previous (current_element)
		end
feature
	dispose is
		do
			-- Note: disposing an interator is a no-operation.
		end
end
