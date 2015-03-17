class DOWNCASTING
   --
   -- This tutorial presents various examples allowing safe downcasting (the way you can assign an object
   -- of a general type into some more specific one).
   --

create {ANY}
   make

feature {}
   make
      local
         a: ABSTRACT_STRING; s: STRING; col: COLLECTION[INTEGER]; array: ARRAY[INTEGER]
      do
         s := "Hello%N"
         a := s -- standard valid assignment

         s ?= a -- Try to put `a' in `s' if it is a STRING or subtype. `s' is Void if assignment fails.
         if s /= Void then
            std_output.put_string(s)
         else
            std_output.put_string(once "Void")
         end

         if s ?:= a then
            -- Could `a' be assigned to `s'?
            std_output.put_string(once "We can put `a' in `s'.%N")
            s ::= a -- force the assignment because we know it's allowed (it's a require of `::=' operator)
         else
            std_output.put_string(once "`a' cannot be put in `s'.%N")
         end

         if {STRING} ?:= a then
            -- Could `a' be assigned to a STRING? (very useful in assertions)
            std_output.put_string(once "`a' is a STRING.%N")
            s ::= a -- force the assignment because we know it's allowed (it's a require of `::=' operator)
         else
            std_output.put_string(once "`a' is not a STRING.%N")
         end

         col := {ARRAY[INTEGER] 1, << 1, 2, 3 >> }
         -- see tutorial/manifest_expression.e
         -- Sometimes, thanks to the way the system is built, the type
         -- known so we are sure the assignment is always valid.
         -- In this case, we don't need to do an assignment attempt
         -- with `?=', the test is a waste of time. `::=' is the solution.

         array ?= col -- Standard common pattern
         check
            array /= Void
         end
         array ::= col -- New way.
      end

end -- class DOWNCASTING
