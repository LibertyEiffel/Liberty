-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class JSON_ENCODER

inherit
   JSON_VISITOR

create {JSON_HANDLER}
   make

feature {ANY}
   pretty: BOOLEAN
         -- True if the JSON text must be prettily indented, False if no extra space should be emitted

   raw: BOOLEAN
         -- True if utf-8 characters can be emitted, False if '\u' sequences are emitted instead

   set_pretty (enable: BOOLEAN) is
      do
         pretty := enable
      ensure
         pretty = enable
      end

   set_raw (enable: BOOLEAN) is
      do
         raw := enable
      ensure
         raw = enable
      end

feature {JSON_HANDLER}
   encode_in (value: JSON_VALUE; a_str: like str) is
      require
         value /= Void
         a_str /= Void
      do
         str := a_str
         depth := 0
         value.accept(Current)
         if pretty then
            str.extend('%N')
         end
         str := Void
      end

feature {JSON_ARRAY}
   visit_array (json: JSON_ARRAY) is
      local
         i: INTEGER
      do
         str.extend('[')
         depth := depth + 1
         from
            i := json.array.lower
         until
            i > json.array.upper
         loop
            if i > json.array.lower then
               str.extend(',')
            end
            pretty_indent
            json.array.item(i).accept(Current)
            i := i + 1
         end
         depth := depth - 1
         pretty_indent
         str.extend(']')
      end

feature {JSON_FALSE}
   visit_false (json: JSON_FALSE) is
      do
         str.append(once "false")
      end

feature {JSON_NULL}
   visit_null (json: JSON_NULL) is
      do
         str.append(once "null")
      end

feature {JSON_NUMBER}
   visit_number (json: JSON_NUMBER) is
      do
         json.append_in(str)
      end

feature {JSON_OBJECT}
   visit_object (json: JSON_OBJECT) is
      local
         i, sep: INTEGER
      do
         str.extend('{')
         depth := depth + 1

         if pretty then
            from
               i := json.members.lower
            until
               i > json.members.upper
            loop
               if json.members.key(i).string.count > sep then
                  sep := json.members.key(i).string.count
               end
               i := i + 1
            end
         end

         from
            i := json.members.lower
         until
            i > json.members.upper
         loop
            if i > json.members.lower then
               str.extend(',')
            end
            pretty_indent
            json.members.key(i).accept(Current)
            str.extend(':')
            if pretty then
               pretty_extend(sep - json.members.key(i).string.count + 1)
            end
            json.members.item(i).accept(Current)
            i := i + 1
         end
         depth := depth - 1
         pretty_indent
         str.extend('}')
      end

feature {JSON_STRING}
   visit_string (json: JSON_STRING) is
      do
         json.append_in(str, raw)
      end

feature {JSON_TRUE}
   visit_true (json: JSON_TRUE) is
      do
         str.append(once "true")
      end

feature {}
   str: STRING
   depth: INTEGER

   make is
      do
      end

   pretty_indent is
      do
         if pretty then
            str.extend('%N')
            pretty_extend(depth * 4)
         end
      end

   pretty_extend (count: INTEGER) is
      require
         pretty
      local
         i: INTEGER
      do
         from
            i := 1
         until
            i > count
         loop
            str.extend(' ')
            i := i + 1
         end
      end

end -- class JSON_ENCODER
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
