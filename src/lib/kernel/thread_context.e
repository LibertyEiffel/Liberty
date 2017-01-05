-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class THREAD_CONTEXT[R_, T_ -> TUPLE]

create {THREAD}
   make

feature {ANY}
   thread: THREAD[R_, T_]
   args: T_

   wait
         -- Wait for the thread to finish
      require
         is_started
      external "built_in"
      ensure
         is_finished
      end

   is_started: BOOLEAN
         -- True if the thread did actually start
      attribute
      end

   is_finished: BOOLEAN
         -- True when the thread has finished
      require
         is_started
      attribute
      end

   status: R_
         -- The returning value
      require
         is_started
         is_finished
      attribute
      end

feature {THREAD}
   run
      require
         not is_started
      external "built_in"
      end

feature {THREAD}
   make (t: like thread; a: like args)
      require
         t /= Void
         a /= Void
      do
         thread := t
         args := a
      ensure
         thread = t
         args = a
      end

   native_data: POINTER

invariant
   thread /= Void
   args /= Void

end -- class THREAD_CONTEXT
--
-- Copyright (C) 2009-2017: by all the people cited in the AUTHORS file.
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
