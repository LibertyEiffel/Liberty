-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
class CGI_COOKIE

insert
   CGI_UTILS

create {ANY}
   make

feature {ANY}
   name: FIXED_STRING
   value: ABSTRACT_STRING

   expires: like expires_memory
   max_age: like max_age_memory
   domain: ABSTRACT_STRING
   path: ABSTRACT_STRING
   secure: BOOLEAN
   http_only: BOOLEAN

   set_value (a_value: like value) assign value
      require
         a_value /= Void implies is_valid_value(a_value)
      do
         value := a_value
         is_changed := True
      ensure
         value = a_value
         is_changed
      end

   set_expires (a_expires: TIME) assign expires
      require
         a_expires.is_universal_time
         max_age = Void
      do
         if expires_memory = Void then
            create expires_memory.set_item(a_expires)
         else
            expires_memory.set_item(a_expires)
         end
         expires := expires_memory
         is_changed := True
      ensure
         expires.item = a_expires
         is_changed
      end

   unset_expires
      do
         expires := Void
         is_changed := True
      ensure
         expires = Void
         is_changed
      end

   set_max_age (a_max_age: INTEGER) assign max_age
      require
         expires = Void
         a_max_age >= 0
      do
         if max_age_memory = Void then
            create max_age_memory.set_item(a_max_age)
         else
            max_age_memory.set_item(a_max_age)
         end
         max_age := max_age_memory
         is_changed := True
      ensure
         max_age.item = a_max_age
         is_changed
      end

   unset_max_age
      do
         max_age := Void
         is_changed := True
      ensure
         max_age = Void
         is_changed
      end

   set_domain (a_domain: ABSTRACT_STRING) assign domain
      require
         a_domain /= Void implies is_valid_domain(a_domain)
      do
         domain := a_domain
         is_changed := True
      ensure
         domain = a_domain
         is_changed
      end

   set_path (a_path: like path) assign path
      require
         a_path /= Void implies is_valid_cookie_path(a_path)
      do
         path := a_path
         is_changed := True
      ensure
         path = a_path
         is_changed
      end

   set_secure (enable: BOOLEAN) assign secure
      do
         secure := enable
         is_changed := True
      ensure
         secure = enable
         is_changed
      end

   set_http_only (enable: BOOLEAN) assign http_only
      do
         http_only := enable
         is_changed := True
      ensure
         http_only = enable
         is_changed
      end

   is_valid_value (a_value: ABSTRACT_STRING): BOOLEAN
      require
         a_value /= Void
      local
         i: INTEGER; c: CHARACTER
      do
         from
            Result := True
            i := a_value.lower
         until
            not Result or else i > a_value.upper
         loop
            c := a_value.item(i)
            inspect
               c
            when ' ', '"', ',', ';', '\' then
               Result := False
            else
               Result := c.code.in_range(33, 126)
            end
            i := i + 1
         end
      end

   is_valid_cookie_path (a_path: ABSTRACT_STRING): BOOLEAN
      require
         a_path /= Void
      local
         i: INTEGER; c: CHARACTER
      do
         from
            Result := True
            i := a_path.lower
         until
            not Result or else i > a_path.upper
         loop
            c := a_path.item(i)
            inspect
               c
            when ';' then
               Result := False
            else
               Result := c.code.in_range(33, 126)
            end
            i := i + 1
         end
      end

   is_valid_domain (a_domain: ABSTRACT_STRING): BOOLEAN
      require
         a_domain /= Void
      local
         i: INTEGER; c: CHARACTER
      do
         from
            Result := True
            i := a_domain.lower
         until
            not Result or else i > a_domain.upper
         loop
            c := a_domain.item(i)
            inspect
               c
            when 'a'..'z', 'A'..'Z' then
               check Result end
            when '-' then
               Result := i /= a_domain.lower and then i /= a_domain.upper
            when '0'..'9' then
               Result := i /= a_domain.lower
            else
               Result := False
            end
            i := i + 1
         end
      end

feature {CGI_COOKIE_JAR}
   is_changed: BOOLEAN

   flush (a_output: OUTPUT_STREAM)
      require
         is_changed
      do
         a_output.put_string(name)
         a_output.put_character('=')
         if value /= Void then
            a_output.put_string(value)
         end
         if expires /= Void then
            a_output.put_string(once "; Expires=")
            a_output.put_string(format_rfc1123_date(expires.item))
         end
         if max_age /= Void then
            a_output.put_string(once "; Max-Age=")
            a_output.put_integer(max_age.item.to_integer_64)
         end
         if domain /= Void then
            a_output.put_string(once "; Domain=")
            a_output.put_string(domain)
         end
         if path /= Void then
            a_output.put_string(once "; Path=")
            a_output.put_string(path)
         end
         if secure then
            a_output.put_string(once "; Secure")
         end
         if http_only then
            a_output.put_string(once "; HttpOnly")
         end
      end

   set_initial_value (a_value: like value) assign value
      require
         a_value /= Void
         is_valid_value(a_value)
         not is_changed
      do
         value := a_value
      ensure
         value = a_value
         not is_changed
      end

feature {}
   format_rfc1123_date (a_date: TIME): STRING
      do
         Result := once ""
         Result.clear_count
         Result.append(wkday.item(a_date.week_day))
         Result.append(once ", ")
         Result.append(int_format(a_date.day, 2))
         Result.extend(' ')
         Result.append(month.item(a_date.month - 1))
         Result.extend(' ')
         Result.append(int_format(a_date.year, 4))
         Result.extend(' ')
         Result.append(int_format(a_date.hour, 2))
         Result.extend(':')
         Result.append(int_format(a_date.minute, 2))
         Result.extend(':')
         Result.append(int_format(a_date.second, 2))
         Result.append(once " GMT")
      end

   wkday: FAST_ARRAY[STRING]
      once
         Result := {FAST_ARRAY[STRING] << "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" >> }
      ensure
         Result.count = 7
         Result.lower = 0
      end

   month: FAST_ARRAY[STRING]
      once
         Result := {FAST_ARRAY[STRING] << "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" >> }
      ensure
         Result.count = 12
         Result.lower = 0
      end

   int_format (size, val: INTEGER): STRING
      do
         Result := once ""
         Result.make_filled('0', size)
         val.append_in(Result)
         Result.keep_tail(size)
      end

feature {}
   make (a_name: ABSTRACT_STRING)
      require
         a_name /= Void
         is_token(a_name)
      do
         name := a_name.intern
      ensure
         name = a_name.intern
      end

   expires_memory: REFERENCE[TIME]
   max_age_memory: REFERENCE[INTEGER]

invariant
   is_token(name)
   value /= Void implies is_valid_value(value)
   path /= Void implies is_valid_cookie_path(path)
   domain /= Void implies is_valid_domain(domain)
   expires /= Void implies expires.item.is_universal_time
   expires /= Void implies max_age = Void
   max_age /= Void implies max_age.item >= 0
   max_age /= Void implies expires = Void

end -- class CGI_COOKIE
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
