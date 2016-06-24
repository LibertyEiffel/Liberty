-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class INTEGER_GENERAL
   --
   -- General integer abstraction to share common code for INTEGER_8, INTEGER_16, INTEGER_32 and
   -- INTEGER_64. (Keep in mind that, INTEGER is just a built_in short-hand for INTEGER_32.)
   --
   -- All implementations have a limited size (8, 16, 32 or 64 bits) and are supposed to use
   -- two's complement representation which is the most common one.
   -- Also keep in mind that INTEGER_8, INTEGER_16, INTEGER_32 and INTEGER_64 are expanded classes
   -- hence making polymorphism not possible (but keeping the very best execution speed).
   --
   -- If you need integers with bigger values, use NUMBER or MUTABLE_BIG_INTEGER.
   --
   -- See also NATURAL_8, NATURAL_16, NATURAL_32, NATURAL_64, NUMBER or MUTABLE_BIG_INTEGER.
   --

inherit
   INTEGRAL
      redefine fill_tagged_out_memory, out_in_tagged_out_memory, is_equal
      end

feature {ANY}
   infix "+" (other: like Current): like Current
      external "built_in"
      end

   infix "-" (other: like Current): like Current
      external "built_in"
      end

   infix "*" (other: like Current): like Current
      external "built_in"
      end

   infix "/" (other: like Current): REAL
      external "built_in"
      end

   infix "//" (other: like Current): like Current
      do
         if Current >= 0 then
            Result := Current #// other
         elseif other > 0 then
            Result := (Current + 1) #// other - 1
         else
            Result := (Current + 1) #// other + 1
         end
      end

   infix "\\" (other: like Current): like Current
      do
         Result := Current #\\ other
         if Result < 0 then
            if other > 0 then
               Result := Result + other
            else
               Result := Result - other
            end
            check
               Result > 0
            end
         end
      end

   infix "^" (exp: like Current): INTEGER_64
      local
         i: like Current; k: INTEGER_64
      do
         i := exp
         if i = 0 then
            Result := 1
         else
            Result := Current
            from
               k := 1
            until
               i <= 1
            loop
               if i.is_odd then
                  k := k * Result
               end
               Result := Result * Result
               i := i #// 2
            end
            Result := Result * k
         end
      end

   abs: like Current
      do
         if Current < 0 then
            Result := -Current
         else
            Result := Current
         end
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

   prefix "+": like Current
      do
         Result := Current
      end

   prefix "-": like Current
      external "built_in"
      end

   is_odd: BOOLEAN
      do
         Result := Current & 1 /= 0
      end

   is_even: BOOLEAN
      do
         Result := Current & 1 = 0
      end

   sqrt: REAL
      deferred
      end

   log: REAL
      deferred
      end

   log10: REAL
      deferred
      end

   gcd (other: like Current): like Current
      do
         if other = 0 then
            Result := Current.abs
         else
            Result := other.gcd(Current \\ other)
         end
      end

feature {ANY} -- Conversions:
   to_string: STRING
      do
         string_buffer.clear_count
         append_in(string_buffer)
         Result := string_buffer.twin
      end

   to_unicode_string: UNICODE_STRING
      do
         unicode_string_buffer.clear_count
         append_in_unicode(unicode_string_buffer)
         Result := unicode_string_buffer.twin
      end

   to_boolean: BOOLEAN
      do
         Result := Current /= 0
      end

   to_number: NUMBER
      deferred
      end

   append_in (buffer: STRING)
      local
         val: like Current; i, idx: INTEGER
      do
         if Current = 0 then
            buffer.extend('0')
         else
            from
               if Current > 0 then
                  val := Current
                  -- Save the position of first character in the buffer.
                  i := buffer.count + 1
               else
                  buffer.extend('-')
                  -- Save the position of first character in the buffer.
                  i := buffer.count + 1
                  -- First (last) digit
                  val := Current #\\ 10
                  if val <= 0 then
                     buffer.extend((-val).decimal_digit)
                     val := -(Current #// 10)
                  else
                     buffer.extend((-val + 10).decimal_digit)
                     val := -(Current #// 10) - 1
                  end
                  check
                     val >= 0
                  end
               end
            until
               val = 0
            loop
               buffer.extend((val #\\ 10).decimal_digit)
               val := val #// 10
            end
            -- Change character order.
            from
               idx := buffer.count
            until
               i >= idx
            loop
               buffer.swap(i, idx)
               idx := idx - 1
               i := i + 1
            end
         end
      end

   append_in_unicode (buffer: UNICODE_STRING)
      local
         val: like Current; i, idx: INTEGER
      do
         if Current = 0 then
            buffer.extend('0'.code)
         else
            from
               if Current > 0 then
                  val := Current
                  -- Save the position of first character in the buffer.
                  i := buffer.count + 1
               else
                  buffer.extend('-'.code)
                  -- Save the position of first character in the buffer.
                  i := buffer.count + 1
                  -- First (last) digit
                  val := Current #\\ 10
                  if val <= 0 then
                     buffer.extend((-val).decimal_digit.code)
                     val := -(Current #// 10)
                  else
                     buffer.extend((- val + 10).decimal_digit.code)
                     val := -(Current #// 10) - 1
                  end
                  check
                     val >= 0
                  end
               end
            until
               val = 0
            loop
               buffer.extend((val #\\ 10).decimal_digit.code)
               val := val #// 10
            end
            -- Change character order.
            from
               idx := buffer.count
            until
               i >= idx
            loop
               buffer.swap(i, idx)
               idx := idx - 1
               i := i + 1
            end
         end
      end

   to_string_format (s: INTEGER): STRING
      local
         i: INTEGER
      do
         string_buffer.clear_count
         append_in(string_buffer)
         from
            create Result.make(string_buffer.count.max(s))
            i := s - string_buffer.count
         until
            i <= 0
         loop
            Result.extend(' ')
            i := i - 1
         end
         Result.append(string_buffer)
      end

   to_unicode_string_format (s: INTEGER): UNICODE_STRING
      local
         i: INTEGER
      do
         unicode_string_buffer.clear_count
         append_in_unicode(unicode_string_buffer)
         from
            create Result.make(unicode_string_buffer.count.max(s))
            i := s - unicode_string_buffer.count
         until
            i <= 0
         loop
            Result.extend(' '.code)
            i := i - 1
         end
         Result.append(unicode_string_buffer)
      end

   append_in_format (buffer: STRING; s: INTEGER)
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
      end

   append_in_unicode_format (buffer: UNICODE_STRING; s: INTEGER)
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
      end

   digit: CHARACTER
      do
         Result := decimal_digit
      end

   is_decimal_digit: BOOLEAN
      do
         Result := in_range(0, 9)
      end

   decimal_digit: CHARACTER
      deferred
      end

   is_hexadecimal_digit: BOOLEAN
      do
         Result := in_range(0, 15)
      end

   hexadecimal_digit: CHARACTER
      deferred
      end

   to_character: CHARACTER
      external "built_in"
      end

   to_octal_in (buffer: STRING)
      local
         index, timez: INTEGER; value: like Current
      do
         from
            value := Current
            timez := bit_count #// 3 + 1
            index := buffer.count + timez
            buffer.extend_multiple(' ', timez)
         until
            timez = 0
         loop
            buffer.put((value & 0x07).decimal_digit, index)
            index := index - 1
            value := value |>>> 3
            timez := timez - 1
         end
      end

   to_octal: STRING
      do
         string_buffer.clear_count
         to_octal_in(string_buffer)
         Result := string_buffer.twin
      end

   to_hexadecimal: STRING
      do
         string_buffer.clear_count
         to_hexadecimal_in(string_buffer)
         Result := string_buffer.twin
      end

   to_hexadecimal_in (buffer: STRING)
      local
         index, timez: INTEGER; value: like Current
      do
         from
            value := Current
            timez := object_size * 2
            index := buffer.count + timez
            buffer.extend_multiple(' ', timez)
         until
            timez = 0
         loop
            buffer.put((value & 0x0F).hexadecimal_digit, index)
            index := index - 1
            value := value |>> 4
            timez := timez - 1
         end
      end

feature {ANY} -- Bitwise Logical Operators:
   bit_test (idx: INTEGER_8): BOOLEAN
      do
         Result := Current.bit_shift_right(idx) & 1 /= 0
      end

   bit_set (idx: INTEGER_8): like Current
      local
         mask: like Current
      do
         mask := 1
         Result := Current.bit_or(mask.bit_shift_left(idx))
      end

   bit_reset (idx: INTEGER_8): like Current
      local
         mask: like Current
      do
         mask := 1
         Result := Current.bit_and(mask.bit_shift_left(idx).bit_not)
      end

   infix "|>>", bit_shift_right (s: INTEGER_8): like Current
         -- Shift by `s' positions right (sign bit copied) bits falling off the end are lost.
      external "built_in"
      end

   infix "|>>>", bit_shift_right_unsigned (s: INTEGER_8): like Current
         -- Shift by `s' positions right (sign bit not copied) bits falling off the end are lost.
      external "built_in"
      end

   infix "|<<", bit_shift_left (s: INTEGER_8): like Current
         -- Shift by `s' positions left bits falling off the end are lost.
      external "built_in"
      end

   infix "#>>", bit_rotate_right (s: INTEGER_8): like Current
      external "built_in"
      end

   infix "#<<", bit_rotate_left (s: INTEGER_8): like Current
      external "built_in"
      end

   bit_rotate (s: INTEGER_8): like Current
      external "built_in"
      end

   prefix "~", bit_not: like Current
      external "built_in"
      end

   infix "&", bit_and (other: like Current): like Current
      external "built_in"
      end

   infix "|", bit_or (other: like Current): like Current
      external "built_in"
      end

   bit_xor (other: like Current): like Current
      external "built_in"
      end

   bit_shift (s: INTEGER_8): like Current
      do
         if s > 0 then
            Result := Current |>> s
         else
            Result := Current |<< -s
         end
      end

   bit_shift_unsigned (s: INTEGER_8): like Current
      do
         if s > 0 then
            Result := Current |>>> s
         else
            Result := Current |<< -s
         end
      end

feature {ANY} -- Object Printing:
   out_in_tagged_out_memory, fill_tagged_out_memory
      do
         Current.append_in(tagged_out_memory)
      end

feature {ANY} -- Miscellaneous:
   sign: INTEGER_8
      do
         if Current < 0 then
            Result := -1
         elseif Current > 0 then
            Result := 1
         end
      end

   divisible (other: like Current): BOOLEAN
      do
         if other /= 0 then 
            Result := (Current #\\ other) = 0
         end
      end

   is_equal (other: like Current): BOOLEAN
      do
         Result := Current = other
      end

   is_a_power_of_2: BOOLEAN
         -- Is `Current' a power of 2?
      do
         Result := (Current - 1) & Current = 0
      end

feature {ANY} -- Looping:
   times (repeat: PROCEDURE[TUPLE[like Current]])
         -- Repeats the procedure from 1 to Current. As for any Liberty Eiffel agent the open argument may be
         -- safely ignored. You may also build your agent with closed arguments.
         --
         -- See also `loop_to', `loop_from'
      require
         meaningful: Current >= zero
      local
         i: like Current
      do
         -- Note:
         -- should really be loop_from(1, repeat) but for the type of 1 (INTEGER_8) not being the type of Current
         from
            i := 1
         until
            i > Current
         loop
            repeat.call([i])
            i := i + 1
         end
      end

   loop_to (bound: like Current; repeat: PROCEDURE[TUPLE[like Current]])
         -- Repeats the procedure from Current to `bound'. As for any Liberty Eiffel agent the open argument may
         -- be safely ignored. You may also build your agent with closed arguments.
         --
         -- See also `times', `loop_from'
         --
         -- See also the simpler `loop_up_to', `loop_down_to'
      local
         i: like Current
      do
         if bound > Current then
            loop_up_to(bound, repeat)
         elseif bound < Current then
            loop_down_to(bound, repeat)
         else
            repeat.call([Current])
         end
      end

   loop_from (bound: like Current; repeat: PROCEDURE[TUPLE[like Current]])
         -- Repeats the procedure from `bound' to Current. As for any Liberty Eiffel agent the open argument may
         -- be safely ignored. You may also build your agent with closed arguments.
         --
         -- See also `times', `loop_to'
      require
         useful: bound /= Current
      do
         bound.loop_to(Current, repeat)
      end

   loop_up_to (bound: like Current; repeat: PROCEDURE[TUPLE[like Current]])
         -- Repeats the procedure from Current to a greater `bound'. As for any Liberty Eiffel agent the open
         -- argument may be safely ignored. You may also build your agent with closed arguments.
         --
         -- See also `loop_to', `loop_down_to'
      local
         i: like Current
      do
         from
            i := Current
         until
            i > bound
         loop
            repeat.call([i])
            i := i + 1
         end
      end

   loop_down_to (bound: like Current; repeat: PROCEDURE[TUPLE[like Current]])
         -- Repeats the procedure from Current to a lower `bound'. As for any Liberty Eiffel agent the open
         -- argument may be safely ignored. You may also build your agent with closed arguments.
         --
         -- See also `loop_to', `loop_down_to'
      local
         i: like Current
      do
         from
            i := Current
         until
            i < bound
         loop
            repeat.call([i])
            i := i - 1
         end
      end

feature {ANY} -- Modular arithmetic (these wrap around on overflow)
   infix "#+" (other: like Current): like Current
      external "built_in"
      end

   prefix "#-": like Current
      external "built_in"
      end

   infix "#-" (other: like Current): like Current
      external "built_in"
      end

   infix "#*" (other: like Current): like Current
      external "built_in"
      end

   infix "#//" (other: like Current): like Current
      external "built_in"
      end

   infix "#\\" (other: like Current): like Current
      external "built_in"
      end

feature {ANY} -- Size query
   bit_count: INTEGER_8
	   -- The number of bits used to store the value of Current
      deferred
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

end -- class INTEGER_GENERAL
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
