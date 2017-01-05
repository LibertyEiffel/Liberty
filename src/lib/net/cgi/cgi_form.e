-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
class CGI_FORM

create {ANY}
   default_create, parse

feature {ANY}
   form: MAP[FIXED_STRING, FIXED_STRING]
      do
         Result := form_memory
      end

   parse (stream: INPUT_STREAM)
      require
         form = Void
      local
         key, value: STRING; state, escape: INTEGER_8
      do
         from
            create form_memory.make
            key := once ""
            state := 0
            key.clear_count
            stream.read_character
         until
            stream.end_of_input or else state < 0
         loop
            inspect
               state
            when 0 then -- reading key
               inspect
                  stream.last_character
               when '=' then
                  state := 1
                  value := once ""
                  value.clear_count
               else
                  key.extend(stream.last_character)
               end
            when 1 then -- reading value
               inspect
                  stream.last_character
               when '&', '%N' then
                  form_memory.add(value.intern, key.intern)
                  state := 0
                  key.clear_count
               when '%%' then
                  state := 2
               else
                  value.extend(stream.last_character)
               end
            when 2 then -- reading escape #1
               if stream.last_character.is_hexadecimal_digit then
                  escape := stream.last_character.hexadecimal_value
                  state := 3
               else
                  state := -1
               end
            when 3 then -- reading escape #2
               if stream.last_character.is_hexadecimal_digit then
                  escape := escape * 0x10 + stream.last_character.hexadecimal_value
                  value.extend(escape.to_character)
                  state := 1
               else
                  state := -1
               end
            end
            stream.read_character
         end
         if state > 0 then
            form_memory.add(value.intern, key.intern)
         end
      ensure
         form /= Void
      end

feature {}
   form_memory: HASHED_DICTIONARY[FIXED_STRING, FIXED_STRING]

end -- class CGI_FORM
--
-- Copyright (C) 2009-2017: by all the people cited in the AUTHORS file.
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
