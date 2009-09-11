-- See the Copyright notice at the end of this file.
--
deferred class CHAIN_OF_RESPONSIBILITY
	--
	-- The ''Chain Of Responsibility'' Design Pattern reified. Such a chain is made of handlers you can add or
	-- remove at your leisure.
	--
	-- The Chain itself is a ''Command'' (see that Design Pattern).  Executing that command looks for a handler
	-- that can handle a request, and let it handle that request.
	--
	-- How you do implement the query is up to you. The handlers are given `Current' i.e. the Chain itself, and
	-- CHAIN_HANDLER is a generic class so you can implement your own protocol.
	--

inherit
	COMMAND

feature {ANY}
	add (c: CHAIN_HANDLER[like Current]) is
			-- Add a handler to the Chain.
		do
			chain.add_last(c)
		end

	remove (c: CHAIN_HANDLER[like Current]) is
			-- Remove a handler from the Chain.
		require
			has(c)
		local
			i: INTEGER
		do
			i := chain.first_index_of(c)
			chain.remove(i)
		end

	has (c: CHAIN_HANDLER[like Current]): BOOLEAN is
			-- Does the handler belong to the chain?
		do
			Result := chain.has(c)
		end

feature {ANY}
	execute is
			-- Find a suitable handler to handle a request.
		local
			i: INTEGER; ok: BOOLEAN
		do
			from
				i := chain.lower
			until
				ok or else i > chain.upper
			loop
				if chain.item(i).can_handle(Current) then
					chain.item(i).handle(Current)
					ok := True
				end
				i := i + 1
			end
		end

feature {}
	chain: FAST_ARRAY[CHAIN_HANDLER[like Current]]

invariant
	chain /= Void

end -- class CHAIN_OF_RESPONSIBILITY
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
