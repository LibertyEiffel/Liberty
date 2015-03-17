-- This file is part of Liberty Eiffel.
--
-- Liberty Eiffel is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, version 3 of the License.
--
-- Liberty Eiffel is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with Liberty Eiffel.  If not, see <http://www.gnu.org/licenses/>.
--
deferred class LIBERTY_AST_TERMINAL_NODE

inherit
   EIFFEL_TERMINAL_NODE

feature {ANY}
   name: FIXED_STRING

   image: EIFFEL_IMAGE

   accept (v: VISITOR)
      do
         check False end
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
   make (a_name: ABSTRACT_STRING; a_image: like image)
      require
         a_name.has_prefix(once "KW ")
      do
         name := a_name.intern
         image := a_image
      ensure
         name = a_name
         image = a_image
      end

end
