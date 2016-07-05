-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class STD_INPUT_OUTPUT
   --
   -- To implement the good old `io' feature.
   --

inherit
   TERMINAL_INPUT_OUTPUT_STREAM
      redefine dispose
      end

create {ANY}
   make

feature {}
   make
      do
      end

feature {ANY}
   is_connected: BOOLEAN
      do
         -- Yes, it is an "and" and not an "or": it must be strong enough,
         -- otherwise the system won't work
         Result := std_input /= Void and then std_input.is_connected
            and then (std_output /= Void and then std_output.is_connected)
      end

   disconnect
      do
         std_input.disconnect
         std_output.disconnect
      end

feature {ANY}
   end_of_input: BOOLEAN
      do
         Result := std_input.end_of_input
      end

   can_unread_character: BOOLEAN
      do
         Result := std_input.can_unread_character
      end

feature {FILTER_INPUT_STREAM} -- input features:
   filtered_read_character
      do
         std_input.read_character
      end

   filtered_unread_character
      do
         std_input.unread_character
      end

   filtered_last_character: CHARACTER
      do
         Result := std_input.last_character
      end

feature {FILTER_OUTPUT_STREAM} -- output features:
   filtered_put_character (c: CHARACTER)
      do
         std_output.put_character(c)
      end

   filtered_flush
      do
         std_output.flush
      end

feature {FILTER} -- meaningless features:
   filtered_descriptor: INTEGER
      do
         std_error.put_string("STD_INPUT_OUTPUT.filtered_descriptor has been called!%N")
         crash
      end

   filtered_has_descriptor: BOOLEAN False

   filtered_stream_pointer: POINTER
      do
         std_error.put_string("STD_INPUT_OUTPUT.filtered_stream_pointer has been called!%N")
         crash
      end

   filtered_has_stream_pointer: BOOLEAN False

feature {}
   dispose
      do
         check
            io = Current
         end
         -- Nothing to dispose for `io'.
      end

invariant
   not_filtered: not input_is_filtered and not output_is_filtered

end -- class STD_INPUT_OUTPUT
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
