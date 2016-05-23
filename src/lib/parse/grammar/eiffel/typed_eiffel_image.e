-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class TYPED_EIFFEL_IMAGE[E_]

inherit
   EIFFEL_IMAGE

create {EIFFEL_GRAMMAR}
   make

feature {ANY}
   decoded: E_

feature {}
   make (a_image: like image; a_decoded: like decoded; a_blanks: like blanks; a_position: like position)
      require
         a_image /= Void
         a_decoded /= Void
      do
         image := a_image
         decoded := a_decoded
         blanks := a_blanks
         position := a_position
      ensure
         image = a_image
         decoded = a_decoded
         blanks = a_blanks
         position = a_position
      end

invariant
   decoded /= Void

end -- class TYPED_EIFFEL_IMAGE
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
