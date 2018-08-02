-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class COLLECTION_SORTER[X_ -> COMPARABLE]
   --
   -- Some algorithms to sort any COLLECTION[COMPARABLE].
   --
   -- Elements are sorted using increasing order: large elements at the beginning of the collection, small at the end (increasing
   -- order is implemented by class COLLECTION_SORTER).
   --
   --
   -- How to use this expanded class :
   --
   --          local
   --             sorter: COLLECTION_SORTER[INTEGER]
   --             array: ARRAY[INTEGER]
   --          do
   --             array := <<1,3,2>>
   --             sorter.sort(array)
   --             check
   --                sorter.is_sorted(array)
   --             end
   --             ...
   --

insert
   ABSTRACT_SORTER[X_]

feature {}
   lt (x, y: X_): BOOLEAN
      do
         Result := x < y
      end

end -- class COLLECTION_SORTER
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
