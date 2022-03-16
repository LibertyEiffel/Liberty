-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class THREAD[R_, T_ -> TUPLE]

create {ANY}
   make

feature {ANY}
   start (args: T_): THREAD_CONTEXT[R_, T_]
         -- Starts the thread. The returned context gives some information on the running thread.
      require
         args /= Void
      do
         create Result.make(Current, args)
         Result.run
      ensure
         Result /= Void
      end

   wait (args: T_): R_
         -- Convenient function that waits for a result. Use with caution, deadlocks lurk this way.
      require
         args /= Void
      local
         context: like start
      do
         context := start(args)
         if context.is_started then
            context.wait
            Result := context.status
         end
      end

feature {THREAD_CONTEXT}
   routine: FUNCTION[T_, R_]

feature {}
   make (a_routine: like routine)
      require
         a_routine /= Void
      do
         routine := a_routine
      ensure
         routine = a_routine
      end

invariant
   routine /= Void

end -- class THREAD
--
-- Copyright (C) 2009-2022: by all the people cited in the AUTHORS file.
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
