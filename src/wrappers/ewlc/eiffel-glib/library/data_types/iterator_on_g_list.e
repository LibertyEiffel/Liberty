note
	description: "."
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class ITERATOR_ON_G_LIST [ITEM->WRAPPER]
inherit
	ITERATOR [ITEM]
	WRAPPER_HANDLER

insert
   G_LIST_EXTERNALS
   GLOBAL_CACHE
	
create {ANY} make
	
feature {} -- Creation
	make (a_list: G_LIST_TRAVERSABLE[ITEM])
		require
         valid_list: a_list /= Void
		do
			list := a_list
		end
	
feature {} -- Implementation
	list: G_LIST_TRAVERSABLE[ITEM]
	current_element: POINTER

feature {ANY} -- Iterator's features
	start
		do
			current_element := list.handle
		end
	
	is_off: BOOLEAN
		do
			Result := (current_element.is_null)
		end
	
	item: ITEM
		local
         ptr: POINTER
         l: WRAPPER
		do
			ptr := g_list_get_data (current_element)
			if ptr.is_not_null then
            l := wrappers.reference_at(ptr)
				Result ?= l -- TODO: this tricks the compiler. Combining the line just above and this one seems to fail
				if Result=Void then Result:=list.wrapper(ptr) end
			end
		end
	
	next
		do
			current_element := g_list_get_next (current_element)
		end

feature {ANY} -- Bi-directional iterator features.
	is_at_first: BOOLEAN
			-- Is Current iterator at the beginning of the G_LIST?
		do
			Result := (current_element = list.handle)
		end
	
	prev
		require past_start: not is_at_first
		do
			current_element := g_list_get_prev (current_element)
		end

	--feature dispose do -- Note: disposing an interator is a
	--no-operation.  end
end
