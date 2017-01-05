-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
expanded class CGI_COOKIE_JAR
   --
   -- Access to the CGI cookies. This class is expanded; cookies are application-wide.
   --

insert
   CGI_UTILS
      redefine
         default_create
      end

feature {ANY}
   cookie (name: ABSTRACT_STRING): CGI_COOKIE
      require
         is_token(name)
      local
         n: FIXED_STRING
      do
         n := name.intern
         Result := jar.fast_reference_at(n)
         if Result = Void then
            check
               not jar.has(n)
            end
            create Result.make(n)
            jar.add(Result, n)
         end
      ensure
         Result /= Void
      end

   for_each (action: PROCEDURE[TUPLE[CGI_COOKIE]])
      do
         jar.for_each_item(action)
      end

feature {CGI_RESPONSE_FIELDS}
   is_field_reserved (a_field: ABSTRACT_STRING): BOOLEAN
      require
         a_field /= Void
      do
         Result := a_field.is_equal(once "Cookie")
            or else a_field.is_equal(once "Set-Cookie")
      end

   flush (a_output: OUTPUT_STREAM)
      local
         i: INTEGER; c: CGI_COOKIE
      do
         if jar /= Void then
            from
               i := jar.lower
            until
               i > jar.upper
            loop
               c := jar.item(i)
               if c.is_changed then
                  a_output.put_string(once "Set-Cookie:")
                  c.flush(a_output)
                  a_output.put_string(crlf)
               end
               i := i + 1
            end
         end
      end

feature {}
   default_create
      do
         init
      end

   init
      local
         system: SYSTEM
         http_cookie: STRING
         i: INTEGER
      once
         http_cookie := system.get_environment_variable(once "HTTP_COOKIE")
         if http_cookie /= Void and then not http_cookie.is_empty then
            from
               i := http_cookie.lower
            until
               not http_cookie.valid_index(i)
            loop
               i := parse_cookie(http_cookie, i)
            end
         end
      end

   parse_cookie (http_cookie: STRING; start: INTEGER): INTEGER
      local
         name, value: STRING; c: CHARACTER; state: INTEGER
      do
         from
            name := once ""
            name.clear_count
            Result := start
         until
            state < 0 or else not http_cookie.valid_index(Result)
         loop
            c := http_cookie.item(Result)
            inspect
               state
            when 0 then -- reading cookie name
               if c = '=' then
                  value := once ""
                  value.clear_count
                  state := 1
               else
                  name.extend(c)
               end
            when 1 then -- reading cookie value
               if c = ';' then
                  cookie(name).set_initial_value(value.intern)
                  state := 2
               else
                  value.extend(c)
               end
            when 2 then -- skipping trailing spaces (after semi-colon)
               if c = ' ' then
                  -- skip
               else
                  Result := Result - 1
                  state := -1
               end
            end
            Result := Result + 1
         end
         if state = 1 then
            -- the last cookie!
            cookie(name).set_initial_value(value.intern)
         end
      end

   jar: LINKED_HASHED_DICTIONARY[CGI_COOKIE, FIXED_STRING]
      once
         create Result.make
      end

end -- class CGI_COOKIE_JAR
--
-- Copyright (C) 2009-2017: by all the people cited in the AUTHORS file.
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
