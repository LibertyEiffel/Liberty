-- See the Copyright notice at the end of this file.
--
deferred class OBSERVABLE
	--
	-- Part of the ''Observer'' Design Pattern. An object of this class should notify its observers whenever its
	-- state changes. Use the `notify' feature for that.
	--
	-- See also OBSERVER.
	--

feature {ANY}
	add (o: OBSERVER[like Current]) is
			-- Add an observer that should be notified
		do
			observers.add_last(o)
		end

	remove (o: OBSERVER[like Current]) is
			-- Remove an observer that should not be notified anymore
		require
			has(o)
		local
			i: INTEGER
		do
			i := observers.first_index_of(o)
			observers.remove(i)
		end

	has (o: OBSERVER[like Current]): BOOLEAN is
			-- True if the observer will be notified when the state of Current changes
		do
			Result := observers.has(o)
		end

feature {}
	notify is
			-- Notify all the observers that the state of Current changed
		local
			i: INTEGER
		do
			from
				i := observers.lower
			until
				i > observers.upper
			loop
				observers.item(i).update(Current)
				i := i + 1
			end
		end

feature {}
	observers: COLLECTION[OBSERVER[like Current]]
			-- The collection of observers

invariant
	notifiable: observers /= Void

end -- class OBSERVABLE
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
