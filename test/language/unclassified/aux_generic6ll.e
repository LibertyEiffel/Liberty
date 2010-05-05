-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class AUX_GENERIC6LL[G]
	--insert
	--	   ANY

creation {ANY}
	make

feature {ANY}
	make is
		do
			create rep.make(1, 20)
			count := 0
			index := 0
		end

feature {ANY}
	empty: BOOLEAN is
		do
			Result := count = 0
		end

	count: INTEGER

	i_th (i: INTEGER): G is
		require
			i >= 1
			i <= count
		do
			Result := rep.item(i)
		end

	item: G is
		do
			Result := rep.item(index)
		end

	forth is
		do
			index := index + 1
		end

	put (x: G) is
		require
			not_of: not off
		do
			rep.put(x, count)
		end

	extend (x: G) is
		do
			count := count + 1
			if count > rep.upper then
				rep.resize(1, count + 10)
			end
			-- if
			rep.put(x, count)
		end

	after: BOOLEAN is
		do
			Result := index > count
		end

	off: BOOLEAN is
		do
			Result := index < 1 or index > count
		end

	start is
		do
			index := 1
		end

	has (x: G): BOOLEAN is
		do
			Result := rep.first_index_of(x) <= count
		end

	first: G is
		do
			Result := rep.item(1)
		end

	last: G is
		do
			Result := rep.item(count)
		end

	remove_last is
		require
			not empty
		do
			count := count - 1
		end

	wipe_out is
		do
			count := 0
		end

	index: INTEGER

feature {ANY}
	-- accès au curseur
	--    cursor : CURSOR is
	--	do
	--	    !!Result.make(index);
	--	end; -- cursor
	--
	--    go_to (c: CURSOR) is
	--	do
	--	    index := c.value;
	--	end; -- go_to
	

feature {}
	rep: ARRAY[G]

end -- class AUX_GENERIC6LL
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- SmartEiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- SmartEiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
