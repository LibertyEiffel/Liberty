-- See the Copyright notice at the end of this file.
--
deferred class ABSTRACT_BACKTRACKING_POOLABLE
	--
	-- Alternatives and sequences MUST be managed in a pool.
	-- The ability to be in a pool is declared in that class.
	--

feature {ANY}
	release is
			-- Called by ABSTRACT_BACKTRACKING to release
			-- current instance to the pool.
		require
			pool /= Void
		do
			pool.release_instance(Current)
		end

	get_twin: like Current is
			-- Return a twin of current from the pool
		require
			pool /= Void
		do
			Result := pool.get_instance
			Result.copy(Current)
		ensure
			Result.is_equal(Current)
		end

	pool: ABSTRACT_BACKTRACKING_POOL[like Current] is
			-- The pool that will record Current
		deferred
		end

feature {ABSTRACT_BACKTRACKING_POOL}
	pool_link: ABSTRACT_BACKTRACKING_POOLABLE
			-- Internal link used by the pool
			-- to chain its poolable items.
			-- Technical note: to give more freedom for
			-- further usages of 'pool_link' it is not
			-- defined with type anchorage.

	set_pool_link (other: like pool_link) is
			-- Set 'pool_link' to 'other'
		do
			pool_link := other
		ensure
			definition: pool_link = other
		end

end -- class ABSTRACT_BACKTRACKING_POOLABLE
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
