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
class EDC_STORABLE_SAVEPOINT

inherit
   EDC_SAVEPOINT

create {EDC_STORABLE_CONNECTION}
   make

feature {ANY}
   name: STRING

   is_active: BOOLEAN
      do
         Result := repository /= Void
      end

   release
      do
         stream := Void
         repository := Void
      end

feature {EDC_STORABLE_CONNECTION}
   restore (a_repository: REPOSITORY[EDC_STORABLE_TABLE])
      require
         is_active
         a_repository.is_empty
      local
         i: INTEGER
      do
         stream.reset
         repository.update
         from
            i := repository.lower
         until
            i > repository.upper
         loop
            a_repository.put(repository.item(i), repository.key(i))
            i := i + 1
         end
      end

feature {}
   make (a_name: like name; a_repository: REPOSITORY[EDC_STORABLE_TABLE])
      local
         i: INTEGER
      do
         name := a_name
         create stream.make
         create repository.connect_to(stream, stream)
         from
            i := a_repository.lower
         until
            i > a_repository.upper
         loop
            repository.put(a_repository.item(i), a_repository.key(i))
            i := i + 1
         end
         repository.commit
      end

   stream: EDC_STORABLE_SAVEPOINT_STREAM

   repository: XML_STREAM_REPOSITORY[EDC_STORABLE_TABLE]

end -- class EDC_STORABLE_SAVEPOINT
