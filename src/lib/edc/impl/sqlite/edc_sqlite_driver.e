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
class EDC_SQLITE_DRIVER

inherit
   EDC_DRIVER

insert
   SINGLETON
      undefine
         is_equal
      end

create {ANY}
   make

feature {}
   make (a_error_handler: like error_handler)
      require
         a_error_handler /= Void
      do
         init
         error_handler := a_error_handler
      ensure
         error_handler = a_error_handler
      end

   error_handler: EDC_ERROR_HANDLER

feature {}
   init
      once
         init_sqlite
      end

   init_sqlite
      external "plug_in"
      alias "{
         location: "${sys}/plugins/edc/impl"
         module_name: "sqlite"
         feature_name: "init_sqlite"
         }"
      end

feature {EDC_CONNECTION_FACTORY}
   valid_url (url: STRING): BOOLEAN
      do
         Result := url.has_prefix(once "sqlite://")
      end

   new_connection (url: STRING; info: DICTIONARY[STRING, STRING]): EDC_SQLITE_CONNECTION
      local
         file: STRING; db: SQLITE_DATABASE; done: BOOLEAN
      do
         file := url.twin
         file.remove_prefix(once "sqlite://")
         from
         until
            done
         loop
            create db.connect(file)
            if db.last_action_success then
               create Result.make(db, info, error_handler)
               done := True
            elseif error_handler /= Void then
               done := not (create {EDC_ERROR_CONNECTION_FAILED}.make(url)).handle(error_handler)
            end
         end
      end

invariant
   error_handler /= Void

end -- class EDC_SQLITE_DRIVER
