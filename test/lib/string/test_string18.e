class TEST_STRING18
   -- Test multiple remove_first and remove_last
insert EIFFELTEST_TOOLS

create {} 
   make

feature {ANY} 
   make
      local x,y: STRING
      do
         print("plain strin%N")
         x := once "__addr"
         y := translate(x)
         assert(y ~ "an_addr")
         assert(y.count = 7)
         print("from external%N")
         create x.from_external(addr)
         y := translate(x)
         assert(y ~ "an_addr")
         assert(y.count = 7)
         print("From external copy")
         create x.from_external_copy(addr)
         y := translate(x)
         assert(y ~ "an_addr")
         assert(y.count = 7)
      end

   translate (a_name: STRING): STRING
      do
         create Result.copy(a_name)
         -- Remove header underscores.
         from
         until
            Result.first /= '_'
         loop
            Result.remove_first
         end

         -- If first character is a number prepend an `a_'
         if Result.first.is_digit then
            Result.prepend(once "a_")
         end
         insert_underscores(Result)

         -- Remove spurious underscores and the end
         from
         until
            Result.last /= '_'
         loop
            Result.remove_last
         end
         Result.to_lower

         inspect
            Result.first
         when 'a', 'e', 'o', 'i', 'u' then
            Result.prepend(once "an_")
         else
            Result.prepend(once "a_")
         end
      end

   insert_underscores (a_string: STRING)
         -- Insert an underscore ('_') before each uppercase letter following a lowercase one.
      require
         a_string /= Void
         not a_string.is_empty
      local
         i: INTEGER
      do
         from
            i := a_string.lower + 1
         until
            i > a_string.upper
         loop
            if a_string.item(i-1).is_lower and then a_string.item(i).is_upper then
               a_string.insert_character('_', i)
               i := i + 2
            else
               i := i + 1
            end
         end
      end

   addr: POINTER
      external "C inline"
      alias "%"__addr%""
      end
end
