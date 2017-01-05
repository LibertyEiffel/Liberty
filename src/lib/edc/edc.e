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
expanded class EDC
   --
   -- Global access point to the Eiffel Data Connection features
   --

insert
   EDC_CONSTANTS

feature {ANY} -- Connections:
   frozen register_driver (a_driver: EDC_DRIVER)
      require
         a_driver /= Void
      do
         factory.register_driver(a_driver)
      end

   connect_to (url: STRING; info: DICTIONARY[STRING, STRING]): EDC_CONNECTION
         -- Latest registered drivers are considered first
      require
         not url.is_empty
         can_connect_to(url)
      do
         Result := factory.connect_to(url, info)
      ensure
         Result /= Void implies Result.is_connected
      end

   can_connect_to (url: STRING): BOOLEAN
      require
         not url.is_empty
      do
         Result := factory.can_connect_to(url)
      end

feature {}
   factory: EDC_CONNECTION_FACTORY

end -- class EDC
