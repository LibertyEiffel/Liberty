note
	description: "Iterator over STRING_ARRAY, wrapper of 'gchar **'"
	copyright: "[
					Copyright (C) 2007-2018: Paolo Redaelli
					
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

class STRING_ARRAY_ITERATOR

inherit ITERATOR[STRING]

create {ANY} make

feature {} -- Implementation and creation
	make (an_array: STRING_ARRAY)
		require array_not_void: an_array/=Void
		do
			array:=an_array
		end

	index: INTEGER

	array: STRING_ARRAY
	
feature {ANY}
	start do index:=array.lower end

	is_off: BOOLEAN do Result:=not array.valid_index(index) end

	item: STRING do Result:=array.item(index) end

	next do index:=index+1 end

end -- class STRING_ARRAY_ITERATOR
