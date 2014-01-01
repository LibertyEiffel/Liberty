-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
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

end -- class COROUTINE_ITERATOR
--
-- Copyright (c) 2009-2014 by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
