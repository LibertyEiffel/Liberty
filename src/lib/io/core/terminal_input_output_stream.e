-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class TERMINAL_INPUT_OUTPUT_STREAM
   --
   -- A stream that is at the same time an input stream and an output stream.
   --

inherit
   TERMINAL_INPUT_STREAM
      rename filter as input_filter,
         set_filter as set_input_filter,
         is_filtered as input_is_filtered,
         detach as detach_input
      redefine can_disconnect, new_url
      end
   TERMINAL_OUTPUT_STREAM
      rename filter as output_filter,
         set_filter as set_output_filter,
         is_filtered as output_is_filtered,
         detach as detach_output
      redefine can_disconnect, new_url
      end
   FILTERABLE
      redefine
         is_filtered, set_filter
      end

feature {ANY}
   can_disconnect: BOOLEAN True

   detach
         -- Detach the input and the output
         --
         -- See also `detach_input', `detach_output'.
      do
         detach_output
         detach_input
      end

   is_filtered: BOOLEAN
         -- Is one of the input or output streams filtered?
         --
         -- See also `is_input_filtered', `is_output_filtered'
      do
         Result := input_is_filtered or else output_is_filtered
      end

   set_filter (a_filter: like filter)
         -- Don't use (use `set_input_filter' or `set_output_filter')
      do
         check
            False
         end
      end

feature {}
   new_url: URL
      do
         create Result.from_stream(Current, True, True)
      end

invariant
   filter = Void

end -- class TERMINAL_INPUT_OUTPUT_STREAM
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
