-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class FIXED_STRING
   --
   -- Immutable character STRINGs indexed from `1' to `count'.
   --

inherit
   NATIVELY_STORED_STRING
      redefine
         immutable, out_in_tagged_out_memory, fill_tagged_out_memory,
         check_can_have_storage_signature
      end

create {ANY}
   make_from_string, copy, from_external_copy, from_external_sized_copy, from_external

create {FIXED_STRING}
   make_from_fixed_string

feature {ANY} -- Creation:
   make_from_string (model: STRING)
         -- Initialize from the characters of `model'.
      require
         not immutable
         model /= Void
      local
         new_count, new_capacity: INTEGER
      do
         new_count := model.count
         if new_count > 0 and then model.last = '%U' then
            new_capacity := new_count
            storage := storage.calloc(new_capacity)
            model.copy_slice_to_native(model.lower, model.upper, storage, 0)
         else
            new_capacity := new_count + 1
            storage := storage.calloc(new_capacity)
            if new_count > 0 then
               model.copy_slice_to_native(model.lower, model.upper, storage, 0)
            end
            storage.put('%U', new_count)
         end
         capacity := new_capacity
         count := new_count
         immutable := True
         original := Void
         holders := new_holders
         hash_code := computed_hash_code

         debug("FIXED_STRING")
            debug_string := out
         end
      ensure
         count = model.count
         immutable
      end

feature {ANY}
   hash_code: INTEGER

   intern: FIXED_STRING
         -- A shared version of this string.
      local
         strings: FAST_ARRAY[FIXED_STRING]
         i: INTEGER
      do
         if is_interned then
            Result := Current
         else
            strings := interned.reference_at(hash_code)
            if strings = Void then
               create strings.with_capacity(4)
               interned.add(strings, hash_code)
            end
            i := strings.first_index_of(Current)
            if strings.valid_index(i) then
               Result := strings.item(i)
            else
               do_intern(strings)
               Result := Current
            end
         end
      end

   out_in_tagged_out_memory
      do
         fill_tagged_out_memory
      end

   fill_tagged_out_memory
      do
         tagged_out_memory.append(Current)
      end

feature {ANY}
   copy (other: like Current)
         -- In fact this feature can only be used at creation time (see `immutable').
      do
         check
            not immutable
         end
         storage := other.storage
         storage_lower := other.storage_lower
         hash_code := other.hash_code
         count := other.count
         capacity := other.capacity
         immutable := True
         original := Void
         share_with(other)
      ensure then
         count = other.count
         immutable
         is_shared
         other.is_shared
      end

   immutable: BOOLEAN

feature {ABSTRACT_STRING}
   do_intern (strings: FAST_ARRAY[FIXED_STRING])
      require
         interned.fast_reference_at(hash_code) = strings
         not is_interned
         not strings.has(Current)
      do
         strings.add_last(Current)
         is_interned := True
      ensure
         is_interned
      end

feature {ANY}
   is_interned: BOOLEAN

feature {ANY} -- Other features:
   substring (start_index, end_index: INTEGER): like Current
      do
         create Result.make_from_fixed_string(Current, start_index, end_index)
      end

feature {}
   make_from_fixed_string (other: FIXED_STRING; start_index, end_index: INTEGER)
      require
         other /= Void
         valid_start_index: other.valid_index(start_index)
         valid_end_index: other.valid_index(end_index) -- end_index <= other.count
         meaningful_interval: start_index <= end_index + 1
      do
         storage := other.storage
         storage_lower := start_index - other.lower + other.storage_lower
         count := end_index - start_index + 1
         capacity := other.capacity
         immutable := True
         original := Void
         share_with(other)
         hash_code := computed_hash_code

         debug("FIXED_STRING")
            debug_string := out
         end
      ensure
         immutable
         is_shared
         other.is_shared
         substring_count: count = end_index - start_index + 1
      end

feature {ANY} -- Interfacing with C string:
   to_external: POINTER
      do
         if is_shared then
            unshare
         end
         Result := storage.to_external + storage_lower
      end

feature {STRING_HANDLER} -- Creation from C string:
   from_external (p: POINTER)
         -- Internal `storage' is set using a copy of `p'. Assume `p' has a null character at the end in order
         -- to compute the Eiffel `count'. This extra null character is not part of the Eiffel
         -- FIXED_STRING.
         -- Also consider `from_external_copy' to choose the most appropriate.
      require
         p.is_not_null
      local
         s: like storage; i: INTEGER
      do
         from
            s := s.from_pointer(p)
         until
            s.item(i) = '%U'
         loop
            i := i + 1
         end

         count := i
         capacity := i + 1
         storage := s

         immutable := True
         original := Void
         holders := new_holders
         hash_code := computed_hash_code

         debug("FIXED_STRING")
            debug_string := out
         end
      ensure
         immutable
      end

   from_external_copy (p: POINTER)
         -- Internal `storage' is set using a copy of `p'. Assume `p' has a null character at the end in order
         -- to compute the Eiffel `count'. This extra null character is not part of the Eiffel
         -- FIXED_STRING.
         -- Also consider `from_external' to choose the most appropriate.
      require
         p.is_not_null
      local
         s: like storage; i: INTEGER
      do
         from
            s := s.from_pointer(p)
         until
            s.item(i) = '%U'
         loop
            i := i + 1
         end

         count := i
         capacity := i + 1
         storage := storage.calloc(capacity)
         storage.copy_from(s, count)

         immutable := True
         original := Void
         holders := new_holders
         hash_code := computed_hash_code

         debug("FIXED_STRING")
            debug_string := out
         end
      ensure
         immutable
      end

   from_external_sized_copy (p: POINTER; size: INTEGER)
         -- Internal `storage' is set using a copy of `p'.  'size' characters are copied, setting then 'count'
         -- to at most `size'. If the C string is shorter though then its size is used instead.
         -- Also consider `from_external_copy' to choose the most appropriate.
      require
         p.is_not_null
         size >= 0
      local
         s: like storage; i: INTEGER
      do
         from
            s := s.from_pointer(p)
         until
            i = size or else s.item(i) = '%U'
         loop
            i := i + 1
         end

         count := i
         capacity := i + 1
         storage := storage.calloc(capacity)
         storage.copy_from(s, count - 1)
         storage.put('%U', count)

         immutable := True
         original := Void
         holders := new_holders
         hash_code := computed_hash_code

         debug("FIXED_STRING")
            debug_string := out
         end
      ensure
         immutable
         count <= size
      end

feature {RECYCLING_POOL, STRING_RECYCLING_POOL, STRING_HANDLER}
   recycle
      local
         s: like storage
      do
         immutable := False
         storage := s
         capacity := 0
         count := 0
      end

feature {STRING_HANDLER} -- Copy On Write:
   is_shared: BOOLEAN
      do
         Result := holders.count > 1
      end

   holders: FAST_ARRAY[FIXED_STRING]

   share_with (other: like Current)
      do
         if holders = Void then
            -- when called by twin
         elseif holders.count = 1 then
            check
               holders.first = Current
            end
            holders.remove_first
            free_holders(holders)
         else
            holders.remove(holders.fast_first_index_of(Current))
         end
         holders := other.holders
         holders.add_last(Current)
      end

   unshare
      require
         is_shared
      local
         s: like storage
      do
         capacity := count + 1
         s := s.calloc(capacity)
         s.slice_copy(0, storage, storage_lower, storage_lower + count - 1)
         s.put('%U', count)
         storage := s
         storage_lower := 0
         holders.remove(holders.fast_first_index_of(Current))
         check
            not holders.is_empty
         end
         holders := new_holders
      ensure
         not is_shared
      end

feature {} -- Holders management:
   new_holders: like holders
      local
         wr: WEAK_REFERENCE[FAST_ARRAY[FIXED_STRING]]
      do
         from
         until
            Result /= Void or else holders_memory.is_empty
         loop
            wr := holders_memory.last
            holders_memory.remove_last
            Result := wr.item
            if Result /= Void then
               wr.set_item(Void)
            end
            weakrefs.add_last(wr)
         end
         if Result = Void then
            create {FAST_ARRAY[FIXED_STRING]} Result.with_capacity(1)
         end
         check
            Result.is_empty
         end
         Result.add_last(Current)
      ensure
         Result.count = 1
         Result.first = Current
      end

   free_holders (a_holders: like holders)
      require
         a_holders.is_empty
      local
         wr: WEAK_REFERENCE[FAST_ARRAY[FIXED_STRING]]
      do
         if weakrefs.is_empty then
            create wr.set_item(a_holders)
         else
            wr := weakrefs.last
            weakrefs.remove_last
            check
               wr.item = Void
            end
            wr.set_item(a_holders)
         end
         holders_memory.add_last(wr)
      end

   holders_memory: FAST_ARRAY[WEAK_REFERENCE[FAST_ARRAY[FIXED_STRING]]]
      once
         create Result.with_capacity(1024)
      end

   weakrefs: FAST_ARRAY[WEAK_REFERENCE[FAST_ARRAY[FIXED_STRING]]]
      once
         create Result.with_capacity(1024)
      end

feature {} -- Invariant checking:
   is_storage_unchanged: BOOLEAN
      do
         if original = Void then
            original := twin
            Result := True
         else
            Result := is_equal(original)
         end
      end

   original: like Current

feature {STRING_HANDLER}
   check_can_have_storage_signature: BOOLEAN
      do
         Result := True
      end

invariant
   0 <= count
   capacity >= count
   not has_storage_signature
   immutable implies storage.is_not_null
   ;(immutable and not is_shared) implies capacity.in_range(count, count + 1)
   ;(immutable and not is_shared) implies (count = 0 implies storage.item(0) = '%U')
   ;(immutable and not is_shared) implies (count > 0 implies (storage.item(count - 1) = '%U' or else storage.item(count) = '%U'))
   ;(immutable and not is_shared) implies (storage.item(count) = '%U' implies capacity = count + 1)
   holders.fast_has(Current)
   holders.for_all(agent (holder: FIXED_STRING; p: POINTER): BOOLEAN do Result := holder.storage.to_pointer = p end (?, storage.to_pointer))
   is_interned = (interned.fast_has(hash_code) and then interned.fast_reference_at(hash_code).fast_has(Current))
   is_interned implies immutable
   --is_storage_unchanged

end -- class FIXED_STRING
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
