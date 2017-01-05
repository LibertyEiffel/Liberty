class ITERATOR_OVER_UNION_FIELDS
inherit ITERATOR[GI_FIELD_INFO]
create{GI_UNION_INFO} from_union
feature {} -- Creation
	from_union (a_union: GI_UNION_INFO) is
	require a_union/=Void
	do
		union:=a_union
	end

feature {ANY}
	start is
	do
		i:=union.fields_lower
	end

	item: GI_FIELD_INFO is
		do
			Result := union.field(i)
		end

	is_off: BOOLEAN is 
	do
		Result:= i>union.fields_upper
	end

	next is
	do
		i:=i+1
	end

feature {}
	union: GI_UNION_INFO
	i: INTEGER	

feature {ANY} -- Check that the underlying traversable has not changed
   iterable_generation: INTEGER is
	  attribute
      end

   generation: INTEGER is
	  attribute
      end

end 

-- Copyright (C) 2013-2017: Paolo Redaelli <paolo.redaelli@gmail.com>
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
	
