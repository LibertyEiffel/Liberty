-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class MINI_PARSER_BUFFER
   --
   -- Useful and efficient mini parsing buffer.
   -- From the user point of view, an object of this class can be considered
   -- as the combination of a STRING to be parsed with an extra INTEGER
   -- index to memorize the current position in this STRING.
   --

insert
   STRING_HANDLER
      redefine
         default_create
      end

create {ANY}
   default_create, initialize_with

feature {ANY}
   initialize_with (string: ABSTRACT_STRING)
         -- Initialize the `Current' buffer interning `string'.
      require
         string /= Void
      do
         if memory = Void then
            memory := default_memory
         end
         storage := string.intern
         current_index := storage.lower
         last_error := Void
      ensure
         count = string.count
         last_error = Void
      end

   next
         -- Move the `current_index' forward by one.
      require
         not end_reached
      do
         current_index := current_index + 1
      ensure
         current_index = 1 + old current_index
      end

   skip_separators
         -- Skip all separators by using `is_separator' of class CHARACTER.
      local
         stop: BOOLEAN
      do
         from
         until
            stop
         loop
            if current_index > upper then
               stop := True
            elseif storage.item(current_index).is_separator then
               current_index := current_index + 1
            else
               stop := True
            end
         end
      end

   last_error: PARSE_ERROR
         -- Can be used to memorize an error message.

   set_last_error (error: like last_error)
      do
         last_error := error
      ensure
         last_error = error
      end

   set_last_error_message (error_message: STRING)
      do
         create last_error.make(current_index, error_message, last_error)
      ensure
         last_error.message = error_message
      end

   set_current_index (new_index: like current_index)
         -- To be able to move (usually back) in the buffer
      require
         new_index.in_range(lower, upper + 1)
      do
         current_index := new_index
      ensure
         current_index = new_index
      end

   print_position_on (stream: OUTPUT_STREAM)
      require
         stream.is_connected
      local
         i, nl_index: INTEGER; c: CHARACTER
         space: STRING
      do
         from
            i := storage.lower
         until
            i = current_index
         loop
            if storage.item(i) = '%N' then
               nl_index := i
            end
            i := i + 1
         end
         from
            space := once ""
            space.clear_count
            i := nl_index + 1
         until
            i > storage.upper or else storage.item(i) = '%N'
         loop
            c := storage.item(i)
            if i < current_index then
               if c = '%T' then
                  space.extend('%T')
               else
                  space.extend(' ')
               end
            end
            stream.put_character(c)
            i := i + 1
         end
         stream.put_new_line
         stream.put_string(space)
         stream.put_character('^')
         stream.put_new_line
      end

feature {ANY} -- Memo
   set_memory (a_memory: like memory)
      require
         a_memory /= Void
      do
         memory := a_memory
      ensure
         memory = a_memory
      end

   memo: INTEGER
      do
         Result := memory.memo(Current)
      end

   restore (a_memo: like memo)
      do
         memory.restore(a_memo, Current)
      end

   memory: MINI_PARSER_MEMORY

feature {ANY} -- Queries
   lower: INTEGER
      do
         Result := storage.lower
      end

   upper: INTEGER
         -- Maximum valid index in storage.
      do
         Result := storage.upper
      end

   count: INTEGER
         -- The length of the `Current' buffer which is also the maximum valid index.
      do
         Result := storage.count
      end

   capacity: INTEGER
         -- Of `storage'.
      do
         Result := storage.capacity
      end

   current_index: INTEGER
         -- Index of the current character.

   current_character: CHARACTER
         -- The current character (the one at `current_index').
      require
         current_index.in_range(lower, upper + 1)
      do
         Result := storage.item(current_index)
      end

   end_reached: BOOLEAN
         -- Is the end of the buffer reached?
      do
         Result := current_index > upper
         if Result then
            marked := True
         end
      ensure
         Result = (current_index > upper)
         Result implies marked
      end

   marked: BOOLEAN

   clear_mark
      do
         marked := False
      ensure
         not marked
      end

feature {}
   storage: FIXED_STRING
         -- The `storage' area to be parsed.

   default_create
      do
         memory := default_memory
      end

   default_memory: DEFAULT_MINI_PARSER_MEMORY
      once
         create Result
      end

invariant
   memory /= Void

end -- class MINI_PARSER_BUFFER
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
