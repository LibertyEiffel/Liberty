note
	description: "Iterator for G_SLIST_STRING."
	copyright: "[
					Copyright (C) 2006-2022: Paolo Redaelli
					
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

class ITERATOR_ON_G_SLIST_STRING 
inherit
	ITERATOR [STRING]
	WRAPPER_HANDLER
insert
	G_SLIST_EXTERNALS
	
create {ANY} make
	
feature {} -- Creation
	make (a_list: G_SLIST_STRING)
		require valid_list: a_list/=Void
		do
			list := a_list.handle
		end
	
feature {} -- Implementation
	list: POINTER
	current_element: POINTER
feature {ANY} -- Iterator's features
	start
		do
			current_element := list
		end
	
	is_off: BOOLEAN
		do
			Result:=(current_element.is_null)
		end
	
	item: STRING
		local cstr: POINTER
		do
			cstr := g_slist_get_data(current_element)
			check 
				string_not_null: cstr.is_not_null 
			end
			create Result.from_external_copy(cstr)
		ensure result_not_void: Result /= Void
		end
	
	next
		do
			current_element := g_slist_get_next (current_element)
		end
end
