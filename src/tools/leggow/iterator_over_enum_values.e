class ITERATOR_OVER_ENUM_VALUES
inherit ITERATOR[GI_VALUE_INFO]
create{GI_ENUM_INFO} from_enum
feature {} -- Creation
	from_enum (an_enum: GI_ENUM_INFO) is
	require a_enum/=Void
	do
		enum:=an_enum
	end

feature {ANY}
	start is
	do
		i:=enum.lower
	end

	item: GI_VALUE_INFO is
		do
			Result := enum.item(i)
		end

	is_off: BOOLEAN is 
	do
		Result:=enum.valid_index(i)
	end

	next is
	do
		i:=i+1
	end

feature {}
	enum: GI_ENUM_INFO
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
	
