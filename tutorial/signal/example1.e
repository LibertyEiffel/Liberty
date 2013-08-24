class EXAMPLE1
   -- Signal example1
   -- This example show signal which carry an integer value.
   -- You may imagine that A is scrollbar and that you need to be
   -- informed each time the value (position) change so that you can
   -- correctly redraw at the new place.

creation {ANY}
   make

feature {}
   a: A

   make is
      do
         create a.make
         a.value_changed.connect(agent foo(?))
         -- a.value_changed.connect(agent foo); -- syntaxically equivalent
         a.set_val(3)
         a.set_val(5)
      end

   foo (i: INTEGER) is
      do
         io.put_string(once "New value is ")
         io.put_integer(i)
         io.put_new_line
      end

end -- class EXAMPLE1
