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
