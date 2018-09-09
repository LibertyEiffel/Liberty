-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class FUNCTION[O_ -> TUPLE, R_]
   --
   -- Where O_ represents open arguments (i.e. arguments which are delayed) and where R_ is for the result
   -- type of the delayed call.
   --

inherit
   ROUTINE[O_]

feature {ANY}
   item alias "()" (o: O_): R_
         -- Result of calling feature with all its operands, using `o' for the open operands.
      external "built_in"
      end

   call (o: O_)
         -- For compatibility only.
      obsolete "This feature should not be used: the result is lost."
      external "built_in"
      end

end -- class FUNCTION
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
