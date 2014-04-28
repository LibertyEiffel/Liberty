-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class THREAD_LOCK

insert
   DISPOSABLE
      redefine
         default_create
      end

create {ANY}
   default_create

feature {ANY}
   is_locked: BOOLEAN is
      external "built_in"
      end

   lock is
      external "built_in"
      ensure
         is_locked
      end

   unlock is
      require
         is_locked
      external "built_in"
      end

   timed_wait (timeout_ms: INTEGER): BOOLEAN is
         -- True if the wait succeeded, False if timed out
      require
         is_locked
         timeout_ms >= 0
      external "built_in"
      end

   wait is
      require
         is_locked
      external "built_in"
      end

   notify is
      require
         is_locked
      external "built_in"
      end

   notify_all is
      require
         is_locked
      external "built_in"
      end

feature {}
   default_create is
      do
         alloc_native_data
      end

   native_data: POINTER

   dispose is
      do
         check
            not is_locked
         end
         free_native_data
      end

   alloc_native_data is
      external "built_in"
      end

   free_native_data is
      external "built_in"
      end

invariant
   native_data.is_not_null

end -- class THREAD_LOCK
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
