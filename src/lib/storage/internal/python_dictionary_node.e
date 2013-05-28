-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class PYTHON_DICTIONARY_NODE[V_, K_]

insert
   ANY
      redefine
         default_create
      end

create {ABSTRACT_PYTHON_DICTIONARY}
   make, default_create

feature {ABSTRACT_PYTHON_DICTIONARY}
   key: K_ is
      require
         is_set
      attribute
      end

   item: V_ is
      require
         is_set
      attribute
      end

   is_set: BOOLEAN

   set (a_item: like item) is
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
   default_create is
      local
         def_key: K_; def_item: V_
      do
         key := def_key
         item := def_item
         is_set := False
      ensure
         not is_set
      end

   make (a_item: like item; a_key: like key) is
      do
         key := a_key
         item := a_item
         is_set := True
      ensure
         key = a_key
         item = a_item
         is_set
      end

end -- class PYTHON_DICTIONARY_NODE[V_, K_]
--
-- Copyright (c) 2009 by all the people cited in the AUTHORS file.
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
