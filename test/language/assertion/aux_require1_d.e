-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class AUX_REQUIRE1_D

inherit
	AUX_REQUIRE1_A
	AUX_REQUIRE1_C
	
creation {ANY}
	default_create

feature {}
	d_only is
		require
			counting_require
		do
		end

	d_or_a_and_c is
		require else
			bad_counting_require
		do
		end
	
	d_or_a_and_b is
		require else
			bad_counting_require
		do
		end
	
	everywhere is
		require else
			bad_counting_require
		do
		end

	partial is
		require else
			counting_require
			bad_counting_require
			counting_require
		do
		end

feature {ANY}
	foo is
		do
			counter.reset
			a_only
			assert(counter.value = 1)

			counter.reset
			b_only
			assert(counter.value = 1)

			counter.reset
			c_only
			assert(counter.value = 1)

			counter.reset
			d_only
			assert(counter.value = 1)

			counter.reset
			a_and_c
			assert(counter.value = 2)

			counter.reset
			d_or_a_and_c
			assert(counter.value = 3)

			counter.reset
			a_and_b
			assert(counter.value = 3)

			counter.reset
			d_or_a_and_b
			assert(counter.value = 4)

			counter.reset
			everywhere
			assert(counter.value = 5)

			counter.reset
			partial
			assert(counter.value = 7)

		end

end -- class AUX_REQUIRE1_D
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
