-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class LINKED_HASHED_DICTIONARY_NODE[V_, K_]
   --
   -- Auxiliary class to implement LINKED_HASHED_DICTIONARY.
   --

inherit
   HASHED_DICTIONARY_NODE[V_, K_]
      export {ABSTRACT_HASHED_DICTIONARY, ITERATOR_ON_LINKED_HASHED_DICTIONARY_ITEMS, ITERATOR_ON_LINKED_HASHED_DICTIONARY_KEYS, ITERATOR_ON_LINKED_HASHED_DICTIONARY}
         key, item
      end

create {ABSTRACT_LINKED_HASHED_DICTIONARY}
   make

feature {ABSTRACT_LINKED_HASHED_DICTIONARY, ITERATOR_ON_LINKED_HASHED_DICTIONARY_ITEMS, ITERATOR_ON_LINKED_HASHED_DICTIONARY_KEYS, ITERATOR_ON_LINKED_HASHED_DICTIONARY}
   previous_link, next_link: like Current
         -- To implement the good iterating order.

feature {ABSTRACT_LINKED_HASHED_DICTIONARY}
   set_links (a_previous, a_next: like Current)
      do
         previous_link := a_previous
         next_link := a_next
      ensure
         previous_link = a_previous
         next_link = a_next
      end

end -- class LINKED_HASHED_DICTIONARY_NODE
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
