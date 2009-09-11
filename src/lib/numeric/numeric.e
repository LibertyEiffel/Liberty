-- See the Copyright notice at the end of this file.
--
deferred class NUMERIC
	--
	-- This class describes a ring.
	--

inherit
	HASHABLE -- *** Here ? Weird ! *** 3th feb 2006 *** Fred + Guillem + Dom ***

feature {ANY}
	infix "+" (other: like Current): like Current is
			-- Sum with `other' (commutative).
		deferred
		end

	infix "-" (other: like Current): like Current is
			-- Result of substracting `other'.
		deferred
		end

	infix "*" (other: like Current): like Current is
			-- Product by `other'.
		deferred
		end

	infix "/" (other: like Current): NUMERIC is
			-- Division by `other'.
		require
			other /= Void
			divisible(other)
		deferred
		end

	prefix "+": like Current is
			-- Unary plus of `Current'.
		deferred
		end

	prefix "-": like Current is
			-- Unary minus of `Current'.
		deferred
		end

	divisible (other: like Current): BOOLEAN is
			-- May `Current' be divided by `other' ?
		require
			other /= Void
		deferred
		end

	one: like Current is
			-- Neutral element for "*" and "/".
		deferred
		end

	zero: like Current is
			-- Neutral element for "+" and "-".
		deferred
		end

	sign: INTEGER_8 is
			-- Sign of Current (0 -1 or 1).
		deferred
		ensure
			Result.in_range(-1, 1)
		end

end -- class NUMERIC
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
