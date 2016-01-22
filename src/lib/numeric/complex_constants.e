-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class COMPLEX_CONSTANTS
   -- Complex constants

feature {ANY} --
   complex (a_real, an_imaginary: REAL_64): COMPLEX_64
      do
         Result.set(a_real,an_imaginary)
      end

feature {ANY} -- Maths constants:
   i: COMPLEX_64
         -- complex i
      do
         Result.set(0.0, 1.0) -- set({REAL_32 0.0},{REAL_32 -1.0})
      end

   zero: COMPLEX_64
         -- zero
      do
         check
            Result.real = 0.0
            Result.imaginary = 0.0
         end
      end

   one: COMPLEX_64
      do
         Result.set(1.0,0.0)
      end

end -- class COMPLEX_CONSTANTS
--
-- Copyright (C) 2011-2016: Paolo Redaelli
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
