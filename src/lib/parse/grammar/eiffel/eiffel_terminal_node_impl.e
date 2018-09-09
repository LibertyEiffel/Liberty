-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class EIFFEL_TERMINAL_NODE_IMPL

inherit
   EIFFEL_TERMINAL_NODE

create {EIFFEL_NODE_FACTORY}
   make

feature {ANY}
   name: FIXED_STRING

   image: EIFFEL_IMAGE

   accept (visitor: VISITOR)
      local
         v: EIFFEL_TERMINAL_NODE_IMPL_VISITOR
      do
         v ::= visitor
         v.visit_eiffel_terminal_node_impl(Current)
      end

feature {EIFFEL_NODE_HANDLER}
   display (output: OUTPUT_STREAM; indent: INTEGER; p: STRING)
      do
         do_indent(output, indent, p)
         output.put_character('"')
         output.put_string(name)
         output.put_string(once "%": ")
         output.put_line(image.image)
      end

   generate (o: OUTPUT_STREAM)
      do
         o.put_string(image.blanks)
         o.put_string(image.image)
         generate_forgotten(o)
      end

feature {}
   make (a_name: like name; a_image: like image)
      do
         name := a_name
         image := a_image
      ensure
         name = a_name
         image = a_image
      end

end -- class EIFFEL_TERMINAL_NODE_IMPL
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
