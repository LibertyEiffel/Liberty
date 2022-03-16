-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class WORDS_OUTPUT_STREAM
   --
   -- Used to correctly wrap text at word boundaries
   --

inherit
   FILTER_OUTPUT_STREAM
      redefine disconnect
      end

create {ANY}
   make

feature {ANY}
   width: INTEGER
         -- The maximum width of the text to display

   disconnect
      local
         i: INTEGER
      do
         if not word.is_empty then
            flush_word
         elseif not spaces.is_empty then
            from
               i := spaces.lower
            until
               i > spaces.upper
            loop
               stream.filtered_put_character(spaces.item(i))
               i := i + 1
            end
            spaces.clear_count
         end
         Precursor
      end

feature {FILTER_OUTPUT_STREAM}
   filtered_put_character (c: CHARACTER)
      do
         inspect
            c
         when '%N' then
            if not word.is_empty then
               flush_word
            else
               spaces.clear_count
               tab := 0
            end
            stream.filtered_put_character(c)
            pos := 0
         when '%T' then
            if not word.is_empty then
               flush_word
            end
            spaces.extend(c)
            tab := tab + 1
         when ' ', '%R', '%U', '%F' then
            if not word.is_empty then
               flush_word
            end
            spaces.extend(c)
         else
            word.extend(c)
         end
      end

   filtered_flush
         -- '''Note''': can be dangerous because it does not take word boundaries into account!
      do
         if not word.is_empty then
            flush_word
         end
      end

feature {}
   local_can_disconnect: BOOLEAN True

feature {ANY}
   make (a_width: like width)
      require
         a_width > 0
         not is_connected
      do
         if word = Void then
            create word.make_empty
            create spaces.make_empty
         end
         width := a_width
      ensure
         width = a_width
      end

feature {}
   word: STRING

   spaces: STRING

   pos: INTEGER

   tab: INTEGER

   flush_word
      require
         is_connected
         not word.is_empty
      local
         i: INTEGER; c: CHARACTER
      do
         if pos + spaces.count + word.count + 7 * tab < width then
            from
               i := spaces.lower
            until
               i > spaces.upper
            loop
               c := spaces.item(i)
               if c = '%T' then
                  from
                     stream.filtered_put_character(' ')
                     pos := pos + 1
                  until
                     pos \\ 8 = 0
                  loop
                     stream.filtered_put_character(' ')
                     pos := pos + 1
                  end
               else
                  stream.filtered_put_character(c)
                  pos := pos + 1
               end
               i := i + 1
            end
         else
            stream.filtered_put_character('%N')
            pos := 0
            if spaces.count > 1 then
               from
                  i := spaces.lower
               until
                  i > spaces.upper
               loop
                  c := spaces.item(i)
                  pos := pos + 1
                  stream.filtered_put_character(c)
                  i := i + 1
               end
               pos := pos + spaces.count
            end
         end
         from
            i := word.lower
         until
            i > word.upper
         loop
            stream.filtered_put_character(word.item(i))
            i := i + 1
         end
         pos := pos + word.count
         tab := 0
         spaces.clear_count
         word.clear_count
      ensure
         word.is_empty
         spaces.is_empty
         tab = 0
      end

invariant
   width > 0
   not spaces.has('%N')
   spaces.for_all(agent {CHARACTER}.is_separator)
   not word.exists(agent {CHARACTER}.is_separator)

end -- class WORDS_OUTPUT_STREAM
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
