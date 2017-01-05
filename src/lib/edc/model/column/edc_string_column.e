-- -----------------------------------------------------------------------------------------------------------
-- This file is part of the ESE library.
-- Copyright (C) 2006-2017: Cyril ADRIAN <cyril.adrian@gmail.com> and others (see AUTHORS)
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
-- associated documentation files (the "Software"), to deal in the Software without restriction, including
-- without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the
-- following conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
-- IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
-- USE OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://ese.sourceforge.net
-- -----------------------------------------------------------------------------------------------------------
class EDC_STRING_COLUMN

inherit
   EDC_TYPED_COLUMN[STRING]
      rename make as typed_make
      redefine valid_value
      end

create {ANY}
   make

feature {ANY}
   accept (a_visitor: VISITOR)
      local
         v: EDC_STRING_COLUMN_VISITOR
      do
         v ::= a_visitor
         v.visit_string_column(Current)
      end

   hash_code (a_value: EDC_DATUM): INTEGER
      do
         Result := value(a_value).hash_code
      end

   size: INTEGER

   valid_value (a_value: EDC_DATUM): BOOLEAN
      local
         v: EDC_TYPED_DATUM[STRING]
      do
         Result := Precursor(a_value)
         if Result and then a_value /= Void then
            v ::= a_value
            Result := v.item.count <= size
         end
      end

   as_value: EDC_STRING_COLUMN_VALUE
      do
         create Result.make(Current)
      end

feature {}
   make (a_name: like name; a_size: like size)
      require
         a_name.count > 0
         a_size > 0
      do
         typed_make(a_name)
         size := a_size
      end

end -- class EDC_STRING_COLUMN
