class TEST_ROPE

insert
   EIFFELTEST_TOOLS

creation
   make

feature
   make is
      local
         a: STRING
         r: ROPE
         ai, ri:  ITERATOR[CHARACTER]
      do
         a:="A-"+"rope"+"-is-beautiful"
         r:="A-"|"rope"|"-is-beautiful"

         assert(a.count = r.count)
         assert(a.is_equal(r))
         assert(r.is_equal(a))

         from
            ai := a.new_iterator; ai.start
            ri := r.new_iterator; ri.start
         until
            ai.is_off or else ri.is_off
         loop
            assert(ai.item = ri.item)
            ai.next; ri.next
         end
         assert(ai.is_off and then ri.is_off)

         assert(r.count = 19)
         assert(("Rope r is "+r.count.to_string+" characters long.").is_equal("Rope r is 19 characters long."))
         assert(("Rope r is "|r.count.to_string|" characters long.").is_equal("Rope r is 19 characters long."))
         assert(("Rope r is "| &r.count        |" characters long.").is_equal("Rope r is 19 characters long."))
         assert(not ("Failing equality").is_equal("Test-"|"equality"))
         assert(("Test-"|"equality").is_equal("Test-"|"equality"))
         assert(not ("Failing"|"equality").is_equal("Test-"|"equality"))
         assert(("Test"|"-equality").is_equal("Test-equality"))
         assert(("Test"|"-equality").is_equal("Test-equ"|"ality"))
         assert(not ("Failing-"|"equality").is_equal("equality"))
         assert(("Foo is "|foo.count.out|" characters long.").is_equal("Foo is 3 characters long."))
         assert(("Foo is "| &foo.count  |" characters long.").is_equal("Foo is 3 characters long."))
         assert(("Ropes are "|("beautiful".intern)).is_equal("Ropes are beautiful"))
         assert(("Ropes are "|("beautiful".intern)).is_equal("Ropes are beautiful".intern))
      end

   foo: STRING is "Foo"

end -- class TEST_ROPE
