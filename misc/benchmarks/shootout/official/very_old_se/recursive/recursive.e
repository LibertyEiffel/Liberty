--   The Computer Language Shootout
--   http://shootout.alioth.debian.org
--   Contributed by A. Suter
--
--   Compilation:
--      se c -clean -boost -no_gc -O3 -fomit-frame-pointer
--      -funroll-loops recursive.e -o recursive
class RECURSIVE

inherit
	ARGUMENTS

create {ANY}
	make

feature {ANY}
	make is
		local
			n: INTEGER
		do
			if not (argument_count = 1 and then argument(1).is_integer) then
				die_with_code(1)
			end
			n := argument(1).to_integer
			if n <= 1 then
				die_with_code(1)
			end
			io.put_string("Ack(3," + n.to_string + "): " + ack(3, n).to_string + "%N")
			io.put_string("Fib(" + (27.0 + n).to_string_format(1) + "): " + fib_real(27.0 + n).to_string_format(1) + "%N")
			io.put_string("Tak(" + (3 * (n - 1)).to_string + "," + (2 * (n - 1)).to_string + "," + (n - 1).to_string + "):%
                                                                                                              % " + tak_integer(3 * (n - 1), 2 * (n - 1), n - 1).to_string + "%N")
			io.put_string("Fib(3): " + fib_integer(3).to_string + "%N")
			io.put_string("Tak(3.0,2.0,1.0): " + tak_real(3.0, 2.0, 1.0).to_string_format(1) + "%N")
		end

	ack (x, y: INTEGER): INTEGER is
		do
			if x = 0 then
				Result := y + 1
			elseif y = 0 then
				Result := ack(x - 1, 1)
			else
				Result := ack(x - 1, ack(x, y - 1))
			end
		end

	fib_integer (n: INTEGER): INTEGER is
		do
			if n < 2 then
				Result := 1
			else
				Result := fib_integer(n - 2) + fib_integer(n - 1)
			end
		end

	fib_real (r: DOUBLE): DOUBLE is
		do
			if r < 2.0 then
				Result := 1.0
			else
				Result := fib_real(r - 2.0) + fib_real(r - 1.0)
			end
		end

	tak_integer (x, y, z: INTEGER): INTEGER is
		do
			if y < x then
				Result := tak_integer(tak_integer(x - 1, y, z), tak_integer(y - 1, z, x), tak_integer(z - 1, x, y))
			else
				Result := z
			end
		end

	tak_real (x, y, z: DOUBLE): DOUBLE is
		do
			if y < x then
				Result := tak_real(tak_real(x - 1.0, y, z), tak_real(y - 1.0, z, x), tak_real(z - 1.0, x, y))
			else
				Result := z
			end
		end

end -- class RECURSIVE
