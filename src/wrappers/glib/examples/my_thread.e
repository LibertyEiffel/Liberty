class MY_THREAD
inherit G_THREAD 
feature {ANY} 
	run is
		do
			-- print("I'm a new thread, doing hard work (sleeping) for "+secs.to_string+" seconds%N")
			-- sleep(secs.to_natural_32)
			-- print("Done!%N")
			(1|..|upper).for_all(agent is_prime)
		end
	

	upper: INTEGER_32
	set(n: like upper) is do upper:=n end
	sleep (a: NATURAL_32) is
		external "C use <unistd.h>"
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
 
