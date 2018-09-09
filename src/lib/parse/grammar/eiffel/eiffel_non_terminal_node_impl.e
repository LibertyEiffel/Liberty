-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class EIFFEL_NON_TERMINAL_NODE_IMPL

inherit
   EIFFEL_NON_TERMINAL_NODE

create {EIFFEL_NODE_FACTORY}
   make

feature {ANY}
   name: FIXED_STRING

   accept (visitor: VISITOR)
      local
         v: EIFFEL_NON_TERMINAL_NODE_IMPL_VISITOR
      do
         v ::= visitor
         v.visit_eiffel_non_terminal_node_impl(Current)
      end

   name_at (index: INTEGER): FIXED_STRING
      do
         Result := names.item(index - lower + names.lower)
      end

   node_at (index: INTEGER): EIFFEL_NODE
      do
         Result := nodes.item(index)
      end

   valid_index (index: INTEGER): BOOLEAN
      do
         Result := nodes.valid_index(index)
      end

   lower: INTEGER
      do
         Result := nodes.lower
      end

   upper: INTEGER
      do
         Result := nodes.upper
      end

   count: INTEGER
      do
         Result := nodes.count
      end

   is_empty: BOOLEAN
      do
         Result := nodes.is_empty
      end

feature {EIFFEL_GRAMMAR}
   set (index: INTEGER; node: EIFFEL_NODE)
      do
         nodes.put(node, index)
         node.set_parent(Current)
      end

feature {EIFFEL_NODE_HANDLER}
   display (output: OUTPUT_STREAM; indent: INTEGER; p: STRING)
      local
         i: INTEGER
      do
         do_indent(output, indent, p)
         output.put_character('"')
         output.put_string(name)
         output.put_line(once "%":")
         from
            i := lower
         until
            i > upper
         loop
            node_at(i).display(output, indent + 1, " * ")
            i := i + 1
         end
      end

   generate (o: OUTPUT_STREAM)
      local
         i: INTEGER
      do
         from
            i := lower
         until
            i > upper
         loop
            node_at(i).generate(o)
            i := i + 1
         end
         generate_forgotten(o)
      end

feature {}
   make (a_name: like name; a_names: like names)
      do
         name := a_name
         names := a_names
         create nodes.make(a_names.count)
      ensure
         name = a_name
         names = a_names
      end

   names: TRAVERSABLE[FIXED_STRING]

   nodes: FAST_ARRAY[EIFFEL_NODE]

invariant
   names.count = nodes.count

end -- class EIFFEL_NON_TERMINAL_NODE_IMPL
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
