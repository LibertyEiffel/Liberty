-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class JSON_OBJECT

inherit
   JSON_TEXT
      redefine
         is_equal, out_in_tagged_out_memory
      end

create {JSON_HANDLER}
   make

feature {ANY}
   accept (visitor: VISITOR)
      local
         v: JSON_VISITOR
      do
         v ::= visitor
         v.visit_object(Current)
      end

   is_equal (other: like Current): BOOLEAN
      local
         i: INTEGER; k: JSON_STRING; v, ov: JSON_VALUE
         eq: SAFE_EQUAL[JSON_VALUE]
      do
         if members.count = other.members.count then
            from
               Result := True
               i := members.lower
            until
               not Result or else i > members.upper
            loop
               k := members.key(i)
               v := members.item(i)
               if other.members.has(k) then
                  ov := other.members.reference_at(k)
               end
               Result := eq.test(v, ov)
               i := i + 1
            end
         end
      end

   out_in_tagged_out_memory
      local
         i: INTEGER
      do
         tagged_out_memory.append(once "JSON_OBJECT[")
         from
            i := members.lower
         until
            i > members.upper
         loop
            if i > members.lower then
               tagged_out_memory.append(once ", ")
            end
            members.key(i).out_in_tagged_out_memory
            tagged_out_memory.append(once ": ")
            members.item(i).out_in_tagged_out_memory
            i := i + 1
         end
         tagged_out_memory.extend(']')
      end

   item (key: ABSTRACT_STRING): JSON_VALUE
      require
         key /= Void
      do
         Result := members.reference_at(create {JSON_STRING}.from_string(key))
      end

feature {JSON_HANDLER}
   members: MAP[JSON_VALUE, JSON_STRING]

feature {}
   make (a_members: like members)
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
-- Copyright (C) 2009-2016: by all the people cited in the AUTHORS file.
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
