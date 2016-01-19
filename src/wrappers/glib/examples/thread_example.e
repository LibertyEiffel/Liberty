class THREAD_EXAMPLE

create {ANY} make

feature {ANY} 
	make is
		do
			print("Creating threads...%N")
			create t1; create t2; create t3
			t1.set(100); t2.set(1000); t3.set(2000)
			t1.start; t2.start; t3.start
			print("Waiting...")
			t1.join
			t2.join
			t3.join
			print("ohh%N")
		end

		t1,t2,t3: MY_THREAD
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
 
