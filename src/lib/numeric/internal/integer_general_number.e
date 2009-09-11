-- See the Copyright notice at the end of this file.
--
deferred class INTEGER_GENERAL_NUMBER
	--
	-- To implement NUMBER (do not use this class, see NUMBER).
	--

inherit
	NUMBER
		redefine abs
		end

feature {ANY}
	abs: INTEGER_GENERAL_NUMBER is
		do
			if is_negative then
				Result ::= -Current
			else
				Result := Current
			end
		end

	factorial: NUMBER is
		do
			if is_zero or else is_one then
				Result := one
			else
				from
					put_into_mutable_big_integer(mutable_register1)
					mutable_register2.copy(mutable_register1)
					mutable_register3.from_integer(2)
				until
					mutable_register3.is_equal(mutable_register2)
				loop
					mutable_register1.multiply(mutable_register3)
					mutable_register3.add_integer(1)
				end
				Result := mutable_register1.to_integer_general_number
			end
		end

	numerator: INTEGER_GENERAL_NUMBER is
		do
			Result := Current
		end

	denominator: INTEGER_GENERAL_NUMBER is
		do
			Result := integer_general_number_one
		end

feature {ANY}
	append_decimal_in (buffer: STRING; digits: INTEGER; all_digits: BOOLEAN) is
		local
			n: INTEGER
		do
			append_in(buffer)
			if all_digits then
				from
					buffer.extend('.')
				until
					n >= digits
				loop
					buffer.extend('0')
					n := n + 1
				end
			end
		end

feature {NUMBER} -- Implementation:
	integer_divide_integer_64_number (other: INTEGER_64_NUMBER): INTEGER_GENERAL_NUMBER is
		require
			other /= Void
		deferred
		ensure
			Result /= Void
		end

	remainder_of_divide_integer_64_number (other: INTEGER_64_NUMBER): INTEGER_GENERAL_NUMBER is
		require
			other /= Void
		deferred
		ensure
			Result /= Void
		end

	integer_divide_big_integer_number (other: BIG_INTEGER_NUMBER): INTEGER_GENERAL_NUMBER is
		require
			other /= Void
		deferred
		ensure
			Result /= Void
		end

	remainder_of_divide_big_integer_number (other: BIG_INTEGER_NUMBER): INTEGER_GENERAL_NUMBER is
		require
			other /= Void
		deferred
		ensure
			Result /= Void
		end

feature {NUMBER} -- Implementation:
	gcd_with_big_integer_number (other: BIG_INTEGER_NUMBER): INTEGER_GENERAL_NUMBER is
		do
			put_into_mutable_big_integer(mutable_register1)
			other.put_into_mutable_big_integer(mutable_register2)
			mutable_register1.gcd(mutable_register2)
			Result := mutable_register1.to_integer_general_number
		end

feature {NUMBER}
	put_into_mutable_big_integer (mut: MUTABLE_BIG_INTEGER) is
		require
			mut /= Void
		deferred
		ensure
			mut.to_integer_general_number.is_equal(Current)
		end

feature {INTEGER_GENERAL_NUMBER}
	integer_general_number_zero: INTEGER_GENERAL_NUMBER is
		once
			Result ::= zero
		ensure
			Result.is_zero
		end

	integer_general_number_one: INTEGER_GENERAL_NUMBER is
		once
			Result ::= one
		ensure
			Result.is_one
		end

	integer_general_number_one_negative: INTEGER_GENERAL_NUMBER is
		once
			Result ::= -integer_general_number_one
		ensure
			(-Result).is_one
		end

end -- class INTEGER_GENERAL_NUMBER
--
-- ------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- This file is part of the SmartEiffel standard library.
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
-- documentation files (the "Software"), to deal in the Software without restriction, including without
-- limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
-- the Software, and to permit persons to whom the Software is furnished to do so, subject to the following
-- conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
-- AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
-- OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------
