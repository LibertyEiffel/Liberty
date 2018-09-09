-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class BIT_STRING
   --
   -- Long and very long bit sequences.
   -- An INTEGER index can be used to access each bit of the sequence.
   -- The leftmost bit has index 1 and the rightmost bit has index `count'.
   --
   -- For short bit sequences (less or equal to 32 or 64), also
   -- consider to use basic INTEGER_N type.
   --

inherit
   TRAVERSABLE[BOOLEAN]
      redefine copy, is_equal, out_in_tagged_out_memory, valid_index
      end

insert
   PLATFORM
      redefine copy, is_equal, out_in_tagged_out_memory
      end

create {ANY}
   make, from_string

feature {}
   word_size: INTEGER_8 32
         -- size of words in storage

   word_limit: INTEGER_8 31
         -- word_size - 1

feature {BIT_STRING}
   storage: FAST_ARRAY[INTEGER_32]
         -- The `storage' area. Bits are stored in the usual way (as
         -- they are printed). Padding of the `last' word is done
         -- using 0 on the right.

feature {ANY}
   count: INTEGER
         -- Number of bits in the sequence.

   lower: INTEGER 1

   upper: INTEGER
      do
         Result := count
      end

   is_empty: BOOLEAN
      do
         Result := count = 0
      end

   make (n: INTEGER)
         -- Make bit sequence of `n' bits.
         -- All bits are set to False.
      require
         n > 0
      do
         count := n
         if storage = Void then
            create storage.make((n + word_limit) #// word_size)
         else
            storage.make((n + word_limit) #// word_size)
         end
         next_generation
      ensure
         count = n
         all_default
      end

   from_string (model: STRING)
         -- Create or set `Current' using `model' which is supposed
         -- to be a sequence of mixed `0' or `1' characters.
      require
         model.is_bit
      do
         make(model.count)
         set_from_string(model, 1)
      end

   valid_index (idx: INTEGER): BOOLEAN
         -- True when `index' is valid (ie. inside actual
         -- bounds of the bit sequence).
      do
         if idx > 0 then
            Result := idx <= count
         end
      end

   item (idx: INTEGER): BOOLEAN
         -- True if `idx'-th bit is 1, False otherwise.
      do
         Result := storage.item((idx - 1) #// word_size).bit_test((word_limit - (idx - 1) #\\ word_size).to_integer_8)
      end

   first: like item
      do
         Result := item(lower)
      end

   last: like item
      do
         Result := item(upper)
      end

   put (value: BOOLEAN; idx: INTEGER)
         -- Set bit `idx' to 1 if `value' is True, 0 otherwise.
      require
         valid_index(idx)
      do
         if value then
            put_1(idx)
         else
            put_0(idx)
         end
      ensure
         value = item(idx)
      end

   put_1 (idx: INTEGER)
         -- Set bit `idx' to 1.
      require
         valid_index(idx)
      local
         pos: INTEGER
      do
         pos := (idx - 1) #// word_size
         storage.put(storage.item(pos).bit_set((word_limit - (idx - 1) #\\ word_size).to_integer_8), pos)
         next_generation
      ensure
         item(idx)
      end

   put_0 (idx: INTEGER)
         -- Set bit `idx' to 0.
      require
         valid_index(idx)
      local
         pos: INTEGER
      do
         pos := (idx - 1) #// word_size
         storage.put(storage.item(pos).bit_reset((word_limit - (idx - 1) #\\ word_size).to_integer_8), pos)
         next_generation
      ensure
         not item(idx)
      end

feature {ANY} -- Rotating and shifting:
   shift_by (n: INTEGER)
         -- Shift `n'-bits.
         -- `n' > 0 : shift right,
         -- `n' < 0 : shift left,
         -- `n' = 0 : do nothing.
         -- Falling bits are lost and entering bits are 0.
         --|*** PR(17/10/2004) change entering into incoming? (everywhere)
      do
         if n > 0 then
            shift_right_by(n)
         elseif n < 0 then
            shift_left_by(-n)
         end
         next_generation
      ensure
         count = old count
      end

   shift_left_by (n: INTEGER)
         -- Shift left by `n' bits.
         -- Falling bits are lost and entering bits are 0.
      require
         n >= 0
      local
         src, shift: INTEGER; shift1, shift2: INTEGER_8; new, prev: INTEGER_32
      do
         if n = 0 then
         elseif n > count then
            storage.clear_all
         elseif n.bit_and(word_limit) = 0 then
            -- move words
            from
               src := n #// word_size
               shift := -src
            until
               src > storage.upper
            loop
               storage.put(storage.item(src), src + shift)
               src := src + 1
            end
            storage.set_slice_with(0, src + shift, storage.upper)
         else
            -- general case
            from
               src := n #// word_size
               shift1 := n.bit_and(word_limit).to_integer_8
               shift2 := word_size - shift1
               prev := storage.item(src)
               src := src + 1
               shift := -src
            until
               src > storage.upper
            loop
               new := prev |<< shift1
               prev := storage.item(src)
               storage.put(new.bit_or(prev |>>> shift2), src + shift)
               src := src + 1
            end
            from
               src := src + shift
               storage.put(prev |<< shift1, src)
            until
               src >= storage.upper
            loop
               src := src + 1
               storage.put(0, src)
            end
         end
         next_generation
      end

   shift_right_by (n: INTEGER)
         -- Shift right by `n' bits.
         -- Falling bits are lost and entering bits are 0.
      require
         n >= 0
      local
         src, shift: INTEGER; shift1, shift2: INTEGER_8; new, prev, mask: INTEGER_32
      do
         if n = 0 then
         elseif n > count then
            storage.clear_all
         elseif n.bit_and(word_limit) = 0 then
            -- move words
            from
               shift := n #// word_size
               src := storage.upper - shift
            until
               src < storage.lower
            loop
               storage.put(storage.item(src), src + shift)
               src := src - 1
            end
            storage.set_slice_with(0, storage.lower, src + shift)
         else
            -- general case
            from
               src := storage.upper - n #// word_size
               shift1 := n.bit_and(word_limit).to_integer_8
               shift2 := word_size - shift1
               mask := -1
               prev := storage.item(src).bit_and(mask |<< (word_size - count.bit_and(word_limit).to_integer_8 - shift1))
               src := src - 1
               shift := storage.upper - src
            until
               src < storage.lower
            loop
               new := prev |>>> shift1
               prev := storage.item(src)
               storage.put(new.bit_or(prev |<< shift2), src + shift)
               src := src - 1
            end
            from
               src := src + shift
               storage.put(prev |>>> shift1, src)
            until
               src <= storage.lower
            loop
               src := src - 1
               storage.put(0, src)
            end
         end
         storage.put(storage.last.bit_and({INTEGER_32 -1 } |<< (word_size - count.bit_and(word_limit).to_integer_8)), storage.upper)
         next_generation
      end

   rotate_by (n: INTEGER)
         -- Rotate by `n' bits.
         -- `n' > 0 : Rotate right,
         -- `n' < 0 : Rotate left,
         -- `n' = 0 : do nothing.
      do
         basic_rotate_right(n \\ count)
      end

   rotate_left_by (n: INTEGER)
         -- Rotate left by `n' bits.
      require
         n >= 0
      do
         basic_rotate_right(-n \\ count)
      end

   rotate_right_by (n: INTEGER)
         -- Rotate right by `n' bits.
      require
         n >= 0
      do
         basic_rotate_right(n #\\ count)
      end

   infix "^" (s: INTEGER): like Current
         -- Sequence shifted by `s' positions (positive `s' shifts
         -- right, negative left; bits falling off the sequence's
         -- bounds are lost).
         -- See also infix "|>>" and infix "|<<".
      require
         s.abs < count
      do
         Result := Current.twin
         Result.shift_by(s)
      end

   infix "|>>" (s: INTEGER): like Current
         -- Sequence shifted right by `s' positions.
         -- Same as infix "^" when `s' is positive (may run a little
         -- bit faster).
      require
         s > 0
      do
         Result := Current.twin
         Result.shift_right_by(s)
      end

   infix "|<<" (s: INTEGER): like Current
         -- Sequence shifted left by `s' positions.
         -- Same as infix "^" when `s' is negative (may run a little
         -- bit faster.
      require
         s > 0
      do
         Result := Current.twin
         Result.shift_left_by(s)
      end

   infix "#" (s: INTEGER): like Current
         -- Sequence rotated by `s' positions (positive right,
         -- negative left).
      require
         s.abs < count
      do
         Result := Current.twin
         Result.rotate_by(s)
      end

   infix "#>>" (s: INTEGER): like Current
         -- Sequence rotated by `s' positions right.
      require
         s >= 0
         s < count
      do
         Result := Current.twin
         Result.rotate_right_by(s)
      end

   infix "#<<" (s: INTEGER): like Current
         -- Sequence rotated by `s' positions left.
      require
         s >= 0
         s < count
      do
         Result := Current.twin
         Result.rotate_left_by(s)
      end

feature {ANY} -- Bitwise Logical Operators:
   infix "and" (other: like Current): like Current
         -- Bitwise `and' of Current with `other'
      require
         count = other.count
      do
         Result := Current.twin
         Result.and_mask(other)
      ensure
         Result.count = Current.count
      end

   infix "implies" (other: like Current): like Current
         -- Bitwise implication of Current with `other'
      require
         count = other.count
      do
         Result := Current.twin
         Result.implies_mask(other)
      ensure
         Result.count = Current.count
      end

   prefix "not": like Current
         -- Bitwise `not' of Current.
      do
         Result := Current.twin
         Result.invert
      ensure
         Result.count = Current.count
      end

   infix "or" (other: like Current): like Current
         -- Bitwise `or' of Current with `other'.
      require
         other /= Void
         count = other.count
      do
         Result := Current.twin
         Result.or_mask(other)
      ensure
         Result.count = Current.count
      end

   infix "xor" (other: like Current): like Current
         -- Bitwise `xor' of Current with `other'
      require
         other /= Void
         count = other.count
      do
         Result := Current.twin
         Result.xor_mask(other)
      ensure
         Result.count = Current.count
      end

   and_mask (other: like Current)
         -- Apply bitwise `and' mask of `other' onto Current.
      require
         count = other.count
      local
         i: INTEGER
      do
         from
            i := storage.lower
         variant
            storage.upper - i
         until
            i > storage.upper
         loop
            storage.put(storage.item(i).bit_and(other.storage.item(i)), i)
            i := i + 1
         end
         next_generation
      end

   implies_mask (other: like Current)
         -- Apply bitwise implies mask of `other'.
      require
         count = other.count
      local
         i: INTEGER; mask: INTEGER_32
      do
         from
            i := storage.upper
         until
            i < 0
         loop
            storage.put(storage.item(i).bit_not.bit_or(other.storage.item(i)), i)
            i := i - 1
         end
         i := count #\\ word_size
         if i /= 0 then
            check
               mask = 0
            end
            mask := mask.bit_not |<< (word_size - i).to_integer_8
            storage.put(storage.last.bit_and(mask), storage.upper)
         end
         next_generation
      end

   or_mask (other: like Current)
         -- Apply bitwise `or' mask of `other' onto Current.
      require
         count = other.count
      local
         i: INTEGER
      do
         from
            i := storage.lower
         variant
            storage.upper - i
         until
            i > storage.upper
         loop
            storage.put(storage.item(i).bit_or(other.storage.item(i)), i)
            i := i + 1
         end
         next_generation
      end

   xor_mask (other: like Current)
         -- Apply bitwise `xor' mask of `other' onto Current
      require
         count = other.count
      local
         i: INTEGER
      do
         from
            i := storage.lower
         variant
            storage.upper - i
         until
            i > storage.upper
         loop
            storage.put(storage.item(i).bit_xor(other.storage.item(i)), i)
            i := i + 1
         end
         next_generation
      end

   invert
         -- Invert Current bit-per-bit.
      local
         i: INTEGER; mask: INTEGER_32
      do
         from
            i := storage.lower
         variant
            storage.upper - i
         until
            i > storage.upper
         loop
            storage.put(storage.item(i).bit_not, i)
            i := i + 1
         end
         i := count #\\ word_size
         if i /= 0 then
            check
               mask = 0
            end
            mask := mask.bit_not |<< (word_size - i).to_integer_8
            storage.put(storage.last.bit_and(mask), storage.upper)
         end
         next_generation
      end

feature {ANY} -- Conversions:
   to_string: STRING
         -- String representation of bit sequence.
         -- A zero bit is mapped to '0', a one bit to '1'.
         -- Leftmost bit is at index 1 in the returned string.
         --
         -- Note: see `append_in' to save memory.
      do
         create Result.make(count)
         append_in(Result)
      ensure
         Result.count = count
      end

   to_integer: INTEGER
         -- The corresponding INTEGER value when `count' <= `Integer_bits'.
         -- No sign-extension when `count' < `Integer_bits'.
      require
         count <= Integer_bits
      do
         Result := storage.first.bit_shift_right_unsigned((word_size - count).to_integer_8)
      end

feature {ANY} -- Others:
   all_cleared, all_default: BOOLEAN
         -- Are all bits set to 0?
      do
         Result := storage.all_default
      end

   clear_all
         -- Set all bits to 0
      do
         storage.clear_all
         next_generation
      ensure
         all_default
      end

   all_set: BOOLEAN
         -- Are all bits set to 1?
      local
         i: INTEGER
      do
         from
            Result := True
            i := storage.upper - 1
         until
            i < 0 or else not Result
         loop
            Result := storage.item(i) = -1 --(0).to_integer_32.bit_not
            i := i - 1
         end
         if Result then
            i := count #\\ word_size
            if i = 0 then
               Result := storage.last = -1 --(0).to_integer_32.bit_not
            else
               Result := storage.last = {INTEGER -1} |<< (word_size - i).to_integer_8
            end
         end
      end

   set_all
         -- Set all bits to 1
      local
         i: INTEGER
      do
         storage.set_all_with(-1)
         i := count #\\ word_size
         if i /= 0 then
            storage.put({INTEGER -1} |<< (word_size - i).to_integer_8, storage.upper)
         end
         next_generation
      ensure
         all_set
      end

   is_equal (other: like Current): BOOLEAN
      do
         if count = other.count then
            Result := storage.is_equal(other.storage)
         end
      end

   copy (other: like Current)
      do
         count := other.count
         if storage = Void then
            storage := other.storage.twin
         else
            storage.copy(other.storage)
         end
         next_generation
      end

   out_in_tagged_out_memory
         -- Append terse printable representation of current object
         -- in `tagged_out_memory'
      do
         Current.append_in(tagged_out_memory)
         tagged_out_memory.extend('B')
      end

   append_in (str: STRING)
         -- Append in `str' a viewable representation of `Current'.
      local
         i: INTEGER
      do
         from
            i := 1
         until
            i > count
         loop
            if item(i) then
               str.extend('1')
            else
               str.extend('0')
            end
            i := i + 1
         end
      end

   set_from_string (model: STRING; offset: INTEGER)
         -- Use the whole contents of `model' to reset range
         -- `offset' .. `offset + model.count - 1' of `Current'.
         -- Assume all characters of `model' are `0' or `1'.
      require
         model.is_bit
         valid_index(offset)
         valid_index(offset + model.count - 1)
      local
         i: INTEGER
      do
         from
            i := 1
         variant
            model.count - i
         until
            i > model.count
         loop
            put(model.item(i) = '1', i + offset - 1)
            i := i + 1
         end
         next_generation
      ensure
         count = old count
      end

feature {ANY} -- Other features:
   new_iterator: ITERATOR[BOOLEAN]
      do
         create {ITERATOR_ON_BIT_STRING} Result.make(Current)
      end

feature {}
   basic_rotate_right (n: INTEGER)
         -- Rotate right by `n' bits.
         --|*** PR(02/11/2004) This is not yet optimized.
      require
         n.in_range(0, count - 1)
      local
         prec: BIT_STRING; mask: BIT_STRING
      do
         if n /= 0 then
            create mask.make(count)
            mask.set_all
            mask.shift_right_by(count - n)
            prec := Current and mask
            shift_right_by(n)
            prec.shift_left_by(count - n)
            or_mask(prec)
         end
         next_generation
      end

invariant
   count >= 1
   not storage.is_empty

end -- class BIT_STRING
--
-- Copyright (C) 2009-2018: by all the people cited in the AUTHORS file.
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
