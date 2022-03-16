class ITERATOR_OVER_STRUCT_FIELDS
inherit ITERATOR[GI_FIELD_INFO]
create{GI_STRUCT_INFO} from_struct
feature {} -- Creation
    from_struct (a_struct: GI_STRUCT_INFO) is
		do
			struct := a_struct
			iterable_generation := generation
		end
feature {ANY}
	start is
	do
		i:=struct.fields_lower
	end

	is_off: BOOLEAN is
	do
		Result := i>struct.fields_upper
	end

	item: GI_FIELD_INFO is
	do
		Result := struct.field(i)
	end

	next is do i:=i+1 end

feature {} -- Implementation
	struct: GI_STRUCT_INFO
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
	
