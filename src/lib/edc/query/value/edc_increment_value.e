-- -----------------------------------------------------------------------------------------------------------
-- This file is part of the ESE library.
-- Copyright (C) 2006-2022: Cyril ADRIAN <cyril.adrian@gmail.com> and others (see AUTHORS)
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
class EDC_INCREMENT_VALUE

inherit
   EDC_TYPED_VALUE[INTEGER]

create {EDC_INCREMENT_COLUMN}
   make

feature {ANY}
   accept (a_visitor: VISITOR)
      local
         v: EDC_INCREMENT_VALUE_VISITOR
      do
         v ::= a_visitor
         v.visit_increment_value(Current)
      end

feature {ANY}
   item: INTEGER

   value (a_columns: TRAVERSABLE[EDC_COLUMN]; a_data: TRAVERSABLE[EDC_DATUM]): EDC_TYPED_DATUM[INTEGER]
      do
         Result := datum_factory.as_datum(item)
      end

feature {EDC_EXPRESSION}
   do_set_parameter_positions (position: INTEGER): INTEGER
      do
         Result := position
      end

   can_call: BOOLEAN True

   open_count: INTEGER 0

   do_prepare_call (arguments: TRAVERSABLE[EDC_VALUE]; cursor: INTEGER): INTEGER
      do
         Result := cursor
      end

feature {ANY}
   datum: EDC_DATUM
      do
         Result := datum_factory.as_datum(item)
      end

feature {}
   make
      do
      end

   datum_factory: EDC_DATUM_FACTORY[INTEGER]

end -- class EDC_INCREMENT_VALUE
