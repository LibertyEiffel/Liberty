class THREAD_POOL_EXAMPLE
inherit G_THREAD_POOL [DO_STUFF]
create {ANY} main

feature {ANY} 
	main is
		-- Starting point
	do
		make(12, False) -- maximum twelve non exclusive threads.
		(1|..|100).do_all(agent (i: INTEGER_32) is 
			do
				push (create {DO_STUFF}.make(100000+i))
			end)
	end

	new_routine: DO_STUFF is
		do
			create Result
		end
end

-- Copyright (C) 2011 Paolo Redaelli, 2013 Cyril Adrian

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
 
