
-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class FIXED_SUBSTRING
	--
	-- A piece of a fixed string, Immutable character STRINGs indexed from `1' to `count'.
	--


inherit
	NATIVELY_STORED_STRING

creation {ANY}
	from_fixed_string, copy

feature {FIXED_STRING} -- Creation:
	from_fixed_string (a_fixed_string: FIXED_STRING; a_beginning, an_end: like lower) is
		-- Initialize Current FIXED_SUBSTRING to represent the content of `a_fixed_string' from index `a_beginning' to `an_end' 
	require
		a_fixed_string/=Void
		a_fixed_string.valid_index(a_beginning)
		a_fixed_string.valid_index(an_end)
		a_beginning <= an_end
	do
		parent:=a_fixed_string
		storage := storage.from_pointer(a_fixed_string.to_external + (a_beginning - a_fixed_string.lower))
		count := an_end - a_beginning + 1 
		capacity := count
		stored_hash_code := uncomputed_hash_code
	ensure 
		definition: a_fixed_string.substring(a_beginning,an_end).is_equal(Current)
	end
feature 
	copy (another: like Current) is
	do
		parent:=another.parent
		storage := another.storage 
		-- It may be necessary to change the previous line into a more convoluted 
		-- storage := storage.from_pointer(another.storage.to_external)
		-- to avoid clutterning the memory collector
		count:=another.count
		capacity:=another.capacity
	end

	intern: FIXED_STRING is
		do
			create Result.from_external_sized_copy(storage.to_external,count)
		end

	recycle is
		do
			not_yet_implemented
		end

	hash_code: INTEGER is
		do
			if stored_hash_code<0 then
				-- It hasn't been computed.
				stored_hash_code:=computed_hash_code
			end
			Result:=stored_hash_code
		end

	substring (start_index, end_index: INTEGER): like Current is
		do
			not_yet_implemented -- Result:=twin
		end

feature {ANY} 
	parent: FIXED_STRING is
		-- The fixed string that contains Current substring
		attribute
		end
feature 
	to_external: POINTER is
		obsolete "FIXED_SUBSTRING.to_external would be O(count) both in CPU time and memory compsuption. Please provide "
		do
			not_yet_implemented
			-- Tentative implementation
		end
feature {} -- Implementation and constants
	stored_hash_code: INTEGER is
		-- The cached value of hash_code. Computed only on-demand
		attribute
		end
	uncomputed_hash_code: INTEGER is -1 
		-- Constant value used to mark uncomputed hash codes.
invariant
	0 <= count
	capacity = count
	parent /= Void

end -- class FIXED_STRING
--
-- Copyright (c) 2009 by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
