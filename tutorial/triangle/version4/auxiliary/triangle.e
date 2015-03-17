class TRIANGLE
   -- Description of TRIANGLEs objects.

inherit
   ANY
      redefine is_equal, copy
      end

create {ANY}
   make

feature {ANY}
   p1: POINT
      -- First point.

   p2: POINT
      -- Second point.

   p3: POINT
      -- Third point.

   translate (dx, dy: REAL)
         -- To translate `Current' using `dx' and `dy'.
      do
         p1.translate(dx, dy)
         p2.translate(dx, dy)
         p3.translate(dx, dy)
      end

   display_on (stream: OUTPUT_STREAM)
         -- To display `Current' on the `stream'.
      require
         stream.is_connected
      do
         stream.put_string("TRIANGLE[%N%T")
         p1.display_on(stream)
         stream.put_string("%N%T")
         p2.display_on(stream)
         stream.put_string("%N%T")
         p3.display_on(stream)
         stream.put_string("%T]%N")
      ensure
         stream.is_connected
      end

   is_equal (other: TRIANGLE): BOOLEAN
      do
         if p1.is_equal(other.p1) then
            if p2.is_equal(other.p2) then
               Result := p3.is_equal(other.p3)
            end
         end
      end

   copy (other: TRIANGLE)
         -- Modify `Current' in order to become like `other'.
      do
         p1 := other.p1.twin
         p2 := other.p2.twin
         p3 := other.p3.twin
      end

feature {}
   make (a, b, c: POINT)
         -- To create a new TRIANGLE.
      require
         a /= Void
         b /= Void
         c /= Void
      do
         p1 := a
         p2 := b
         p3 := c
      ensure
         p1 = a
         p2 = b
         p3 = c
      end

invariant
   p1 /= Void
   p2 /= Void
   p3 /= Void

end -- class TRIANGLE
