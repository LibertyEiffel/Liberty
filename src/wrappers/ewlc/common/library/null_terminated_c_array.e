note
	description: "Wrapper for NULL terminated array of pointer."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli 
					
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

deferred class NULL_TERMINATED_C_ARRAY [ITEM_ -> C_STRUCT]
	-- A NULL-terminated C_ARRAY, useful since many low-level C
	-- functions expect to receive such arrays. 

	-- The NULL (default_pointer in Eiffel) is not counted as an
	-- element of the array.

inherit C_ARRAY [ITEM_]
	redefine
		with_capacity
	end
								 
-- creation with_capacity, from_collection, from_external

feature {} -- Creation
	-- Note: space allocated in storage must always be capacity+1 large, to
	-- store the ending NULL pointer

	from_external (an_array: POINTER) is
			-- Initialize the NULL_TERMINATED_C_ARRAY from `an_array'
			-- pointer. The array is inspected from the beginning to
			-- discover the first NULL pointer that marks its end.
		require
			array_not_null: an_array.is_not_null
		local
			i: INTEGER
		do
			storage := storage.from_pointer (an_array)
			-- Look for NULL
			from
				i := lower
			until
				storage.item(i).is_null
			loop
				i := i + 1
			end
			upper := i - 1
			capacity := count
		end
	
	with_capacity (a_capacity: INTEGER) is
		do
			capacity := a_capacity
			upper := -1
			storage := storage.calloc(a_capacity+1)
		end

feature {ANY}
	is_null_terminated: BOOLEAN is
		do
			-- 0 1 2 3 4
			-- a b c d NULL
			Result := storage.item(upper + 1).is_null
		end

invariant 
	null_terminated: is_null_terminated
end -- class NULL_TERMINATED_C_ARRAY
