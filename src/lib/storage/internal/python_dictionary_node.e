-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class PYTHON_DICTIONARY_NODE[V_, K_]

insert
   HASHABLE
      redefine
         default_create
      end

create {ABSTRACT_PYTHON_DICTIONARY}
   make, default_create

feature {ANY}
   is_equal (other: like Current): BOOLEAN
      do
         if is_set and then other.is_set then
            Result := safe_equal_key.test(key, other.key)
               and then safe_equal_item.test(item, other.item)
         else
            Result := is_set = other.is_set
         end
      end

feature {ABSTRACT_PYTHON_DICTIONARY, PYTHON_DICTIONARY_NODE}
   hash_code: INTEGER

   key: K_
      require
         is_set
      attribute
      end

   item: V_
      require
         is_set
      attribute
      end

   is_set: BOOLEAN

   set (a_item: like item)
      require
         is_set
      do
         item := a_item
      ensure
         key = old key
         item = a_item
         is_set
      end

feature {}
   default_create
      local
         def_key: K_; def_item: V_
      do
         hash_code := 0
         key := def_key
         item := def_item
         is_set := False
      ensure
         not is_set
      end

   make (a_item: like item; a_key: like key; a_hash: like hash_code)
      do
         hash_code := a_hash
         key := a_key
         item := a_item
         is_set := True
      ensure
         hash_code = a_hash
         key = a_key
         item = a_item
         is_set
      end

   safe_equal_key: SAFE_EQUAL[K_]
   safe_equal_item: SAFE_EQUAL[V_]

end -- class PYTHON_DICTIONARY_NODE[V_, K_]
--
-- Copyright (C) 2009-2022: by all the people cited in the AUTHORS file.
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
