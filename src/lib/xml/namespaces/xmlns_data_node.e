-- See the Copyright notice at the end of this file.
--
class XMLNS_DATA_NODE
   --
   -- A node in an XMLNS_TREE
   --

inherit
   XMLNS_NODE

create {XMLNS_TREE}
   make

feature {ANY}
   data: UNICODE_STRING
         -- Data in the node, if there is some.

feature {ANY}
   accept (visitor: VISITOR)
      local
         v: XMLNS_NODE_VISITOR
      do
         v ::= visitor
         v.visit_data_node(Current)
      end

feature {}
   make (a_data: like data; a_line: like line; a_column: like column)
      require
         a_data /= Void
         a_line > 0
         a_column > 0
      do
         data := a_data
         line := a_line
         column := a_column
      end

invariant
   data /= Void

end -- class XMLNS_DATA_NODE
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
