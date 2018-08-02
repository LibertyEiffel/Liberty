-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class NATURAL_GENERAL
   --
   -- General natural number abstraction to share common code for NATURAL_8, NATURAL_16, NATURAL_32 and
   -- NATURAL_64.
   --
   -- All implementations have a limited size (8, 16, 32 or 64 bits).
   -- As NATURAL_8, NATURAL_16, NATURAL_32 and NATURAL_64 are expanded classes, it is not possible to
   -- expect any form of polymorphism (but you are sure to get the very best execution speed).
   --
   -- See also INTEGER_8, INTEGER_16, INTEGER_32, INTEGER_64, NUMBER or MUTABLE_BIG_INTEGER.
   --

inherit
   COMPARABLE
      redefine
         is_equal, fill_tagged_out_memory, out_in_tagged_out_memory, infix ">",
         infix "<=", infix ">="
      end
   HASHABLE --| **** TODO change to NUMERIC when NATURAL integration is complete
      redefine
         fill_tagged_out_memory, out_in_tagged_out_memory
      end

insert
   PLATFORM
      redefine
         is_equal, fill_tagged_out_memory, out_in_tagged_out_memory
      end

feature {ANY}
   infix "+" (other: like Current): like Current
         -- Sum with `other' (commutative).
      external "built_in"
      end

   infix "-" (other: like Current): like Current
         -- Result of subtracting `other'.
      external "built_in"
      end

   infix "*" (other: like Current): like Current
         -- Product by `other'.
      external "built_in"
      end

   infix "/" (other: like Current): REAL
         -- Division by `other'.
      external "built_in"
      end

   infix "//" (other: like Current): like Current
         -- Quotient of the Euclidian division of `Current' by `other'.
         -- The corresponding remainder is given by infix "\\".
         --
         -- See also infix "#//".
      external "built_in"
      end

   infix "\\" (other: like Current): like Current
         -- Remainder of the Euclidian division of `Current' by `other'.
         -- By definition, `0 <= Result < other.abs'.
         --
         -- See also infix "#\\", infix "//".
      external "built_in"
      end

   infix "<" (other: like Current): BOOLEAN
      external "built_in"
      end

   infix "<=" (other: like Current): BOOLEAN
      external "built_in"
      end

   infix ">" (other: like Current): BOOLEAN
      external "built_in"
      end

   infix ">=" (other: like Current): BOOLEAN
      external "built_in"
      end

   is_odd: BOOLEAN
         -- Is odd?
      deferred
      end

   is_even: BOOLEAN
         -- Is even?
      deferred
      end

   is_equal (other: like Current): BOOLEAN
      do
         Result := Current = other
      end

feature {ANY} -- Conversions:
   to_string: STRING
         -- The decimal view of `Current' into a new allocated STRING.
         -- For example, if `Current' is 3 the `Result' is "3".
         --
         -- See also `append_in', `to_string_format', `to_unicode_string'.
      do
         string_buffer.clear_count
         append_in(string_buffer)
         Result := string_buffer.twin
      end

   to_unicode_string: UNICODE_STRING
         -- The decimal view of `Current' into a new allocated UNICODE_STRING.
         -- For example, if `Current' is -1 the `Result' is U"-1".
         --
         -- See also `append_in_unicode', `to_unicode_string_format', `to_string'.
      do
         unicode_string_buffer.clear_count
         append_in_unicode(unicode_string_buffer)
         Result := unicode_string_buffer.twin
      end

   append_in_format (buffer: STRING; s: INTEGER)
         -- Append in the `buffer' the equivalent of `to_string_format'.
         -- If you look for performances, you should always prefer `append_in_format' which allow you
         -- to recycle a unique common `buffer' (each call of `to_string_format' allocate a new object!).
         --
         -- See also `append_in', `append_in_unicode', `append_in_unicode_format'.
      require
         to_string.count <= s
      local
         i: INTEGER
      do
         string_buffer.clear_count
         append_in(string_buffer)
         from
            i := s - string_buffer.count
         until
            i <= 0
         loop
            buffer.extend(' ')
            i := i - 1
         end
         buffer.append(string_buffer)
      ensure
         buffer.count >= old buffer.count + s
      end

   append_in_unicode_format (buffer: UNICODE_STRING; s: INTEGER)
         -- Append in the `buffer' the equivalent of `to_unicode_string_format'.
         -- If you look for performances, you should always prefer `append_in_unicode_format' which allow
         -- you to recycle a unique common `buffer' (each call of `to_unicode_string_format' allocate a
         -- new object!).
         --
         -- See also `append_in_format', `append_in', `append_in_format'.
      require
         to_string.count <= s
      local
         i: INTEGER
      do
         unicode_string_buffer.clear_count
         append_in_unicode(unicode_string_buffer)
         from
            i := s - unicode_string_buffer.count
         until
            i <= 0
         loop
            buffer.extend(' '.code)
            i := i - 1
         end
         buffer.append(unicode_string_buffer)
      ensure
         buffer.count >= old buffer.count + s
      end

   decimal_digit: CHARACTER
         -- Gives the corresponding CHARACTER for range 0..9.
         --
         -- See also `hexadecimal_digit'.
      deferred
      ensure
         (once "0123456789").has(Result)
      end

   hexadecimal_digit: CHARACTER
         -- Gives the corresponding CHARACTER for range 0..15.
         --
         -- See also `decimal_digit'.
      deferred
      ensure
         (once "0123456789ABCDEF").has(Result)
      end

   to_character: CHARACTER
         -- Return the corresponding ASCII character.
         --
         -- See also `to_boolean', `to_number', `to_string'.
      deferred
      end

   to_number: NUMBER
         -- Convert `Current' into a new allocated NUMBER.
         --
         -- See also `to_boolean', `to_string', `to_character', `to_hexadecimal'.
      deferred
      ensure
         Result.to_string.is_equal(to_string)
      end

feature {ANY} -- Modular arithmetic (these wrap around on overflow)
   infix "#+" (other: like Current): like Current
      external "built_in"
      end

   infix "#-" (other: like Current): like Current
      external "built_in"
      end

   infix "#\\" (other: like Current): like Current
      external "built_in"
      end

   infix "#//" (other: like Current): like Current
      external "built_in"
      end

feature {ANY} -- Object printing
   out_in_tagged_out_memory, fill_tagged_out_memory
      do
         Current.append_in(tagged_out_memory)
      end

   to_hexadecimal: STRING
      do
         string_buffer.clear_count
         to_hexadecimal_in(string_buffer)
         Result := string_buffer.twin
      end

   to_hexadecimal_in (buffer: STRING)
      local
         index, timez: INTEGER;
         value, val_mask: like Current
      do
         from
            value := Current
            timez := object_size * 2
            index := buffer.count + timez
            buffer.extend_multiple(' ', timez)
         until
            timez = 0
         loop
            val_mask := (value |>> 4) |<< 4
            buffer.put((value - val_mask).hexadecimal_digit, index)
            index := index - 1
            value := value |>> 4
            timez := timez - 1
         end
      end

   append_in (buffer: STRING)
         -- Append in the `buffer' the equivalent of `to_string'.
         -- If you look for performances, you should always prefer `append_in' which allow you to recycle
         -- a unique common `buffer' (each call of `to_string' allocate a new object!).
         --
         -- See also `append_in_format', `append_in_unicode', `append_in_unicode_format', `to_hexadecimal_in'.
      require
         buffer /= Void
      deferred
      end

   append_in_unicode (buffer: UNICODE_STRING)
         -- Append in the `buffer' the equivalent of `to_unicode_string'.
         -- If you look for performances, you should always prefer `append_in_unicode' which allow you to recycle
         -- a unique common `buffer' (each call of `to_unicode_string' allocate a new object!).
         --
         -- See also `append_in_unicode_format', `append_in', `append_in_format', `to_hexadecimal_in'.
      require
         buffer /= Void
      deferred
      end

feature {ANY} -- Bitwise Logical Operators:
   infix "#>>", bit_rotate_right (s: INTEGER_8): like Current
         -- Rotate by `s' positions right.
         --
         -- See also `bit_rotate_left' and `bit_rotate'.
      require
         s.in_range(1, bit_count - 1)
      external "built_in"
      end

   infix "#<<", bit_rotate_left (s: INTEGER_8): like Current
         -- Rotate by `s' positions left.
         --
         -- See also `bit_rotate_right' and `bit_rotate'.
      require
         s.in_range(1, bit_count - 1)
      external "built_in"
      end

   bit_rotate (s: INTEGER_8): like Current
         -- Rotate by `s' positions (positive `s' shifts right, negative left
         --
         -- See also `bit_rotate_right' and `bit_rotate_left'.
      require
         s.in_range(- (bit_count - 1), bit_count - 1)
      external "built_in"
      end

   prefix "~", bit_not: like Current
         -- One's complement of `Current'.
      external "built_in"
      end

   infix "&", bit_and (other: like Current): like Current
         -- Bitwise logical and of `Current' with `other'.
      external "built_in"
      end

   infix "|", bit_or (other: like Current): like Current
         -- Bitwise logical inclusive or of `Current' with `other'.
      external "built_in"
      end

   bit_xor (other: like Current): like Current
         -- Bitwise logical exclusive or of `Current' with `other'.
      external "built_in"
      end

   infix "|>>", bit_shift_right (s: INTEGER_8): like Current
         -- Shift by `s' positions right (sign bit copied) bits falling off the end are lost.
      external "built_in"
      end

   infix "|<<", bit_shift_left (s: INTEGER_8): like Current
         -- Shift by `s' positions left bits falling off the end are lost.
      external "built_in"
      end

feature {ANY} -- Size query
   bit_count: INTEGER_8
         -- The number of bits used to store the value of Current
                 -- (it is 8 for NATURAL_8, 16 for NATURAL_16 and so on)
         -- This is actually used only for assertion here, in NATURAL_GENERAL.
      deferred
      ensure
         Result = (object_size * 8)
      end

feature {}
   string_buffer: STRING
      once
         create Result.make(128)
      end

   unicode_string_buffer: UNICODE_STRING
      once
         create Result.make(128)
      end

end -- class NATURAL_GENERAL
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
