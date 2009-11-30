-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class NATIVELY_STORED_STRING
	-- An ABSTRACT_STRING of CHARACTERs stored into with a NATIVE_ARRAY.

inherit 
	ABSTRACT_STRING

feature {STRING_HANDLER}
	storage: NATIVE_ARRAY[CHARACTER]
			-- The place where characters are stored.

feature {ANY}
	count: INTEGER is attribute end

	capacity: INTEGER
			-- Capacity of the `storage' area.

	item (i: INTEGER): CHARACTER is
		do
			Result := storage.item(i - 1)
		end

	is_equal (other: ABSTRACT_STRING): BOOLEAN is
		-- It `other' does not conform to NATIVELY_STORED_STRING this query is
		-- an O(count.max(other.count)) operation, requiring iterating over
		-- both strings.
		local 
			nss: NATIVELY_STORED_STRING; ci,oi: ITERATOR[CHARACTER]
		do
			nss ?= other -- Try to assign other to nss
			if nss/=Void then -- direct comparison of memory areas is possible
				if count = nss.count then
					Result := storage.fast_memcmp(nss.storage, count)
				end
			else -- Compare character-by-character
				from 
					Result := True 
					ci := new_iterator;	oi := other.new_iterator
					ci.start; oi.start
				until Result=False or else ci.is_off or oi.is_off
				loop
					Result := (ci.item = oi.item)
					ci.next; oi.next
				end
				if Result=True then	-- reached the end of a string without founding differences; both iterators shall be off for the strings to be equal.
					check either_current_or_other_are_off: ci.is_off or oi.is_off end
					Result := (ci.is_off = oi.is_off)
				end
			end
		end


	same_as (other: ABSTRACT_STRING): BOOLEAN is
		local 
			nss: NATIVELY_STORED_STRING; ci,oi: ITERATOR[CHARACTER]
			s1, s2: like storage; i: INTEGER
		do
			nss ?= other -- Try to assign other to nss
			if nss/=Void then -- direct comparison of memory areas is possible
				i := count
				if i = nss.count then
					if storage.fast_memcmp(nss.storage, i) then
						Result := True
					else
						from
							i := i - 1
							s1 := storage
							s2 := nss.storage
							Result := True
						until i < 0
						loop
							if s1.item(i).same_as(s2.item(i)) then
								i := i - 1
							else
								i := -1
								Result := False
							end
						end
					end
				end
			else -- other is not a NATIVELY_STORED_STRING
				from 
					Result := True 
					ci := new_iterator;	oi := other.new_iterator
					ci.start; oi.start
				until Result=False or else ci.is_off or oi.is_off
				loop
					Result := (ci.item.same_as(oi.item))
					ci.next; oi.next
				end
				if Result=True then	-- reached the end of a string without founding differences; both iterators shall be off for the strings to be equal.
					check either_current_or_other_are_off: ci.is_off or oi.is_off end
					Result := (ci.item.same_as(oi.item))
				end
			end
		end

	index_of (c: CHARACTER; start_index: INTEGER): INTEGER is
		do
			if start_index <= count then
				Result := storage.fast_index_of(c, start_index - 1, count - 1)
				if Result = count then
					Result := 0
				else
					Result := Result + 1
				end
			end
		end

	reverse_index_of (c: CHARACTER; start_index: INTEGER): INTEGER is
			-- Index of first occurrence of `c' at or before `start_index', 0 if none.
			-- The search is done in reverse direction, which means from the `start_index' down
			-- to the first character.
			--
			-- See also `index_of', `last_index_of', `first_index_of'.
		do
			if count > 0 then
				Result := storage.fast_reverse_index_of(c, start_index - 1) + 1
			end
		end

	has (c: CHARACTER): BOOLEAN is
		do
			Result := storage.fast_has(c, count - 1)
		end

	occurrences (c: CHARACTER): INTEGER is
		do
			Result := storage.fast_occurrences(c, count - 1)
		end
feature {ANY} -- Concatenation 
	infix "&" (another: ABSTRACT_STRING): ABSTRACT_STRING is
		-- Current and `another' concatenating into a new object. The actual
		-- effective type of Result is chosen by the implementation, possibly
		-- based on heuristics.
		do
			-- Currently returning a ROPE.
			Result := Current|another
		end

feature {ANY} -- Access
	first: CHARACTER is
		do
			Result := storage.item(0)
		end

	last: CHARACTER is
		do
			Result := storage.item(count - 1)
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

invariant
	capacity > 0 implies storage.is_not_null
	count <= capacity

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
