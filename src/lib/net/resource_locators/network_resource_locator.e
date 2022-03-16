-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
class NETWORK_RESOURCE_LOCATOR
   --
   -- Provides meaning to a network URL (Universal Resource Locator) strings, by the use of accessors to
   -- different parts of it: `protocol', `username', `password', `host', `port', `path', `arguments' and
   -- `anchor' are different parts of the URL:
   --
   --   protocol://username:password@host:port/path?arguments#anchor
   --
   -- See also [http://www.faqs.org/rfcs/rfc1738.html RFC 1738]
   --

inherit
   RESOURCE_LOCATOR
      redefine
         relative_uri
      end

insert
   NETWORK_RESOURCE_VALIDITY
      undefine
         is_equal
      end

create {TCP_PROTOCOL}
   set_uri

feature {TCP_PROTOCOL}
   set_uri (a_uri: STRING)
      local
         i, j, k: INTEGER; s: STRING
      do
         s := once ""
         i := 2
         j := a_uri.index_of(':', 3)
         k := a_uri.first_index_of('@')
         if a_uri.valid_index(j) then
            if j < k then
               -- look for user
               s.copy_substring(a_uri, i + 1, j - 1)
               set_username(s)
               -- look for password
               s.copy_substring(a_uri, j + 1, k - 1)
               set_password(s)
               j := a_uri.index_of(':', j + 1)
            else
               -- look for user
               s.copy_substring(a_uri, i + 1, k - 1)
               set_username(s)
            end
            i := k
         end
         k := a_uri.index_of('/', i + 1)
         if a_uri.valid_index(k) then
            if a_uri.valid_index(j) then
               -- look for host
               s.copy_substring(a_uri, i + 1, j - 1)
               set_host(s)
               -- look for port
               s.copy_substring(a_uri, j + 1, k - 1)
               set_port(s.to_integer)
            else
               -- look for host
               s.copy_substring(a_uri, i + 1, k - 1)
               set_host(s)
            end
            i := a_uri.index_of('?', k + 1)
            j := a_uri.index_of('#', k + 1)
            if a_uri.valid_index(i) then
               -- look for path
               s.copy_substring(a_uri, k, i - 1)
               set_path(s)
               if a_uri.valid_index(j) then
                  -- look for arguments
                  s.copy_substring(a_uri, i + 1, j - 1)
                  if arguments /= Void then
                     arguments.copy(s)
                  else
                     arguments := string_pool.new_twin(s)
                  end
                  -- look for anchor
                  s.copy_substring(a_uri, j + 1, a_uri.upper)
                  set_anchor(s)
               else
                  -- look for arguments
                  s.copy_substring(a_uri, i + 1, a_uri.upper)
                  arguments := s
               end
            elseif a_uri.valid_index(j) then
               -- look for path
               s.copy_substring(a_uri, k, j - 1)
               set_path(s)
               -- look for anchor
               s.copy_substring(a_uri, j + 1, a_uri.upper)
               set_anchor(s)
            else
               -- look for path
               s.copy_substring(a_uri, k, a_uri.upper)
               set_path(s)
            end
         else
            -- no path
            set_path(string_pool.new)
         end
      end

feature {ANY}
   uri: STRING
      do
         Result := uri_string(username, password, host, port, path, arguments, anchor)
      end

feature {URL_VALIDITY}
   valid_uri (a_uri: STRING): BOOLEAN
      do
         Result := is_absolute_uri(a_uri) or else is_relative_uri(a_uri)
      end

feature {URL}
   absolute_uri (a_uri: STRING): BOOLEAN
      do
         Result := is_absolute_uri(a_uri)
      end

   relative_uri (a_uri: STRING): BOOLEAN
      do
         Result := is_relative_uri(a_uri)
      end

   set_relative (a_uri: STRING)
      local
         i: INTEGER
      do
         i := path.last_index_of('/')
         if path.valid_index(i) then
            path.shrink(1, i)
         else
            path.copy(once "/")
         end
         check
            path.last = '/'
         end
         path.append(a_uri)
      end

feature {ANY}
   username: STRING
         -- The optional user name.

   password: STRING
         -- The optional password.

   host: STRING
         -- The host name.

   port: INTEGER
         -- The port; 0 means use the standard port of the protocol.

   path: STRING
         -- The path.

   arguments: STRING
         -- The optional arguments.

   anchor: STRING
         -- The optional anchor.

feature {}
   set_host (a_host: like host)
         -- Sets the host name.
      require
         not a_host.is_empty
      do
         if host /= Void then
            host.copy(a_host)
         else
            host := string_pool.new_twin(a_host)
         end
      ensure
         host.is_equal(a_host)
      end

   set_port (a_port: like port)
         -- Sets the port number; 0 means use the standard port of the protocol.
      require
         a_port >= 0
      do
         port := a_port
      ensure
         port = a_port
      end

   set_username (a_username: like username)
         -- Sets an optional user name; Void clears it.
      do
         if username /= Void then
            username.copy(a_username)
         else
            username := string_pool.new_twin(a_username)
         end
      ensure
         username.is_equal(a_username)
      end

   set_password (a_password: like password)
         -- Sets an optional password; Void clears it.
      require
         a_password /= Void implies username /= Void
      do
         if password /= Void then
            password.copy(a_password)
         else
            password := string_pool.new_twin(a_password)
         end
      ensure
         password.is_equal(a_password)
      end

   set_path (a_path: like path)
         -- Sets the path.
      require
         not a_path.is_empty
      do
         if path /= Void then
            path.copy(a_path)
         else
            path := string_pool.new_twin(a_path)
         end
      ensure
         path.is_equal(a_path)
      end

   set_arguments (a_argument_name, a_argument_value: STRING)
         -- Sets an optional argument. May be called more than once to add more arguments. A Void name clears
         -- all the arguments.
      require
         a_argument_value /= Void implies a_argument_name /= Void
      do
         if a_argument_name = Void then
            if arguments /= Void then
               string_pool.recycle(arguments)
            end
            arguments := Void
         else
            if arguments = Void then
               arguments := string_pool.new_twin(a_argument_name)
            else
               arguments.extend('&')
               arguments.append(a_argument_name)
            end
            if a_argument_value /= Void then
               arguments.extend('=')
               arguments.append(encode(a_argument_value))
            end
         end
      end

   set_anchor (a_anchor: like anchor)
         -- Sets an optional anchor.
      do
         if a_anchor = Void then
            if anchor /= Void then
               string_pool.recycle(anchor)
            end
            anchor := Void
         else
            if anchor /= Void then
               anchor.copy(a_anchor)
            else
               anchor := string_pool.new_twin(a_anchor)
            end
         end
      ensure
         a_anchor = Void implies anchor = Void
         a_anchor /= Void implies anchor.is_equal(a_anchor)
      end

   uri_string (a_user, a_pwd, a_host: STRING; a_port: INTEGER; a_path, a_args, a_anchor: STRING): STRING
      do
         Result := once ""
         Result.copy(once "//")
         if a_user /= Void then
            Result.append(a_user)
            if a_pwd /= Void then
               Result.extend(':')
               Result.append(a_pwd)
            end
         end
         if a_user /= Void then
            Result.extend('@')
         end
         Result.append(a_host)
         if a_port /= 0 then
            Result.extend(':')
            a_port.append_in(Result)
         end
         if a_path /= Void then
            Result.append(a_path)
         end
         if a_args /= Void then
            Result.extend('?')
            Result.append(a_args)
         end
         if a_anchor /= Void then
            Result.extend('#')
            Result.append(a_anchor)
         end
         Result := decode(Result)
      end

feature {}
   encode (string: STRING): STRING
      require
         string /= Void
      local
         i: INTEGER; c: CHARACTER
      do
         Result := once ""
         Result.clear_count
         from
            i := string.lower
         until
            i > string.upper
         loop
            c := string.item(i)
            inspect
               c
            when '%U' .. ' ', '%%', '<', '>', '%"', '#', '{', '}', '|', '\', '^', '~', '[', ']', '`', '%/127/' .. '%/255/',
               ';', '/', '?', ':', '@', '=', '&' then
               -- list of "unsafe" and "reserved" characters from RFC1738
               Result.extend('%%')
               c.to_hexadecimal_in(Result)
            else
               Result.extend(c)
            end
            i := i + 1
         end
      ensure
         Result /= Void
      end

   decode (string: STRING): STRING
      require
         string /= Void
      local
         i, n: INTEGER; c: CHARACTER
      do
         Result := once ""
         Result.clear_count
         from
            i := string.lower
         until
            i > string.upper
         loop
            c := string.item(i)
            if c /= '%%' then
               Result.extend(c)
               i := i + 1
            else
               c := string.item(i + 1)
               inspect
                  c
               when '0'..'9' then
                  n := c.code - '0'.code
               when 'A'..'Z' then
                  n := c.code - 'A'.code + 10
               when 'a' .. 'z' then
                  n := c.code - 'a'.code + 10
               end
               c := string.item(i + 2)
               inspect
                  c
               when '0'..'9' then
                  n := n*16 + c.code - '0'.code
               when 'A'..'Z' then
                  n := n*16 + c.code - 'A'.code + 10
               when 'a'..'z' then
                  n := n*16 + c.code - 'a'.code + 10
               end
               Result.extend(n.to_character)
               i := i + 3
            end
         end
      end

   string_pool: STRING_RECYCLING_POOL
      once
         create Result.make
      end

feature {RECYCLING_POOL}
   recycle
      do
         string_pool.recycle(host)
         string_pool.recycle(path)
         if username /= Void then
            string_pool.recycle(username)
            username := Void
         end
         if password /= Void then
            string_pool.recycle(password)
            password := Void
         end
         if arguments /= Void then
            string_pool.recycle(arguments)
            arguments := Void
         end
         if anchor /= Void then
            string_pool.recycle(anchor)
            anchor := Void
         end
      end

invariant
   has_host: not host.is_empty
   meaningful_port: port >= 0
   has_path: not path.is_empty

end -- class NETWORK_RESOURCE_LOCATOR
--
-- Copyright (C) 2009-2022: by all the people cited in the AUTHORS file.
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
