-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class MESSAGE_FORMATTER[E_, F_->TRAVERSABLE[E_]]

feature {ANY}
   put_message (message: TRAVERSABLE[E_]; arguments: TRAVERSABLE[F_])
      local
         i, backtrack_i: INTEGER
         index: INTEGER
         state: INTEGER
         ch: E_
      do
         from
            i := message.lower
         until
            i > message.upper
         loop
            from
            until
               i > message.upper
            loop
               ch := message.item(i)
               inspect
                  state
               when -1 then -- Always print
                  put(ch)
                  state := 0
               when 0 then -- Normal state
                  if ch.is_equal(delimiter) then
                     backtrack_i := i - 1
                     state := 1
                  else
                     put(ch)
                  end
               when 1 then -- After @
                  if ch.is_equal(delimiter) then
                     put(ch)
                     state := 0
                  elseif ch.is_equal(opening_brace) then
                     index := 0
                     state := 2
                  else
                     i := backtrack_i
                     state := -1
                  end
               when 2 then -- After @(
                  if is_digit(ch) then
                     index := index * 10 + value(ch)
                  elseif ch.is_equal(closing_brace) and then arguments.valid_index(index) then
                     put_item(arguments.item(index))
                     state := 0
                  else
                     i := backtrack_i
                     state := -1
                  end
               end
               i := i + 1
            end
            check
               i >= 0
            end
            if state > 0 then
               i := backtrack_i + 1
               state := -1
            end
         end
      end

feature {}
   put (e: E_)
      deferred
      end

   put_item (item: F_)
      deferred
      end

feature {}
   delimiter: E_
      deferred
      end

   opening_brace: E_
      deferred
      end

   closing_brace: E_
      deferred
      end

   is_digit (e: E_): BOOLEAN
      deferred
      end

   value (e: E_): INTEGER
      require
         is_digit(e)
      deferred
      end

end -- class MESSAGE_FORMATTER
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
