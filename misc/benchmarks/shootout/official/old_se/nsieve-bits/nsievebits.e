-- The Great Computer Language Shootout
-- http://shootout.alioth.debian.org/
--
-- Written by Dima Dorfman, 2004
--
-- converted to SE 2.1 by jose
--
class NSIEVEBITS

insert
	ARGUMENTS

creation {ANY}
	make

feature {ANY}
	flags: FAST_ARRAY[INTEGER_32]

	Bit_length: INTEGER is 32

	make is
		local
			n, m: INTEGER
		do
			check
				argument_count = 1
			end
			check
				argument(1).is_integer
			end
			n := argument(1).to_integer
			check
				n.in_range(2, 17)
			end
			m := 10000 |<< n.to_integer_8
			create flags.make((m + Bit_length - 1) // Bit_length)
			std_output.put_string("Primes up to ")
			std_output.put_integer_format(m, 8)
			std_output.put_character(' ')
			std_output.put_integer_format(nsieves(flags, m), 8)
			std_output.put_new_line
			m := m |>> 1
			flags.resize((m + Bit_length - 1) // Bit_length)
			std_output.put_string("Primes up to ")
			std_output.put_integer_format(m, 8)
			std_output.put_character(' ')
			std_output.put_integer_format(nsieves(flags, m), 8)
			std_output.put_new_line
			m := m |>> 1
			flags.resize((m + Bit_length - 1) // Bit_length)
			std_output.put_string("Primes up to ")
			std_output.put_integer_format(m, 8)
			std_output.put_character(' ')
			std_output.put_integer_format(nsieves(flags, m), 8)
			std_output.put_new_line
		end

	nsieves (is_prime: like flags; upper: INTEGER): INTEGER is
		local
			i, j, k: INTEGER
		do
			is_prime.set_all_with((-1).to_integer)
			from
				i := 2
			until
				i >= upper
			loop
				if is_prime.item(i #// Bit_length) & ((1).to_integer |<< (i #\\ Bit_length).to_integer_8) /= 0 then
					from
						j := i + i
					until
						j >= upper
					loop
						k := j #// Bit_length
						is_prime.put(is_prime.item(k) & ~((1).to_integer |<< (j #\\ Bit_length).to_integer_8), k)
						j := j + i
					end
					Result := Result + 1
				end
				i := i + 1
			end
		end

end -- class NSIEVEBITS
