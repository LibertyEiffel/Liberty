-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
class CGI_CONTENT_TYPE
   --
   -- CONTENT_TYPE
   --

create {CGI}
   make

feature {CGI_HANDLER}
   type: FIXED_STRING
      attribute
      end

   subtype: FIXED_STRING
      attribute
      end

   attributes: MAP[FIXED_STRING, FIXED_STRING]
      do
         Result := attributes_memory
      end

feature {CGI}
   error: STRING

feature {}
   make (t: STRING)
      require
         not t.is_empty
      do
         a_media_type(t)
      end

   a_media_type (t: STRING)
      local
         pos: INTEGER; s: STRING
      do
         pos := t.lower
         from
            s := once ""
            s.clear_count
         until
            not t.valid_index(pos) or else t.item(pos) = '/'
         loop
            s.extend(t.item(pos))
            pos := pos + 1
         end
         if not t.valid_index(pos) then
            set_error(t)
         else
            check
               t.item(pos) = '/'
            end
            pos := pos + 1
            if not t.valid_index(pos) then
               set_error(t)
            else
               type := s.intern
               from
                  s.clear_count
               until
                  not t.valid_index(pos) or else t.item(pos) = ';'
               loop
                  s.extend(t.item(pos))
                  pos := pos + 1
               end
               subtype := s.intern
               if t.valid_index(pos) then
                  check
                     t.item(pos) = ';'
                  end
                  create attributes_memory.make
                  from
                     pos := a_parameter(t, pos)
                  until
                     error /= Void or else not t.valid_index(pos)
                  loop
                     pos := a_parameter(t, pos)
                  end
               end
            end
         end
      end

   a_parameter (t: STRING; pos: INTEGER): INTEGER
      require
         t.valid_index(pos)
         t.item(pos) = ';'
         error = Void
      local
         a, v: STRING
      do
         a := once ""
         v := once ""
         Result := pos
         from
            a.clear_count
         until
            not t.valid_index(Result) or else t.item(Result) = '='
         loop
            a.extend(t.item(Result))
            Result := Result + 1
         end
         if not not t.valid_index(Result) then
            set_error(t)
         else
            Result := Result + 1
            if not not t.valid_index(Result) then
               set_error(t)
            elseif t.item(Result) = '"' then
               from
                  v.clear_count
               until
                  not t.valid_index(Result) or else t.item(Result) = '"'
               loop
                  v.extend(t.item(Result))
                  Result := Result + 1
               end
               if not t.valid_index(Result) or else (t.valid_index(Result + 1) and then t.item(Result + 1) /= ';') then
                  set_error(t)
               else
                  Result := Result + 1
                  attributes_memory.put(v.intern, a.intern)
               end
            else
               from
                  v.clear_count
               until
                  not t.valid_index(Result) or else t.item(Result) = ';'
               loop
                  v.extend(t.item(Result))
                  Result := Result + 1
               end
               attributes_memory.put(v.intern, a.intern)
            end
         end
      ensure
         error = Void implies (attributes.count = old attributes.count + 1 and then (t.valid_index(Result) implies t.item(Result) = ';'))
      end

   set_error (t: STRING)
      require
         t /= Void
      do
         error := "Invalid CONTENT_TYPE: "
         error.append(t)
      end

   attributes_memory: HASHED_DICTIONARY[FIXED_STRING, FIXED_STRING]

end -- class CGI_CONTENT_LENGTH
--
-- Copyright (C) 2009-2018: by all the people cited in the AUTHORS file.
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
