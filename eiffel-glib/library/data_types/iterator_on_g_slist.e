indexing
	description: "Iterator for G_SLIST."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

class ITERATOR_ON_G_SLIST [ITEM->WRAPPER]
inherit
	ITERATOR [ITEM]
	WRAPPER_HANDLER
insert
	WRAPPER_FACTORY [ITEM]
	G_SLIST_EXTERNALS
	
creation make
	
feature {} -- Creation
	make (a_list: G_SLIST[ITEM]) is
		require valid_list: a_list/=Void
		do
			list := a_list.handle
		end
	
feature {} -- Implementation
	list: POINTER
	current_element: POINTER
feature -- Iterator's features
	start is
		do
			current_element := list
		end
	
	is_off: BOOLEAN is
		do
			Result:=(current_element.is_null)
		end
	
	item: ITEM is
		obsolete "suboptimal implementation"
		do
			Result := new_item
			Result.from_external_pointer (g_slist_get_data
													(current_element))
			-- Note: This implementation create a new wrapper object for
			-- each call to item. This is cleary inefficient. A possible
			-- solution could be to add singleton DICTIONARY that stores
			-- wrapper object and its wrapped C structure
		end
	
	next is
		do
			current_element := g_slist_get_next (current_element)
		end
end
