-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class NATIVELY_STORED_STRING
	-- An ABSTRACT_STRING of CHARACTERs stored into with a NATIVE_ARRAY.

	-- Implementation notes: it is NOT guaranteed that the memory buffer will contain a binary 0 to mark its
	-- end, except when using `to_external'

inherit
	ABSTRACT_STRING
		redefine
			print_on, copy_slice_to_native
		end

feature {STRING_HANDLER}
	storage: NATIVE_ARRAY[CHARACTER]
			-- The place where characters are stored.

	storage_lower: INTEGER is
			-- The index of the first character of `storage' effectively used.
		attribute
		end

feature {ANY}
	count: INTEGER is
		attribute
		end

	capacity: INTEGER
			-- Capacity of the `storage' area.

	item (i: INTEGER): CHARACTER is
		do
			Result := storage.item(i - lower + storage_lower)
		end

	is_equal (other: ABSTRACT_STRING): BOOLEAN is
			-- It `other' does not conform to NATIVELY_STORED_STRING this query is an O(count.max(other.count))
			-- operation, requiring iterating over both strings.
		local
			nss: NATIVELY_STORED_STRING; i, j: INTEGER
		do
			if nss ?:= other then -- direct comparison of memory areas is possible
				nss ::= other
				Result := count = nss.count
					and then (storage = nss.storage
								 or else storage.slice_fast_memcmp(storage_lower, nss.storage, nss.storage_lower, nss.storage_lower + count - 1))
			else -- compare character by character
				from
					Result := count = other.count
					i := lower
					j := other.lower
				until
					not Result or else i > upper
				loop
					Result := item(i) = other.item(j)
					i := i + 1
					j := j + 1
				end
				check
					Result implies j > other.upper
				end
			end
		end

	same_as (other: ABSTRACT_STRING): BOOLEAN is
		local
			nss: NATIVELY_STORED_STRING
			i, j: INTEGER
		do
			if nss ?:= other then -- direct comparison of memory areas is possible, try that first
				nss ::= other
				Result := count = nss.count
					and then (storage = nss.storage
								 or else storage.slice_fast_memcmp(storage_lower, nss.storage, nss.storage_lower, nss.storage_lower + count - 1))
			end
			if not Result then
				from
					Result := count = other.count
					i := lower
					j := other.lower
				until
					not Result or else i > upper
				loop
					Result := item(i).same_as(other.item(j))
					i := i + 1
					j := j + 1
				end
				check
					Result implies j > other.upper
				end
			end
		end

	index_of (c: CHARACTER; start_index: INTEGER): INTEGER is
		do
			if start_index <= count then
				Result := lower + storage.fast_index_of(c, start_index + storage_lower, storage_lower + count - 1) - storage_lower
				if Result > count then
					Result := 0
				end
			end
		end

	reverse_index_of (c: CHARACTER; start_index: INTEGER): INTEGER is
			-- Index of first occurrence of `c' at or before `start_index', 0 if none.  The search is done in
			-- reverse direction, which means from the `start_index' down to the first character.
			--
			-- See also `index_of', `last_index_of', `first_index_of'.
		do
			if count > 0 then
				Result := storage.fast_reverse_index_of(c, start_index + storage_lower - lower) - storage_lower + lower
				if Result <= 0 then
					Result := 0
				end
			end
		end

	has (c: CHARACTER): BOOLEAN is
		do
			Result := storage.slice_fast_has(c, storage_lower, storage_lower + count - 1)
		end

	occurrences (c: CHARACTER): INTEGER is
		do
			Result := storage.slice_fast_occurrences(c, storage_lower, storage_lower + count - 1)
		end

feature {ANY} -- Concatenation
	infix "&" (another: ABSTRACT_STRING): ABSTRACT_STRING is
			-- Current and `another' concatenating into a new object. The actual effective type of Result is
			-- chosen by the implementation, possibly based on heuristics.
		do
			-- Currently returning a ROPE.
			Result := Current | another
		end

feature {ANY} -- Access
	first: CHARACTER is
		do
			Result := storage.item(storage_lower)
		end

	last: CHARACTER is
		do
			Result := storage.item(storage_lower + count - 1)
		end

	fill_tagged_out_memory is
		do
			tagged_out_memory.append(once "count: ")
			count.append_in(tagged_out_memory)
			tagged_out_memory.append(once "capacity: ")
			capacity.append_in(tagged_out_memory)
			tagged_out_memory.append(once "storage: %"")
			tagged_out_memory.append(Current)
			tagged_out_memory.add_last('%"')
		end

	print_on (file: OUTPUT_STREAM) is
		do
			file.put_natively_stored_string(Current)
		end

feature {STRING}
	copy_slice_to_native (start_index, end_index: INTEGER; target: NATIVE_ARRAY[CHARACTER]; target_offset: INTEGER) is
		do
			target.slice_copy(target_offset, storage, storage_lower + start_index - lower, storage_lower + end_index - lower)
		end

invariant
	capacity > 0 implies storage.is_not_null
	count <= capacity
	storage_lower >= 0

end -- class NATIVELY_STORED_STRING

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
