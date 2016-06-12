-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_WEAK_REF00
   -- very simple test case for weak references, to test, that the 
   -- item is set correctly

insert
   MEMORY
   EIFFELTEST_TOOLS
   
create {}
   make

feature {}
   make
      local
         s: STRING
         w, w2: WEAK_REFERENCE[STRING]
      do
         s := "some text%N"
         collection_off
         create w.set_item(s)

         -- garbage colelction is switched off above, so
         -- the weak reference cannot be freed
         label_assert("reference set 1", w.item = s)

         if w.item /= Void then
            io.put_string(w.item)
         else
            io.put_string("already collected")
         end

         create w2.set_item(s)
         w2.set_item("other text%N")
         label_assert("reference set 2", w2.item /= Void)
         label_assert("reference set 2.2", w2.item /= s)

         label_assert("correct value 2", ("other text%N").is_equal(w2.item))
         
         if w2.item /= Void then
            io.put_string(w2.item + "%N")
         else
            io.put_string("already collected%N")
         end

         collection_on
      end
end -- class TEST_WEAK_REF00
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
