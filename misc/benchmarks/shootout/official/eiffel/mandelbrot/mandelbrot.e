--
-- http://shootout.alioth.debian.org/
--
-- Mandelbrot for SE by jose
--
class MANDELBROT

insert
	ARGUMENTS

create {ANY}
	make

feature {ANY}
	make is
		local
			size, i, iter, x, y: INTEGER; zr, zi, cr, ci, pr, pi, limit: REAL_64; stop, gone: BOOLEAN
			bit, bit_accu: INTEGER_8
		do
			check
				argument_count = 1
			end
			check
				argument(1).is_integer
			end
			size := argument(1).to_integer
			check
				size > 1
			end
			-- write header
			std_output.put_string("P4%N")
			std_output.put_string(argument(1))
			std_output.put_character(' ')
			std_output.put_string(argument(1))
			std_output.put_character('%N')
			-- compute mandelbrot's bitmap
			limit := 4.0
			iter := 50
			bit := 0x80
			from
				y := 0
			until
				y = size
			loop
				ci := 2.0 * y / size - 1.0
				from
					x := 0
				until
					x = size
				loop
					cr := 2.0 * x / size - 1.5
					zr := 0
					zi := 0
					pr := 0
					pi := 0
					from
						i := 0
						stop := False
					until
						stop
					loop
						zi := 2.0 * zr * zi + ci
						zr := pr - pi + cr
						pi := zi * zi
						pr := zr * zr
						if pi + pr > limit then
							stop := True
							gone := True
						else
							i := i + 1
							stop := i = iter
						end
					end
					if gone then
						gone := False
					else
						bit_accu := bit_accu | bit
					end
					if bit = 1 then
						std_output.put_character(bit_accu.to_character)
						bit_accu := 0
						bit := 0x80
					else
						bit := bit |>>> 1
					end
					x := x + 1
				end
				if bit /= 0x80 then
					std_output.put_character(bit_accu.to_character)
					bit_accu := 0
					bit := 0x80
				end
				y := y + 1
			end
		end

end -- class MANDELBROT
