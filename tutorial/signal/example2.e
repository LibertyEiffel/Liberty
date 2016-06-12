class EXAMPLE2
   -- Signal example2
   -- expected:
   -- a: 0 0
   -- b: 3 3
   -- c: 3 5
   -- d: 3 5
   -- e: 7 7
   -- f: 9 9
   -- This example shows that you may connect two objects, even if they
   -- don't know each other and they don't have been written for that.
   -- This class connects two objects of type A so that they stay
   -- synchronized. You may imagine that one is a cursor and the other
   -- is a spin button, both represent the same quantity. So you want
   -- that each change on one of them updates the value shown by the other.

create {ANY}
   make

feature {}
   a1, a2: A

   make
      do
         create a1.make
         create a2.make
         a1.value_changed.connect(agent a2.set_val(?))
         state("a")
         a1.set_val(3)
         state("b")
         a2.set_val(5)
         state("c")
         a2.value_changed.connect(agent a1.set_val(?))
         state("d")
         a1.set_val(7)
         state("e")
         a1.set_val(9)
         state("f")
      end

   state (s: STRING)
      do
         io.put_string(once "View point ")
         io.put_string(s)
         io.put_string(once ": a1=")
         io.put_integer(a1.value)
         io.put_string(once ", a2=")
         io.put_integer(a2.value)
         io.put_new_line
      end

end -- class EXAMPLE2
