-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class AT_EXIT
--
-- This class contains a private unique list of actions to run at exit time.
--

feature {ANY}
   add (a_action: PROCEDURE[TUPLE])
      do
         actions.add_last(a_action)
      end

   run
      require
         not is_running
      local
         action: PROCEDURE[TUPLE]
      do
         is_running_memory.set_item(True)
         from
         until
            actions.is_empty
         loop
            action := actions.first
            actions.remove_first
            action.call([])
         end
         is_running_memory.set_item(False)
      end

   is_running: BOOLEAN
      do
         Result := is_running_memory.item
      end

feature {}
   actions: RING_ARRAY[PROCEDURE[TUPLE]]
      once
         create Result.make(1, 0)
      end

   is_running_memory: REFERENCE[BOOLEAN]
      once
         create Result
      end

end -- class AT_EXIT
--
-- Copyright (C) 2013-2022: Cyril ADRIAN
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
