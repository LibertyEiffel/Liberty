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
expanded class EDC_CONNECTION_FACTORY
   --
   -- Never to be called directly; it implements the chain-of-responsibility pattern
   -- between data drivers.
   --

insert
   EDC_CONSTANTS

feature {EDC}
   register_driver (a_driver: EDC_DRIVER)
      require
         a_driver /= Void
      do
         drivers.add_last(a_driver)
      end

   connect_to (url: STRING; info: DICTIONARY[STRING, STRING]): EDC_CONNECTION
      require
         not url.is_empty
      do
         Result := driver(url).new_connection(url, info)
      end

   can_connect_to (url: STRING): BOOLEAN
      do
         Result := driver(url) /= Void
      end

feature {}
   drivers: FAST_ARRAY[EDC_DRIVER]
      once
         create Result.make(0)
      end

   driver (url: STRING): EDC_DRIVER
         -- Latest added drivers are considered first
      require
         not url.is_empty
      local
         i: INTEGER
      do
         from
            i := drivers.upper
         until
            Result /= Void or else i < drivers.lower
         loop
            Result := drivers.item(i)
            if not Result.valid_url(url) then
               Result := Void
            end
            i := i - 1
         end
      end

end -- class EDC_CONNECTION_FACTORY
