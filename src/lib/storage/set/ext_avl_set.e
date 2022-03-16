-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class EXT_AVL_SET[E_]

inherit
   ABSTRACT_AVL_SET[E_]
      rename
         make as abs_make,
         from_collection as abs_from_collection
      end

create {ANY}
   make, from_collection

feature {ANY}
   order: PREDICATE[TUPLE[E_, E_]]

   from_collection (a_order: like order; model: COLLECTION[like item])
      require
         a_order /= Void
         model /= Void
      do
         order := a_order
         abs_from_collection(model)
      ensure
         order = a_order
      end

feature {}
   ordered (e1, e2: E_): BOOLEAN
      do
         Result := order.item([e1, e2])
      end

   a_new_node: EXT_AVL_SET_NODE[E_]
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

end -- class EXT_AVL_SET
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
