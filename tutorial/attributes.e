class
   ATTRIBUTES
   -- see how the keyword attribute is used to define "member variables"

create {ANY}
   make
   
feature {ANY}
   make
      do
         b := 5
         a := b -- remove this line to see the contract failing
         io.put_string("a = ")
         io.put_line(a.out)
         io.put_string("b = ")
         io.put_line(b.out)
      end

   a: INTEGER
         -- define an attribute with contracts
         -- to be checked, whether this is really nice design
         -- or whether a class invariant would be better
      attribute
      ensure
         Result = b
      end

   b: INTEGER
         -- this is the traditional short form of attributes
end
