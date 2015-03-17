class POINT
   -- Description of POINTs objects.

create {ANY}
   make

feature {ANY}
   x: REAL
      -- The `x' coordinate.

   y: REAL
      -- The `y' coordinate.

   rho: REAL
      do
         Result := x.sin
      end

   make (vx, vy: REAL)
      do
         x := vx
         y := vy
      end

   translate (dx, dy: REAL)
         -- To translate the `Current' POINT.
      do
         x := x + dx
         y := y + dy
      end

end -- class POINT
