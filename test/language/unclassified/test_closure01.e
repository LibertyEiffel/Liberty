class TEST_CLOSURE01

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      local
         a: INTEGER
      do
         a := 3
         (
            agent (i: INTEGER)
               do
                  assert(a = 3)
                  assert(i = 5)
               end (?)
         ).call([{INTEGER 5}])
      end

end -- class TEST_CLOSURE01
