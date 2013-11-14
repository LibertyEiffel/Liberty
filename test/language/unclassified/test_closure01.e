class TEST_CLOSURE01

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make is
      local
         a: INTEGER
      do
         a := 3
         (
            agent (i: INTEGER) is
               do
                  assert(a = 3)
                  assert(i = 5)
               end (?)
         ).call([5])
      end

end -- class TEST_CLOSURE01
