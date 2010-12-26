class AUX_COROUTINE

inherit
   COROUTINE[TUPLE, INTEGER]

feature {COROUTINE_ITERATOR}
   invoke (args: TUPLE) is
      local
         i: INTEGER
      do
         from
            i := 1
         until
            i > 10
         loop
            yield(i)
            i := i + 1
         end
      end

end
