-- See the Copyright notice at the end of this file.
--
class MINIMAL_RANDOM_NUMBER_GENERATOR
	--
	-- Implements the Minimal Standard generator from Press et. al. Numerical Recipies.
	--

inherit
	RANDOM_NUMBER_GENERATOR

creation {ANY}
	make, with_seed

feature {}
	im: INTEGER is 2147483647

	ia: INTEGER is 16807

	iq: INTEGER is 127773

	ir: INTEGER is 2836

	seed: INTEGER

feature {ANY}
	make is
		local
			seed_init: INTEGER
		do
			seed_init := clock_based_random_seed
			from
			until
				seed_init < im
			loop
				seed_init := seed_init - iq
			end
			with_seed(seed_init)
		end

	with_seed (seed_value: INTEGER) is
		require
			valid_seed: seed_value > 0 and seed_value < im
		do
			seed := seed_value
			next
		end

	next is
		local
			k: INTEGER
		do
			k := seed #// iq
			seed := ia * (seed - k * iq) - ir * k
			if seed < 0 then
				seed := seed + im
			end
		end

	last_real: REAL is
		do
			Result := seed / im
		end

	last_integer (n: INTEGER): INTEGER is
		do
			Result := seed #\\ n + 1
		end

invariant
	good_seed: seed > 0 and seed < im

end -- class MINIMAL_RANDOM_NUMBER_GENERATOR
--
-- ------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- This file is part of the SmartEiffel standard library.
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
-- documentation files (the "Software"), to deal in the Software without restriction, including without
-- limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
-- the Software, and to permit persons to whom the Software is furnished to do so, subject to the following
-- conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
-- AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
-- OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------
