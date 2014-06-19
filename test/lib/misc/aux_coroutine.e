class AUX_COROUTINE

inherit
   COROUTINE[TUPLE, INTEGER]

create {ANY}
   make

feature {COROUTINE_ITERATOR}
   invoke (args: TUPLE)
      local
         i: INTEGER
      do
         from
            i := 1
         until
            i > max
         loop
            yield(i)
            i := i + 1
         end
      end

feature {}
   make (a_max: like max)
      require
         a_max > 0
      do
         max := a_max
      ensure
         max = a_max
      end

   max: INTEGER

end
