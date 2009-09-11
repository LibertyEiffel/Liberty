-- See the Copyright notice at the end of this file.
--
class BIJECTIVE_DICTIONARY_REVERSER[V_, K_]
	-- Allows to view a BIJECTIVE_DICTIONARY[V_, K_] as a BIJECTIVE_DICTIONARY[K_, V_]

inherit
	BIJECTIVE_DICTIONARY[V_, K_]

creation {ANY}
	from_bijective_dictionary

feature {ANY}
	from_bijective_dictionary (bijective_dictionary_: like bijective_dictionary) is
		do
			bijective_dictionary := bijective_dictionary_
		end

	count: INTEGER is
		do
			Result := bijective_dictionary.count
		end

	has (k: K_): BOOLEAN is
		do
			Result := bijective_dictionary.has_value(k)
		end

	at (k: K_): V_ is
		do
			Result := bijective_dictionary.key_at(k)
		end

	reference_at (k: K_): V_ is
		do
			if has(k) then
				Result := at(k)
			end
		end

	fast_has (k: K_): BOOLEAN is
		do
			Result := bijective_dictionary.fast_has_value(k)
		end

	fast_at (k: K_): V_ is
		do
			Result := bijective_dictionary.fast_key_at(k)
		end

	fast_reference_at (k: K_): V_ is
		do
			if fast_has(k) then
				Result := fast_at(k)
			end
		end

	has_value (v: V_): BOOLEAN is
		do
			Result := bijective_dictionary.has(v)
		end

	key_at (v: V_): K_ is
		do
			Result := bijective_dictionary.at(v)
		end

	fast_has_value (v: V_): BOOLEAN is
		do
			Result := bijective_dictionary.fast_has(v)
		end

	fast_key_at (v: V_): K_ is
		do
			Result := bijective_dictionary.fast_at(v)
		end

	put (v: V_; k: K_) is
		do
			remove(k)
			add(v, k)
		end

	add (v: V_; k: K_) is
		do
			bijective_dictionary.add(k, v)
		end

	remove (k: K_) is
		local
			v: V_
		do
			if has(k) then
				v := at(k)
				bijective_dictionary.remove(v)
			end
		end

	clear_count is
		do
			bijective_dictionary.clear_count
		end

	clear_count_and_capacity is
		do
			bijective_dictionary.clear_count_and_capacity
		end

	capacity: INTEGER is
		do
			Result := bijective_dictionary.capacity
		end

	item (index: INTEGER): V_ is
		do
			Result := bijective_dictionary.key(index)
		end

	key (index: INTEGER): K_ is
		do
			Result := bijective_dictionary.item(index)
		end

	copy (other: like Current) is
		do
			bijective_dictionary := other.bijective_dictionary
		end

	internal_key (k: K_): K_ is
		do
			Result := key_at(at(k))
		end

feature {BIJECTIVE_DICTIONARY}
	bijective_dictionary: BIJECTIVE_DICTIONARY[K_, V_]

end -- class BIJECTIVE_DICTIONARY_REVERSER
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
