class
   ATTRIBUTES
   -- see how the keyword attribute is used to define "member variables"

create {ANY}
   make
   
feature {ANY}
   make
      do
         b := 5
         io.put_string("a = ")
         io.put_line(a.out)
         io.put_string("b = ")
         io.put_line(b.out)
      end

   a: INTEGER
         -- define an self-initializing attribute with contracts
         -- its body is executed on the first access the this member variable
      require
          b_is_set: b /= 0
      attribute
         Result := b
      ensure
         res: Result = b
         a: a = b
      end

   b: INTEGER
         -- this is the traditional short form of attributes
end
