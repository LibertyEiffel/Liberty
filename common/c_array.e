indexing
	description: "."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli 
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hopeOA that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

class C_ARRAY [ITEM -> WRAPPER]
	-- TODO: ITEM could also be conformant to C_STRUCT or
	-- SHARED_C_STRUCT. See which is the better design.

inherit FAST_ARRAY [ITEM]
	
creation
	make, with_capacity,
	from_collection,
	from_external_array

feature {} -- Creation
	from_external_array (an_array: POINTER; a_length: INTEGER) is
		require
			array_not_null: an_array.is_not_null
			positive_length: a_length > 0
		do
			capacity := a_length
			storage := storage.from_pointer (an_array)
		end
end -- class C_ARRAY
