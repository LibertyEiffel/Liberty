-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class JSON_OBJECT

inherit
   JSON_TEXT
      redefine
         is_equal
      end

create {JSON_HANDLER}
   make

feature {ANY}
   accept (visitor: VISITOR) is
      local
         v: JSON_VISITOR
      do
         v ::= visitor
         v.visit_object(Current)
      end

   is_equal (other: like Current): BOOLEAN is
      do
         Result := members.is_equal(other.members)
      end

feature {JSON_VISITOR, JSON_OBJECT}
   members: MAP[JSON_VALUE, JSON_STRING]

feature {}
   make (a_members: like members) is
      require
         a_members /= Void
      do
         members := a_members
      ensure
         members = a_members
      end

invariant
   members /= Void

end -- class JSON_OBJECT
--
-- Copyright (c) 2009 by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
