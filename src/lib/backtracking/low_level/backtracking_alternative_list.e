-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class BACKTRACKING_ALTERNATIVE_LIST
   --
   -- An alternative of a list of nodes.
   --

inherit
   ABSTRACT_BACKTRACKING_ALTERNATIVE
      rename pool as pool_of_alternative_list
      end

insert
   BACKTRACKING_GLOBALS

feature {ABSTRACT_BACKTRACKING}
   list: BACKTRACKING_NODE_OR_LIST
         -- Iterator on the next item of the list.

   set_list (value: BACKTRACKING_NODE_OR_LIST)
      require
         value_not_void: value /= Void
      do
         list := value
      ensure
         definition: list = value
         list_not_void: list /= Void
      end

feature {ABSTRACT_BACKTRACKING}
   next_alternative (explorer: BACKTRACKING)
      do
         -- Tell to evaluate 'list.node' now.
         explorer.set_current_node(list.node)
         -- Iterate
         list := list.next
         if list /= Void then
            -- Alternative is still on, continue it.
            explorer.continue_alternative
         else
            -- Alternative is off, remove it.
            explorer.pop_alternative
         end
      end

end -- class BACKTRACKING_ALTERNATIVE_LIST
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
