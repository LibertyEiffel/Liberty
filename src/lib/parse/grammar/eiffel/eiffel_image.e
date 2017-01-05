-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class EIFFEL_IMAGE

inherit
   PARSER_IMAGE
      redefine
         out_in_tagged_out_memory, is_equal
      end

feature {ANY}
   is_equal (other: like Current): BOOLEAN
         -- Redefined because Liberty Eiffel's default is_equal generates bad code in some strange situations
      do
         Result := position = other.position
            and then image.is_equal(other.image)
      end

feature {ANY}
   image: STRING
         -- the real image of the token

   blanks: STRING
         -- the leading blanks and comments (before the `image' itself)

   line: INTEGER
      do
         Result := position.line
      end

   column: INTEGER
      do
         Result := position.column
      end

   index: INTEGER
      do
         Result := position.index
      end

   out_in_tagged_out_memory
      do
         tagged_out_memory.append(image)
      end

feature {EIFFEL_IMAGE}
   position: EIFFEL_POSITION
         -- the position of the `image' (discarding the leading `blanks')

invariant
   image /= Void

end -- class EIFFEL_IMAGE
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
