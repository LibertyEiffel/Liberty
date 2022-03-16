-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class BACKTRACKING_NODE_UNARY
   --
   -- node that reference one subnode
   --

inherit
   BACKTRACKING_NODE
      undefine
         fill_tagged_out_memory
      end

insert
   BACKTRACKING_NODE_FILL

feature {ANY}
   node: BACKTRACKING_NODE
         -- the node

   make, set_node (value: BACKTRACKING_NODE)
      require
         value_not_void: value /= Void
      do
         node := value
      ensure
         definition: node = value
         node_not_void: node /= Void
      end

invariant
   node_not_void: node /= Void

end -- class BACKTRACKING_NODE_UNARY
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
