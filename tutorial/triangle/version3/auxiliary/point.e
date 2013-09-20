class POINT
	-- Description of POINTs objects.

creation {ANY}
	make

feature {ANY}
	x: REAL
			-- The `x' coordinate.

	y: REAL
			-- The `y' coordinate.

	translate (dx, dy: REAL) is
			-- To translate `Current' using `dx' and `dy'.
		do
			x := x + dx
			y := y + dy
		ensure
			x = dx + old x
			y = dy + old y
		end

	display is
			-- Display `Current' on `io'.
		do
			io.put_string("POINT[")
			io.put_real(x)
			io.put_character(',')
			io.put_real(y)
			io.put_string("]%N")
		end

feature {}
	make (vx, vy: REAL) is
			-- To create a new POINT.
		do
			x := vx
			y := vy
		end

end -- class POINT
