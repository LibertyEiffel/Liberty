-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class WAITPID_ACTION

feature {WAITPID_JOB}
   fire_waitpid (pid, status: INTEGER)
      do
         if on_waitpid /= Void then
            on_waitpid.call([pid, status])
         end
      end

   fire_timeout
      do
         if on_timeout /= Void then
            on_timeout.call([])
         end
      end

   set (a_on_waitpid: like on_waitpid; a_on_timeout: like on_timeout)
      do
         on_waitpid := a_on_waitpid
         on_timeout := a_on_timeout
      ensure
         on_waitpid = a_on_waitpid
         on_timeout = a_on_timeout
      end

feature {}
   on_waitpid: PROCEDURE[TUPLE[INTEGER, INTEGER]]
   on_timeout: PROCEDURE[TUPLE]

end -- class WAITPID_ACTION
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
