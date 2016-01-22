-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class BINARY_INPUT_STREAM
   --
   -- A binary input stream is an input stream that is binary safe (meaning that, except for failure modes, 
   -- you can read back the very same sequence of bytes you wrote to that stream)
   --

inherit
   INPUT_STREAM

feature {ANY}
   read_byte
         -- Read a byte and assign it to `last_byte'.
      require
         is_connected
         not is_filtered
         can_read_character
      deferred
      end

   last_byte: INTEGER
         -- Last byte read with `read_byte'.
      require
         is_connected
         not end_of_input
         not is_filtered
      deferred
      end

   read_integer_16_native_endian
         -- Read in the same order as the machine running this code. If a
         -- 16-bits value is available, it's assigned to `last_integer_16'.
         -- The result is machine dependant.
      require
         is_connected
         not is_filtered
         can_read_character
      deferred
      end

   read_integer_16_big_endian
         -- Read a big endian value is the file. If a 16-bits value
         -- is available, it's assigned to `last_integer_16'.
      require
         is_connected
         not is_filtered
         can_read_character
      deferred
      end

   read_integer_16_little_endian
         -- Read a little endian value is the file. If a 16-bits value
         -- is available, it's assigned to `last_integer_16'.
      require
         is_connected
         not is_filtered
         can_read_character
      deferred
      end

   last_integer_16: INTEGER
         -- Last byte read with `read_integer_16_*'.
      require
         is_connected
         not end_of_input
         not is_filtered
      deferred
      end

   read_integer_32_native_endian
         -- Read in the same order as the machine running this code. If a
         -- 32-bits value is available, it's assigned to `last_integer_32'.
         -- The result is machine dependant.
      require
         is_connected
      deferred
      end

   read_integer_32_big_endian
         -- Read a big endian value is the file. If 32-bits value
         -- is available, it's assigned to `last_integer_32'.
      require
         is_connected
         not is_filtered
         can_read_character
      deferred
      end

   read_integer_32_little_endian
         -- Read a little endian value is the file. If a 32-bits value
         -- is available, it's assigned to `last_integer_32'.
      require
         is_connected
         not is_filtered
         can_read_character
      deferred
      end

   last_integer_32: INTEGER
      require
         is_connected
         not end_of_input
         not is_filtered
      deferred
      end

end -- class BINARY_INPUT_STREAM
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
