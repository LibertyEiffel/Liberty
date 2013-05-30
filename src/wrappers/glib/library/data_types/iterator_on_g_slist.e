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

class ITERATOR_ON_G_SLIST [ITEM_->WRAPPER]
inherit
	ITERATOR [ITEM_]
	WRAPPER_HANDLER

insert
	GSLIST_EXTERNALS
	GSLIST_STRUCT
	GLOBAL_CACHE

create {ANY} make
	
feature {} -- Creation
	make (a_list: G_SLIST_TRAVERSABLE[ITEM_]) is
		require
         valid_list: a_list /= Void
		do
			list := a_list
		end
	
feature {} -- Implementation
	list: G_SLIST_TRAVERSABLE[ITEM_]
	current_element: POINTER

feature {ANY} -- Iterator's features
	start is
		do
			current_element := list.handle
		end
	
	is_off: BOOLEAN is
		do
			Result:=(current_element.is_null)
		end
	
	item: ITEM_ is
		local
         ptr: POINTER
         l: WRAPPER
		do
			ptr := gslist_struct_get_data (current_element)
			if ptr.is_not_null then 
				l := wrappers.reference_at(ptr)
				Result ?= l -- TODO: this tricks the compiler. Combining the line just above and this one seems to fail
				if Result = Void then
					Result := list.wrapper(ptr)
				end
			end
		end
	
	next is
		do
			current_element := gslist_struct_get_next (current_element)
		end
end
