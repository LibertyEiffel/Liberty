-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class EIFFEL_LIST_NODE_IMPL

inherit
   EIFFEL_LIST_NODE

insert
   TRAVERSABLE[EIFFEL_NODE]

create {EIFFEL_NODE_FACTORY}
   make

feature {ANY}
   name: FIXED_STRING

   accept (visitor: VISITOR)
      local
         v: EIFFEL_LIST_NODE_IMPL_VISITOR
      do
         v ::= visitor
         v.visit_eiffel_list_node_impl(Current)
      end

   item (i: INTEGER): EIFFEL_NODE
      do
         Result := children.item(children.upper - i)
      end

   lower: INTEGER
      do
         Result := children.lower
      end

   upper: INTEGER
      do
         Result := children.upper
      end

   count: INTEGER
      do
         Result := children.count
      end

   first: EIFFEL_NODE
      do
         Result := children.last
      end

   last: EIFFEL_NODE
      do
         Result := children.first
      end

   is_empty: BOOLEAN
      do
         Result := children.is_empty
      end

feature {EIFFEL_GRAMMAR}
   add (a_child: like item)
      do
         children.add_last(a_child)
         a_child.set_parent(Current)
      end

feature {EIFFEL_NODE_HANDLER}
   display (output: OUTPUT_STREAM; indent: INTEGER; p: STRING)
      local
         i: INTEGER; n: STRING
      do
         n := once ""
         do_indent(output, indent, p)
         output.put_character('"')
         output.put_string(name)
         output.put_string(once "%": ")
         output.put_integer(children.count)
         output.put_string(once " atom")
         if children.count /= 1 then
            output.put_character('s')
         end
         output.put_new_line
         from
            i := lower
         until
            i > upper
         loop
            n.copy(once "#")
            (upper - i + lower + 1).append_in(n)
            n.append(once ": ")
            item(i).display(output, indent + 1, n)
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
            item(i).generate(o)
            i := i + 1
         end
         generate_forgotten(o)
      end

feature {}
   make (a_name: like name)
      do
         name := a_name
         create children.make(0)
      ensure
         name = a_name
      end

   children: FAST_ARRAY[EIFFEL_NODE]

end -- class EIFFEL_LIST_NODE_IMPL
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
