-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class HASHABLE
   --
   -- Ancestor class for all hashable objects.
   --
   -- For example, the `hash_code' is needed for HASHED_DICTIONARY and for HASHED_SET.  Thus, most standard
   -- objects are HASHABLE (STRING, REAL, INTEGER_8, INTEGER_16, INTEGER_32, INTEGER_64, POINTER, NUMBER,
   -- MUTABLE_BIG_INTEGER, and so forth).
   --

insert
   ANY
      redefine is_equal
      end

feature {ANY}
   hash_code: INTEGER
         -- The hash-code value of `Current'.
      deferred
      ensure
         good_hash_value: Result >= 0
      end

   is_equal (other: like Current): BOOLEAN
      deferred
      ensure then
         Result implies hash_code = other.hash_code
      end

end -- class HASHABLE
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
