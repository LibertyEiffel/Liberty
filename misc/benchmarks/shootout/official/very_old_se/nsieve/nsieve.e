--
-- The Great Computer Language Shootout
-- http://shootout.alioth.debian.org/
--
-- Written by Dima Dorfman, 2004
--
-- converted to SE2.1 by jose
--
class NSIEVE

inherit
	ARGUMENTS

create {ANY}
	make

feature {ANY}
	flags: FIXED_ARRAY[BOOLEAN]

	make is
		local
			n, m: INTEGER
		do
			create flags.make(0)
			check
				argument_count = 1
			end
			check
				argument(1).is_integer
			end
			n := argument(1).to_integer
			check
				n > 1
			end
			m := (1).to_integer |<< n.to_integer_8
			m := 10000 * m
			flags.resize(m)
			print("Primes up to " + m.to_string_format(8) + " " + nsieves(flags).to_string_format(8) + "%N")
			m := m // 2
			flags.resize(m)
			print("Primes up to " + m.to_string_format(8) + " " + nsieves(flags).to_string_format(8) + "%N")
			m := m // 2
			flags.resize(m)
			print("Primes up to " + m.to_string_format(8) + " " + nsieves(flags).to_string_format(8) + "%N")
		end

	nsieves (is_prime: like flags): INTEGER is
		local
			i, j: INTEGER
		do
			is_prime.set_all_with(True)
			from
				i := 2
			until
				i > is_prime.upper
			loop
				if is_prime.item(i) then
					from
						j := i + i
					until
						j > is_prime.upper
					loop
						is_prime.put(False, j)
						j := j + i
					end
					Result := Result + 1
				end
				i := i + 1
			end
		end

end -- class NSIEVE
