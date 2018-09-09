-- -----------------------------------------------------------------------------------------------------------
-- This file is part of the ESE library.
-- Copyright (C) 2006-2018: Cyril ADRIAN <cyril.adrian@gmail.com> and others (see AUTHORS)
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
class EDC_DELETE

inherit
   EDC_SELECTABLE

create {EDC_CONNECTION}
   make

feature {ANY}
   accept (a_visitor: VISITOR)
      local
         v: EDC_DELETE_VISITOR
      do
         v ::= a_visitor
         v.visit_delete(Current)
      end

feature {ANY}
   call (arguments: TRAVERSABLE[EDC_VALUE]): INTEGER
         -- Delete the selected rows and return the number of deleted rows
      require
         arguments.count = open_count
      local
         lost: INTEGER; rs: EDC_RESULT_SET
      do
         if arguments /= Void then
            lost := do_prepare_call(arguments, arguments.lower)
         end
         check
            can_call
         end
         Result := connection.call_delete(Current)
      end

   table: EDC_TABLE
      do
         Result := item(lower).table
      end

   all_columns_are_in_the_same_table: BOOLEAN
      local
         i: INTEGER; t: EDC_TABLE
      do
         from
            Result := True
            t := item(lower).table
            i := lower + 1
         until
            not Result or else i > upper
         loop
            Result := item(i).table = t
            i := i + 1
         end
      end

invariant
   all_columns_are_in_the_same_table

end -- class EDC_DELETE
