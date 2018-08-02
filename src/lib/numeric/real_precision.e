-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class REAL_PRECISION

feature {ANY}
   set_precision (a_precision: like precision)
         -- Set the mantissa precision, used by the `~=' operator
         -- The nearer to 0, the more precise.
      require
         a_precision >= 0
      do
         precision_ref.set_item(a_precision)
      ensure
         precision = a_precision
      end

   precision: INTEGER_8
      do
         Result := precision_ref.item
      ensure
         Result >= 0
      end

feature {}
   precision_ref: REFERENCE[INTEGER_8]
      once
         create Result.set_item(3)
      end

end -- class REAL_PRECISION
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
