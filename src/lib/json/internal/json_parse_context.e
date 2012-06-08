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
         Result := data.item(index)
      end

   is_valid: BOOLEAN is
      do
         Result := data.valid_index(index)
      end

   next is
      require
         is_valid
      do
         index := index + 1
         if is_valid then
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
               or else not data.item(index).is_separator
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
            Result := data.valid_index(i + index) and then word.item(i + word.lower) = data.item(i + index)
            i := i + 1
         end
         if Result then
            check
               i = word.count
            end
            index := index + i
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
   data: STRING
   index: INTEGER

   make (a_data: like data) is
      require
         a_data /= Void
      do
         data := a_data
         index := a_data.lower
         line := 1
         debug ("json/parser")
            io.put_line(once "**** #(1) => #(2)" # index.out # item_or_invalid)
         end
      ensure
         data = a_data
         index = a_data.lower
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
   data /= Void

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
