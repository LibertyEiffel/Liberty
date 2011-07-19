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
class LIBERTY_SEMANTICS_POSITION

inherit
   LIBERTY_POSITION
      redefine
         show
      end

insert
   EIFFEL_NODE_HANDLER

create {LIBERTY_ERRORS}
   make

feature {ANY}
   is_unknown: BOOLEAN is False

   show (stream: OUTPUT_STREAM) is
      do
         generate_source
         if index <= source.upper then
            Precursor(stream)
         else
            debug
               stream.put_string(once "Invalid position ")
               stream.put_integer(index)
               stream.put_new_line
            end
         end
      end

feature {}
   ast: LIBERTY_AST_NON_TERMINAL_NODE

feature {}
   make (a_index: like index; a_ast: like ast; a_file: like file) is
      require
         a_ast /= Void
         a_index > 0
         a_file /= Void
      do
         index := a_index
         ast := a_ast
         file := a_file
      ensure
         index = a_index
         ast = a_ast
         file = a_file
      end

   generate_source is
      do
         if last_ast_in_code_buffer.item /= ast then
            code_buffer.clear
            ast.generate(code_buffer)
            last_ast_in_code_buffer.set_item(ast)
         end
      end

   last_ast_in_code_buffer: REFERENCE[EIFFEL_NODE] is
      once
         create Result
      end

   code_buffer: STRING_OUTPUT_STREAM is
      once
         create Result.connect_to(source)
      end

   source: STRING is ""

invariant
   ast /= Void

end
