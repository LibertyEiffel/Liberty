indexing
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$REvision:$"

class STRING_EXAMPLE

create {ANY} make
feature {ANY}
	string: G_STRING
	make is
		local i: INTEGER; c: CHARACTER
		do
			create string.make (10)
			print ("String count is "+string.count.out+"%N")
			from i:=0; c:='a' until c>'j' loop
				string.put(c,i)
				c:=c.next
				i:=i+1
			end
			print(string.to_string)
		end
end	
				
-- Copyright (C) 2009 Paolo Redaelli, 2013 Cyril Adrian

-- This library is free software; you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public License
-- as published by the Free Software Foundation; either version 2.1 of
-- the License, or (at your option) any later version.
--
-- This library is distributed in the hopeOA that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Lesser General Public License for more details.
--
-- You should have received a copy of the GNU Lesser General Public
-- License along with this library; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
-- 02110-1301 USA
 
