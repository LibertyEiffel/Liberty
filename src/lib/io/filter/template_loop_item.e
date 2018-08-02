-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class TEMPLATE_LOOP_ITEM

feature {TEMPLATE_INPUT_STREAM, TEMPLATE_LOOP_ITEM}
   name: FIXED_STRING
   index: INTEGER
   discard: BOOLEAN

   new (a_name: like name; a_index: like index; a_discard: like discard): TEMPLATE_LOOP_ITEM
      do
         Result.name := a_name
         Result.index := a_index
         Result.discard := a_discard
      ensure
         Result.name = a_name
         Result.index = a_index
         Result.discard = a_discard
      end

feature {TEMPLATE_LOOP_ITEM}
   set_name (a_name: like name) assign name
      require
         a_name /= Void
      do
         name := a_name
      ensure
         name = a_name
      end

   set_index (a_index: like index) assign index
      do
         index := a_index
      ensure
         index = a_index
      end

   set_discard (a_discard: like discard) assign discard
      do
         discard := a_discard
      ensure
         discard = a_discard
      end

end -- class TEMPLATE_LOOP_ITEM
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
