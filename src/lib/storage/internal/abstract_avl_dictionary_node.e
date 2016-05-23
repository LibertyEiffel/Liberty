-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class ABSTRACT_AVL_DICTIONARY_NODE[V_, K_]
   --
   -- Auxiliary class to implement AVL_DICTIONARY.
   --

inherit
   AVL_TREE_NODE[K_]
      rename
         item as key,
         set_item as set_key,
         safe_equal as safe_equal_key
      redefine
         recycle
      end
   ANY_AVL_DICTIONARY_NODE

feature {ABSTRACT_AVL_DICTIONARY, ABSTRACT_AVL_DICTIONARY_NODE, ITERATOR_ON_AVL_DICTIONARY_ITEMS, ITERATOR_ON_AVL_DICTIONARY}
   safe_equal_value: SAFE_EQUAL[V_]

   value: V_

   set_value (v: like value)
      do
         value := v
      ensure
         value = v
      end

   fast_at (k: like key): like Current
         -- Is element `e' in the tree?
      do
         if key = k then
            Result := Current
         elseif safe_equal_key.test(key, k) then
            -- because otherwise there would be an infinite recursion
            --Result := Void
         elseif ordered(k, key) then
            if left /= Void then
               Result := left.fast_at(k)
            end
         else
            if right /= Void then
               Result := right.fast_at(k)
            end
         end
      end

   occurrences (v: V_): INTEGER
      do
         Result := occurrences_(v, 0)
      end

   fast_occurrences (v: V_): INTEGER
      do
         Result := fast_occurrences_(v, 0)
      end

   key_at (v: V_): K_
      do
         if safe_equal_value.test(v, value) then
            Result := key
         elseif left /= Void then
            Result := left.key_at(v)
         elseif right /= Void then
            Result := right.key_at(v)
         end
      end

   fast_key_at (v: V_): K_
      do
         if v = value then
            Result := key
         elseif left /= Void then
            Result := left.fast_key_at(v)
         elseif right /= Void then
            Result := right.fast_key_at(v)
         end
      end

feature {ABSTRACT_AVL_DICTIONARY_NODE}
   occurrences_ (v: V_; cnt: INTEGER): INTEGER
      do
         Result := cnt
         if safe_equal_value.test(v, value) then
            Result := Result + 1
         end
         if left /= Void then
            Result := left.occurrences_(v, Result)
         end
         if right /= Void then
            Result := right.occurrences_(v, Result)
         end
      ensure
         Result >= cnt
      end

   fast_occurrences_ (v: V_; cnt: INTEGER): INTEGER
      do
         Result := cnt
         if v = value then
            Result := Result + 1
         end
         if left /= Void then
            Result := left.fast_occurrences_(v, Result)
         end
         if right /= Void then
            Result := right.fast_occurrences_(v, Result)
         end
      ensure
         Result >= cnt
      end

feature {ABSTRACT_AVL_DICTIONARY}
   set (v: like value; k: like key)
      do
         set_balance(balanced)
         left := Void
         right := Void
         set_value(v)
         set_key(k)
      ensure
         value = v
         key = k
      end

feature {RECYCLING_POOL}
   recycle
      local
         v: V_
      do
         Precursor
         value := v
      end

end -- class ABSTRACT_AVL_DICTIONARY_NODE
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
