-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class NUMBER
   --
   -- This abstract definition of a NUMBER is intended to be the unique
   -- view of the client (do not use sub-classes names at all in the
   -- client code). In order to create NUMBERs without using concrete
   -- class name, the client code can inherit NUMBER_TOOLS. (See directory
   -- tutorial/number for examples.)
   --

inherit
   HASHABLE
      redefine fill_tagged_out_memory, out_in_tagged_out_memory
      end
   COMPARABLE
      undefine is_equal
      redefine infix ">", infix "<=", infix ">=", in_range, compare, three_way_comparison, min, max, fill_tagged_out_memory,
         out_in_tagged_out_memory
      end
   NUMERIC
      redefine fill_tagged_out_memory, out_in_tagged_out_memory
      end

insert
   PLATFORM
      undefine is_equal
      redefine fill_tagged_out_memory, out_in_tagged_out_memory
      end

feature {ANY} -- Binary operators for two NUMBERs:
   infix "+" (other: NUMBER): NUMBER
         -- Sum of `Current' and `other'.
      require
         other /= Void
      deferred
      ensure
         (Result - other).is_equal(Current)
      end

   infix "-" (other: NUMBER): NUMBER
         -- Difference of `Current' and `other'.
      require
         other /= Void
      do
         Result := Current + -other
      ensure
         (Result + other).is_equal(Current)
      end

   infix "*" (other: NUMBER): NUMBER
         -- Product of `Current' and `other'.
      require
         other /= Void
      deferred
      ensure
         Result /= Void
      end

   infix "/" (other: NUMBER): NUMBER
         -- Quotient of `Current' and `other'.
      do
         Result := Current * other.inverse
      ensure
         Result /= Void
      end

   infix "//" (other: NUMBER): NUMBER
         -- Divide `Current' by `other' (Integer division).
      require
         is_integer_general_number
         other.is_integer_general_number
         divisible(other)
      deferred
      ensure
         Result.is_integer_general_number
         Current.is_equal(Result * other + Current \\ other)
      end

   infix "\\" (other: NUMBER): NUMBER
         -- Remainder of division of `Current' by `other'.
      require
         is_integer_general_number
         other.is_integer_general_number
         divisible(other)
      deferred
      ensure
         Result.is_integer_general_number
         not Result.is_negative and Result < other.abs
      end

   infix "^" (exp: NUMBER): NUMBER
         -- `Current' raised to `exp'-th power.
      require
         exp.is_integer_general_number
         is_zero implies exp @> 0
      local
         e: NUMBER; factor: NUMBER
      do
         Result := one
         factor := Current
         from
            e := exp.abs
         until
            e.is_zero
         loop
            if e.is_odd then
               Result := Result * factor
            end
            e := e @// 2
            factor := factor * factor
         end
         if exp @< 0 then
            Result := Result.inverse
         end
      ensure
         Result /= Void
         exp.is_zero implies Result.is_one
      end

   infix "<" (other: NUMBER): BOOLEAN
         -- Is `Current' strictly less than `other'?
      deferred
      end

   infix "<=" (other: NUMBER): BOOLEAN
         -- Is `Current' less or equal than `other'?
      do
         Result := not (other < Current)
      end

   infix ">" (other: NUMBER): BOOLEAN
         -- Is `Current' strictly greater than `other'?
      do
         Result := other < Current
      end

   infix ">=" (other: NUMBER): BOOLEAN
         -- Is `Current' greater or equal than `other'?
      do
         Result := not (Current < other)
      end

   gcd (other: NUMBER): INTEGER_GENERAL_NUMBER
         -- Great Common Divisor of `Current' and `other'.
      require
         other.is_integer_general_number
         is_integer_general_number
      deferred
      ensure
         not Result.is_negative
         Result.is_zero implies Current.is_zero and other.is_zero
         not Result.is_zero implies (Current / Result).gcd(other / Result).is_one
      end

feature {ANY} -- Unary operators for two NUMBERs:
   frozen prefix "+": NUMBER
         -- Unary plus of `Current'.
      do
         Result := Current
      ensure
         Result = Current
      end

   prefix "-": NUMBER
         -- Opposite of `Current'.
      deferred
      ensure
         Result /= Void
      end

feature {ANY} -- To know more about a NUMBER:
   frozen is_integer_8: BOOLEAN
         -- Does `Current' value fit on an INTEGER_8?
      local
         integer_64_number: INTEGER_64_NUMBER
      do
         if integer_64_number ?:= Current then
            integer_64_number ::= Current
            Result := integer_64_number.value.fit_integer_8
         end
      ensure
         Result implies is_integer_general_number
      end

   frozen is_integer_16: BOOLEAN
         -- Does `Current' value fit on an INTEGER_16?
      local
         integer_64_number: INTEGER_64_NUMBER
      do
         if integer_64_number ?:= Current then
            integer_64_number ::= Current
            Result := integer_64_number.value.fit_integer_16
         end
      ensure
         Result implies is_integer_general_number
      end

   frozen is_integer_32: BOOLEAN
         -- Does `Current' value fit on an INTEGER?
      local
         integer_64_number: INTEGER_64_NUMBER
      do
         if integer_64_number ?:= Current then
            integer_64_number ::= Current
            Result := integer_64_number.value.fit_integer_32
         end
      ensure
         Result implies is_integer_general_number
      end

   frozen is_integer_64: BOOLEAN
         -- Does `Current' value fit on an INTEGER_64?
      local
         integer_64_number: INTEGER_64_NUMBER
      do
         Result := integer_64_number ?:= Current
      ensure
         Result implies is_integer_general_number
      end

   frozen is_natural_64: BOOLEAN
         -- Does `Current' value fit on a NATURAL_64?
      local
         big_integer_number: BIG_INTEGER_NUMBER
      do
         if is_negative then
            check
               not Result
            end
         elseif is_integer_64 then
            Result := True
         else
            big_integer_number ::= Current
            Result := big_integer_number.is_natural_64_
         end
      ensure
         Result implies is_integer_general_number
      end

   in_range (lower, upper: NUMBER): BOOLEAN
         -- Return True if `Current' is in range [`lower'..`upper']
      do
         Result := Current >= lower and then Current <= upper
      end

   compare, three_way_comparison (other: NUMBER): INTEGER
         -- Compare `Current' with `other'.
         -- `<'  <==> `Result < 0'
         -- `>'  <==> `Result > 0'
         -- Otherwise `Result = 0'.
      do
         if Current < other then
            Result := -1
         elseif other < Current then
            Result := 1
         end
      end

   min (other: NUMBER): NUMBER
         -- Minimum of `Current' and `other'.
      do
         if Current < other then
            Result := Current
         else
            Result := other
         end
      end

   max (other: NUMBER): NUMBER
         -- Maximum of `Current' and `other'.
      do
         if other < Current then
            Result := Current
         else
            Result := other
         end
      end

   is_zero: BOOLEAN
         -- Is it 0 ?
      deferred
      ensure
         Result = Current @= 0
      end

   is_one: BOOLEAN
         -- Is it 1 ?
      deferred
      ensure
         Result = Current @= 1
      end

   is_positive: BOOLEAN
         -- Is `Current' > 0 ?
      deferred
      ensure
         Result = Current @> 0
      end

   is_negative: BOOLEAN
         -- Is `Current' < 0 ?
      deferred
      ensure
         Result = Current @< 0
      end

   is_odd: BOOLEAN
         -- Is `odd' ?
      require
         is_integer_general_number
      do
         Result := (Current @\\ 2).is_one
      end

   is_even: BOOLEAN
         -- Is `even' ?
      require
         is_integer_general_number
      do
         Result := (Current @\\ 2).is_zero
      end

   is_equal (other: NUMBER): BOOLEAN
      deferred
      end

   frozen is_integer_general_number: BOOLEAN
      local
         integer_general_number: INTEGER_GENERAL_NUMBER
      do
         Result := integer_general_number ?:= Current
      end

   frozen is_fraction_general_number: BOOLEAN
      local
         fraction_general_number: FRACTION_GENERAL_NUMBER
      do
         Result := fraction_general_number ?:= Current
      end

   frozen fit_real: BOOLEAN
      do
         if Current #>= Minimum_real then
            Result := Current #<= Maximum_real
         end
      end

feature {ANY} -- Conversions and printing:
   frozen to_integer_8: INTEGER_8
         -- Conversion of `Current' in an INTEGER_8.
      require
         is_integer_8
      local
         integer_64_number: INTEGER_64_NUMBER
      do
         integer_64_number ::= Current
         Result := integer_64_number.value.to_integer_8
      end

   frozen to_integer_16: INTEGER_16
         -- Conversion of `Current' in an INTEGER_16.
      require
         is_integer_16
      local
         integer_64_number: INTEGER_64_NUMBER
      do
         integer_64_number ::= Current
         Result := integer_64_number.value.to_integer_16
      end

   frozen to_integer_32: INTEGER
         -- Conversion of `Current' in an INTEGER_32.
      require
         is_integer_32
      local
         integer_64_number: INTEGER_64_NUMBER
      do
         integer_64_number ::= Current
         Result := integer_64_number.value.to_integer_32
      end

   frozen to_integer_64: INTEGER_64
         -- Conversion of `Current' in an INTEGER.
      require
         is_integer_64
      local
         integer_64_number: INTEGER_64_NUMBER
      do
         integer_64_number ::= Current
         Result := integer_64_number.value
      end

   frozen to_natural_64: NATURAL_64
         -- Conversion of `Current' in a NATURAL_64.
      require
         is_natural_64
      local
         integer_64_number: INTEGER_64_NUMBER; big_integer_number: BIG_INTEGER_NUMBER
      do
         if {INTEGER_64_NUMBER} ?:= Current then
            integer_64_number ::= Current
            Result := integer_64_number.value.to_natural_64
         else
            big_integer_number ::= Current
            Result := big_integer_number.to_natural_64_
         end
      end

   force_to_real_64: REAL_64
         -- Conversion of `Current' in a REAL_64.
      require
         fit_real
      deferred
      end

   frozen to_string: STRING
         -- Convert the NUMBER into a new allocated STRING.
         -- Note: see also `append_in' to save memory.
      do
         string_buffer.clear_count
         append_in(string_buffer)
         Result := string_buffer.twin
      end

   frozen to_unicode_string: UNICODE_STRING
         -- Convert the NUMBER into a new allocated UNICODE_STRING.
         -- Note: see also `append_in_unicode' to save memory.
      do
         unicode_string_buffer.clear_count
         append_in_unicode(unicode_string_buffer)
         Result := unicode_string_buffer.twin
      end

   append_in (buffer: STRING)
         -- Append the equivalent of `to_string' at the end of `buffer'.
         -- Thus you can save memory because no other STRING is allocated
         -- for the job.
      require
         buffer /= Void
      deferred
      end

   append_in_unicode (buffer: UNICODE_STRING)
         -- Append the equivalent of `to_unicode_string' at the end of `buffer'.
         -- Thus you can save memory because no other UNICODE_STRING is allocated
         -- for the job.
      require
         buffer /= Void
      deferred
      end

   frozen to_string_format (s: INTEGER): STRING
         -- Same as `to_string' but the result is on `s' character and the
         -- number is right aligned.
         -- Note: see `append_in_format' to save memory.
      require
         to_string.count <= s
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
      ensure
         Result.count = s
      end

   frozen to_unicode_string_format (s: INTEGER): UNICODE_STRING
         -- Same as `to_unicode_string' but the result is on `s' character and
         -- the number is right aligned.
         -- Note: see `append_in_unicode_format' to save memory.
      require
         to_string.count <= s
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
      ensure
         Result.count = s
      end

   frozen append_in_format (str: STRING; s: INTEGER)
         -- Append the equivalent of `to_string_format' at the end of
         -- `str'. Thus you can save memory because no other
         -- STRING is allocated for the job.
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
            str.extend(' ')
            i := i - 1
         end
         str.append(string_buffer)
      ensure
         str.count >= old str.count + s
      end

   frozen append_in_unicode_format (str: UNICODE_STRING; s: INTEGER)
         -- Append the equivalent of `to_unicode_string_format' at the end of
         -- `str'. Thus you can save memory because no other
         -- UNICODE_STRING is allocated for the job.
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
            str.extend(' '.code)
            i := i - 1
         end
         str.append(unicode_string_buffer)
      ensure
         str.count >= old str.count + s
      end

   frozen to_decimal (digits: INTEGER; all_digits: BOOLEAN): STRING
         -- Convert `Current' into its decimal view. A maximum of decimal
         -- `digits' places will be used for the decimal part. If the
         -- `all_digits' flag is True insignificant digits will be included
         -- as well. (See also `decimal_in' to save memory.)
      require
         non_negative_digits: digits >= 0
      do
         Result := once "This is a local STRING buffer ...."
         Result.clear_count
         append_decimal_in(Result, digits, all_digits)
         Result := Result.twin
      ensure
         not Result.is_empty
      end

   append_decimal_in (buffer: STRING; digits: INTEGER; all_digits: BOOLEAN)
         -- Append the equivalent of `to_decimal' at the end of `buffer'. Thus
         -- you can save memory because no other STRING is allocated.
      require
         non_negative_digits: digits >= 0
      deferred
      end

   frozen decimal_digit, digit: CHARACTER
         -- Gives the corresponding CHARACTER for range 0..9.
      require
         to_integer_32.in_range(0, 9)
      do
         Result := to_integer_32.decimal_digit
      ensure
         (once "0123456789").has(Result)
         Current @= Result.value
      end

feature {ANY} -- To mimic NUMERIC:
   divisible (other: NUMBER): BOOLEAN
         -- Is `other' a valid divisor for `Current' ?
      do
         Result := not other.is_zero
      end

   one: NUMBER
         -- The neutral element of multiplication.
      once
         create {INTEGER_64_NUMBER} Result.make(1)
      ensure
         neutral_element:
            -- Result is the neutral element of
            -- multiplication.
      end

   zero: NUMBER
         -- The neutral element of addition.
      once
         create {INTEGER_64_NUMBER} Result.make(0)
      ensure
         neutral_element:
            -- Result is the neutral element of
            -- addition.
      end

   frozen sign: INTEGER_8
         -- Sign of `Current' (0 or -1 or 1).
      do
         if is_positive then
            Result := 1
         elseif is_negative then
            Result := -1
         end
      ensure then
         Result = 1 implies is_positive
         Result = 0 implies is_zero
         Result = -1 implies is_negative
      end

   sqrt: REAL_64
         -- Compute the square routine.
      require
         fit_real
      do
         Result := force_to_real_64.sqrt
      end

   frozen log: REAL_64
      require
         fit_real
      do
         Result := force_to_real_64.log
      end

   abs: NUMBER
      do
         if is_negative then
            Result := -Current
         else
            Result := Current
         end
      ensure
         not Result.is_negative
      end

feature {ANY} -- To mix NUMBER and INTEGER_64:
   infix "@+" (other: INTEGER_64): NUMBER
         -- Sum of `Current' and `other'.
      deferred
      ensure
         Result /= Void
      end

   infix "@-" (other: INTEGER_64): NUMBER
         -- Difference of `Current' and `other'.
      do
         if other = Minimum_integer_64 then
            Result := Current @+ 1
            Result := Result @+ Maximum_integer_64
         else
            Result := Current @+ -other
         end
      ensure
         Result /= Void
      end

   infix "@*" (other: INTEGER_64): NUMBER
      deferred
      ensure
         Result /= Void
      end

   infix "@/" (other: INTEGER_64): NUMBER
         -- Quotient of `Current' and `other'.
      require
         other /= 0
      deferred
      ensure
         Result /= Void
      end

   infix "@//" (other: INTEGER_64): NUMBER
         -- Divide `Current' by `other' (Integer division).
      require
         is_integer_general_number
         other /= 0
      deferred
      ensure
         Result.is_integer_general_number
      end

   infix "@\\" (other: INTEGER_64): NUMBER
         -- Remainder of division of `Current' by `other'.
      require
         is_integer_general_number
         other /= 0
      deferred
      ensure
         Result.is_integer_general_number
      end

   infix "@^" (exp: INTEGER_64): NUMBER
      require
         is_zero implies exp > 0
      local
         int: INTEGER_64; other: NUMBER
      do
         int := exp.abs
         inspect
            int
         when 0 then
            create {INTEGER_64_NUMBER} Result.make(1)
         when 1 then
            Result := Current
         else
            from
               int := int - 1
               other := Current
               Result := Current
            until
               int < 2
            loop
               if int.is_odd then
                  Result := Result * other
               end
               other := other * other -- method sqrt : ^2
               int := int #// 2
            end
            Result := Result * other
         end
         if exp < 0 then
            Result := Result.inverse
         end
      ensure
         Result /= Void
         --|*** Bad assertion (Vincent Croizier, 01/06/04) ***
         --| Result /= Current implies (exp /= 1 or else not is_zero)
      end

   infix "@=" (other: INTEGER_64): BOOLEAN
         -- Is `Current' equal `other' ?
      deferred
      end

   infix "@<" (other: INTEGER_64): BOOLEAN
         -- Is `Current' strictly less than `other'?
      deferred
      ensure
         Result = not (Current @>= other)
      end

   infix "@<=" (other: INTEGER_64): BOOLEAN
         -- Is `Current' less or equal `other'?
      deferred
      ensure
         Result = not (Current @> other)
      end

   infix "@>" (other: INTEGER_64): BOOLEAN
         -- Is `Current' strictly greater than `other'?
      deferred
      ensure
         Result = not (Current @<= other)
      end

   infix "@>=" (other: INTEGER_64): BOOLEAN
         -- Is `Current' greater or equal than `other'?
      deferred
      ensure
         Result = not (Current @< other)
      end

feature {ANY} -- To mix NUMBER and REAL_64:
   infix "#=" (other: REAL_64): BOOLEAN
         -- Is `Current' equal `other'?
      deferred
      end

   infix "#<" (other: REAL_64): BOOLEAN
         -- Is `Current' strictly less than `other'?
      deferred
      ensure
         Result implies not (Current #>= other)
      end

   infix "#<=" (other: REAL_64): BOOLEAN
         -- Is `Current' less or equal `other'?
      deferred
      ensure
         Result = not (Current #> other)
      end

   infix "#>" (other: REAL_64): BOOLEAN
         -- Is `Current' strictly greater than `other'?
      deferred
      ensure
         Result = not (Current #<= other)
      end

   infix "#>=" (other: REAL_64): BOOLEAN
         -- Is `Current' greater or equal than `other'?
      deferred
      ensure
         Result = not (Current #< other)
      end

feature {ANY} -- Misc:
   out_in_tagged_out_memory, fill_tagged_out_memory
      do
         append_in(tagged_out_memory)
      end

   hash_code: INTEGER
      deferred
      end

   inverse: NUMBER
      require
         divisible(Current)
      deferred
      ensure
         Result /= Void
      end

   factorial: NUMBER
      require
         is_integer_general_number
         not is_negative
      deferred
      ensure
         Result.is_integer_general_number
         Result.is_positive
      end

   numerator: INTEGER_GENERAL_NUMBER
      deferred
      end

   denominator: INTEGER_GENERAL_NUMBER
      deferred
      end

feature {NUMBER} -- Implementation:
   frozen add_with_integer_64_number (other: INTEGER_64_NUMBER): NUMBER
      require
         other /= Void
      do
         Result := Current @+ other.to_integer_32
      ensure
         Result /= Void
      end

   add_with_big_integer_number (other: BIG_INTEGER_NUMBER): NUMBER
      require
         other /= Void
      deferred
      ensure
         Result /= Void
      end

   add_with_fraction_with_big_integer_number (other: FRACTION_WITH_BIG_INTEGER_NUMBER): NUMBER
      require
         other /= Void
      deferred
      ensure
         Result /= Void
      end

   multiply_with_integer_64_number (other: INTEGER_64_NUMBER): NUMBER
      require
         other /= Void
      do
         Result := Current @* other.to_integer_32
      ensure
         Result /= Void
      end

   multiply_with_big_integer_number (other: BIG_INTEGER_NUMBER): NUMBER
      require
         other /= Void
      deferred
      ensure
         Result /= Void
      end

   multiply_with_fraction_with_big_integer_number (other: FRACTION_WITH_BIG_INTEGER_NUMBER): NUMBER
      require
         other /= Void
      deferred
      ensure
         Result /= Void
      end

   greater_with_integer_64_number (other: INTEGER_64_NUMBER): BOOLEAN
      require
         other /= Void
      do
         Result := Current @> other.to_integer_32
      end

   greater_with_big_integer_number (other: BIG_INTEGER_NUMBER): BOOLEAN
      require
         other /= Void
      deferred
      end

   greater_with_fraction_with_big_integer_number (other: FRACTION_WITH_BIG_INTEGER_NUMBER): BOOLEAN
      require
         other /= Void
      deferred
      end

   gcd_with_integer_64_number (other: INTEGER_64_NUMBER): INTEGER_GENERAL_NUMBER
      require
         other /= Void
      deferred
      end

   gcd_with_big_integer_number (other: BIG_INTEGER_NUMBER): INTEGER_GENERAL_NUMBER
      require
         other /= Void
      deferred
      end

feature {NUMBER, NUMBER_TOOLS}
   max_double: NUMBER
      local
         nt: NUMBER_TOOLS; tmp: STRING
      once
         tmp := "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
         tmp.clear_count
         Maximum_real_64.append_in_format(tmp, 0)
         Result := nt.from_string(tmp)
      end

   min_double: NUMBER
      local
         nt: NUMBER_TOOLS; tmp: STRING
      once
         tmp := "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
         tmp.clear_count
         Minimum_real_64.append_in_format(tmp, 0)
         Result := nt.from_string(tmp)
      end

feature {NUMBER} -- To implement efficient calculus
   mutable_register1: MUTABLE_BIG_INTEGER
      once
         create Result.from_integer_64(0)
      end

   mutable_register2: MUTABLE_BIG_INTEGER
      once
         create Result.from_integer_64(0)
      end

   mutable_register3: MUTABLE_BIG_INTEGER
      once
         create Result.from_integer_64(0)
      end

   mutable_register4: MUTABLE_BIG_INTEGER
      once
         create Result.from_integer_64(0)
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

feature {} -- To create fractions
   from_two_integer (n, d: INTEGER_64): NUMBER
      require
         d /= 0
      local
         n_number, d_number: INTEGER_64_NUMBER
      do
         create n_number.make(n)
         create d_number.make(d)
         Result := from_two_integer_general_number(n_number, d_number)
      ensure
         Result @* d @= n
      end

   from_two_integer_general_number (n, d: INTEGER_GENERAL_NUMBER): NUMBER
      require
         n /= Void
         d /= Void
         not d.is_zero
      do
         if (n \\ d).is_zero then
            Result := n // d
         else
            create {FRACTION_WITH_BIG_INTEGER_NUMBER} Result.make(n, d)
         end
      ensure
         n.is_equal(Result * d)
      end

   from_integer_and_integer_general_number (n: INTEGER_64; d: INTEGER_GENERAL_NUMBER): NUMBER
      require
         d /= Void
         not d.is_zero
      local
         n_number: INTEGER_64_NUMBER
      do
         create n_number.make(n)
         Result := from_two_integer_general_number(n_number, d)
      end

   from_integer_general_number_and_integer (n: INTEGER_GENERAL_NUMBER; d: INTEGER_64): NUMBER
      require
         n /= Void
         d /= 0
      local
         d_number: INTEGER_64_NUMBER
      do
         create d_number.make(d)
         Result := from_two_integer_general_number(n, d_number)
      end

invariant
   denominator.is_positive
   is_integer_general_number implies denominator.is_one
   not is_integer_general_number implies numerator.gcd(denominator) @= 1

end -- class NUMBER
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
