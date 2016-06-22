-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class INPUT_STREAM_TOOLS

feature {ANY}
   read_character
         -- If `read_character' fail, `end_of_input' is set. Else, use `last_character'.
         -- Read tutorial or io cluster documentation to learn the `read_character' usage pattern.
      require
         is_connected
         not is_filtered and then can_read_character
      deferred
      ensure
         not end_of_input implies valid_last_character
      end

   read_line_in (buffer: STRING)
         -- Same job as `read_line' but storage is directly done in `buffer'.
         -- Read tutorial or io cluster documentation to learn the `read_line' usage pattern.
      require
         is_connected
         not is_filtered and then can_read_line
         buffer /= Void
      deferred
      end

   read_available_in (buffer: STRING; limit: INTEGER)
         -- Same job as `read_available' but storage is directly done in `buffer'.
         -- The usage pattern is the same as for `read_line'.
      require
         is_connected
         not is_filtered
         buffer /= Void
         limit > 0
      deferred
      end

   unread_character
      require
         is_connected
         not is_filtered and then can_unread_character
      deferred
      end

   last_character: CHARACTER
      require
         is_connected
         not end_of_input
         not is_filtered and then valid_last_character
      deferred
      end

   can_read_character: BOOLEAN
         -- Note that this state is usually temporary. Usually it is called until either it becomes True or
         -- the stream is disconnected:
         --
         --  from
         --  until
         --     stream.can_read_character or else not stream.is_connected
         --  loop
         --     -- some "still waiting..." code, maybe a sandglass?
         --  end
         --  if stream.is_connected then
         --     stream.read_character
         --  end
         --
         -- See also: `is_connected', `end_of_input'
      require
         is_connected
      deferred
      ensure
         Result implies not end_of_input
      end

   can_read_line: BOOLEAN
      require
         is_connected
      deferred
      end

   can_unread_character: BOOLEAN
      require
         is_connected
         valid_last_character
      deferred
      end

   valid_last_character: BOOLEAN
      require
         is_connected
      deferred
      end

   end_of_input: BOOLEAN
         -- `end_of_input' means the previous attempt in character reading failed because the end has been
         -- reached. So `last_character' is not valid and you are not allowed to do any read attempt
         -- anymore.
         --
         -- '''Notes:'''
         -- * Just after a successful connect, `end_of_input' is always False because you did not yet read
         -- anything).
         -- * Once the end of input has been reached, this is definitive in that no more characters will ever
         -- be provided (but of course you can still come back if `can_unread_character'; `end_of_input'
         -- will be changed if you `unread_character'). In that, it is different from `can_read_character'
         -- which is only a temporary state.
         --
         -- Please refer to the Liberty Eiffel FAQ or tutorial/io examples.
      deferred
      end

   is_filtered: BOOLEAN
      deferred
      end

   is_connected: BOOLEAN
      deferred
      end

feature {ANY} -- Skipping separators:
   skip_separators
         -- Skip all separators (see `is_separator' of class CHARACTER) and make the first non-separator
         -- available in `last_character'. This non-separator character is pushed back into the stream (see
         -- `unread_character') to be available one more time (the next `read_character' will consider this
         -- non-separator). When `end_of_input' occurs, this process is automatically stopped.
      require
         is_connected
         not is_filtered
      do
         from
            read_character
         until
            end_of_input or else not last_character.is_separator
         loop
            read_character
         end
         if not end_of_input then
            unread_character
         end
      end

   skip_separators_using (separators: STRING)
         -- Same job as `skip_separators' using the `separators' set.
      require
         is_connected
         not is_filtered
         separators /= Void
      do
         from
            read_character
         until
            end_of_input or else not separators.has(last_character)
         loop
            read_character
         end
         if not end_of_input and then can_unread_character then
            unread_character
         end
      end

   skip_remainder_of_line
         -- Skip all the remainder of the line including the end of line delimiter itself.
      require
         is_connected
         not is_filtered
      local
         stop: BOOLEAN
      do
         from
         until
            stop
         loop
            if end_of_input then
               stop := True
            else
               inspect
                  last_character -- See for example: http://www.mrx.net/c/introduction.html
               when '%N' then
                  -- UNIX format
                  stop := True
               when '%R' then
                  read_character
                  if not end_of_input then
                     if last_character = '%N' then
                        -- DOS format
                     end
                  end
                  stop := True
               else
                  read_character
               end
            end
         end
      end

feature {ANY} -- To read one number at a time:
   read_integer
         -- Read an integer according to the Eiffel syntax.  Make result available in `last_integer'.  Heading
         -- separators are automatically skipped using `is_separator' of class CHARACTER.  Trailing separators
         -- are not skipped.
      require
         is_connected
         not is_filtered
      local
         state: INTEGER; sign: BOOLEAN
      do
         -- state = 0 : waiting sign or first digit.
         -- state = 1 : sign read, waiting first digit.
         -- state = 2 : in the number.
         -- state = 3 : end state.
         -- state = 4 : error state.
         from
         until
            state > 2
         loop
            read_character
            if end_of_input then
               inspect
                  state
               when 0 .. 1 then
                  state := 4
               when 2 then
                  state := 3
                  -- no else, because state > 2 is impossible
               end
            else
               inspect
                  state
               when 0 then
                  if last_character.is_separator then
                  elseif last_character.is_digit then
                     last_integer := last_character.value
                     state := 2
                  elseif last_character = '-' then
                     sign := True
                     state := 1
                  elseif last_character = '+' then
                     state := 1
                  else
                     state := 4
                  end
               when 1 then
                  if last_character.is_separator then
                  elseif last_character.is_digit then
                     last_integer := last_character.value
                     state := 2
                  else
                     state := 4
                  end
               else
                  if last_character.is_digit then
                     last_integer := last_integer * 10 + last_character.value
                  else
                     state := 3
                  end
               end
            end
         end
         if can_unread_character and then not end_of_input then
            unread_character
         end
         valid_last_integer := state /= 4
         if sign then
            last_integer := -last_integer
         end
      ensure
         old end_of_input implies end_of_input and then not valid_last_integer
      end

   last_integer: INTEGER
         -- Last integer read using `read_integer'.

   valid_last_integer: BOOLEAN
         -- Was the last call to `read_integer' successful ?

   last_real: REAL
         -- Last real read with `read_real'.

   valid_last_real: BOOLEAN
         -- Was the last call to `read_real' successful ?

   read_real
         -- Read a REAL and make the result available in `last_real'.
      require
         is_connected
         not is_filtered
      local
         state: INTEGER; sign: BOOLEAN
      do
         -- state = 0 : waiting sign or first digit.
         -- state = 1 : sign read, waiting first digit.
         -- state = 2 : in the integral part.
         -- state = 3 : in the fractional part.
         -- state = 4 : read 'E' or 'e' for scientific notation
         -- state = 5 : read sign of exponent
         -- state = 6 : in exponent
         -- state = 7 : end state.
         -- state = 8 : error state.
         from
            last_string.clear_count
         until
            state >= 7
         loop
            read_character
            if end_of_input then
               inspect
                  state
               when 2, 3, 6, 7 then
                  state := 7
               else
                  state := 8
               end
            else
               inspect
                  state
               when 0 then
                  if last_character.is_separator then
                  elseif last_character.is_digit then
                     last_string.add_last(last_character)
                     state := 2
                  elseif last_character = '-' then
                     sign := True
                     state := 1
                  elseif last_character = '+' then
                     state := 1
                  elseif last_character = '.' then
                     last_string.add_last(last_character)
                     state := 3
                  else
                     state := 8
                  end
               when 1 then
                  if last_character.is_separator then
                  elseif last_character.is_digit then
                     last_string.add_last(last_character)
                     state := 2
                  elseif last_character = '.' then
                     last_string.add_last(last_character)
                     state := 3
                  else
                     state := 8
                  end
               when 2 then
                  if last_character.is_digit then
                     last_string.add_last(last_character)
                  elseif last_character = '.' then
                     last_string.add_last(last_character)
                     state := 3
                  elseif (once "eE").has(last_character) then
                     last_string.add_last(last_character)
                     state := 4
                  else
                     state := 7
                  end
               when 3 then
                  if last_character.is_digit then
                     last_string.add_last(last_character)
                  elseif (once "eE").has(last_character) then
                     last_string.add_last(last_character)
                     state := 4
                  else
                     state := 7
                  end
               when 4 then
                  if last_character.is_separator then
                     state := 8
                  elseif last_character.is_digit then
                     last_string.add_last(last_character)
                     state := 6
                  elseif (once "+-").has(last_character) then
                     last_string.add_last(last_character)
                     state := 5
                  else
                     state := 8
                  end
               when 5 then
                  if last_character.is_digit then
                     last_string.add_last(last_character)
                     state := 6
                  else
                     state := 8
                  end
               when 6 then
                  if last_character.is_digit then
                     last_string.add_last(last_character)
                  else
                     state := 7
                  end
               end
            end
         end
         if not end_of_input and then can_unread_character then
            unread_character
         end
         valid_last_real := state /= 8
         if last_string.count > 0 then
            -- Wouldn't "if valid_last_real then" be better ? <FM-06/07/2005>
            last_real := last_string.to_real
         else
            last_real := 0 -- NaN
         end
         if sign then
            last_real := -last_real
         end
      ensure
         old end_of_input implies end_of_input and then not valid_last_real
      end

feature {ANY} -- To read one line or one word at a time:
   last_string: STRING
         -- Access to the unique common buffer to get for example the result computed by `read_line',
         -- `read_word', `newline', etc. This is a once function (the same common buffer is used for all
         -- streams).
      once
         create Result.make(1024)
      end

   read_line
         -- Read a complete line ended by '%N' or `end_of_input'. Make the result available in `last_string'
         -- common buffer. The end of line character (usually '%N') is not added in the `last_string' buffer.
         -- Read tutorial or io cluster documentation to learn the read_line usage pattern.
         --
         -- See also `read_line_in'.
      require
         is_connected
         not is_filtered
      do
         last_string.clear_count
         read_line_in(last_string)
      end

   read_available (limit: INTEGER)
         -- Read as many characters as possible, as long as the stream does not block and up to the given limit.
         --
         -- See also `read_available_in'.
      require
         is_connected
         not is_filtered
      do
         last_string.clear_count
         read_available_in(last_string, limit)
      end

   read_word
         -- Read a word using `is_separator' of class CHARACTER. The result is available in the `last_string'
         -- common buffer. Heading separators are automatically skipped. Trailing separators are not skipped
         -- (`last_character' is left on the first one). If `end_of_input' is encountered, Result can be the
         -- empty string.
      require
         is_connected
         not is_filtered
      do
         skip_separators
         if not end_of_input then
            read_character
         end
         from
            last_string.clear_count
         until
            end_of_input or else last_character.is_separator
         loop
            last_string.extend(last_character)
            read_character
         end
      end

   newline
         -- Consume input until newline ('%N') is found. The corresponding STRING is stored in `last_string'
         -- common buffer.
      require
         is_connected
         not is_filtered
      local
         stop: BOOLEAN
      do
         from
            last_string.clear_count
            stop := end_of_input
         until
            stop
         loop
            read_character
            if end_of_input or else last_character = '%N' then
               stop := True
            else
               last_string.extend(last_character)
            end
         end
      end

   reach_and_skip (keyword: STRING)
         -- Try to skip enough characters in order to reach the `keyword' which is skipped too. If the
         -- `keyword' is not in the remainder of this stream, the process is stopped as soon as `end_of_input'
         -- occurs.
      require
         is_connected
         not is_filtered
         not keyword.is_empty
      local
         stop: BOOLEAN; i: INTEGER; first: CHARACTER
      do
         from
            last_string.clear_count
            first := keyword.first
         until
            end_of_input or else stop
         loop
            -- Reach the first character of the `keyword':
            from
               i := 2
            until
               i > last_string.count or else last_string.item(i) = first
            loop
               i := i + 1
            end
            if i <= last_string.count then
               last_string.remove_head(i - 1)
            else
               last_string.clear_count
               from
                  if not end_of_input then
                     read_character
                  end
               until
                  end_of_input or else last_character = first
               loop
                  read_character
               end
               last_string.extend(first)
            end
            check
               not end_of_input implies last_string.item(1) = first
               last_string.count <= keyword.count
            end
            -- Now we need as many characters as in `keyword':
            if not (end_of_input or else last_string.count = keyword.count) then
               from
                  read_character
               until
                  end_of_input or else last_string.count = keyword.count - 1
               loop
                  last_string.extend(last_character)
                  read_character
               end
               if not end_of_input then
                  last_string.extend(last_character)
               end
            end
            stop := last_string.is_equal(keyword)
         end
         if not end_of_input then
            read_character
            unread_character
         end
      ensure
         not end_of_input implies last_string.is_equal(keyword)
      end

feature {ANY} -- Other features:
   read_word_using (separators: STRING)
         -- Same job as `read_word' using `separators'.
      require
         is_connected
         not is_filtered
         separators /= Void
      do
         skip_separators_using(separators)
         if not end_of_input then
            read_character
         end
         from
            last_string.clear_count
         until
            end_of_input or else separators.has(last_character)
         loop
            last_string.extend(last_character)
            read_character
         end
      end

   read_tail_in (str: STRING)
         -- Read all remaining character of the stream in `str'.
      require
         is_connected
         not is_filtered
         str /= Void
      do
         from
         until
            end_of_input
         loop
            read_character
            if not end_of_input then
               str.extend(last_character)
            end
         end
      ensure
         end_of_input
      end

feature {}
   io_getc (stream: POINTER): INTEGER
      external "plug_in"
      alias "{
    location: "${sys}/plugins"
    module_name: "io"
    feature_name: "io_getc"
    }"
      end

   io_ungetc (byte: CHARACTER; stream: POINTER)
      external "plug_in"
      alias "{
    location: "${sys}/plugins"
    module_name: "io"
    feature_name: "io_ungetc"
    }"
      end

   io_fread (buf: NATIVE_ARRAY[CHARACTER]; size: INTEGER; stream: POINTER): INTEGER
         -- return size read or 0 if end of input (-1 on error => exception ?)
      external "plug_in"
      alias "{
    location: "${sys}/plugins"
    module_name: "io"
    feature_name: "io_fread"
    }"
      end

   eof: INTEGER
      external "plug_in"
      alias "{
    location: "${sys}/plugins"
    module_name: "io"
    feature_name: "EOF"
    }"
      end

end -- class INPUT_STREAM_TOOLS
--
-- Copyright (C) 2009-2016: by all the people cited in the AUTHORS file.
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
