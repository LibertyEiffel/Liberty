expanded class PREREQUISITES_ITERATOR
insert 
	ITERATOR[GI_BASE_INFO]
		redefine default_create end
create{GI_INTERFACE_INFO} default_create

feature {ANY}
	default_create is
		do
			-- Setting generation and iterable_generation to different values
			-- so that any invocation of the queries and commands requiring
			-- is_valid will fail. 
			-- set_class will make sure that is_valid is set.
			iterable_generation := -1
			generation := 0
		end

feature {GI_INTERFACE_INFO}
	from_interface (an_interface: GI_INTERFACE_INFO) is
	do
		interface:=an_interface
		iterable_generation:=generation
	end

feature {ANY}
	start is
	do
		i:=interface.prerequisites_lower
	end

   is_off: BOOLEAN is
	  do
		  Result := i>interface.prerequisites_upper
      end

	item: GI_BASE_INFO is
		do
			Result:=interface.prerequisite(i)
		end

	next is
		do
			i:=i+1
		end

feature {} -- Implementation
	interface: GI_INTERFACE_INFO
	i: INTEGER
feature {ANY} -- Check that the underlying traversable has not changed
   iterable_generation: INTEGER is
	  attribute
      end

   generation: INTEGER is
	  attribute
      end

end

-- Copyright (C) 2013-2022: Paolo Redaelli <paolo.redaelli@gmail.com>
-- 
-- This library is free software; you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public License
-- as published by the Free Software Foundation; either version 2.1 of
-- the License, or (at your option) any later version.
-- 
-- This library is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Lesser General Public License for more details.
-- 
-- You should have received a copy of the GNU Lesser General Public
-- License along with this library; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
-- 02110-1301 USA
	
