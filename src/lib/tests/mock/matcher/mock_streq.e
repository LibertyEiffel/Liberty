-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class MOCK_STREQ

inherit
   MOCK_TYPED_MATCHER[ABSTRACT_STRING]

insert
   SAFE_EQUAL[ABSTRACT_STRING]
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
            tagged_out_memory.extend('"')
            item.out_in_tagged_out_memory
            tagged_out_memory.extend('"')
         end
      end

feature {MOCK_EXPECTATION}
   match (a: MOCK_TYPED_ARGUMENT[ABSTRACT_STRING]): BOOLEAN
      do
         Result := test(item, a.item)
         if not Result then
            if item /= Void and then a.item /= Void then
               Result := item.out.is_equal(a.item.out)
            end
         end
      end

feature {}
   make (e: ABSTRACT_STRING)
      do
         item := e
      end

   item: ABSTRACT_STRING

end -- class MOCK_STREQ
--
-- Copyright (C) 2013-2017: Cyril ADRIAN <cyril.adrian@gmail.com>
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
