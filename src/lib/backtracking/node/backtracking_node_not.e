-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class BACKTRACKING_NODE_NOT
   --
   -- node that negate a node what mean that the exploration
   -- will be continued if exploration of the subnode is stopped
   -- and conversely.
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
         -- insert a cut point
         explorer.push_cut_point
         -- create a call to continuation
         explorer.push_or(the_true_node)
         -- evaluate 'node' now
         explorer.set_current_node(node)
         -- and if it's a success the following node
         -- will remove the or by a cut and will fail
         explorer.push_and(the_cut_and_false_node)
      end

feature {}
   do_fill_tagged_out_memory
      do
         tagged_out_memory.append(once "not (")
         node.fill_tagged_out_memory
         tagged_out_memory.append(once ")")
      end

end -- class BACKTRACKING_NODE_NOT
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
