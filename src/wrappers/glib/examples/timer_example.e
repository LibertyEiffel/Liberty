class TIMER_EXAMPLE

create {ANY} make
feature {ANY}
	timer: G_TIMER
	make is
		local t: REAL
		do
			create timer
			print("G_TIMER is "+timer.object_size.out+" bytes long%N")
			from  until timer.elapsed > 10.0
			loop
				if (timer.elapsed-t)>0.1 then
					t := timer.elapsed;
					(once "Elapsed ").print_on(std_output)
					timer.elapsed.print_on (std_output)
					(once " seconds%N").print_on(std_output)
				end
			end
		end
end	

-- Copyright (C) 2005 Paolo Redaelli, 2013 Cyril Adrian

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
 			
