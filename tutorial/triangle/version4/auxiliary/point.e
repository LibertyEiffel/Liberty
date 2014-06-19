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

   display_on (stream: OUTPUT_STREAM)
         -- Display `Current' on the `stream'.
      require
         stream.is_connected
      do
         stream.put_string("POINT[")
         stream.put_real(x)
         stream.put_character(',')
         stream.put_real(y)
         stream.put_string("]%N")
      ensure
         stream.is_connected
      end

feature {}
   make (vx, vy: REAL)
         -- To create a new POINT.
      do
         x := vx
         y := vy
      end

end -- class POINT
