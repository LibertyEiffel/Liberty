-- -----------------------------------------------------------------------------------------------------------
-- This file is part of the ESE library.
-- Copyright (C) 2006-2016: Cyril ADRIAN <cyril.adrian@gmail.com> and others (see AUTHORS)
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
deferred class EDC_STORABLE_DRIVER[R_ -> REPOSITORY[EDC_STORABLE_TABLE]]
   --
   -- Data is stored in a REPOSITORY.
   --
   -- See also EDC_STORABLE_XML_FILE_DRIVER
   --

inherit
   EDC_DRIVER

insert
   SINGLETON
      undefine
         is_equal
      end

feature {EDC_CONNECTION_FACTORY}
   new_connection (url: STRING; info: DICTIONARY[STRING, STRING]): EDC_STORABLE_CONNECTION
      do
         create Result.prepare_connect
         Result.connect_to(new_repository(url, info))
      end

feature {}
   new_repository (url: STRING; info: DICTIONARY[STRING, STRING]): R_
      deferred
      ensure
         Result /= Void
      end

   transient: REPOSITORY_TRANSIENT

end -- class EDC_STORABLE_DRIVER
