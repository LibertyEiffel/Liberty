-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class BINARY_OUTPUT_STREAM
   --
   -- A binary output stream is an output stream that is binary safe (meaning that, except for failure modes,
   -- you can read back the very same sequence of bytes you wrote to that stream)
   --

inherit
   OUTPUT_STREAM

feature {ANY}
   put_byte (byte: INTEGER)
      require
         is_connected
      deferred
      end

   put_integer_16_native_endian (i: INTEGER_16)
         -- Write in the same order as the machine running this code.
         -- The result is machine dependant.
      require
         is_connected
      deferred
      end

   put_integer_16_big_endian (i: INTEGER_16)
         -- Write `i' in big endian mode.
         -- The result is machine independent.
      require
         is_connected
      deferred
      end

   put_integer_16_little_endian (i: INTEGER_16)
         -- Write `i' in little endian mode.
         -- The result is machine independent.
      require
         is_connected
      deferred
      end

   put_integer_32_native_endian (i: INTEGER_32)
         -- Write in the same order as the machine running this code.
         -- The result is machine dependant.
      require
         is_connected
      deferred
      end

   put_integer_32_big_endian (i: INTEGER_32)
         -- Write `i' in big endian mode.
         -- The result is machine independent.
      require
         is_connected
      deferred
      end

   put_integer_32_little_endian (i: INTEGER_32)
         -- Write `i' in little endian mode.
         -- The result is machine independent.
      require
         is_connected
      deferred
      end

end -- class BINARY_OUTPUT_STREAM
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
