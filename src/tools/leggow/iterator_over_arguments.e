class ITERATOR_OVER_ARGUMENTS
inherit ITERATOR[GI_ARG_INFO]
create{GI_CALLABLE_INFO} from_callable
feature {} -- Creation
	from_callable (a_callable: GI_CALLABLE_INFO) is
	require a_callable/=Void
	do
		callable:=a_callable
		iterable_generation := generation
	end

feature {ANY}
	start is
	do
		i:=callable.lower
	end

	item: GI_ARG_INFO is
		do
			Result := callable.item(i)
		end

	is_off: BOOLEAN is 
	do
		Result:=callable.valid_index(i)
	end

	next is
	do
		i:=i+1
	end

feature {}
	callable: GI_CALLABLE_INFO
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
	
