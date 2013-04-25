class COROUTINE_ITERATOR[O_ -> TUPLE, Y_]

inherit
   ITERATOR[Y_]
   ANY_COROUTINE_ITERATOR

create {COROUTINE}
   make

feature {ANY}
   start is
      do
         context := do_start(Current, coroutine)
         next
      end

   is_off: BOOLEAN

   item: Y_

   next is
      local
         def: Y_
      do
         coroutine.set_iterator(Current) -- also useful to ensure the coroutine invariant checking at each continuation.
         if not do_continue(context) then
            is_off := True
            item := def
         end
      end

   generation, iterable_generation: INTEGER is 0

feature {}
   context: POINTER

feature {COROUTINE}
   set_item (a_item: like item) is
      do
         item := a_item
      ensure
         item = a_item
      end

   yield is
      do
         do_yield(context)
      end

feature {} -- called by the plugin using CECIL
   invoke is
      do
         coroutine.invoke(arguments)
      end

feature {}
   arguments: O_
   coroutine: COROUTINE[O_, Y_]

   make (a_coroutine: like coroutine; a_arguments: like arguments) is
      do
         init
         coroutine := a_coroutine
         arguments := a_arguments
         start
      ensure
         coroutine = a_coroutine
         arguments = a_arguments
      end

   init is
      once
         initialize
      end

   initialize is
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "coroutine"
         feature_name: "coroutine_initialize"
         }"
      end

   do_start (a_iterator: like Current; a_coroutine: like coroutine): like context is
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "coroutine"
         feature_name: "coroutine_start"
         }"
      end

   do_continue (a_context: like context): BOOLEAN is
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "coroutine"
         feature_name: "coroutine_continue"
         }"
      end

   do_yield (a_context: like context) is
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "coroutine"
         feature_name: "coroutine_yield"
         }"
      end

end
