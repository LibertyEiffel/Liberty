-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class EIFFEL_NODE
   --
   -- Provides two basic operations: `display' for debug purposes, and `generate' for more generic node
   -- handling.
   --
   -- Any other operation should be provided by an external VISITOR.
   --
   -- See also: EIFFEL_NON_TERMINAL_NODE, EIFFEL_LIST_NODE, EIFFEL_TERMINAL_NODE, EIFFEL_IMAGE
   --

inherit
   VISITABLE

insert
   EIFFEL_NODE_HANDLER

feature {ANY}
   parent: EIFFEL_NODE
         -- the parent node

   forgotten: FAST_ARRAY[EIFFEL_NODE]
         -- used when this node is in a EIFFEL_LIST_NODE and nodes are between this node and the next one

   name: FIXED_STRING
         -- the name of the node in the grammar
      deferred
      ensure
         name /= Void
      end

   source_line: INTEGER
      deferred
      end

   source_column: INTEGER
      deferred
      end

   source_index: INTEGER
      deferred
      end

feature {EIFFEL_GRAMMAR}
   set_forgotten (a_forgotten: like forgotten)
      do
         forgotten := a_forgotten
      ensure
         forgotten = a_forgotten
      end

feature {EIFFEL_NODE_HANDLER} -- Basic operations
   display (output: OUTPUT_STREAM; indent: INTEGER; p: STRING)
         -- Display the node in a tree fashion in the provided `output' stream
      deferred
      end

   generate (o: OUTPUT_STREAM)
         -- Generate the node exactly as it was written, including blanks and `forgotten' nodes, onto the
         -- provided `output' stream
      deferred
      end

feature {EIFFEL_NODE_HANDLER}
   generate_forgotten (o: OUTPUT_STREAM)
      local
         i: INTEGER
      do
         if forgotten /= Void then
            from
               i := forgotten.lower
            until
               i > forgotten.upper
            loop
               forgotten.item(i).generate(o)
               i := i + 1
            end
         end
      end

feature {EIFFEL_NON_TERMINAL_NODE, EIFFEL_LIST_NODE}
   set_parent (a_parent: like parent)
      require
         a_parent /= Void
         parent = Void
      do
         parent := a_parent
      ensure
         parent = a_parent
      end

feature {}
   do_indent (output: OUTPUT_STREAM; indent: INTEGER; p: STRING)
      local
         i: INTEGER
      do
         from
            i := 1
         until
            i > indent
         loop
            output.put_string(once "   ")
            i := i + 1
         end
         if p /= Void then
            output.put_string(p)
         end
      end

end -- class EIFFEL_NODE
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
