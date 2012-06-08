-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class JSON_PARSE_CONTEXT

create {JSON_PARSER}
   make

feature {JSON_PARSER}
   line, column: INTEGER

   item: CHARACTER is
      require
         is_valid
      do
         Result := data.last_character
      end

   is_valid: BOOLEAN is
      do
         Result := not data.end_of_input
      end

   next is
      require
         is_valid
      do
         data.read_character
         if is_valid then
            index := index + 1
            if item = '%N' then
               line := line + 1
               column := 1
            else
               column := column + 1
            end
         end
         debug
            io.put_line(once "**** #(1) => #(2)" # index.out # item_or_invalid)
         end
      end

   skip_blanks is
      do
         from
         until
            not is_valid
               or else not item.is_separator
         loop
            next
         end
      ensure
         index >= old index
      end

   skip (word: STRING): BOOLEAN is
      require
         not word.is_empty
      local
         i: INTEGER
      do
         from
            Result := True
            i := 0
         until
            not Result or else i = word.count
         loop
            Result := not data.end_of_input and then word.item(i + word.lower) = item
            next
            i := i + 1
         end
      end

   error (str: ABSTRACT_STRING): ABSTRACT_STRING is
      require
         str /= Void
      do
         Result := once "**** Syntax error: #(1) at #(2)" # str # debug_position
      ensure
         Result /= Void
      end

   debug_position: ABSTRACT_STRING is
      do
         Result := once "#(1):#(2)" # &line # &column
      ensure
         Result /= Void
      end

feature {}
   data: INPUT_STREAM
   index: INTEGER

   make (a_data: like data) is
      require
         a_data.is_connected
      do
         data := a_data
         line := 1
         index := 0
         next
      ensure
         data = a_data
         index = 1
         line = 1
      end

   item_or_invalid: ABSTRACT_STRING is
      do
         create {LAZY_STRING} Result.make(agent: ABSTRACT_STRING is
                                          do
                                             if is_valid then
                                                Result := once "'#(1)' (#(2), #(3))" # item.out # line.out # column.out
                                             else
                                                Result := once "(invalid)"
                                             end
                                          end)
      end

invariant
   data.is_connected

end -- class JSON_PARSE_CONTEXT
--
-- Copyright (c) 2009 by all the people cited in the AUTHORS file.
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
