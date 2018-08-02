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
deferred class EDC_RESULT_SET

insert
   EDC_CONSTANTS

feature {ANY} -- Connection:
   disconnect
      require
         is_connected
      deferred
      ensure
         not is_connected
      end

   is_connected: BOOLEAN
      deferred
      ensure
         Result implies connection.is_connected
      end

   connection: EDC_CONNECTION
         -- back-link to the connection
      deferred
      end

feature {ANY} -- Data query:
   is_after_last: BOOLEAN
      require
         is_connected
      deferred
      end

   is_before_first: BOOLEAN
      require
         is_connected
      deferred
      end

   is_off: BOOLEAN
      require
         is_connected
      do
         -- default implementation
         Result := is_before_first or else is_after_last
      ensure
         is_before_first implies Result
         is_after_last implies Result
      end

   next
      require
         is_connected
         not is_after_last
      deferred
      ensure
         not is_before_first
      end

   previous
      require
         is_connected
         not is_before_first
      deferred
      ensure
         not is_after_last
      end

feature {EDC_CONNECTION}
   update (values: TRAVERSABLE[EDC_VALUE])
         -- Update the current row
      deferred
      end

   delete
         -- Delete the current row
      deferred
      end

feature {ANY}
   fetch_direction: INTEGER_8
      require
         is_connected
      deferred
      ensure
         Result = fetch_forward or else Result = fetch_backward
      end

   column_count: INTEGER
      deferred
      end

   column (index: INTEGER): EDC_COLUMN
      require
         index.in_range(0, column_count - 1)
      deferred
      ensure
         Result /= Void
      end

   column_named (column_name: STRING): EDC_COLUMN
      require
         not column_name.is_empty
      deferred
      end

feature {EDC_COLUMN}
   item (a_column: EDC_COLUMN): EDC_DATUM
      deferred
      end

end -- class EDC_RESULT_SET
