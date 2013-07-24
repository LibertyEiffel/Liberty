class DO_STUFF
inherit G_POOLED_ROUTINE
create {ANY}
	make,
	default_create
feature {ANY} 
	make (an_i: INTEGER_32) is
	local msg: STRING
	do
		i:=an_i
		msg := "Looking for "
		i.append_in(msg)
		msg.append(once ".%N")
		-- Warning! to_string is NOT thread safe!
		print(msg)

	end
	
	invoke (a_pool: G_THREAD_POOL[G_POOLED_ROUTINE]) is
		local x: like i; msg: STRING
		do
			from is_prime:=False; x:=2
			until not is_prime or x>=i loop
				is_prime := (i\\x)=0 -- rest of the division
				x:=x+1
			end
			msg := ""; i.append_in(msg)
			if is_prime then msg.append(" is prime.%N") 
			else msg.append(" is not prime.%N") 
			end
			print (msg)

		end

	i: INTEGER_32
	is_prime: BOOLEAN
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
 
