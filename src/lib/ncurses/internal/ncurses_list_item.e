-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class NCURSES_LIST_ITEM[E_]

create {ANY}
   make

feature {ANY}
   is_selected: BOOLEAN

   set_is_selected (s: like is_selected)
      do
         is_selected := s
      ensure
         is_selected = s
      end

   tag: STRING

   set_tag (s: like tag)
      require
         not s.is_empty
      do
         tag := s
      ensure
         tag = s
      end

   value: E_

   set_value (s: like value)
      do
         value := s
      ensure
         value = s
      end

feature {}
   make (s: like is_selected; t: like tag; v: like value)
      require
         not t.is_empty
      do
         is_selected := s
         tag := t
         value := v
      ensure
         is_selected = s
         tag = t
         value = v
      end

end -- class NCURSES_LIST_ITEM
--
-- Copyright (C) 2009-2017: by all the people cited in the AUTHORS file.
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
