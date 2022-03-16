-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class STRING
   --
   -- Resizable character STRINGs indexed from `1' to `count'.
   --

inherit
   NATIVELY_STORED_STRING

create {ANY}
   with_capacity, make, copy, make_empty, make_filled, from_external, from_external_copy,
   from_external_sized, from_external_sized_copy, make_from_string

feature {ANY} -- Creation / Modification:
   make, with_capacity (needed_capacity: INTEGER)
         -- Initialize the string to have at least `needed_capacity' characters of storage.
      require
         non_negative_size: needed_capacity >= 0
      do
         storage_lower := 0
         if needed_capacity > 0 then
            ensure_capacity(needed_capacity)
         end
         count := 0
         next_generation
      ensure
         needed_capacity <= capacity
         empty_string: count = 0
      end

   make_empty
         -- Create an empty string.
      do
         make(0)
      end

   make_filled (c: CHARACTER; n: INTEGER)
         -- Initialize string with `n' copies of `c'.
      require
         valid_count: n >= 0
      do
         make(n)
         count := n
         fill_with(c)
         next_generation
      ensure
         count_set: count = n
         filled: occurrences(c) = count
      end

   make_from_string (model: ABSTRACT_STRING)
         -- Initialize from the characters of `model'.
      require
         model /= Void
      local
         c: INTEGER
      do
         storage_lower := 0
         c := model.count
         count := c
         if c > 0 then
            ensure_capacity(c)
            slice_copy(0, model, model.lower, model.upper)
         end
         next_generation
      ensure
         count = model.count
      end

feature {ANY}
   hash_code: INTEGER
      do
         Result := computed_hash_code
      end

feature {ANY} -- Modification:
   resize (new_count: INTEGER)
         -- Resize Current. When `new_count' is greater than
         -- `count', new positions are initialized with the
         -- default value of type CHARACTER ('%U').
      require
         new_count >= 0
      do
         if new_count <= count then
         elseif capacity < new_count + storage_lower then
            ensure_capacity(new_count + storage_lower)
         else
            storage.clear(count + storage_lower, new_count + storage_lower - 1)
         end
         count := new_count
      ensure
         count = new_count
         capacity >= old capacity
      end

   clear_count, wipe_out
         -- Discard all characters so that `is_empty' is True after that call.
         -- The internal `capacity' is not changed by this call (i.e. the internal `storage' memory
         -- neither released nor shrunk).
         --
         -- See also `clear_count_and_capacity'.
      do
         storage_lower := 0
         count := 0
      ensure
         is_empty: count = 0
                   capacity = old capacity
                   storage_lower = 0
      end

   clear_count_and_capacity
         -- Discard all characters (`is_empty' is True after that call). The internal `capacity' may also be
         -- reduced after this call.
         --
         -- See also `clear_count'.
      local
         null_storage: like storage
      do
         count := 0
         capacity := 0
         storage_lower := 0
         storage := null_storage
      ensure
         is_empty: count = 0
                   capacity = 0
                   storage_lower = 0
                   storage.is_null
      end

   copy (other: like Current)
         -- Copy `other' onto Current.
         --
         -- See also `copy_substring'.
      local
         c: INTEGER
      do
         if other /= Current then
            storage_lower := 0
            c := other.count
            if c > 0 then
               ensure_capacity(c)
               storage.copy_slice_from(other.storage, other.storage_lower, other.storage_lower + c - 1)
            end
            count := c
         end
      ensure then
         count = other.count
      end

   copy_substring (s: ABSTRACT_STRING; start_index, end_index: INTEGER)
         -- Copy the substring from `s' from `start_index' to `end_index'
         -- to Current.
         --
         -- See also `copy'.
      require
         string_not_void: s /= Void
         valid_start_index: 1 <= start_index
         valid_end_index: end_index <= s.count
         meaningful_interval: start_index <= end_index + 1
      local
         c: INTEGER
      do
         c := end_index - start_index + 1
         if c > 0 then
            ensure_capacity(c)
            slice_copy(0, s, start_index, end_index)
         end
         count := c
      end

   fill_with (c: CHARACTER)
         -- Replace every character with `c'.
      do
         storage_lower := 0
         storage.set_all_with(c, count - 1)
      ensure
         occurrences(c) = count
      end

   replace_all (old_character, new_character: like item)
         -- Replace all occurrences of the element `old_character' by `new_character'.
      do
         storage.fast_replace_all(old_character, new_character, count + storage_lower - 1)
      ensure
         count = old count
         old_character /= new_character implies occurrences(old_character) = 0
      end

   append, append_string (s: ABSTRACT_STRING)
         -- Append a copy of 's' to `Current'.
         --
         -- See also `add_last', `add_first', `prepend', '+'.
      require
         s_not_void: s /= Void
      local
         needed_capacity: INTEGER
      do
         -- Note: pre-computing needed capacity may be costly for ROPEs. Consider moving it into the NATIVELY_STORED_STRING-specific part of the feature.
         needed_capacity := count + s.count + storage_lower
         ensure_capacity(needed_capacity)
         slice_copy(upper, s, s.lower, s.upper)
         count := needed_capacity - storage_lower
      end

   append_substring (s: ABSTRACT_STRING; start_index, end_index: INTEGER)
         -- Append the substring from `s' from `start_index' to `end_index'
         -- to Current.
      require
         string_not_void: s /= Void
         valid_start_index: 1 <= start_index
         valid_end_index: end_index <= s.count
         meaningful_interval: start_index <= end_index + 1
      local
         needed_capacity: INTEGER
      do
         needed_capacity := count + storage_lower + end_index - start_index + 1
         ensure_capacity(needed_capacity)
         slice_copy(upper, s, start_index, end_index)
         count := needed_capacity
      end

   prepend (other: ABSTRACT_STRING)
         -- Prepend `other' to `Current'.
         --
         -- See also `append'.
      require
         other /= Void
      local
         d, i, j: INTEGER
      do
         if other = Current then --| **** TODO -- this fixes TEST_ALG09 using a quick and dirty special case :-(
            ensure_capacity(count * 2 + storage_lower)
            slice_copy(count, Current, lower, upper)
            count := count * 2
         else
            i := count
            j := other.count
            d := storage_lower - j
            if d < 0 then
               -- the string to be prepended is bigger than the unused space available in the buffer before the beginning of the string.
               ensure_capacity(i + j)
            end
            if i = 0 or else d = 0 then
               storage_lower := 0
            elseif d > 0 then
               storage_lower := d
            else
               storage.move(storage_lower, storage_lower + i - 1, -d)
               storage_lower := 0
            end
            slice_copy(0, other, other.lower, other.upper)
            count := i + j
         end
      ensure
         (old other.twin + old twin).is_equal(Current)
      end

   insert_string (s: ABSTRACT_STRING; i: INTEGER)
         -- Insert `s' at index `i', shifting characters from index `i'
         -- to `count' rightwards.
      require
         string_not_void: s /= Void
         valid_insertion_index: lower <= i and i <= upper + 1
      local
         j, k, dk: INTEGER
      do
         j := count
         k := s.count
         count := j + k
         dk := k - storage_lower
         if dk <= 0 then
            storage.move(storage_lower, i - lower + storage_lower, -k)
            storage_lower := -dk
            slice_copy(i - lower, s, s.lower, s.upper)
         else
            ensure_capacity(count)
            if storage_lower > 0 then
               storage.move(storage_lower, i + storage_lower - lower, -storage_lower)
            end
            if i <= j then
               storage.move(i + storage_lower - lower, j + storage_lower - lower, dk)
            end
            storage_lower := 0
            slice_copy(i - lower, s, s.lower, s.upper)
         end
      end

   replace_substring (s: ABSTRACT_STRING; start_index, end_index: INTEGER)
         -- Replace the substring from `start_index' to `end_index',
         -- inclusive, with `s'.
      require
         string_not_void: s /= Void
         valid_start_index: lower <= start_index
         valid_end_index: end_index <= upper
         meaningful_interval: start_index <= end_index + 1
      local
         remove_len, insert_len, difference, old_upper: INTEGER
      do
         remove_len := end_index - start_index + 1
         insert_len := s.count
         difference := insert_len - remove_len
         if difference > 0 then
            if storage_lower >= difference then
               storage.move(storage_lower, start_index, -difference)
               storage_lower := storage_lower - difference
            else
               old_upper := upper
               ensure_capacity(count + difference)
               if end_index < old_upper then
                  -- something to move?
                  storage.move(storage_lower + end_index + 1 - lower, storage_lower + old_upper - lower, difference)
               end
            end
         elseif difference < 0 then
            if end_index < upper then
               -- something to move?
               storage.move(storage_lower + end_index + 1 - lower, storage_lower + upper - lower, difference)
            end
         end
         count := count + difference
         slice_copy(start_index - lower, s, s.lower, s.upper)
      end

   put (c: CHARACTER; i: INTEGER)
         -- Put `c' at index `i'.
         --
         -- See also `item', `lower', `upper', `swap'.
      require
         valid_index: valid_index(i)
      do
         storage.put(c, storage_lower + i - lower)
      ensure
         item(i) = c
      end

   swap (i1, i2: INTEGER)
         -- Swap two characters.
         --
         -- See also `item', `put'.
      require
         valid_index(i1)
         valid_index(i2)
      local
         tmp: CHARACTER
      do
         tmp := item(i1)
         put(item(i2), i1)
         put(tmp, i2)
      ensure
         item(i1) = old item(i2)
         item(i2) = old item(i1)
      end

   insert_character (c: CHARACTER; i: INTEGER)
         -- Inserts `c' at index `i', shifting characters from
         -- position 'i' to `count' rightwards.
      require
         valid_insertion_index: lower <= i and i <= upper + 1
      do
         if storage_lower > 0 and then i <= upper then
            if i > lower then
               storage.move(storage_lower, storage_lower + i - lower, -1)
            end
            storage_lower := storage_lower - 1
         else
            ensure_capacity(count + storage_lower + 1)
            if i <= upper then
               storage.move(storage_lower - lower + i, storage_lower - lower + upper, 1)
            end
         end
         storage.put(c, storage_lower + i - lower)
         count := count + 1
      ensure
         item(i) = c
         count = old count + 1
      end

   shrink (min_index, max_index: INTEGER)
         -- Keep only the slice [`min_index' .. `max_index'] or nothing
         -- when the slice is empty.
      require
         lower <= min_index
         max_index <= upper
         min_index <= max_index + 1
      do
         if max_index < min_index then
            count := 0
         elseif min_index = 1 then
            count := max_index
         else
            storage_lower := storage_lower + min_index - lower
            count := max_index - min_index + 1
         end
      ensure
         count = max_index - min_index + 1
      end

   remove (i: INTEGER)
         -- Remove character at position `i'.
         --
         -- See also `remove_head', `remove_between', `remove_suffix', `remove_prefix'.
      require
         valid_removal_index: valid_index(i)
      do
         remove_between(i, i)
      ensure
         count = old count - 1
      end

   add_first, precede (c: CHARACTER)
         -- Add `c' at first position.
         --
         -- See also `add_last'.
      do
         insert_character(c, lower)
      ensure
         count = 1 + old count
         item(lower) = c
      end

   add_last, append_character, extend (c: CHARACTER)
         -- Append `c' to string.
         --
         -- See also `add_first'.
      do
         insert_character(c, upper + 1)
      ensure
         count = 1 + old count
         item(upper) = c
      end

   to_lower
         -- Convert all characters to lower case.
         --
         -- See also `to_upper', `as_lower', `as_upper'.
      local
         i: INTEGER
      do
         from
            i := 1
         until
            i > count
         loop
            put(item(i).to_lower, i)
            i := i + 1
         end
      end

   to_upper
         -- Convert all characters to upper case.
         --
         -- See also `to_lower', `as_upper', `as_lower'.
      local
         i: INTEGER
      do
         from
            i := 1
         until
            i > count
         loop
            put(item(i).to_upper, i)
            i := i + 1
         end
      end

   keep_head (n: INTEGER)
         -- Remove all characters except for the first `n'.
         -- Do nothing if `n' >= `count'.
         --
         -- See also `keep_tail', `remove_head', `remove_tail'.
      require
         n_non_negative: n >= 0
      do
         if n < count then
            remove_tail(count - n)
         end
      ensure
         count = n.min(old count)
      end

   keep_tail (n: INTEGER)
         -- Remove all characters except for the last `n'.
         -- Do nothing if `n' >= `count'.
         --
         -- See also `keep_head', `remove_tail', `remove_head'.
      require
         n_non_negative: n >= 0
      do
         if n < count then
            remove_head(count - n)
         end
      ensure
         count = n.min(old count)
      end

   remove_first
         -- Remove the `first' item.
         --
         -- See also `remove_head', `remove_last', `remove'.
      require
         not is_empty
      do
         storage_lower := storage_lower + 1
         count := count - 1
      ensure
         count = old count - 1
      end

   remove_head (n: INTEGER)
         -- Remove `n' first characters. If `n' >= `count', remove all.
         --
         -- See also `remove_tail', `remove', `remove_the_first'.
      require
         n_non_negative: n >= 0
      do
         if n >= count then
            storage_lower := 0
            count := 0
         else
            storage_lower := storage_lower + n
            count := count - n
         end
      ensure
         count = (old count - n).max(0)
      end

   remove_last
         -- Remove the `last' item.
         --
         -- See also `remove_tail', `remove_first', `remove'.
      require
         not is_empty
      do
         count := count - 1
      ensure
         count = old count - 1
      end

   remove_tail (n: INTEGER)
         -- Remove `n' last characters. If `n' >= `count', remove all.
         --
         -- See also `remove_head', `remove', `remove_the_last'.
      require
         n_non_negative: n >= 0
      do
         if n >= count then
            storage_lower := 0
            count := 0
         else
            count := count - n
         end
      ensure
         count = (old count - n).max(0)
      end

   remove_substring, remove_between (start_index, end_index: INTEGER)
         -- Remove all characters from `strt_index' to `end_index' inclusive.
      require
         valid_start_index: 1 <= start_index
         valid_end_index: end_index <= count
         meaningful_interval: start_index <= end_index + 1
      local
         i, len: INTEGER
      do
         len := end_index - start_index + 1
         if len > 0 then
            from
               i := end_index + 1
            until
               i > count
            loop
               put(item(i), i - len)
               i := i + 1
            end
            count := count - len
         end
      ensure
         count = old count - (end_index - start_index + 1)
      end

   remove_suffix (s: ABSTRACT_STRING)
         -- Remove the suffix `s' of current string.
         --
         -- See also `remove_prefix', `remove_tail', `remove'.
      require
         has_suffix(s)
      do
         remove_tail(s.count)
      ensure
         (old Current.twin).is_equal(Current + old s.twin)
      end

   remove_prefix (s: ABSTRACT_STRING)
         -- Remove the prefix `s' of current string.
         --
         -- See also `remove_suffix', `remove_head', `remove'.
      require
         has_prefix(s)
      do
         remove_head(s.count)
      ensure
         (old s.twin + Current).is_equal(old Current.twin)
      end

   left_adjust
         -- Remove leading blanks.
         --
         -- See also `remove_head', `first'.
      local
         i: INTEGER
      do
         from
            i := 1
         until
            i > count or else not item(i).is_separator -- i.e. not a blank like ' '
         loop
            i := i + 1
         end
         remove_head(i - 1)
      ensure
         stripped: is_empty or else not first.is_separator
      end

   right_adjust
         -- Remove trailing blanks.
         --
         -- See also `remove_tail', `last'.
      do
         from
         until
            count = 0 or else not item(count).is_separator
         loop
            count := count - 1
         end
      ensure
         stripped: is_empty or else not last.is_separator
      end

feature {ANY} -- Other features:
   substring (start_index, end_index: INTEGER): like Current
      local
         new_count: INTEGER
         new_store: like storage
      do
         new_count := end_index - start_index + 1
         new_store := new_store.calloc(new_count + 1)
         new_store.slice_copy(0, storage, storage_lower + start_index - lower, storage_lower + end_index - lower)

         Result := standard_twin
         Result.from_external_sized(new_store.to_external, new_count)
      end

   extend_multiple (c: CHARACTER; n: INTEGER)
         -- Extend Current with `n' times character `c'.
      require
         n >= 0
      local
         i: INTEGER
      do
         from
            i := n
         until
            i = 0
         loop
            add_last(c)
            i := i - 1
         end
      ensure
         count = n + old count
      end

  precede_multiple (c: CHARACTER; n: INTEGER)
          -- Prepend `n' times character `c' to Current.

      local
          old_upper, new_storage_lower: INTEGER
      do
          -- Note: This command once had this precondition: "require n >= 0" As you
          -- can see this implementation does not actually need it.  In fact this
          -- command will not fail if n is negative. Perhaps it is a vestigial
          -- precondition when there were no NATURAL type. When n is not positive
          -- this command does not make any change. Paolo
          -- 2011-09-04
          if n > 0 then
                  old_upper := upper
                  if old_upper < lower then
                          check count = 0 end
                                  storage_lower := 0
                                  extend_multiple(c, n)
                          else
                                  if n > storage_lower then
                  new_storage_lower := 0
                  count := count + storage_lower
                  extend_multiple('%U', n - storage_lower)
               else
                  new_storage_lower := storage_lower - n
                  count := count + n
               end
               storage.move(storage_lower, storage_lower + old_upper - lower, n)
               storage.set_slice_with(c, new_storage_lower, new_storage_lower + n - 1)
               storage_lower:= new_storage_lower
               next_generation
            end
         end
      ensure
         count = n.max(0) + old count
                 not_changed_when_n_is_not_positive: n < 1 implies Current ~ old twin
      end

   extend_to_count (c: CHARACTER; needed_count: INTEGER)
         -- Extend Current with `c' until `needed_count' is reached.
         -- Do nothing if `needed_count' is already greater or equal
         -- to `count'.
      require
         needed_count >= 0
      local
         needed: INTEGER
      do
         from
            needed := needed_count - count
         until
            needed <= 0
         loop
            add_last(c)
            needed := needed - 1
         end
      ensure
         count >= needed_count
      end

   precede_to_count (c: CHARACTER; needed_count: INTEGER)
         -- Prepend `c' to Current until `needed_count' is reached.
         -- Do nothing if `needed_count' is already greater or equal
         -- to `count'.
      require
         needed_count >= 0
      local
         needed: INTEGER
      do
         from
            needed := needed_count - count
         until
            needed <= 0
         loop
            add_first(c)
            needed := needed - 1
         end
      ensure
         count >= needed_count
      end

   reverse
         -- Reverse the string.
      local
         i1, i2: INTEGER
      do
         from
            i1 := 1
            i2 := count
         until
            i1 >= i2
         loop
            swap(i1, i2)
            i1 := i1 + 1
            i2 := i2 - 1
         end
      end

   remove_all_occurrences (ch: CHARACTER)
         -- Remove all occurrences of `ch'.
         --
         -- See also `occurrences', `remove'.
      local
         i, j: INTEGER
      do
         from
            i := 1
            j := 1
         until
            i > count
         loop
            if item(i) /= ch then
               put(item(i), j)
               j := j + 1
            end
            i := i + 1
         end
         count := j - 1
      ensure
         count = old count - old occurrences(ch)
      end

feature {ANY} -- Testing and Conversion:
   to_hexadecimal
         -- Convert Current bit sequence into the corresponding
         -- hexadecimal notation.
      require
         is_bit
      local
         i, k, new_count: INTEGER; value: INTEGER
      do
         from
            i := 1
            k := count #\\ 4
            if k > 0 then
               new_count := 1
            end
         until
            k = 0
         loop
            value := value * 2 + item(i).value
            i := i + 1
            k := k - 1
         end
         if new_count > 0 then
            put(value.hexadecimal_digit, new_count)
         end
         from
         until
            i > count
         loop
            from
               value := item(i).value
               i := i + 1
               k := 3
            until
               k = 0
            loop
               value := value * 2 + item(i).value
               i := i + 1
               k := k - 1
            end
            new_count := new_count + 1
            put(value.hexadecimal_digit, new_count)
         end
         count := new_count
      end

feature {ANY} -- Other features:
   extend_unless (ch: CHARACTER)
         -- Extend `Current' (using `extend') with `ch' unless `ch'
         -- already the `last' character.
      do
         if count = 0 or else item(count) /= ch then
            add_last(ch)
         end
      ensure
         last = ch
         count >= old count
      end

   intern: FIXED_STRING
         -- A shared version of this string.
      local
         strings: FAST_ARRAY[FIXED_STRING]
         i: INTEGER
      do
         strings := interned.reference_at(hash_code)
         if strings = Void then
            create strings.with_capacity(4)
            interned.add(strings, hash_code)
         end
         from
            i := strings.lower
         until
            Result /= Void or else i > strings.upper
         loop
            if strings.item(i).same_as(Current) then
               Result := strings.item(i)
            end
            i := i + 1
         end
         if Result = Void then
            create Result.make_from_string(Current)
            Result.do_intern(strings)
         end
      end

feature {ANY} -- Interfacing with C string:
   to_external: POINTER
         -- Gives C access to the internal `storage' (may be dangerous).
         -- To be compatible with C, a null character is added at the end
         -- of the internal `storage'. This extra null character is not
         -- part of the Eiffel STRING.
      do
         if count + storage_lower = capacity then
            add_last('%U')
            count := count - 1
         elseif storage.item(count + storage_lower) /= '%U' then
            storage.put('%U', count + storage_lower)
         end
         Result := storage.to_pointer + storage_lower
      end

   from_external (p: POINTER)
         -- Internal `storage' is set using `p' (may be dangerous because
         -- the external C string `p' is not duplicated). Assume `p' has a
         -- null character at the end in order to compute the Eiffel
         -- `count'. This extra null character is not part of the Eiffel
         -- STRING. Also consider `from_external_copy' to choose the most
         -- appropriate.
      require
         p.is_not_null
      do
         storage_lower := 0
         from
            storage := storage.from_pointer(p)
            count := 0
         until
            storage.item(count) = '%U'
         loop
            count := count + 1
         end
         capacity := count + 1
         if storage_signature_count > 0 then
            has_storage_signature := False
         end
         next_generation
      ensure
         capacity = count + 1
         p = to_external
      end

   from_external_copy (p: POINTER)
         -- Internal `storage' is set using a copy of `p'. Assume `p' has a
         -- null character at the end in order to compute the Eiffel
         -- `count'. This extra null character is not part of the Eiffel
         -- STRING. Also consider `from_external' to choose the most
         -- appropriate.
      require
         p.is_not_null
      local
         s: like storage; i: INTEGER
      do
         storage_lower := 0
         from
            s := s.from_pointer(p)
            count := 0
         until
            s.item(i) = '%U'
         loop
            add_last(s.item(i))
            i := i + 1
         end
         next_generation
      end

   from_external_sized (p: POINTER; size: INTEGER)
         -- Internal `storage' is set using `p' (may be dangerous because
         -- the external C string `p' is not duplicated). The 'count' of
         -- characters of the string is set to 'size'.
         -- Also consider `from_external_sized_copy' to choose the most
         -- appropriate.
      require
         p.is_not_null
         size >= 0
      do
         storage_lower := 0
         storage := storage.from_pointer(p)
         count := size
         capacity := size
         if storage_signature_count > 0 then
            has_storage_signature := False
         end
         next_generation
      ensure
         count = size
         capacity = size
         p = storage.to_pointer -- caution: to_external will add a trailing null
      end

   from_external_sized_copy (p: POINTER; size: INTEGER)
         -- Internal `storage' is set using a copy of `p'.
         -- 'size' characters are copied, setting then 'count' to 'size'.
         -- Also consider `from_external' to choose the most appropriate.
      require
         p.is_not_null
         size >= 0
      local
         s: like storage
      do
         storage_lower := 0
         from
            ensure_capacity(size)
            s := s.from_pointer(p)
            count := 0
         until
            count = size
         loop
            storage.put(s.item(count), count)
            count := count + 1
         end
         next_generation
      ensure
         count = size
      end

feature {RECYCLING_POOL, STRING_RECYCLING_POOL}
   recycle
      do
         clear_count
      end

feature {}
   slice_copy (at: INTEGER; source: ABSTRACT_STRING; start_index, end_index: INTEGER)
      do
         if end_index >= start_index then
            source.copy_slice_to_native(start_index, end_index, storage, at + storage_lower)
         end
      end

invariant
   0 <= count
   count <= capacity
   capacity > 0 implies storage.is_not_null
   storage_lower >= 0

end -- class STRING
--
-- Copyright (C) 2009-2022: by all the people cited in the AUTHORS file.
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
