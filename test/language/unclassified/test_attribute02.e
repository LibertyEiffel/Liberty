-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class TEST_ATTRIBUTE02

insert
   EIFFELTEST_TOOLS

create {}
   main

feature {ANY}
   main
      do
         b := 5
         label_assert("a is self_init", a = 5)
      end

   a: INTEGER
         -- define an self-initializing attribute with contracts
         -- its body is executed on the first access the this member variable
      require
          b_is_set: b /= 0
      attribute
         Result := b
      ensure
         res: Result = b
         a: a = b
      end

   b: INTEGER
      


end -- class TEST_ATTRIBUTE02
--
-- Copyright (C) 2015-2016: by all the people cited in the AUTHORS file.
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
