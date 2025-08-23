-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class NUMERIC
   --
   -- This class describes a ring.
   --

inherit
   HASHABLE -- *** Here ? Weird ! *** 3th feb 2006 *** Fred + Guillem + Dom ***

feature {ANY}
   infix "+" (other: like Current): like Current
         -- Sum with `other' (commutative).
      deferred
      end

   infix "-" (other: like Current): like Current
         -- Result of subtracting `other'.
      deferred
      end

   infix "*" (other: like Current): like Current
         -- Product by `other'.
      deferred
      end

   infix "/" (other: like Current): NUMERIC
         -- Division by `other'.
      require
         other /= Void
         other /= zero
      deferred
      end

   prefix "+": like Current
         -- Unary plus of `Current'.
      deferred
      end

   prefix "-": like Current
         -- Unary minus of `Current'.
      deferred
      end

   divisible (other: like Current): BOOLEAN
         -- May `Current' be divided by `other' ?
      require
         other /= Void
      deferred
      end

   one: like Current
         -- Neutral element for "*" and "/".
      deferred
      end

   zero: like Current
         -- Neutral element for "+" and "-".
      deferred
      end

   sign: INTEGER_8
         -- Sign of Current (0 -1 or 1).
      deferred
      ensure
         Result.in_range(-1, 1)
      end

end -- class NUMERIC
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
