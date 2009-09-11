-- See the Copyright notice at the end of this file.
--
class DICTIONARY_KEY_TRAVERSER[V_, K_]
	-- This class allows you to view a DICTIONARY[V_, K_] as a TRAVERSABLE[K_].  Note that there is no need for
	-- a DICTIONARY_ITEM_TRAVERSER because DICTIONARY[V_, K_] is already a TRAVERSABLE[V_].

inherit
	TRAVERSABLE[K_]

creation {ANY}
	from_dictionary

feature {ANY}
	from_dictionary (dictionary_: like dictionary) is
		do
			dictionary := dictionary_
		end

feature {ANY}
	lower: INTEGER is
		do
			Result := dictionary.lower
		end

	upper: INTEGER is
		do
			Result := dictionary.upper
		end

feature {ANY}
	count: INTEGER is
		do
			Result := dictionary.count
		end

	is_empty: BOOLEAN is
		do
			Result := dictionary.is_empty
		end

feature {ANY}
	item (i: INTEGER): K_ is
		do
			Result := dictionary.key(i)
		end

	first: like item is
		do
			Result := item(lower)
		end

	last: like item is
		do
			Result := item(upper)
		end

feature {ANY}
	get_new_iterator: ITERATOR[K_] is
		do
			Result := dictionary.get_new_iterator_on_keys
		end

feature {}
	dictionary: DICTIONARY[V_, K_]

end -- class DICTIONARY_KEY_TRAVERSER
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
