--
-- The Great Computer Language Shootout
-- http://shootout.alioth.debian.org/
--
-- Contributed by Arnaud Payement for Smart Eiffel
--
class NBODY

insert
	ARGUMENTS

creation {ANY}
	make

feature {ANY}
	make is
		local
			n: INTEGER; i: INTEGER; bodies: NBODY_SYSTEM
		do
			create bodies.make
			std_output.put_double_format(bodies.energy, 9)
			std_output.put_string("%N")
			n := argument(1).to_integer
			from
				i := 0
			until
				i = n
			loop
				bodies.advance(0.01)
				i := i + 1
			end
			std_output.put_double_format(bodies.energy, 9)
			std_output.put_string("%N")
		end

end -- class NBODY
