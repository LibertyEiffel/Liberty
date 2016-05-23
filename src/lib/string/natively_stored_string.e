-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class NATIVELY_STORED_STRING
   -- An ABSTRACT_STRING of CHARACTERs stored into with a NATIVE_ARRAY.

   -- Implementation note: it is NOT guaranteed that the memory buffer will contain a binary 0 to mark its
   -- end, except when using `to_external'

inherit
   ABSTRACT_STRING
      redefine
         print_on, copy_slice_to_native
      end

feature {STRING_HANDLER}
   storage: NATIVE_ARRAY[CHARACTER]
         -- The place where characters are stored.

   storage_lower: INTEGER
         -- The index of the first character of `storage' effectively used.
      attribute
      end

feature {ANY}
   count: INTEGER
      attribute
      end

   capacity: INTEGER
         -- Capacity of the `storage' area.

   item (i: INTEGER): CHARACTER
      do
         Result := storage.item(i - lower + storage_lower)
      end

   is_equal (other: ABSTRACT_STRING): BOOLEAN
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

   same_as (other: ABSTRACT_STRING): BOOLEAN
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

   index_of, fast_index_of (c: CHARACTER; start_index: INTEGER): INTEGER
      local
         index: INTEGER
      do
         if start_index <= count then
            index := storage.fast_index_of(c, start_index + storage_lower - lower, storage_lower + count - lower)
            Result := lower + index - storage_lower
         else
            Result := upper + 1
         end
      end

   reverse_index_of, fast_reverse_index_of (c: CHARACTER; start_index: INTEGER): INTEGER
         -- Index of first occurrence of `c' at or before `start_index',
         -- The index will be invalid, smaller than `lower' when no occurrence is found;
         -- The search is done in reverse direction, which means from the
         -- `start_index' down to the first character.
         --
         -- See also `index_of', `last_index_of', `first_index_of'.
      do
         -- Implementation note: the actual value of Result when no occurrence
         -- is found has deliberately not been written in public documentation
         -- because an eventual heir may redefine the value of lower
         if count > 0 then
            Result := storage.fast_reverse_index_of(c, start_index + storage_lower - lower) - storage_lower + lower
            if Result <= 0 then
               Result := lower - 1
            end
         end
      end

   has, fast_has (c: CHARACTER): BOOLEAN
      do
         Result := storage.slice_fast_has(c, storage_lower, storage_lower + count - 1)
      end

   occurrences (c: CHARACTER): INTEGER
      do
         Result := storage.slice_fast_occurrences(c, storage_lower, storage_lower + count - 1)
      end

feature {ANY} -- Concatenation
   infix "&" (another: ABSTRACT_STRING): ABSTRACT_STRING
         -- Current and `another' concatenating into a new object. The actual effective type of Result
         -- chosen by the implementation, possibly based on heuristics.
      do
         if another.is_empty then
            Result := Current
         elseif is_empty then
            Result := another
         else
            Result := Current | another
         end
      end

feature {ANY} -- Access
   first: CHARACTER
      do
         Result := storage.item(storage_lower)
      end

   last: CHARACTER
      do
         Result := storage.item(storage_lower + count - 1)
      end

   fill_tagged_out_memory
      do
         tagged_out_memory.append(once "[count: ")
         count.append_in(tagged_out_memory)
         tagged_out_memory.append(once "capacity: ")
         capacity.append_in(tagged_out_memory)
         tagged_out_memory.append(once "storage: %"")
         tagged_out_memory.append(Current)
         tagged_out_memory.append(once "%"]")
      end

   print_on (file: OUTPUT_STREAM)
      do
         file.put_natively_stored_string(Current)
      end

feature {STRING_HANDLER}
   set_count (new_count: like count)
      require
         new_count <= capacity
      do
         count := new_count
      ensure
         count = new_count
      end

   ensure_capacity (needed_capacity: like capacity)
      require
         needed_capacity >= 0
      local
         actual_capacity, new_capacity: like capacity
      do
         storage_signature_count := 0
         check
            check_can_have_storage_signature
         end
         actual_capacity := capacity + storage_signature_count
         if storage.is_null then -- implies actual_capacity = 0
            check
               not has_storage_signature
            end
            new_capacity := needed_capacity
            if new_capacity + storage_signature_count > 0 then
               storage := storage.calloc(new_capacity + storage_signature_count)
            end
            capacity := new_capacity
            check
               check_set_storage_signature
               has_storage_signature implies check_valid_storage_signature
            end
         elseif capacity < needed_capacity then
            check
               has_storage_signature implies check_valid_storage_signature
            end
            new_capacity := needed_capacity.max((capacity #* 2).max(32 - storage_signature_count))
            storage := storage.realloc(actual_capacity, new_capacity + storage_signature_count)
            capacity := new_capacity
            check
               check_set_storage_signature
               has_storage_signature implies check_valid_storage_signature
            end
         else
            check
               has_storage_signature implies check_valid_storage_signature
            end
         end
      ensure
         capacity >= needed_capacity
      end

   set_storage (new_storage: like storage; new_capacity: like capacity)
      require
         count <= new_capacity
      do
         storage_signature_count := 0
         check
            check_can_have_storage_signature
         end
         storage := new_storage
         capacity := new_capacity
         check
            check_set_storage_signature
         end
      ensure
         storage = new_storage
         capacity = new_capacity
      end

feature {STRING_HANDLER}
   copy_slice_to_native (start_index, end_index: INTEGER; target: NATIVE_ARRAY[CHARACTER]; target_offset: INTEGER)
      do
         target.slice_copy(target_offset, storage, storage_lower + start_index - lower, storage_lower + end_index - lower)
      end

feature {} -- storage signature: only in all_check mode
   check_set_storage_signature: BOOLEAN
      require
         storage.is_not_null
         storage_signature_count = 4
      do
         storage.put('%/0/' , capacity  )
         storage.put('%/3/' , capacity+1)
         storage.put('%/9/' , capacity+2)
         storage.put('%/27/', capacity+3)
         has_storage_signature := True
         Result := True
      ensure
         has_storage_signature
      end

feature {STRING_HANDLER}
   has_storage_signature: BOOLEAN

   check_valid_storage_signature: BOOLEAN
      require
         has_storage_signature
      do
         Result :=   storage.item(capacity  ) = '%/0/'
            and then storage.item(capacity+1) = '%/3/'
            and then storage.item(capacity+2) = '%/9/'
            and then storage.item(capacity+3) = '%/27/'
         if not Result then
            sedb_breakpoint
         end
      end

   check_can_have_storage_signature: BOOLEAN
      do
         if storage_signature_count = 0 then
            storage_signature_count := 4
            check
               storage.is_not_null implies check_set_storage_signature
            end
         end
         Result := True
      end

   storage_signature_count: INTEGER

invariant
   capacity > 0 implies storage.is_not_null
   count <= capacity
   storage_lower >= 0
   storage_signature_count > 0 implies (has_storage_signature implies check_valid_storage_signature)
   storage_signature_count = 0 or storage_signature_count = 4

end -- class NATIVELY_STORED_STRING

--
-- Copyright (C) 2009-2016: by all the people cited in the AUTHORS file.
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
