class TRIANGLE
   -- Description of TRIANGLEs objects.

feature {ANY}
   p1: POINT
      -- First point.

   p2: POINT
      -- Second point.

   p3: POINT
      -- Third point.

   make (a, b, c: POINT)
         -- To initialize the `Current' TRIANGLE.
      do
         p1 := a
         p2 := b
         p3 := c
      end

   translate (dx, dy: REAL)
         -- To translate the `Current' TRIANGLE.
      do
         p1.translate(dx, dy)
         p2.translate(dx, dy)
         p3.translate(dx, dy)
      end

end -- class TRIANGLE
