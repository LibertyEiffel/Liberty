-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class INTEGRAL
   --
   -- General integer abstraction for both integers and naturals.
   --

inherit
   COMPARABLE
      undefine infix "<=", infix ">", infix ">=", is_equal
      end

insert
   NUMERIC
   PLATFORM

feature {ANY}
   infix "+" (other: like Current): like Current
      require
         no_overflow: Current > zero = (other > zero) implies Current #+ other > zero = (Current > zero) -- this means: if operand are of same sign, it will be sign of the Result.
      deferred
      ensure
         Result #- other = Current
      end

   infix "-" (other: like Current): like Current
      require
         no_overflow: Current > zero /= (other > zero) implies Current #- other > zero = (Current > zero) -- this means: if operand are of different sign, sign of the Result will be the same sign as Current.
      deferred
      ensure
         Result #+ other = Current
      end

   infix "*" (other: like Current): like Current
      require
         no_overflow: (other /= zero) implies Current #* other #// other = Current
      deferred
      ensure
         Current /= zero and other /= zero implies Result /= zero
         Result /= zero implies Result #// other = Current
         Result /= zero implies Result #\\ other = zero
      end

   infix "/" (other: like Current): REAL
      deferred
      end

   infix "//" (other: like Current): like Current
         -- Quotient of the Euclidian division of `Current' by `other'.
         -- The corresponding remainder is given by infix "\\".
         --
         -- See also infix "#//".
      require
         other /= zero
         no_overflow: other = -one implies Current = zero or Current |<< 1 /= zero
      deferred
      ensure
         euclidian_divide_case1: Current >= zero implies Result * other + Current \\ other = Current
         euclidian_divide_case2: Current < zero implies Result #* other #+ (Current \\ other) = Current
      end

   infix "\\" (other: like Current): like Current
         -- Remainder of the Euclidian division of `Current' by `other'.
         -- By definition, `zero <= Result < other.abs'.
         --
         -- See also infix "#\\", infix "//".
      require
         other /= zero
      deferred
      ensure
         Result >= zero
         other |<< 1 /= zero implies Result < other.abs
         good_remainder: Result #- (Current #\\ other) #\\ other = zero
      end

   infix "^" (exp: like Current): INTEGER_64
         -- Integer power of `Current' by `other'
      require
         exp >= zero
      deferred
      end

   abs: like Current
         -- Absolute value of `Current'.
      require
         not_minimum_value: Current < zero implies zero < #-Current
      deferred
      ensure
         Result >= zero
      end

   infix "<" (other: like Current): BOOLEAN
      deferred
      end

   infix "<=" (other: like Current): BOOLEAN
      deferred
      end

   infix ">" (other: like Current): BOOLEAN
      deferred
      end

   infix ">=" (other: like Current): BOOLEAN
      deferred
      end

   prefix "+": like Current
      deferred
      end

   prefix "-": like Current
      require
         not_minimum_value: Current < zero implies zero < #-Current
      deferred
      end

   is_odd: BOOLEAN
         -- Is odd?
      deferred
      end

   is_even: BOOLEAN
         -- Is even?
      deferred
      end

   sqrt: REAL
         -- Square root of `Current'.
      require
         Current >= zero
      deferred
      end

   log: REAL
         -- Natural Logarithm of `Current'.
      require
         Current > zero
      deferred
      end

   log10: REAL
         -- Base-10 Logarithm of Current.
      require
         Current > zero
      deferred
      end

   gcd (other: like Current): like Current
         -- Greatest Common Divisor of `Current' and `other'.
      deferred
      ensure
         Result >= zero
         Result = zero implies Current = zero and other = zero
         Result >= (one+one) implies Current \\ Result = zero and other \\ Result = zero and (Current // Result).gcd(other // Result) = one
      end

   lcm (other: like Current): like Current
         -- Least Common Multiple of `Current' and `other'.
      do
         Result := abs // gcd(other) * other.abs
      ensure
         Result >= zero
         Result = zero implies Current = zero or other = zero
         Result * gcd(other) = (Current * other).abs
      end

feature {ANY} -- Conversions:
   to_string: STRING
         -- The decimal view of `Current' into a new allocated STRING.
         -- For example, if `Current' is -1 the `Result' is "-1".
         --
         -- See also `append_in', `to_string_format', `to_unicode_string', `to_hexadecimal', `to_octal'.
      deferred
      end

   to_unicode_string: UNICODE_STRING
         -- The decimal view of `Current' into a new allocated UNICODE_STRING.
         -- For example, if `Current' is -1 the `Result' is U"-1".
         --
         -- See also `append_in_unicode', `to_unicode_string_format', `to_string', `to_hexadecimal', `to_octal'.
      deferred
      end

   to_boolean: BOOLEAN
         -- Return False for 0, otherwise True.
         --
         -- See also `to_string', `to_character', `to_hexadecimal', `to_number'.
      deferred
      ensure
         Result = (Current /= zero)
      end

   to_number: NUMBER
         -- Convert `Current' into a new allocated NUMBER.
         --
         -- See also `to_boolean', `to_string', `to_character', `to_hexadecimal'.
      deferred
      ensure
         Result.to_string.is_equal(to_string)
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

   to_string_format (s: INTEGER): STRING
         -- Same as `to_string' but the result is on `s' character and the number is right aligned.
         --
         -- See also `append_in_format', `to_character', `to_number', `to_hexadecimal'.
      require
         to_string.count <= s
      deferred
      ensure
         Result.count = s
      end

   to_unicode_string_format (s: INTEGER): UNICODE_STRING
         -- Same as `to_unicode_string' but the result is on `s' character and the number is right aligned.
         --
         -- See also `append_in_unicode_format', `to_string', `to_hexadecimal', `to_octal'.
      require
         to_string.count <= s
      deferred
      ensure
         Result.count = s
      end

   append_in_format (buffer: STRING; s: INTEGER)
         -- Append in the `buffer' the equivalent of `to_string_format'.
         -- If you look for performances, you should always prefer `append_in_format' which allow you to recycle
         -- a unique common `buffer' (each call of `to_string_format' allocate a new object!).
         --
         -- See also `append_in', `append_in_unicode', `append_in_unicode_format', `to_hexadecimal_in'.
      require
         to_string.count <= s
      deferred
      ensure
         buffer.count >= old buffer.count + s
      end

   append_in_unicode_format (buffer: UNICODE_STRING; s: INTEGER)
         -- Append in the `buffer' the equivalent of `to_unicode_string_format'.
         -- If you look for performances, you should always prefer `append_in_unicode_format' which allow you to recycle
         -- a unique common `buffer' (each call of `to_unicode_string_format' allocate a new object!).
         --
         -- See also `append_in_format', `append_in', `append_in_format', `to_hexadecimal_in'.
      require
         to_string.count <= s
      deferred
      ensure
         buffer.count >= old buffer.count + s
      end

   digit: CHARACTER
         -- Legacy synonym for `decimal_digit'.
         -- Note: already prefer `decimal_digit' because digit may become obsolete (feb 4th 2006).
      deferred
      ensure
         Result = decimal_digit
      end

   is_decimal_digit: BOOLEAN
      deferred
      end

   decimal_digit: CHARACTER
         -- Gives the corresponding CHARACTER for range 0..9.
      require
         is_decimal_digit
      deferred
      ensure
         (once "0123456789").has(Result)
         --Current.is_equal(Result.value)
      end

   is_hexadecimal_digit: BOOLEAN
      deferred
      end

   hexadecimal_digit: CHARACTER
         -- Gives the corresponding CHARACTER for range 0..15.
      require
         is_hexadecimal_digit
      deferred
      ensure
         (once "0123456789ABCDEF").has(Result)
      end

   to_character: CHARACTER
         -- Return the corresponding ASCII character.
         --
         -- See also `to_boolean', `to_number', `to_string', `to_hexadecimal'.
      require
         Current >= zero
         --Current <= Maximum_character_code
      deferred
      end

   to_octal_in (buffer: STRING)
         -- Append in the `buffer' the equivalent of `to_octal'.
         -- If you look for performances, you should always prefer `to_octal_in' which allow you to recycle
         -- a unique common `buffer' (each call of `to_octal' allocate a new object!).
         --
         -- See also `to_hexadecimal_in', `append_in', `append_in_format', `append_in_unicode'.
      deferred
      ensure
         buffer.count = old buffer.count + bit_count #// 3 + 1
      end

   to_octal: STRING
         -- The octal view of `Current' into a new allocated STRING.
         -- For example, if `Current' is -1 and if `Current' is a 16 bits integer the `Result' is "177777".
         --
         -- See also `to_octal_in', `to_hexadecimal', `to_number', `to_string'.
      deferred
      ensure
         Result.count = bit_count #// 3 + 1
      end

   to_hexadecimal: STRING
         -- The hexadecimal view of `Current' into a new allocated STRING.
         -- For example, if `Current' is -1 and if `Current' is a 32 bits integer the `Result' is "FFFFFFFF".
         --
         -- See also `to_hexadecimal_in', `to_octal', `to_number', `to_string'.
      deferred
      ensure
         Result.count = object_size * 2
      end

   to_hexadecimal_in (buffer: STRING)
         -- Append in the `buffer' the equivalent of `to_hexadecimal'.
         -- If you look for performances, you should always prefer `to_hexadecimal_in' which allow you to recycle
         -- a unique common `buffer' (each call of `to_hexadecimal' allocate a new object!).
         --
         -- See also `to_octal_in', `append_in', `append_in_format', `append_in_unicode'.
      deferred
      ensure
         buffer.count = old buffer.count + object_size * 2
      end

feature {ANY} -- Bitwise Logical Operators:
   bit_test (idx: INTEGER_8): BOOLEAN
         -- The value of the `idx'-ith bit (the right-most bit is at index 0).
      require
         idx.in_range(0, bit_count - 1)
      deferred
      end

   bit_set (idx: INTEGER_8): like Current
         -- The value of the `idx'-ith bit (the right-most bit is at index 0).
      require
         idx.in_range(0, bit_count - 1)
      deferred
      ensure
         Result.bit_test(idx)
         Result = Current or Result.bit_reset(idx) = Current
      end

   bit_reset (idx: INTEGER_8): like Current
         -- The value of the `idx'-ith bit (the right-most bit is at index 0).
      require
         idx.in_range(0, bit_count - 1)
      deferred
      ensure
         not Result.bit_test(idx)
         Result = Current or Result.bit_set(idx) = Current
      end

   infix "|>>", bit_shift_right (s: INTEGER_8): like Current
         -- Shift by `s' positions right (sign bit copied) bits falling off the end are lost.
      require
         s.in_range(0, bit_count - 1)
      deferred
      end

   infix "|>>>", bit_shift_right_unsigned (s: INTEGER_8): like Current
         -- Shift by `s' positions right (sign bit not copied) bits falling off the end are lost.
      require
         s.in_range(0, bit_count - 1)
      deferred
      end

   infix "|<<", bit_shift_left (s: INTEGER_8): like Current
         -- Shift by `s' positions left bits falling off the end are lost.
      require
         s.in_range(0, bit_count - 1)
      deferred
      end

   infix "#>>", bit_rotate_right (s: INTEGER_8): like Current
         -- Rotate by `s' positions right.
         --
         -- See also `bit_rotate_left' and `bit_rotate'.
      require
         s.in_range(1, bit_count - 1)
      deferred
      end

   infix "#<<", bit_rotate_left (s: INTEGER_8): like Current
         -- Rotate by `s' positions left.
         --
         -- See also `bit_rotate_right' and `bit_rotate'.
      require
         s.in_range(1, bit_count - 1)
      deferred
      end

   bit_rotate (s: INTEGER_8): like Current
         -- Rotate by `s' positions (positive `s' shifts right, negative left
         --
         -- See also `bit_rotate_right' and `bit_rotate_left'.
      require
         s.in_range(- (bit_count - 1), bit_count - 1)
      deferred
      end

   prefix "~", bit_not: like Current
         -- One's complement of `Current'.
      deferred
      end

   infix "&", bit_and (other: like Current): like Current
         -- Bitwise logical and of `Current' with `other'.
      deferred
      end

   infix "|", bit_or (other: like Current): like Current
         -- Bitwise logical inclusive or of `Current' with `other'.
      deferred
      end

   bit_xor (other: like Current): like Current
         -- Bitwise logical exclusive or of `Current' with `other'.
      deferred
      end

   bit_shift (s: INTEGER_8): like Current
         -- Shift by `s' positions (positive `s' shifts right (sign bit
         -- copied), negative shifts left bits falling off the end are lost).
         --
         -- See also infix "|>>" and infix "|<<".
      require
         s /= 0
      deferred
      end

   bit_shift_unsigned (s: INTEGER_8): like Current
         -- Shift by `s' positions (positive `s' shifts right (sign bit not
         -- copied), negative left bits falling off the end are lost).
         --
         -- See also infix "|>>>" and infix "|<<".
      require
         s /= 0
      deferred
      end

feature {ANY} -- Miscellaneous:
   sign: INTEGER_8
         -- Sign of `Current' (0 or -1 or 1).
      deferred
      end

   divisible (other: like Current): BOOLEAN
      require
         not_by_zero: other /= zero
      deferred
      ensure
         definition: Result = ((Current \\ other) = zero)
      end

   is_a_power_of_2: BOOLEAN
         -- Is `Current' a power of 2?
      require
         Current > zero
      deferred
      ensure
         Current > 1 implies Current.is_even
      end

feature {ANY} -- Modular arithmetic (these wrap around on overflow)
   infix "#+" (other: like Current): like Current
      deferred
      end

   prefix "#-": like Current
      deferred
      end

   infix "#-" (other: like Current): like Current
      deferred
      end

   infix "#*" (other: like Current): like Current
      deferred
      end

   infix "#//" (other: like Current): like Current
         -- Integer division of `Current' by `other'.
         --
         -- According to the ANSI C99: if `Current' and `other' are both non-negative, the `Result' is the
         -- quotient of the Euclidian division; but this is not the general case, the `Result' value is the
         -- algebraic quotient `Current/other' with any fractional part discarded. (This is often called
         -- "truncated toward zero"). So, the corresponding remainder value only verifies the expression
         -- `remainder.abs < other.abs'.
         --
         -- See also infix "//", infix "#\\".
      require
         other /= zero
      deferred
      ensure
         Result * other + Current #\\ other = Current
         ansi_c_remainder: (other |<< 1 /= zero) implies (Current - Result * other).abs < other.abs
         ansi_c_good_case: Current >= zero and other > zero implies Current - Result * other >= zero
      end

   infix "#\\" (other: like Current): like Current
         -- Remainder of the integer division of `Current' by `other'.
         -- According to the ANSI C99:
         --   * if `Current' and `other' are both non-negative,
         --     the `Result' is the remainder of the Euclidian division.
         --   * but this is not the general case,
         --     `Result' as the same sign as `Current' and only verify
         --     the expression `Result.abs < other.abs'.
         --
         -- See also infix "\\", infix "#//".
      require
         other /= zero
      deferred
      ensure
         (Current - Result) #\\ other = zero
         ansi_c_remainder: (other |<< 1 /= zero) implies Result.abs < other.abs
         ansi_c_good_case: (Current >= zero and other > zero) implies Result >= zero
      end

feature {}
   bit_count: INTEGER_8
         -- Well, it is 8 for INTEGER_8, 16 for INTEGER_16 and so on.
         -- Note that this feature is not exported because this information is part of the type.
         -- This is actually used only for assertion here, in INTEGER_GENERAL.
      deferred
      ensure
         Result = (object_size * 8)
      end

end -- class INTEGRAL
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
