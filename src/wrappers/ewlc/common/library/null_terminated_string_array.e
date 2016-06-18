note
	description: "Wrapper for NULL terminated array of strings."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli 
					
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

class NULL_TERMINATED_STRING_ARRAY
	-- A NULL-terminated STRING_ARRAY, useful since many low-level C
	-- functions expect to receive such arrays. 

	-- The NULL (default_pointer in Eiffel) is not counted as an
	-- element of the array.

inherit  STRING_ARRAY --  redefine with_capacity end
								 
create {ANY} from_collection, from_external --, with_capacity

feature {} -- Creation
	-- Note: space allocated in storage must always be capacity+1 large, to
	-- store the ending NULL pointer


	from_external (an_array: POINTER)
			-- Initialize the NULL_TERMINATED_C_ARRAY from `an_array'
			-- pointer. The array is inspected from the beginning to
			-- discover the first NULL pointer that marks its end.
		require array_not_null: an_array.is_not_null
		local a_lenght: INTEGER
		do
			storage := storage.from_pointer (an_array)
			-- Look for NULL
			from a_lenght:=lower until storage.item(a_lenght).is_null loop a_lenght:=a_lenght+1 end
			create strings.make(a_lenght)
			fill_strings
		end
	
	-- with_capacity (a_capacity: INTEGER) do
	-- storage:=storage.calloc(a_capacity+1) create
	-- strings.make(a_capacity+1) end

feature {ANY}
	is_null_terminated: BOOLEAN
		do
			-- 0 1 2 3 4
			-- a b c d NULL
			Result:=storage.item(upper+1).is_null
		end

invariant 
	null_terminated: is_null_terminated
end -- class NULL_TERMINATED_STRING_ARRAY
