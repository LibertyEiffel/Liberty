class POINT
   -- Description of POINTs objects.

feature {ANY}
   x: REAL
      -- The `x' coordinate.

   y: REAL
      -- The `y' coordinate.

   translate (dx, dy: REAL)
         -- To translate the `Current' POINT.
      do
         -- Modification of the `Current' POINT.
         x := x + dx
         y := y + dy
      end

end -- class POINT
