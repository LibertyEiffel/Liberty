-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class LOOP_STACK
   -- Manage `LOOP_ITEM'. When a new loop is pushed, all jobs in the currently
   -- running loop are suspended until the new loop ends (all jobs end or break).
   --

create {ANY}
   make

feature {}
   loop_stack: FAST_ARRAY[LOOP_ITEM]

   make
      do
         create loop_stack.make(0)
         loop_stack.add_last(create {LOOP_ITEM}.make)
      ensure
         current_loop /= Void
      end

feature {ANY}
   stop: BOOLEAN

   new_loop
         -- create new empty loop (ie without job) and push it on the stack
      local
         loop_item: LOOP_ITEM
      do
         if not loop_stack.is_empty then
            current_loop.pause_loop
         end
         create loop_item.make
         loop_stack.add_last(loop_item)
      end

   push_loop (l: like current_loop)
         -- `l' is restarted and pushed on the stack
      require
         l /= Void
      do
         if not loop_stack.is_empty then
            current_loop.pause_loop
         end
         l.restart
         loop_stack.add_last(l)
      ensure
         current_loop = l
      end

   run
         -- run `current_loop' (ie execute it's jobs)
      require
         current_loop /= Void
      do
         from
            stop := False
         until
            stop or else loop_stack.is_empty
         loop
            current_loop.run
            if current_loop /= Void then
               --may be Void after `break'
               if not current_loop.pause then
                  loop_stack.remove_last
               end
            end
         end
      ensure
         loop_stack.is_empty or stop
      end

   add_job (j: JOB)
         -- Add a job to the current loop
      require
         j /= Void
      do
         current_loop.add_job(j)
      end

   break
         -- Exit current loop
      require
         current_loop /= Void
      do
         current_loop.break_loop
         loop_stack.remove_last
      ensure
         current_loop /= old current_loop
      end

   exit_all
         --TODO: Really needed feature ?
      require
         stop = False
      do
         stop := True
         current_loop.pause_loop
      ensure
         stop = True
      end

   current_loop: LOOP_ITEM
         --TODO: change this function into an attribute to be more efficient
      do
         if not loop_stack.is_empty then
            Result := loop_stack.last
         end
      end

end -- class LOOP_STACK
--
-- Copyright (C) 2009-2018: by all the people cited in the AUTHORS file.
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
