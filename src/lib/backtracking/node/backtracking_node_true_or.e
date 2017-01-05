-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class BACKTRACKING_NODE_TRUE_OR
   --
   -- Alternative between nothing (as true) first and then a node
   --

inherit
   BACKTRACKING_NODE_UNARY

insert
   BACKTRACKING_NODE_GLOBALS

create {ANY}
   make

feature {ANY}
   explore (explorer: BACKTRACKING)
      do
         -- Push 'node' in front of the possible alternatives.
         explorer.push_or(node)
         -- Continues the exploration
         explorer.continue
      end

feature {}
   do_fill_tagged_out_memory
      do
         tagged_out_memory.append(once "<true> or (")
         node.fill_tagged_out_memory
         tagged_out_memory.append(once ")")
      end

end -- class BACKTRACKING_NODE_TRUE_OR
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
