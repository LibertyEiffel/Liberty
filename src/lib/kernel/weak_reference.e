-- See the Copyright notice at the end of this file.
--
class WEAK_REFERENCE[G_]
	--
	-- Weak reference to some object of type G_.
	-- This kind of reference does not prevent the object of type G_ from being reclaimed by the garbage
	-- collector (in which case item returns Void).
	-- Item makes it possible to get (a strong reference to) the object.
	-- Inheriting from this class is prohibited.
	--
	-- Notes: when using the "-no_gc" option (i.e. no garbage collector), the behavior of WEAK_REFERENCE
	-- is equivalent to the behavior of REFERENCE. Also note that WEAK_REFERENCE is not yet implemented
	-- for `compile_to_jvm' (the behavior is the one of REFERENCE).
	--

inherit
	ANY

creation {ANY}
	set_item

feature {ANY}
	item: G_
			-- Return a (strong) reference to the object

	set_item (i: like item) is
			-- Set the object to be weak referenced
		do
			item := i
		ensure
			item = i
		end

end -- class WEAK_REFERENCE
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
