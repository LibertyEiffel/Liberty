-- The Great Computer Language Shootout
-- http://shootout.alioth.debian.org/
--
-- Original C contributed by Sebastien Loisel
-- Conversion to eiffel by jos from C++ version of Jon Harrop
-- Compile: compile -boost -o spectralnorm spectralnorm
class SPECTRALNORM

inherit
	ARGUMENTS

creation {ANY}
	make

feature {ANY}
	make is
		local
			i, n: INTEGER; u, v: FIXED_ARRAY[DOUBLE]; vv, vbv: DOUBLE
		do
			check
				argument_count = 1
			end
			check
				argument(1).is_integer
			end
			n := argument(1).to_integer
			check
				n > 0
			end
			create u.make(n)
			create v.make(n)
			u.set_all_with(1.0)
			from
			until
				i = 10
			loop
				eval_ata_times_u(u, v)
				u.set_all_with(0.0)
				eval_ata_times_u(v, u)
				i := i + 1
			end
			from
				i := 0
			until
				i = n
			loop
				vbv := vbv + u.item(i) * v.item(i)
				vv := vv + v.item(i) * v.item(i)
				i := i + 1
			end
			io.put_double_format((vbv / vv).sqrt, 9)
			io.put_new_line
		end

	eval_ata_times_u (u, atau: FIXED_ARRAY[DOUBLE]) is
		local
			tmp: FIXED_ARRAY[DOUBLE]
		do
			create tmp.make(u.count)
			eval_a_times_u(u, tmp)
			eval_at_times_u(tmp, atau)
		end

	eval_a_times_u (u, au: FIXED_ARRAY[DOUBLE]) is
		local
			i, j, n: INTEGER; x: DOUBLE
		do
			from
				n := u.count
			until
				i = n
			loop
				x := au.item(i)
				from
					j := 0
				until
					j = n
				loop
					x := x + eval_a(i, j) * u.item(j)
					j := j + 1
				end
				au.put(x, i)
				i := i + 1
			end
		end

	eval_at_times_u (u, au: FIXED_ARRAY[DOUBLE]) is
		local
			i, j, n: INTEGER; x: DOUBLE
		do
			from
				n := u.count
			until
				i = n
			loop
				x := au.item(i)
				from
					j := 0
				until
					j = n
				loop
					x := x + eval_a(j, i) * u.item(j)
					j := j + 1
				end
				au.put(x, i)
				i := i + 1
			end
		end

	eval_a (i, j: INTEGER): DOUBLE is
		do
			Result := (1.0).to_double / (((i + j) * (i + j + 1)) // 2 + i + 1).to_double
		end

end -- class SPECTRALNORM
