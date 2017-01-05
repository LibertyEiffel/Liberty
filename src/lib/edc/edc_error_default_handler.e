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
class EDC_ERROR_DEFAULT_HANDLER

inherit
   EDC_ERROR_HANDLER

create {EDC_CONSTANTS}
   make

feature {EDC_ERROR_CONNECTION_FAILED}
   connection_failed (error: EDC_ERROR_CONNECTION_FAILED): BOOLEAN
      do
         std_error.put_line("Connection failed: " + error.url)
         sedb_breakpoint
         die_with_code(1)
      end

feature {EDC_ERROR_ACCESS_DENIED}
   access_denied (error: EDC_ERROR_ACCESS_DENIED): BOOLEAN
      do
         std_error.put_line("Access denied (" + error.reason + "): " + error.query)
         sedb_breakpoint
         die_with_code(1)
      end

feature {EDC_ERROR_LOCKED}
   locked (error: EDC_ERROR_LOCKED): BOOLEAN
      do
         std_error.put_line("Locked (" + error.reason + "): " + error.query)
         sedb_breakpoint
         die_with_code(1)
      end

feature {EDC_ERROR_QUERY_FAILED}
   query_failed (error: EDC_ERROR_QUERY_FAILED): BOOLEAN
      do
         std_error.put_line("Query failed (" + error.reason + "): <" + error.query + ">")
         sedb_breakpoint
         die_with_code(1)
      end

feature {EDC_ERROR_UNKNOWN}
   unknown (error: EDC_ERROR_UNKNOWN): BOOLEAN
      do
         std_error.put_line("Unknown error (" + error.reason + ")")
         sedb_breakpoint
         die_with_code(1)
      end

feature {}
   make
      do
      end

end -- class EDC_ERROR_DEFAULT_HANDLER
