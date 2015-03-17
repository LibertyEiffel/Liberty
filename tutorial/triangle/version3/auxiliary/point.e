class POINT
   -- Description of POINTs objects.

create {ANY}
   make

feature {ANY}
   x: REAL
      -- The `x' coordinate.

   y: REAL
      -- The `y' coordinate.

   translate (dx, dy: REAL)
         -- To translate `Current' using `dx' and `dy'.
      do
         x := x + dx
         y := y + dy
      ensure
         x = dx + old x
         y = dy + old y
      end

   display
         -- Display `Current' on `io'.
      do
         io.put_string("POINT[")
         io.put_real(x)
         io.put_character(',')
         io.put_real(y)
         io.put_string("]%N")
      end

feature {}
   make (vx, vy: REAL)
         -- To create a new POINT.
      do
         x := vx
         y := vy
      end

end -- class POINT
