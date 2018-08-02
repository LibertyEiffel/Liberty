-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class EXT_HASHED_SET[E_]
   --
   -- Like a HASH_SET but the items' hash_code function is given
   --

inherit
   ABSTRACT_HASHED_SET[E_]
      rename
         make as abs_make,
         with_capacity as abs_with_capacity
         from_collection as abs_from_collection
      end

create {ANY}
   make, with_capacity, from_collection

feature {ANY}
   hash_coder: FUNCTION[TUPLE[E_], INTEGER]

   make (a_hash_coder: like hash_coder)
      require
         a_hash_coder /= Void
      do
         hash_coder := a_hash_coder
         abs_make
      ensure
         hash_coder = a_hash_coder
      end

   with_capacity (a_hash_coder: like hash_coder; medium_size: INTEGER)
      require
         a_hash_coder /= Void
         medium_size > 0
      do
         hash_coder := a_hash_coder
         abs_with_capacity(medium_size)
      ensure
         hash_coder = a_hash_coder
      end

   from_collection (a_hash_coder: like hash_coder; model: COLLECTION[like item])
      require
         a_hash_coder /= Void
         model /= Void
      do
         hash_coder := a_hash_coder
         abs_from_collection(model)
      ensure
         hash_coder = a_hash_coder
      end

feature {}
   hash_code (e: E_): INTEGER
      do
         Result := hash_coder.item([e])
      end

invariant
   hash_coder /= Void

end -- class EXT_HASHED_SET
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
