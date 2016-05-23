-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class READLINE_INPUT_STREAM
   --
   -- An input stream where the data is read from CLI using GNU Readline.
   --
   -- NOTE: the history is a singleton so there is really no point in creating more than
   -- one readline stream...
   --

inherit
   TERMINAL_INPUT_STREAM
      redefine
         valid_last_character, dispose
      end

insert
   READ_LINE
      rename
         read_line as gnu_readline,
         last_line as gnu_lastline
      end

create {ANY}
   make, make_no_history

feature {ANY}
   set_prompt (a_prompt: like prompt)
      require
         a_prompt /= Void
      do
         prompt := a_prompt
      end

   end_of_input: BOOLEAN
      do
         Result := gnu_lastline = Void or else offset > gnu_lastline.upper
      end

   is_connected: BOOLEAN

   must_disconnect: BOOLEAN False

   can_unread_character: BOOLEAN
      do
         Result := gnu_lastline /= Void and then offset >= gnu_lastline.lower
      end

   disconnect
      do
         filter := Void
         is_connected := False
      end

   valid_last_character: BOOLEAN
      do
         Result := gnu_lastline /= Void and then gnu_lastline.valid_index(offset)
      end

feature {FILTER_INPUT_STREAM}
   filtered_read_character
      do
         offset := offset + 1
         if gnu_lastline = Void or else offset > gnu_lastline.upper then
            gnu_readline
            if gnu_lastline /= Void then
               if keep_history and then not gnu_lastline.is_empty then
                  history.add(gnu_lastline)
               end
               gnu_lastline.extend('%N')
               offset := gnu_lastline.lower
            end
         end
      end

   filtered_unread_character
      do
         offset := offset - 1
      end

   filtered_last_character: CHARACTER
      do
         Result := gnu_lastline.item(offset)
      end

feature {FILTER}
   filtered_descriptor: INTEGER
      do
         std_error.put_string("READLINE_INPUT_STREAM.filtered_descriptor has been called!%N")
         crash
      end

   filtered_has_descriptor: BOOLEAN False

   filtered_stream_pointer: POINTER
      do
         std_error.put_string("READLINE_INPUT_STREAM.filtered_stream_pointer has been called!%N")
         crash
      end

   filtered_has_stream_pointer: BOOLEAN False

feature {}
   dispose
      do
         -- No need to force people to disconnect such a STREAM.
      end

   make
      do
         is_connected := True
         keep_history := True
      end

   make_no_history
      do
         is_connected := True
      end

   offset: INTEGER
   keep_history: BOOLEAN

end -- class READLINE_INPUT_STREAM
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
