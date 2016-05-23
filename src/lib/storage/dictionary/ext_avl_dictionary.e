-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class EXT_AVL_DICTIONARY[V_, K_]
   --
   -- Associative memory. Values of type `V_' are stored using Keys of type `K_'.
   --
   -- Efficient implementation of DICTIONARY using an AVL balanced tree. AVL stands for the names of G. M. Adel'son-Velskii
   -- and E. M. Landis, two Russian mathematicians who first came up with this method of keeping the tree balanced.
   --

inherit
   ABSTRACT_AVL_DICTIONARY[V_, K_]
      rename
         make as abs_make
      end

create {ANY}
   make

feature {ANY}
   order: PREDICATE[TUPLE[K_, K_]]

feature {}
   ordered (k1, k2: K_): BOOLEAN
      do
         Result := order.item([k1, k2])
      end

   a_new_node: EXT_AVL_DICTIONARY_NODE[V_, K_]
      do
         create Result.make(order)
      end

   make (a_order: like order)
      require
         a_order /= Void
      do
         order := a_order
         abs_make
      ensure
         order = a_order
      end

invariant
   order /= Void

end -- class EXT_AVL_DICTIONARY
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
