-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class SIMPLE_INPUT_OUTPUT_STREAM
   --
   -- Just a centralized access to and input stream and an output stream.
   --
   -- Note that it cannot be filtered itself (see invariant).
   --

inherit
   TERMINAL_INPUT_OUTPUT_STREAM

create {ANY}
   make

feature {}
   make (a_in: like in_stream; a_out: like out_stream)
      do
         in_stream := a_in
         out_stream := a_out
      end

   in_stream: INPUT_STREAM

   out_stream: OUTPUT_STREAM

feature {ANY}
   is_connected: BOOLEAN
      do
         -- Yes, it is an "and" and not an "or": it must be strong enough,
         -- otherwise the system won't work
         Result := in_stream /= Void and then in_stream.is_connected
            and then (out_stream /= Void and then out_stream.is_connected)
      end

   disconnect
      do
         in_stream.disconnect
         out_stream.disconnect
      end

feature {ANY}
   end_of_input: BOOLEAN
      do
         Result := in_stream.end_of_input
      end

   can_unread_character: BOOLEAN
      do
         Result := in_stream.can_unread_character
      end

feature {FILTER_INPUT_STREAM} -- input features:
   filtered_read_character
      do
         in_stream.read_character
      end

   filtered_unread_character
      do
         in_stream.unread_character
      end

   filtered_last_character: CHARACTER
      do
         Result := in_stream.last_character
      end

feature {FILTER_OUTPUT_STREAM} -- output features:
   filtered_put_character (c: CHARACTER)
      do
         out_stream.put_character(c)
      end

   filtered_flush
      do
         out_stream.flush
      end

feature {FILTER} -- meaningless features:
   filtered_descriptor: INTEGER
      do
         std_error.put_string("INPUT_OUTPUT_STREAM_CONNECTOR.filtered_descriptor has been called!%N")
         crash
      end

   filtered_has_descriptor: BOOLEAN False

   filtered_stream_pointer: POINTER
      do
         std_error.put_string("INPUT_OUTPUT_STREAM_CONNECTOR.filtered_stream_pointer has been called!%N")
         crash
      end

   filtered_has_stream_pointer: BOOLEAN False

invariant
   not_filtered: not input_is_filtered and not output_is_filtered

end -- class SIMPLE_INPUT_OUTPUT_STREAM
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
