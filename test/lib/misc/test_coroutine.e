class TEST_COROUTINE

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   max: INTEGER 10

   make
      local
         coro: AUX_COROUTINE
         i: ITERATOR[INTEGER]
         i_check: INTEGER
      do
         create coro.make(max)
         from
            i := coro.item([])
         until
            i.is_off
         loop
            i_check := i_check + 1
            assert(i.item = i_check)
            i.next
         end
         assert(i_check = max)
      end

end
