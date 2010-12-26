class TEST_COROUTINE

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make is
      local
         coro: AUX_COROUTINE
         i: ITERATOR[INTEGER]
      do
         create coro
         from
            i := coro.item([])
         until
            i.is_off
         loop
            std_output.put_string(once "next item: ")
            std_output.put_integer(i.item)
            std_output.put_new_line
            i.next
         end
      end

end
