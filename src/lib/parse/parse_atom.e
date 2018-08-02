-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class PARSE_ATOM[C_ -> PARSE_CONTEXT]
   --
   -- A part of the PARSE_TABLE.
   --

insert
   TRISTATE_VALUES
   PARSER_FACET

feature {ANY}
   name: FIXED_STRING
   table: PARSE_TABLE[C_]

   is_coherent: BOOLEAN
      require
         table /= Void
      deferred
      ensure
         must_be_coherent: Result
      end

   pretty_print_on (stream: OUTPUT_STREAM)
      require
         stream.is_connected
      deferred
      end

feature {PARSE_TABLE}
   set (a_name: ABSTRACT_STRING; a_table: like table)
      require
         name = Void
         table = Void
         not a_name.is_empty
         a_table /= Void
      do
         name := a_name.intern
         table := a_table
      ensure
         name = a_name.intern
         table = a_table
      end

   set_table (a_table: like table)
      require
         a_table /= Void
      do
         table := a_table
      ensure
         table = a_table
      end

   set_default_tree_builders (non_terminal_builder: PROCEDURE[TUPLE[FIXED_STRING, TRAVERSABLE[FIXED_STRING]]]; terminal_builder: PROCEDURE[TUPLE[FIXED_STRING, PARSER_IMAGE]])
      require
         is_coherent
      deferred
      end

feature {PARSER_FACET}
   parse (context: C_): TRISTATE
         -- The Result is `yes' if the parsing succeeded, `no' if there was a syntax error, or `maybe' if the
         -- parse could complete with some more text.
      require
         context /= Void
      deferred
      ensure
         context.actions.count >= old context.actions.count
         ;(Result /= yes) implies context.buffer.current_index = old context.buffer.current_index and then context.actions.count = old context.actions.count
      end

feature {}
   add_error_position (error: STRING; buffer: MINI_PARSER_BUFFER)
      local
         n, l, c: INTEGER
      do
         n := buffer.current_index
         from
            l := 1
            c := 1
            buffer.set_current_index(buffer.lower)
         until
            buffer.current_index = n
         loop
            if buffer.current_character = '%N' then
               l := l + 1
               c := 1
            else
               c := c + 1
            end
            buffer.next
         end
         if not error.is_empty then
            error.extend(' ')
         end
         error.append(once "at line ")
         l.append_in(error)
         error.append(once ", column ")
         c.append_in(error)
      end

   print_error_position (o: OUTPUT_STREAM; buffer: MINI_PARSER_BUFFER)
      local
         s: STRING
      do
         s := once ""
         s.clear_count
         add_error_position(s, buffer)
         o.put_string(s)
      end

end -- class PARSE_ATOM
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
