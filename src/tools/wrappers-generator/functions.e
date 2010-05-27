class FUNCTIONS
	-- Some GCC-XML nodes describing functions grouped by the id of the file they are defined into.

inherit HASHED_DICTIONARY[LINKED_LIST[C_FUNCTION], UNICODE_STRING]

creation make

feature 
	store (a_function: C_FUNCTION) is
		-- Store `a_function' into Current, creating the container list if necessary.
		require a_function/=Void
		local list: LINKED_LIST[C_FUNCTION]; an_id: UNICODE_STRING
		do
			an_id := a_function.file_id 
			list := reference_at (an_id)
			if list=Void then 
				create list.make
				add(list, an_id)
			end
			list.add_last(a_function)
		end

end	
-- Copyright 2008,2009,2010 Paolo Redaelli

-- wrappers-generator  is free software: you can redistribute it and/or modify it
-- under the terms of the GNU General Public License as published by the Free
-- Software Foundation, either version 2 of the License, or (at your option)
-- any later version.

-- wrappers-generator is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-- or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-- more details.

-- You should have received a copy of the GNU General Public License along with
-- this program.  If not, see <http://www.gnu.org/licenses/>.
