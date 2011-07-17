class POINT
	-- Description of POINTs objects.

creation {ANY}
	make

feature {ANY}
	x: REAL
			-- The `x' coordinate.

	y: REAL
			-- The `y' coordinate.

	rho: REAL is
		do
			Result := x.sin
		end

	make (vx, vy: REAL) is
		do
			x := vx
			y := vy
		end

	translate (dx, dy: REAL) is
			-- To translate the `Current' POINT.
		do
			x := x + dx
			y := y + dy
		end

end -- class POINT
