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
class EDC_LOG_DRIVER
   --
   -- Every query is logged in an SQL form in the given OUTPUT_STREAM.
   --
   -- URLs have the form <code>"log://..."</code>
   --

inherit
   EDC_DRIVER

insert
   EDC
      rename valid_url as sql_valid_url,
         connect_to as sql_connect_to
      export {} sql_can_connect_to, sql_connect_to
      end

create {ANY}
   make

feature {EDC_CONNECTION_FACTORY}
   valid_url (url: STRING): BOOLEAN
      local
         suburl: STRING
      do
         suburl := nested_url(url)
         if suburl /= Void then
            Result := sql_valid_url(suburl)
         end
      end

   new_connection (url: STRING; info: DICTIONARY[STRING, STRING]): EDC_CONNECTION
      do
         log.put_string(once "-- connecting to ")
         log.put_string(url)
         log.put_new_line
         create {EDC_LOG_CONNECTION} Result.make(log, sql_connect_to(nested_url(url), info))
      end

feature {}
   nested_url (url: STRING): STRING
      local
         suburl: STRING
      do
         if url.has_prefix(once "log://") then
            suburl := once ""
            suburl.copy(url)
            suburl.remove_prefix(once "log://")
            Result := suburl
         end
      end

feature {}
   make (a_log: like log)
      require
         a_log /= Void
      do
         log := a_log
      end

   log: OUTPUT_STREAM

invariant
   log /= Void

end -- class EDC_LOG_DRIVER
