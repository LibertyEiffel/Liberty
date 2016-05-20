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
class EDC_STORABLE_XML_FILE_DRIVER
   --
   -- Data is stored in an XML file given by the url after the <code>"xml://"</code> prefix.
   --

inherit
   EDC_STORABLE_DRIVER[XML_FILE_REPOSITORY[EDC_STORABLE_TABLE]]

feature {EDC_CONNECTION_FACTORY}
   valid_url (url: STRING): BOOLEAN
      do
         Result := url.has_prefix(once "xml://")
      end

feature {}
   new_repository (url: STRING; info: DICTIONARY[STRING, STRING]): XML_FILE_REPOSITORY[EDC_STORABLE_TABLE]
      local
         filename: STRING
      do
         Result := repositories.reference_at(url)
         if Result = Void then
            filename := url.twin
            filename.remove_prefix(once "xml://")
            create Result.connect_to(filename)
            repositories.put(Result, url)
         end
      end

   repositories: DICTIONARY[XML_FILE_REPOSITORY[EDC_STORABLE_TABLE], STRING]
      once
         create {HASHED_DICTIONARY[XML_FILE_REPOSITORY[EDC_STORABLE_TABLE], STRING]} Result.make
      end

end -- class EDC_STORABLE_XML_FILE_DRIVER
