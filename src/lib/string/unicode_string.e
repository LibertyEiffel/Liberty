-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class UNICODE_STRING
   --
   -- WARNING: THIS CLASS IS A WORK IN PROGRESS. SOME FEATURE ARE NOT
   -- YET IMPLEMENTED AND SOME FEATURE MAY APPEAR/DISAPPEAR.
   --
   -- A UNICODE_STRING is a resizable string written with unicode values.
   -- From unicode.org: "Unicode provides a unique number for every
   -- character ,
   --                    no matter what the platform,
   --                    no matter what the program,
   --                    no matter what the language.
   --
   -- WARNING: a grapheme may be described with many code.
   -- grapheme may be defined as "user character". Angstrom sign
   -- one grapheme but may be defined using (LETTER A + COMBINING RING).
   -- Unicode strings may be acceded in two ways:
   --      - low-level (code by code)
   --      - high-level (grapheme by grapheme)
   --
   -- Unless otherwise specified, all functions unit is the unicode number.
   --

inherit
   HASHABLE
      redefine copy, out_in_tagged_out_memory, fill_tagged_out_memory
      end
   COMPARABLE
      redefine is_equal, copy, compare, three_way_comparison, out_in_tagged_out_memory, fill_tagged_out_memory
      end
   TRAVERSABLE[INTEGER]
      redefine is_equal, copy, out_in_tagged_out_memory, fill_tagged_out_memory, next_generation
      end
   SEARCHABLE[INTEGER]
      redefine is_equal, copy, out_in_tagged_out_memory, fill_tagged_out_memory
      end
   RECYCLABLE
      redefine is_equal, copy, out_in_tagged_out_memory, fill_tagged_out_memory
      end

insert
   UNICODE_STRING_HELPER
      redefine is_equal, copy, out_in_tagged_out_memory, fill_tagged_out_memory
      end

create {ANY}
   make, copy, make_empty, make_filled, from_utf8

feature {UNICODE_STRING, UNICODE_STRING_HANDLER}
   storage: NATIVE_ARRAY[INTEGER_16]
         -- The place where characters are stored.
         -- WARNING: it's only `storage' area. Each Unicode value
         -- stored using 2 bytes (CHARACTER). Encoding used is UTF-16NE.
         -- low surrogates are stored in other way for direct access.

feature {ANY}
   count: INTEGER
         -- String length which is also the maximum valid index.
         --
         -- See also `is_empty', `lower', `upper'.

   capacity: INTEGER
         -- Capacity of the `storage' area.

   lower: INTEGER 1
         -- Minimum index; actually, this is always 1 (this feature
         -- here to mimic the one of the COLLECTION hierarchy).
         --
         -- See also `upper', `valid_index', `item'.

   upper: INTEGER
         -- Maximum index; actually the same value as `count' (this
         -- feature is here to mimic the one of the COLLECTION hierarchy).
         --
         -- See also `lower', `valid_index', `item'.
      do
         Result := count
      ensure
         Result = count
      end

feature {ANY} -- Creation / Modification:
   make (needed_capacity: INTEGER)
         -- Initialize the string to have at least `needed_capacity'
         -- characters of storage.
      require
         non_negative_size: needed_capacity >= 0
      do
         if needed_capacity > 0 then
            if capacity < needed_capacity then
               storage := storage.calloc(needed_capacity)
               capacity := needed_capacity
            end
         end
         count := 0
         if low_surrogate_indexes = Void then
            create low_surrogate_indexes.make(0)
            create low_surrogate_values.make(0)
         else
            low_surrogate_indexes.make(0)
            low_surrogate_values.make(0)
         end
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

   make_filled (unicode: INTEGER; n: INTEGER)
         -- Initialize string with `n' copies of `unicode'.
      require
         valid_count: n >= 0
         valid_unicode_value: valid_unicode(unicode)
      do
         make(n)
         count := n
         fill_with(unicode)
      ensure
         count_set: count = n
         filled: occurrences(unicode) = count
      end

feature {ANY} -- Testing:
   is_empty: BOOLEAN
         -- Has string length 0?
         --
         -- See also `count'.
      do
         Result := count = 0
      end

   item (i: INTEGER): INTEGER
         -- Get unicode at position `i'.
         --
         -- See also `lower', `upper', `valid_index', `put'.
      local
         n: INTEGER
      do
         n := storage.item(i - 1)
         if n & 0x0000F800 = 0x0000D800 then
            Result := n & 0x000007FF + 64
            Result := Result * 1024 + low_surrogate_value(i)
         else
            Result := n & 0x0000FFFF
         end
      end

   infix "@" (i: INTEGER): INTEGER
         -- The infix notation which is actually just a synonym for `item'.
         --
         -- See also `item', `put'.
      require
         valid_index(i)
      do
         Result := item(i)
      ensure
         definition: Result = item(i)
      end

   hash_code: INTEGER
      local
         i, j: INTEGER
      do
         from
            j := count
         until
            j <= 0
         loop
            Result := Result #* 5 #+ storage.item(i)
            i := i + 1
            j := j - 1
         end
         from
            j := low_surrogate_values.upper
         until
            j <= low_surrogate_values.lower
         loop
            Result := Result #* 5 #+ low_surrogate_values.item(j)
            j := j - 1
         end
         if Result < 0 then
            Result := -(Result + 1)
         end
      end

   infix "<" (other: like Current): BOOLEAN
         -- Is `Current' less than `other'?
         --
         -- See also `>', `<=', `>=', `min', `max'.
      local
         i: INTEGER; maxi: INTEGER
      do
         from
            i := 1
            maxi := count.min(other.count)
         until
            i > maxi or else item(i) /= other.item(i)
         loop
            i := i + 1
         end
         if i <= maxi then
            Result := item(i) < other.item(i)
         else
            Result := i <= other.count
         end
         --not_yet_implemented
      end

   compare, three_way_comparison (other: like Current): INTEGER
      do
         not_yet_implemented
         -- redefine needed ?
      end

   is_equal (other: like Current): BOOLEAN
         -- Do both strings have the same character sequence?
         --
         -- See also `same_as'.
      do
         if other = Current then
            Result := True
         else
            if count = other.count and then low_surrogate_values.is_equal(other.low_surrogate_values) and then low_surrogate_indexes.is_equal(other.low_surrogate_indexes) then
               Result := storage.fast_memcmp(other.storage, count)
            end
            if not Result then
               --not_yet_implemented
            end
         end
      end

   same_as (other: UNICODE_STRING): BOOLEAN
         -- Case insensitive `is_equal'.
      require
         other /= Void
      do
         not_yet_implemented
      end

   index_of, fast_index_of (unicode: INTEGER; start_index: INTEGER): INTEGER
         -- Index of first occurrence of `unicode' at or after `start_index',
         -- 0 if none.
         --
         -- See also `reverse_index_of', `first_index_of', `last_index_of', `has'.
         require
         valid_unicode_value: valid_unicode(unicode)
      local
         code: INTEGER_16; remainder: INTEGER_16; i: INTEGER
      do
         if unicode >= 0x00010000 then
            -- stored as high and low surrogate
            code := (unicode #// 1024 - 64).low_16
            remainder := (unicode & 0x000003FF).to_integer_16
            from
               i := 0
            until
               i > low_surrogate_indexes.upper or else low_surrogate_indexes.item(i) >= start_index
            loop
               i := i + 1
            end
            from
            until
               i > low_surrogate_indexes.upper or else low_surrogate_values.item(i) = remainder and then storage.item(low_surrogate_indexes.item(i) - 1) = code
            loop
               i := i + 1
            end
            if i <= low_surrogate_indexes.upper then
               Result := low_surrogate_indexes.item(i)
            end
         else
            -- not surrogate character
            code := unicode.low_16
            from
               i := start_index - 1
               Result := start_index
            until
               Result > count or else storage.item(i) = code
            loop
               Result := Result + 1
               i := i + 1
            end
            if Result > count then
               Result := 0
            end
         end
      ensure then
         Result /= 0 implies item(Result) = unicode
      end

   reverse_index_of, fast_reverse_index_of (unicode: INTEGER; start_index: INTEGER): INTEGER
         -- Index of first occurrence of `unicode' at or before `start_index', 0 if none.
         -- The search is done in reverse direction, which means from the `start_index' down
         -- to the first character.
         --
         -- See also `index_of', `last_index_of', `first_index_of'.
      --require
      --   valid_start_index: start_index >= 0 and start_index <= count
      --   valid_unicode_value: valid_unicode(unicode)
      do
         from
            Result := start_index
         until
            Result = 0 or else unicode = item(Result)
         loop
            Result := Result - 1
         end
      ensure then
         Result /= 0 implies item(Result) = unicode
      end

   first_index_of, fast_first_index_of (unicode: INTEGER): INTEGER
         -- Index of first occurrence of `unicode' at index 1 or after index 1.
         --
         -- See also `last_index_of', `index_of', `reverse_index_of'.
      do
         Result := index_of(unicode, 1)
      end

   last_index_of, fast_last_index_of (unicode: INTEGER): INTEGER
         -- Index of last occurrence of `unicode', 0 if none.
         --
         -- See also `first_index_of', `reverse_index_of', `index_of'.
      do
         Result := reverse_index_of(unicode, upper)
      end

   has, fast_has (unicode: INTEGER): BOOLEAN
         -- True if `unicode' is in the STRING.
         --
         -- See also `index_of', `occurrences', `has_substring'.
      require
         valid_unicode_value: valid_unicode(unicode)
      do
         Result := index_of(unicode, 1) /= 0
      end

   has_substring (other: UNICODE_STRING): BOOLEAN
         -- True if `Current' contains `other'.
         --
         -- See also `substring_index', `has'.
      require
         other_not_void: other /= Void
      do
         Result := substring_index(other, 1) /= 0
      end

   occurrences (unicode: INTEGER): INTEGER
         -- Number of times character `unicode' appears in the string.
         --
         -- See also `remove_all_occurrences', `has'.
      require
         valid_unicode_value: valid_unicode(unicode)
      local
         i: INTEGER
      do
         from
            i := index_of(unicode, 1)
         until
            i = 0
         loop
            Result := Result + 1
            i := index_of(unicode, i)
         end
      ensure
         Result >= 0
      end

   has_suffix (s: UNICODE_STRING): BOOLEAN
         -- True if suffix of `Current' is `s'.
         --
         -- See also `remove_suffix', `has_prefix', `has_substring'.
      require
         s /= Void
      local
         i, offset: INTEGER
      do
         offset := count - s.count
         from
            Result := offset >= 0
            i := lower
         until
            not Result or else i > s.upper
         loop
            Result := item(i + offset) = s.item(i)
            i := i + 1
         end
      end

   has_prefix (p: UNICODE_STRING): BOOLEAN
         -- True if prefix of `Current' is `p'.
      require
         p /= Void
      local
         i: INTEGER
      do
         from
            Result := count >= p.count
            i := lower
         until
            not Result or else i > p.upper
         loop
            Result := item(i) = p.item(i)
            i := i + 1
         end
      end

feature {ANY} -- Testing and Conversion:
   is_ascii: BOOLEAN
         -- True if all unicode value is in range 0..127
      local
         i: INTEGER
      do
         from
            i := count - 1
         until
            i < 0 or else storage.item(i) & 0xFF80 /= 0
         loop
            i := i - 1
         end
         Result := i < 0
      end

   to_utf8: STRING
         -- New string is created, current unicode string is encoded
         -- with UTF-8 format.
         --
         -- See also: `utf8_encode_in' and `as_utf8' to save memory.
      do
         tmp_buffer.clear_count
         utf8_encode_in(tmp_buffer)
         Result := tmp_buffer.twin
      end

   as_utf8: STRING
         -- Encode the string in UTF-8. Always returns the same once object.
         --
         -- See also: `to_utf8', `utf8_encode_in'.
      do
         Result := once ""
         Result.clear_count
         utf8_encode_in(Result)
      end

   utf8_encode_in (s: STRING)
         -- Append the string in UTF-8 to `s'.
         --
         -- See also: `to_utf8', `as_utf8'.
      require
         s /= Void
      local
         i: INTEGER
      do
         from
            i := 1
         until
            i > count
         loop
            utf8_character_in(item(i), s)
            i := i + 1
         end
      end

   utf16be_encode_in (s: STRING)
         -- Append the string in UTF-16BE to `s'
      require
         s /= Void
      local
         i, k: INTEGER; v: INTEGER_16
      do
         from
         until
            i >= count
         loop
            v := storage.item(i)
            s.extend((v |>>> 8).to_character)
            s.extend((v & 0x00FF).to_character)
            if v & 0xF800 = 0xD800 then
               check
                  low_surrogate_indexes.item(k) = i + 1
               end
               s.extend((low_surrogate_values.item(k) #// 256 + 220).to_character)
               s.extend((low_surrogate_values.item(k) & 0x00FF).to_character)
               k := k + 1
            end
            i := i + 1
         end
      end

   utf8_decode_from (s: ABSTRACT_STRING): BOOLEAN
         -- Use `s' as UTF-8 format encoded unicode string
         -- Return `False' if decoding process failed
      require
         s /= Void
      local
         i, k, seq_length: INTEGER; v: INTEGER
      do
         from
            Result := True
            i := 1
         until
            i > s.count
         loop
            v := s.item(i).code
            i := i + 1
            inspect
               v
            when 0 .. 127 then
               extend(v)
               k := 0
            when 192 .. 223 then
               v := v - 192
               k := 2
            when 224 .. 239 then
               v := v - 224
               k := 3
            when 240 .. 247 then
               v := v - 240
               k := 4
            else
               extend(65533)
               Result := False
               k := 0
            end
            from
               seq_length := k
            until
               k <= 1
            loop
               if i <= s.count and then s.item(i).code.in_range(128, 191) then
                  v := v * 64 + s.item(i).code - 128
                  i := i + 1
                  k := k - 1
               else
                  extend(65533)
                  Result := False
                  k := 0
               end
            end
            if k = 1 then
               if v < 128 or else v < 2048 and then seq_length > 2 or else v < 65536 and then seq_length > 3 then
                  -- overlong sequence, must be refused by any UTF-8
                  -- compliant decode for security reasons.
                  extend(65533)
                  Result := False
               elseif not valid_unicode(v) then
                  extend(65533)
                  Result := False
               else
                  extend(v)
               end
            end
         end
      end

feature {}
   from_utf8 (s: ABSTRACT_STRING)
         -- Use `s' as UTF-8 format encoded unicode string
         -- This function may be used for manifest strings
         -- See `utf8_decode_from' for error detection
      require
         s /= Void
      local
         error: BOOLEAN
      do
         make(s.count)
         error := utf8_decode_from(s)
      end

feature {ANY} -- Modification:
   resize (new_count: INTEGER)
         -- Resize Current. When `new_count' is greater than
         -- `count', new positions are initialized with unicode 0.
      require
         new_count >= 0
      local
         i: INTEGER
      do
         if new_count <= count then
         elseif capacity < new_count then
            if capacity = 0 then
               storage := storage.calloc(new_count)
            else
               storage := storage.realloc(capacity, new_count)
            end
            capacity := new_count
         else
            storage.clear(count, new_count - 1)
         end
         count := new_count
         from
            i := low_surrogate_indexes.upper
         until
            i < 0 or else low_surrogate_indexes.item(i) <= new_count
         loop
            --TODO: only one remove out of the loop
            low_surrogate_indexes.remove_last
            low_surrogate_values.remove_last
            i := i - 1
         end
         next_generation
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
         count := 0
         low_surrogate_indexes.make(0)
         low_surrogate_values.make(0)
         next_generation
      ensure
         is_empty: count = 0
         capacity = old capacity
      end

   clear_count_and_capacity
         -- Discard all characters (`is_empty' is True after that call). The internal `capacity' may also be
         -- reduced after this call.
         --
         -- See also `clear_count'.
      do
         low_surrogate_indexes.clear_count_and_capacity
         low_surrogate_values.clear_count_and_capacity
         clear_count
         --*** capacity := 0
         --*** storage := null_storage
         next_generation
      ensure
         is_empty: count = 0
         capacity = 0
      end

   copy (other: like Current)
         -- Copy `other' onto Current.
         --
         -- See also `copy_substring'.
      do
         count := other.count
         if count > 0 then
            if capacity < count then
               storage := storage.calloc(count)
               capacity := count
            end
            storage.copy_from(other.storage, count - 1)
         end
         if low_surrogate_indexes = Void then
            create low_surrogate_indexes.make(0)
            create low_surrogate_values.make(0)
         end
         low_surrogate_indexes.copy(other.low_surrogate_indexes)
         low_surrogate_values.copy(other.low_surrogate_values)
         next_generation
      ensure then
         count = other.count
      end

   copy_substring (s: like Current; start_index, end_index: INTEGER)
         -- Copy the substring from `s' from `start_index' to `end_index'
         -- to Current.
         --
         -- See also `copy'.
         --|*** DUMB IMPLEMENTATION
      require
         string_not_void: s /= Void
         valid_start_index: 1 <= start_index
         valid_end_index: end_index <= s.count
         meaningful_interval: start_index <= end_index + 1
      do
         clear_count
         append_substring(s, start_index, end_index)
      end

   fill_with (unicode: INTEGER)
         -- Replace every unicode with the new value.
      require
         valid_unicode_value: valid_unicode(unicode)
      local
         i: INTEGER; code: INTEGER_16; remainder: INTEGER_16
      do
         if unicode >= 65536 then
            -- stored as high and low surrogate
            code := (unicode #// 1024 - 64).low_16
            remainder := (unicode & 0x000003FF).to_integer_16 --unicode #\\ 1024
            storage.set_all_with(code, count - 1)
            low_surrogate_values.resize(count)
            low_surrogate_values.set_all_with(remainder)
            from
               i := count - 1
               low_surrogate_indexes.resize(count)
            until
               i < 0
            loop
               low_surrogate_indexes.put(i + 1, i)
               i := i - 1
            end
         else
            code := unicode.low_16
            storage.set_all_with(code, count - 1)
            low_surrogate_values.resize(0)
            low_surrogate_indexes.resize(0)
         end
         next_generation
      ensure
         occurrences(unicode) = count
      end

   replace_all (old_code, new_code: like item)
         -- Replace all occurrences of the element `old_code' by `new_code'.
      require
         valid_unicode_value: valid_unicode(old_code)
         valid_unicode_value: valid_unicode(new_code)
      local
         i: INTEGER
      do
         --*** May be implemented in a more efficient way...
         if old_code /= new_code then
            from
               i := index_of(old_code, 1)
            until
               i = 0
            loop
               put(new_code, i)
               i := index_of(old_code, i + 1)
            end
         end
         next_generation
      ensure
         count = old count
         old_code /= new_code implies occurrences(old_code) = 0
      end

   append, append_string (s: UNICODE_STRING)
         -- Append a copy of 's' to `Current'.
         --
         -- See also `add_last', `add_first', `prepend', '+'.
      require
         s_not_void: s /= Void
      local
         s_count, needed_capacity, new_capacity, i: INTEGER; indexes: FAST_ARRAY[INTEGER]
      do
         s_count := s.count
         needed_capacity := count + s_count
         if needed_capacity > capacity then
            if capacity = 0 then
               storage := storage.calloc(needed_capacity)
               capacity := needed_capacity
            else
               new_capacity := (2 * capacity).max(needed_capacity)
               storage := storage.realloc(capacity, new_capacity)
               capacity := new_capacity
            end
         end
         storage.copy_at(count, s.storage, s_count)
         from
            indexes := s.low_surrogate_indexes
         until
            i > indexes.upper
         loop
            low_surrogate_indexes.add_last(indexes.item(i) + count)
            low_surrogate_values.add_last(s.low_surrogate_values.item(i))
            i := i + 1
         end
         count := needed_capacity
         next_generation
      end

   append_substring (s: like Current; start_index, end_index: INTEGER)
         -- Append the substring from `s' from `start_index' to `end_index'
         -- to Current.
         --|*** DUMB IMPLEMENTATION
      require
         string_not_void: s /= Void
         valid_start_index: 1 <= start_index
         valid_end_index: end_index <= s.count
         meaningful_interval: start_index <= end_index + 1
      local
         i: INTEGER
      do
         from
            i := start_index
         until
            i > end_index
         loop
            extend(s.item(i))
            i := i + 1
         end
      end

   prepend (other: UNICODE_STRING)
         -- Prepend `other' to `Current'.
         --
         -- See also `append'.
      require
         other /= Void
      local
         i, j, k: INTEGER
      do
         i := count
         j := other.count
         resize(i + j)
         if i > 0 and then j > 0 then
            storage.move(0, i - 1, j)
            from
               k := low_surrogate_indexes.upper
            until
               k < 0
            loop
               low_surrogate_indexes.put(low_surrogate_indexes.item(k) + j, k)
               k := k - 1
            end
         end
         -- May be implemented in a more efficient way...
         from
            k := other.low_surrogate_indexes.upper
         until
            k < 0
         loop
            low_surrogate_indexes.add_first(other.low_surrogate_indexes.item(k))
            low_surrogate_values.add_first(other.low_surrogate_values.item(k))
            k := k - 1
         end
         storage.copy_from(other.storage, j - 1)
         next_generation
      ensure
         (old other.twin + old Current.twin).is_equal(Current)
      end

   insert_string (s: UNICODE_STRING; i: INTEGER)
         -- Insert `s' at index `i', shifting characters from index `i'
         -- to `count' rightwards.
      require
         string_not_void: s /= Void
         valid_insertion_index: 1 <= i and i <= count + 1
      local
         j, k: INTEGER; pos, n: INTEGER
      do
         j := count
         k := s.count
         resize(j + k)
         if i <= j then
            storage.move(i - 1, j - 1, k)
         end
         storage.copy_at(i - 1, s.storage, k)
         pos := low_surrogate_position(i)
         j := low_surrogate_indexes.count + s.low_surrogate_indexes.count
         low_surrogate_indexes.resize(j)
         low_surrogate_values.resize(j)
         from
            -- move existing surrogates and adjust indexes
            n := s.low_surrogate_indexes.upper
         until
            n < 0
         loop
            j := j - 1
            low_surrogate_indexes.put(low_surrogate_indexes.item(pos + n) + k, j)
            low_surrogate_values.put(low_surrogate_values.item(pos + n), j)
            n := n - 1
         end
         from
            -- copy surrogates from s and adjust indexes
            n := s.low_surrogate_indexes.upper
            j := pos + n
         until
            n < 0
         loop
            low_surrogate_indexes.put(s.low_surrogate_indexes.item(n) + i, j)
            low_surrogate_values.put(s.low_surrogate_values.item(n), j)
            j := j - 1
            n := n - 1
         end
         next_generation
      end

   replace_substring (s: UNICODE_STRING; start_index, end_index: INTEGER)
         -- Replace the substring from `start_index' to `end_index',
         -- inclusive, with `s'.
      require
         string_not_void: s /= Void
         valid_start_index: 1 <= start_index
         valid_end_index: end_index <= count
         meaningful_interval: start_index <= end_index + 1
      do
         -- May be implemented in a more efficient way...
         remove_between(start_index, end_index)
         insert_string(s, start_index)
      end

   infix "+" (other: UNICODE_STRING): like Current
         -- Create a new UNICODE_STRING which is the concatenation of
         -- `Current' and `other'.
         --
         -- See also `append'.
      require
         other_exists: other /= Void
      do
         create Result.make(count + other.count)
         Result.append(Current)
         Result.append(other)
      ensure
         result_count: Result.count = count + other.count
      end

   put (unicode: INTEGER; i: INTEGER)
         -- Put `unicode' at position `i'.
         --
         -- See also `item', `lower', `upper', `swap'.
      require
         valid_index: valid_index(i)
         valid_unicode_value: valid_unicode(unicode)
      local
         v, n: INTEGER
      do
         if unicode >= 65536 then
            -- stored as high and low surrogate
            v := unicode #// 1024 - 64
            if storage.item(i - 1) & 0xF800 = 0xD800 then
               low_surrogate_values.put((unicode & 0x000003FF).to_integer_16, low_surrogate_index(i))
            else
               n := low_surrogate_position(i)
               low_surrogate_indexes.add_last(0)
               low_surrogate_values.add_last(0)
               if n /= low_surrogate_indexes.upper then
                  low_surrogate_indexes.move(n, low_surrogate_indexes.upper - 1, 1)
                  low_surrogate_values.move(n, low_surrogate_values.upper - 1, 1)
               end
               low_surrogate_indexes.put(i, n)
               low_surrogate_values.put((unicode & 0x000003FF).to_integer_16, n)
            end
            storage.put(v.low_16, i - 1)
         else
            if storage.item(i - 1) & 0xF800 = 0xD800 then
               v := low_surrogate_index(i)
               low_surrogate_indexes.remove(v)
               low_surrogate_values.remove(v)
            end
            storage.put(unicode.low_16, i - 1)
         end
         next_generation
      ensure
         item(i) = unicode
      end

   swap (i1, i2: INTEGER)
         -- Swap two characters.
         --
         -- See also `item', `put'.
      require
         valid_index(i1)
         valid_index(i2)
      local
         tmp: INTEGER_16; j1, j2: INTEGER; low_tmp: INTEGER_16; k1, k2: INTEGER
      do
         j1 := i1 - 1
         j2 := i2 - 1
         tmp := storage.item(j1)
         if tmp & 0xF800 = 0xD800 then
            if storage.item(j2) & 0xF800 = 0xD800 then
               k1 := low_surrogate_index(i1)
               k2 := low_surrogate_index(i2)
               low_tmp := low_surrogate_values.item(k1)
               low_surrogate_values.put(low_surrogate_values.item(k2), k1)
               low_surrogate_values.put(low_tmp, k2)
               low_surrogate_indexes.put(i2, k1)
               low_surrogate_indexes.put(i1, k2)
            else
               low_tmp := low_surrogate_values.item(k1)
               k1 := low_surrogate_index(i1)
               k2 := low_surrogate_position(i2)
               if k2 > k1 + 1 then
                  low_surrogate_indexes.move(k1 + 1, k2 - 1, -1)
                  low_surrogate_values.move(k1 + 1, k2 - 1, -1)
                  k2 := k2 - 1
               elseif k1 > k2 then
                  low_surrogate_indexes.move(k2, k1 - 1, 1)
                  low_surrogate_values.move(k2, k1 - 1, 1)
                  --else no move
               end
               low_surrogate_indexes.put(i1, k2)
               low_surrogate_values.put(low_tmp, k2)
            end
         else
            if storage.item(j2) & 0xF800 = 0xD800 then
               low_tmp := low_surrogate_values.item(k2)
               k1 := low_surrogate_position(i1)
               k2 := low_surrogate_index(i2)
               if k1 > k2 + 1 then
                  low_surrogate_indexes.move(k2 + 1, k1 - 1, -1)
                  low_surrogate_values.move(k2 + 1, k1 - 1, -1)
                  k1 := k1 - 1
               elseif k2 > k1 then
                  low_surrogate_indexes.move(k1, k2 - 1, 1)
                  low_surrogate_values.move(k1, k2 - 1, 1)
                  --else no move
               end
               low_surrogate_indexes.put(i2, k1)
               low_surrogate_values.put(low_tmp, k1)
               -- else i1 and i2 are not surrogate
            end
         end
         storage.put(storage.item(j2), j1)
         storage.put(tmp, j2)
         next_generation
      ensure
         item(i1) = old item(i2)
         item(i2) = old item(i1)
      end

   insert_character (unicode: INTEGER; i: INTEGER)
         -- Inserts `unicode' at index `i', shifting characters from
         -- position 'i' to `count' rightwards.
      require
         valid_insertion_index: 1 <= i and i <= count + 1
         valid_unicode_value: valid_unicode(unicode)
      local
         j, k: INTEGER
      do
         k := low_surrogate_position(i)
         from
            j := low_surrogate_indexes.upper
         until
            j < k
         loop
            low_surrogate_indexes.put(low_surrogate_indexes.item(j) + 1, j)
            j := j - 1
         end
         resize(count + 1)
         if count > 1 then
            storage.move(i - 1, count - 2, 1)
            storage.put(0, i - 1)
         end
         put(unicode, i)
      ensure
         item(i) = unicode
      end

   shrink (min_index, max_index: INTEGER)
         -- Keep only the slice [`min_index' .. `max_index'] or nothing
         -- when the slice is empty.
      require
         1 <= min_index
         max_index <= count
         min_index <= max_index + 1
      local
         i, j: INTEGER
      do
         if max_index < min_index then
            count := 0
            low_surrogate_indexes.make(0)
            low_surrogate_values.make(0)
         elseif min_index = 1 then
            count := max_index
            i := low_surrogate_position(count)
            if i <= low_surrogate_indexes.upper then
               if low_surrogate_indexes.item(i) = max_index then
                  i := i + 1
               end
            end
            low_surrogate_indexes.resize(i)
            low_surrogate_values.resize(i)
         else
            storage.slice_copy(0, storage, min_index - 1, max_index - 1)
            from
               i := low_surrogate_position(min_index)
            until
               i > low_surrogate_indexes.upper or else low_surrogate_indexes.item(i) > max_index
            loop
               low_surrogate_indexes.put(low_surrogate_indexes.item(i) - min_index + 1, j)
               low_surrogate_values.put(low_surrogate_values.item(i), j)
               j := j + 1
               i := i + 1
            end
            low_surrogate_indexes.resize(j)
            low_surrogate_values.resize(j)
            count := max_index - min_index + 1
         end
         next_generation
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

   add_first, precede (unicode: INTEGER)
         -- Add `unicode' at first position.
         --
         -- See also `add_last'.
      require
         valid_unicode_value: valid_unicode(unicode)
      local
         i: INTEGER
      do
         from
            i := low_surrogate_indexes.upper
         until
            i < 0
         loop
            low_surrogate_indexes.put(low_surrogate_indexes.item(i) + 1, i)
            i := i - 1
         end
         resize(count + 1)
         if count > 1 then
            storage.move(0, count - 2, 1)
            storage.put(0, 0)
         end
         put(unicode, 1)
      ensure
         count = 1 + old count
         item(1) = unicode
      end

   add_last, append_character, extend (unicode: INTEGER)
         -- Append `unicode' to string.
         --
         -- See also `add_first'.
      require
         valid_unicode_value: valid_unicode(unicode)
      local
         new_capacity: INTEGER
      do
         if capacity > count then
         elseif capacity = 0 then
            new_capacity := 32
            storage := storage.calloc(new_capacity)
            capacity := new_capacity
         else
            new_capacity := 2 * capacity
            storage := storage.realloc(capacity, new_capacity)
            capacity := new_capacity
         end
         if unicode >= 65536 then
            -- stored as high and low surrogate
            low_surrogate_indexes.add_last(count)
            low_surrogate_values.add_last((unicode & 0x000003FF).to_integer_16)
            storage.put((unicode #// 1024 - 64).low_16, count)
         else
            storage.put(unicode.low_16, count)
         end
         count := count + 1
         next_generation
      ensure
         count = 1 + old count
         item(count) = unicode
      end

   to_lower
         -- Convert all characters to lower case.
         --
         -- See also `to_upper', `as_lower', `as_upper'.
      do
         not_yet_implemented
      end

   to_upper
         -- Convert all characters to upper case.
         --
         -- See also `to_lower', `as_upper', `as_lower'.
      do
         not_yet_implemented
      end

   as_lower: like Current
         -- New object with all letters in lower case.
         --
         -- See also `as_upper', `to_lower', `to_upper'.
      do
         create Result.copy(Current)
         Result.to_lower
      end

   as_upper: like Current
         -- New object with all letters in upper case.
         --
         -- See also `as_lower', `to_upper', `to_lower'.
      do
         create Result.copy(Current)
         Result.to_upper
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
         --*** May be improved?
         remove_between(1, 1)
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
         if n > count then
            count := 0
            low_surrogate_indexes.make(0)
            low_surrogate_values.make(0)
         else
            if n > 0 then
               remove_between(1, n)
            end
         end
         next_generation
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
         --*** May be improved
         remove_tail(1)
      ensure
         count = old count - 1
      end

   remove_tail (n: INTEGER)
         -- Remove `n' last characters. If `n' >= `count', remove all.
         --
         -- See also `remove_head', `remove', `remove_the_last'.
      require
         n_non_negative: n >= 0
      local
         i: INTEGER
      do
         if n > count then
            count := 0
            low_surrogate_indexes.make(0)
            low_surrogate_values.make(0)
         else
            count := count - n
            i := low_surrogate_position(count + 1)
            low_surrogate_indexes.resize(i)
            low_surrogate_values.resize(i)
         end
         next_generation
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
         i, k, len: INTEGER
      do
         len := end_index - start_index + 1
         if len > 0 then
            from
               i := low_surrogate_position(start_index)
               k := low_surrogate_position(end_index + 1)
            until
               k > low_surrogate_indexes.upper
            loop
               low_surrogate_indexes.put(low_surrogate_indexes.item(k) - len, i)
               low_surrogate_values.put(low_surrogate_values.item(k), i)
               k := k + 1
               i := i + 1
            end
            low_surrogate_indexes.resize(i)
            low_surrogate_values.resize(i)
            storage.slice_copy(start_index - 1, storage, end_index, count - 1)
            count := count - len
         end
         next_generation
      ensure
         count = old count - (end_index - start_index + 1)
      end

   remove_suffix (s: UNICODE_STRING)
         -- Remove the suffix `s' of current string.
         --
         -- See also `remove_prefix', `remove_tail', `remove'.
      require
         has_suffix(s)
      do
         not_yet_implemented
         -- remove_last(s.count); equal sequence may have different size
      ensure
         (old Current.twin).is_equal(Current + old s.twin)
      end

   remove_prefix (s: UNICODE_STRING)
         -- Remove the prefix `s' of current string.
         --
         -- See also `remove_suffix', `remove_head', `remove'.
      require
         has_prefix(s)
      do
         not_yet_implemented
         -- remove_head(s.count); equal sequence may have different size
      ensure
         (old Current.twin).is_equal(old s.twin + Current)
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
            i > count or else not is_space(item(i -- not_yet_implemented -- handle combining characters
            ))
         loop
            i := i + 1
         end
         remove_head(i - 1)
      ensure
      -- not_yet_implemented -- handle combining characters
         stripped: is_empty or else not is_space(first)
      end

   right_adjust
         -- Remove trailing blanks.
         --
         -- See also `remove_tail', `last'.
      local
         i: INTEGER
      do
         from
         until
            count = 0 or else not is_space(item(count -- not_yet_implemented -- handle combining characters
            ))
         loop
            count := count - 1
         end
         i := low_surrogate_position(count + 1)
         low_surrogate_indexes.resize(i)
         low_surrogate_values.resize(i)
         next_generation
      ensure
      -- not_yet_implemented -- handle combining characters
         stripped: is_empty or else not is_space(last)
      end

feature {ANY} -- Printing:
   out_in_tagged_out_memory
      do
         utf8_encode_in(tagged_out_memory)
      end

   fill_tagged_out_memory
      do
         tagged_out_memory.append(once "count: ")
         count.append_in(tagged_out_memory)
         tagged_out_memory.append(once "capacity: ")
         capacity.append_in(tagged_out_memory)
         tagged_out_memory.append(once "storage: %"")
         utf8_encode_in(tagged_out_memory)
         tagged_out_memory.append_character('%"')
      end

feature {ANY} -- Other features:
   first: INTEGER
         -- Access to the very `first' character.
         --
         -- See also `last', `item'.
      local
         n: INTEGER
      do
         n := storage.item(0)
         if n & 0x0000F800 = 0x0000D800 then
            check
               low_surrogate_indexes.item(0) = 1
            end
            Result := n & 0x000007FF + 64
            Result := Result * 1024 + low_surrogate_values.item(0)
         else
            Result := n & 0x0000FFFF
         end
      end

   last: INTEGER
         -- Access to the very `last' character.
         --
         -- See also `first', `item'.
      local
         n: INTEGER
      do
         n := storage.item(count - 1)
         if n & 0x0000F800 = 0x0000D800 then
            Result := n & 0x000007FF + 64
            Result := Result * 1024 + low_surrogate_value(count)
         else
            Result := n & 0x0000FFFF
         end
      end

   substring (start_index, end_index: INTEGER): like Current
         -- New string consisting of items [`start_index'.. `end_index'].
         --
         -- See also `substring_index' and `copy_substring' to save memory.
      require
         valid_start_index: 1 <= start_index
         valid_end_index: end_index <= count
         meaningful_interval: start_index <= end_index + 1
      local
         i: INTEGER; c: like storage; lsi: FAST_ARRAY[INTEGER]; lsv: FAST_ARRAY[INTEGER_16]
      do
         create Result.make(end_index - start_index + 1)
         Result.set_count(end_index - start_index + 1)
         c := Result.storage
         lsi := Result.low_surrogate_indexes
         lsv := Result.low_surrogate_values
         c.slice_copy(0, storage, start_index - 1, end_index - 1)
         from
            i := low_surrogate_position(start_index)
         until
            i > low_surrogate_indexes.upper or else low_surrogate_indexes.item(i) > end_index
         loop
            lsi.add_last(low_surrogate_indexes.item(i) - start_index)
            lsv.add_last(low_surrogate_values.item(i))
            i := i + 1
         end
      ensure
         substring_count: Result.count = end_index - start_index + 1
      end

   extend_multiple (unicode: INTEGER; n: INTEGER)
         -- Extend Current with `n' times character `unicode'.
      require
         n >= 0
         valid_unicode_value: valid_unicode(unicode)
      local
         i: INTEGER
      do
         from
            i := n
         until
            i = 0
         loop
            append_character(unicode)
            i := i - 1
         end
      ensure
         count = n + old count
      end

   precede_multiple (unicode: INTEGER; n: INTEGER)
         -- Prepend `n' times character `unicode' to Current.
      require
         n >= 0
         valid_unicode_value: valid_unicode(unicode)
      local
         i: INTEGER
      do
         if n > 0 then
            if count = 0 then
               extend_multiple(unicode, n)
            else
               --|*** May be implemented in a more efficient way...
               from
                  i := n
               until
                  i = 0
               loop
                  precede(unicode)
                  i := i - 1
               end
            end
         end
      ensure
         count = n + old count
      end

   extend_to_count (unicode: INTEGER; needed_count: INTEGER)
         -- Extend Current with `unicode' until `needed_count' is reached.
         -- Do nothing if `needed_count' is already greater or equal
         -- to `count'.
      require
         needed_count >= 0
         valid_unicode_value: valid_unicode(unicode)
      do
         if needed_count > count then
            extend_multiple(unicode, needed_count - count)
         end
      ensure
         count >= needed_count
      end

   precede_to_count (unicode: INTEGER; needed_count: INTEGER)
         -- Prepend `unicode' to Current until `needed_count' is reached.
         -- Do nothing if `needed_count' is already greater or equal
         -- to `count'.
      require
         needed_count >= 0
         valid_unicode_value: valid_unicode(unicode)
      do
         if needed_count > count then
            precede_multiple(unicode, needed_count - count)
         end
      ensure
         count >= needed_count
      end

   reverse
         -- Reverse the string.
      local
         i1, i2: INTEGER
      do
         not_yet_implemented
         --|*** reverse grapheme
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

   remove_all_occurrences (unicode: INTEGER)
         -- Remove all occurrences of `unicode'.
         --
         -- See also `occurrences', `remove'.
      require
         valid_unicode_value: valid_unicode(unicode)
      local
         i: INTEGER
      do
         --|*** May be implemented in a more efficient way...
         from
            i := index_of(unicode, 1)
         until
            i = 0
         loop
            remove(i)
            i := index_of(unicode, i)
         end
      ensure
         count = old count - old occurrences(unicode)
      end

   substring_index (other: UNICODE_STRING; start_index: INTEGER): INTEGER
         -- Position of first occurrence of `other' at or after `start', 0 if none.
         --
         -- See also `substring', `first_substring_index'.
      require
         other_not_void: other /= Void
         valid_start_index: start_index >= 1 and start_index <= count + 1
      do
         not_yet_implemented
      end

   first_substring_index (other: UNICODE_STRING): INTEGER
         -- Position of first occurrence of `other' at or after 1, 0 if none.
         --
         -- See also `substring_index'.
      require
         other_not_void: other /= Void
      do
         Result := substring_index(other, 1)
      ensure
         definition: Result = substring_index(other, 1)
      end

feature {ANY} -- Splitting a STRING:
   split: ARRAY[UNICODE_STRING]
         -- Split the string into an array of words. Uses `is_separator'
         -- to find words. Gives Void or a non empty array.
         --
         -- See also `split_in'.
      do
         if count > 0 then
            split_buffer.clear_count
            split_in(split_buffer)
            if not split_buffer.is_empty then
               Result := split_buffer.twin
            end
         end
      ensure
         Result /= Void implies not Result.is_empty
      end

   split_in (words: COLLECTION[UNICODE_STRING])
         -- Same jobs as `split' but result is appended in `words'.
         --
         -- See also `split'.
      require
         words /= Void
      local
         state, i: INTEGER; unicode: INTEGER
      do
         -- state = 0: waiting next word.
         -- state = 1: inside a new word.
         -- not_yet_implemented --|*** handle combining characters
         if count > 0 then
            from
               i := 1
            until
               i > count
            loop
               unicode := item(i)
               if state = 0 then
                  if not is_separator(unicode) then
                     string_buffer.clear_count
                     string_buffer.append_character(unicode)
                     state := 1
                  end
               else
                  if not is_separator(unicode) then
                     string_buffer.append_character(unicode)
                  else
                     words.add_last(string_buffer.twin)
                     state := 0
                  end
               end
               i := i + 1
            end
            if state = 1 then
               words.add_last(string_buffer.twin)
            end
         end
      ensure
         words.count >= old words.count
      end

feature {ANY} -- Other features:
   extend_unless (unicode: INTEGER)
         -- Extend `Current' (using `extend') with `unicode' unless
         -- unicode `ch' is already the `last' character.
      require
         valid_unicode_value: valid_unicode(unicode)
      do
         if count = 0 or else item(count) /= unicode then
            append_character(unicode)
         end
      ensure
         last = unicode
         count >= old count
      end

   new_iterator: ITERATOR[INTEGER]
      do
         create {ITERATOR_ON_UNICODE_STRING} Result.make(Current)
      end

   valid_unicode (unicode: INTEGER): BOOLEAN
      do
         Result := unicode.in_range(0, 0x0010FFFF) and then not unicode.in_range(0x0000D800, 0x0000DFFF) and then unicode /= 0x0000FFFE and then unicode /= 0x0000FFFF
         -- surrogates
         -- reverse BOM
         -- not valid unicode value
      end

   is_space (unicode: INTEGER): BOOLEAN
      do
         -- not_yet_implemented; should handle combining characters
         Result := unicode = ' '.code
      end

   is_separator (unicode: INTEGER): BOOLEAN
      do
         -- not_yet_implemented; should handle combining characters
         Result := unicode = ' '.code
      end

   is_combining (unicode: INTEGER): BOOLEAN
      do
         not_yet_implemented
         -- 0x0300 -> 0x036f
         -- 0x20d0 -> 0x20ff
         -- 0xfe20 -> 0xfe2f
      end

feature {UNICODE_STRING, UNICODE_STRING_HANDLER}
   low_surrogate_indexes: FAST_ARRAY[INTEGER]
         -- user indexes (starting at 1)

   low_surrogate_values: FAST_ARRAY[INTEGER_16]
         -- low surrogate value is stored without 0xDC00 part and
         -- endianness dependant !

   set_count (new_count: INTEGER)
      require
         new_count <= capacity
      do
         count := new_count
      end

feature {}
   string_buffer: UNICODE_STRING
         -- Private, temporary once buffer.
      once
         create Result.make(256)
      end

   tmp_buffer: STRING
         -- Private, temporary once buffer.
      once
         create Result.make(256)
      end

   split_buffer: ARRAY[UNICODE_STRING]
      once
         create Result.with_capacity(4, 1)
      end

   low_surrogate_value (index: INTEGER): INTEGER_16
      require
         storage.item(index) & 0xF800 = 0xD800
      do
         Result := low_surrogate_values.item(low_surrogate_index(index))
      ensure
         Result.in_range(0, 1023)
      end

   low_surrogate_index (index: INTEGER): INTEGER
      require
         low_surrogate_indexes.has(index)
      do
         --|*** Should use dichotomic search
         Result := low_surrogate_indexes.fast_first_index_of(index)
      ensure
         low_surrogate_values.valid_index(Result)
      end

   low_surrogate_position (index: INTEGER): INTEGER
         -- return position to use in low_surrogate* arrays relative to
         -- character at `index' in the string (return the good answer
         -- if the corresponding character is not surrogate)
      do
         -- Should use dichotomic search
         from
         until
            Result > low_surrogate_indexes.upper or else low_surrogate_indexes.item(Result) >= index
         loop
            Result := Result + 1
         end
      ensure
         low_surrogate_indexes.is_empty implies Result = 0
         Result <= low_surrogate_indexes.upper + 1
         Result >= low_surrogate_indexes.lower
         Result > low_surrogate_indexes.lower implies low_surrogate_indexes.item(Result - 1) < index
         Result <= low_surrogate_indexes.upper implies low_surrogate_indexes.item(Result + 1) >= index
      end

   valid_surrogates: BOOLEAN
      local
         i, j: INTEGER
      do
         from
            Result := True
         until
            i >= count
         loop
            if storage.item(i) & 0xF800 = 0xD800 then
               if low_surrogate_indexes.item(j) /= i + 1 then
                  Result := False
               end
               if storage.item(i) <= 0xDC00 then
                  -- negative!
                  Result := False
               end
               j := j + 1
            end
            i := i + 1
         end
         if low_surrogate_indexes.count /= j then
            Result := False
         end
      end

feature {}
   manifest_initialize (c: like capacity; s: like storage; ls_cap: INTEGER; lsv: NATIVE_ARRAY[INTEGER_16]
      lsi: NATIVE_ARRAY[INTEGER])
         -- This function is a compiler-hook automatically called when
         -- a manifest unicode string (i.e. U"foo") is used in the Eiffel
         -- source code.
      local
         i: INTEGER
      do
         if c > 0 then
            storage := storage.calloc(c)
            storage.copy_from(s, c - 1)
         end
         capacity := c
         count := c
         from
            create low_surrogate_indexes.make(ls_cap)
            create low_surrogate_values.make(ls_cap)
         until
            i >= ls_cap
         loop
            --|*** TODO: array copy may be improved using
            --|NATIVE_ARRAY.copy_from. Need to force new upper value
            --|in FAST_ARRAY.
            low_surrogate_indexes.add_last(lsi.item(i))
            low_surrogate_values.add_last(lsv.item(i))
            i := i + 1
         end
      end

feature {}
   debug_utf8: STRING

   set_debug_utf8
      do
         if debug_utf8 = Void then
            debug_utf8 := to_utf8
         else
            debug_utf8.copy(as_utf8)
         end
      end

   next_generation
      do
         Precursor
         debug("UNICODE_STRING")
            set_debug_utf8
         end
      end

feature {RECYCLING_POOL}
   recycle
      do
         clear_count
      end

invariant
   0 <= count
   count <= capacity
   capacity > 0 implies storage.is_not_null
   low_surrogate_values.count = low_surrogate_indexes.count
   valid_surrogates

end -- class UNICODE_STRING
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
