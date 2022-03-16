-- See the Copyright notice at the end of this file.
--
class UNICODE_PARSER_BUFFER
   --
   -- A UTF-8 aware parser buffer for XML parsing
   --

insert
   RECYCLABLE
   PLATFORM

create {ANY}
   connect_to

feature {ANY}
   unknown_character: INTEGER 0x0000fffd

feature {ANY}
   connect_to (a_url: like url; a_encoding: STRING)
      require
         not is_connected
      do
         if backlog = Void then
            create backlog.make(0)
         else
            check
               backlog.is_empty
            end
         end
         url := a_url
         if a_encoding /= Void then
            set_encoding(a_encoding)
         else
            size := 0
         end
         index := -1
         line := 1
         column := 1
         at_error := False
         next
      end

   disconnect
      do
         url.disconnect
         url := Void
         backlog.clear_count
      ensure
         not is_connected
      end

   set_encoding (a_encoding: STRING)
      require
         a_encoding /= Void
      local
         enc: STRING
      do
         enc := once ""
         enc.copy(a_encoding)
         enc.to_upper
         inspect
            enc
         when "UTF-8" then
            size := 4
         when "UTF-16" then
            size := 8
            not_yet_implemented
         else
            size := 1
         end
      end

   url: URL
   index, line, column: INTEGER
   at_error: BOOLEAN

   is_connected: BOOLEAN
      do
         Result := url /= Void and then url.is_connected
      end

   end_of_input: BOOLEAN
      require
         is_connected
      do
         Result := index > backlog.upper and then url.input.end_of_input
      end

   can_read_character: BOOLEAN
      do
         Result := index < backlog.upper or else url.input.can_read_character
      end

   next
      require
         is_connected
         not end_of_input
         can_read_character
         not at_error
      local
         input: INPUT_STREAM; n, w, x, y, z, b1, b2, b3: INTEGER
      do
         if index = backlog.upper then
            input := url.input
            inspect
               size
            when 0 then
               -- no encoding set, it is an error to have a non-ASCII character
               input.read_character
               if not input.end_of_input then
                  if input.last_character.code > 0x7f then
                     at_error := True
                  else
                     backlog.add_last(input.last_character.code)
                  end
               end
            when 1 then
               -- ASCII and 8-bit pages
               input.read_character
               if not input.end_of_input then
                  backlog.add_last(input.last_character.code)
               end
            when 4 then
               -- UTF-8
               input.read_character
               if not input.end_of_input then
                  n := input.last_character.code
                  if n < 0x00000080 then
                     backlog.add_last(n)
                  else
                     breakpoint
                     input.read_character
                     if not input.end_of_input then
                        if n & 0x000000e0 = 0x000000c0 then
                           -- 2 bytes
                           y := n
                           input.read_character
                           if input.end_of_input then
                              backlog.add_last(unknown_character)
                           else
                              z := input.last_character.code
                              if z & 0x000000c0 = 0x00000080 then
                                 y := y & 0x0000001f
                                 z := z & 0x0000003f
                                 b1 := y |>>> 2
                                 b2 := ((y & 0x00000003) |<< 6) & z
                                 backlog.add_last(b1 | b2)
                              else
                                 backlog.add_last(unknown_character)
                              end
                           end
                        elseif n & 0x000000f0 = 0x000000e0 then
                           -- 3 bytes
                           x := n
                           input.read_character
                           if input.end_of_input then
                              backlog.add_last(unknown_character)
                           else
                              y := input.last_character.code
                              if y & 0x000000c0 = 0x00000080 then
                                 input.read_character
                                 if input.end_of_input then
                                    backlog.add_last(unknown_character)
                                 else
                                    z := input.last_character.code
                                    if z & 0x000000c0 = 0x00000080 then
                                       x := x & 0x0000000f
                                       y := y & 0x0000003f
                                       z := z & 0x0000003f
                                       b1 := (x |<< 4) & (y |>>> 2)
                                       b2 := ((y & 0x00000003) |<< 6) & z
                                       backlog.add_last(b1 | b2)
                                    else
                                       backlog.add_last(unknown_character)
                                    end
                                 end
                              else
                                 backlog.add_last(unknown_character)
                              end
                           end
                        elseif n & 0x000000f8 = 0x000000f0 then
                           -- 4 bytes
                           w := n
                           input.read_character
                           if input.end_of_input then
                              backlog.add_last(unknown_character)
                           else
                              x := input.last_character.code
                              input.read_character
                              if input.end_of_input then
                                 backlog.add_last(unknown_character)
                              else
                                 y := input.last_character.code
                                 if y & 0x000000c0 = 0x00000080 then
                                    input.read_character
                                    if input.end_of_input then
                                       backlog.add_last(unknown_character)
                                    else
                                       z := input.last_character.code
                                       if z & 0x000000c0 = 0x00000080 then
                                          w := w & 0x00000007
                                          x := x & 0x0000003f
                                          y := y & 0x0000003f
                                          z := z & 0x0000003f
                                          b1 := (w |<< 2) | (x |>>> 4)
                                          b2 := ((x & 0x0000000f) |<< 4) | (y |>> 2)
                                          b3 := ((y & 0x00000003) |<< 6) & z
                                          backlog.add_last(b1 | b2 | b3)
                                       else
                                          backlog.add_last(unknown_character)
                                       end
                                    end
                                 else
                                    backlog.add_last(unknown_character)
                                 end
                              end
                           end
                        else
                           -- invalid code
                           backlog.add_last(unknown_character)
                        end
                     end
                  end
               end
            when 8 then
               -- UTF-16
               not_yet_implemented
            end
         end
         if not at_error then
            index := index + 1

            if not end_of_input then
               if code = '%N'.code then
                  line := line + 1
                  column := 1
               else
                  column := column + 1
               end
            end
         end
      ensure
         at_error or else (not url.input.end_of_input implies backlog.valid_index(index))
         at_error or else (url.input.end_of_input implies index = backlog.upper + 1)
      end

   previous
      require
         is_connected
         index > 0
      local
         i: INTEGER
      do
         index := index - 1
         if code = '%N'.code then
            line := line - 1
            from
               column := 0
               i := index
            until
               i = 0 or else backlog.item(i) = '%N'.code
            loop
               column := column + 1
               i := i - 1
            end
         else
            column := column - 1
         end
      ensure
         not end_of_input
         backlog.valid_index(index)
      end

   save_position: UNICODE_PARSER_POSITION
      do
         Result.set(index, line, column)
      end

   restore_position (a_position: UNICODE_PARSER_POSITION)
      do
         index := a_position.index
         line := a_position.line
         column := a_position.column
      end

   set_index (a_index: like index)
      require
         valid_index(a_index)
      do
         index := a_index
      end

   valid_index (a_index: like index): BOOLEAN
      do
         Result := backlog.valid_index(index)
      end

   character: CHARACTER
      require
         is_connected
         is_character
      do
         Result := code.to_character
      ensure
         Result.code = code
      end

   code: INTEGER
      require
         is_connected
      do
         Result := backlog.item(index)
      end

   is_character: BOOLEAN
      require
         is_connected
      local
         i: INTEGER
      do
         i := code
         Result := i >= 0 and then i <= Maximum_character_code
      end

   append_substring_in (string: UNICODE_STRING; first, last: INTEGER)
      require
         string /= Void
         first <= last
         valid_index(first)
         valid_index(last)
      local
         i: INTEGER
      do
         from
            i := first
         until
            i > last
         loop
            string.extend(backlog.item(i))
            i := i + 1
         end
      end

feature {}
   backlog: FAST_ARRAY[INTEGER]
   size: INTEGER

feature {RECYCLING_POOL}
   recycle
      do
         if is_connected then
            disconnect
         end
      end

end -- class UNICODE_PARSER_BUFFER
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
