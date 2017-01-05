class GI_VALUE_INFO

inherit
	WRAPPER 
	REFERENCE_COUNTED
	ANY -- to get standard copy and is_equal features

insert 
	GIBASEINFO_EXTERNALS
	GIENUMINFO_EXTERNALS

create{GI_INFO_FACTORY, WRAPPER} from_external_pointer

feature {ANY} 
	value: INTEGER_64 is
   		-- the enumeration value. This will always be representable as a 32-bit signed or unsigned value. 64 bits are used to allow both.
		do
			Result := g_value_info_get_value(handle)
		end

	ref is
		local p: POINTER
		do
			p:=g_base_info_ref(handle)
		end

	unref is
		do
			g_base_info_unref(handle)
		end
		
-- feature {ANY}
-- 	copy (another: like Current) is
-- 		do
-- 			handle:=another.handle
-- 		end
-- 
-- 	is_equal (another: like Current): BOOLEAN is
-- 		do
-- 			Result := handle = another.handle
-- 		end
-- 
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
	
