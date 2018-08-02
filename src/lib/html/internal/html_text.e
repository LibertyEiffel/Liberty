-- See the Copyright notice at the end of this file.
--
class HTML_TEXT

inherit
   HTML_ELEMENT

create {HTML_PARSER}
   make

feature {ANY}
   text: STRING

feature {HTML_ELEMENT}
   really_append_in (buffer: STRING; stop_at_dot, stopped: BOOLEAN): BOOLEAN
      local
         i: INTEGER; s: STRING
      do
         check
         -- require then
            not stopped
         end
         Result := stopped
         if stop_at_dot then
            i := text.first_index_of('.')
            if i = 0 then
               buffer.append(text)
            else
               s := once ""
               s.copy_substring(text, 1, i)
               buffer.append(s)
               Result := True
            end
         else
            buffer.append(text)
         end
      ensure then
         Result implies buffer.last = '.'
      end

   really_to_html_stream (html: HTML_OUTPUT_STREAM; stop_at_dot, stopped: BOOLEAN): BOOLEAN
      local
         i, depth: INTEGER; entity: STRING; c: CHARACTER; in_entity, stop_now: BOOLEAN
      do
         from
            i := text.lower
         until
            stop_now or else i > text.upper
         loop
            c := text.item(i)
            if in_entity then
               check
                  entity /= Void
               end
               if c = ';' then
                  html.put_entity(entity)
                  in_entity := False
               else
                  entity.extend(c)
               end
            else
               inspect
                  c
               when '&' then
                  entity := once ""
                  entity.clear_count
                  in_entity := True
               when '.', '!', '?' then
                  Result := stop_at_dot
                  html.put_character(c)
               when 'A' .. 'Z', 'a' .. 'z', '0' .. '9' then
                  html.put_character(c)
                  Result := False
               when '(', '[', '{' then
                  depth := depth + 1
                  html.put_character(c)
               when ')', ']', '}' then
                  depth := depth - 1
                  html.put_character(c)
               else
                  html.put_character(c)
               end
               if Result and then depth = 0 and then (i = text.upper or else text.item(i + 1) = ' ') then
                  stop_now := True
               end
            end
            i := i + 1
         end
      end

feature {}
   make (a_text: like text; a_parent: like parent)
      require
         a_text /= Void
      do
         text := a_text
         parent := a_parent
         if parent /= Void then
            parent.add_child(Current)
         end
      end

end -- class HTML_TEXT
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
