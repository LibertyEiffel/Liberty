class PIDIGITS
	--
	-- Written by Cyril Adrian <cyril.adrian@laposte.net>
	--

insert
	ARGUMENTS

creation {ANY}
	make

feature {}
	step: INTEGER is 10

	make is
		local
			digits: PI_DIGIT_SPIGOT; n, i, j: INTEGER
		do
			if argument_count = 1 then
				from
					n := argument(1).to_integer
					create digits.make
				until
					n <= 0
				loop
					if n >= step then
						from
							i := 0
						until
							i = step
						loop
							digits.next
							std_output.put_integer(digits.item)
							i := i + 1
						end
						j := j + step
					else
						from
							from
								i := 0
							until
								i = n
							loop
								digits.next
								std_output.put_integer(digits.item)
								i := i + 1
							end
						until
							i = step
						loop
							std_output.put_character(' ')
							i := i + 1
						end
						j := j + n
					end
					std_output.put_character('%T')
					std_output.put_character(':')
					std_output.put_integer(j)
					std_output.put_new_line
					n := n - step
				end
			end
		end

end -- class PIDIGITS
