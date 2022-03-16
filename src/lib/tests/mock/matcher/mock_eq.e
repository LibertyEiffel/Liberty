-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class MOCK_EQ[E_]

inherit
   MOCK_TYPED_MATCHER[E_]

insert
   SAFE_EQUAL[E_]
      redefine
         out_in_tagged_out_memory
      end

create {ANY}
   make

feature {ANY}
   out_in_tagged_out_memory
      do
         if item = Void then
            tagged_out_memory.append(once "Void")
         else
            item.out_in_tagged_out_memory
         end
      end

feature {MOCK_EXPECTATION}
   match (a: MOCK_TYPED_ARGUMENT[E_]): BOOLEAN
      do
         Result := test(item, a.item)
      end

feature {}
   make (e: E_)
      do
         item := e
      end

   item: E_

end -- class MOCK_EQ
--
-- Copyright (C) 2013-2022: Cyril ADRIAN <cyril.adrian@gmail.com>
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
