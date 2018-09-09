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
class EDC_BLOB

inherit
   XML_CALLBACKS

insert
   XML_REPOSITORY_IMPL[STORABLE]

create {ANY}
   from_string

feature {ANY}
   from_string (a_string: STRING)
      require
         a_string /= Void
      do
         if string = Void then
            create string.from_string(a_string)
         else
            string.from_string(a_string)
         end
         update
      end

   to_string: STRING
      do
         Result := string.to_string
      end

feature {}
   string: EDC_STRING_STREAM

   commit
      do
         string.clear
         write_to_stream(string)
      end

   update
      do
         read_from_stream(string)
      end

   is_connected: BOOLEAN True

   is_updateable: BOOLEAN True

   is_commitable: BOOLEAN True

end -- class EDC_BLOB
