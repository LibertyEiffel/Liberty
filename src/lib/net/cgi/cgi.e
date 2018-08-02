-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
class CGI
   --
   -- This class provides a simple executable framework for CGI implementation.
   --
   -- It is meant to be instanciated once, used in a one-shot process that dies quickly.
   -- Hence the light memory management.
   --
   -- See RFC 3875
   --

insert
   SINGLETON
   DISPOSABLE
      undefine
         is_equal
      end
   CGI_IO
      undefine
         is_equal
      end

create {CGI_HANDLER}
   make

feature {ANY}
   run
      require
         need_run
      local
         crm: CGI_REQUEST_METHOD
         ok: BOOLEAN
      do
         crm := request_method
         if error = Void then
            state := 1
            crm.invoke(handler)
         else
            state := -1
            ok := (create {CGI_RESPONSE_DOCUMENT}.set_error(error)).flush(Current, output)
            check ok end
         end
      ensure
         need_reply or else done
      end

   need_run: BOOLEAN
      do
         Result := state = 0
      end

   need_reply: BOOLEAN
      do
         Result := state = 1
      end

   done: BOOLEAN
      do
         Result := state = -1
      end

feature {CGI_HANDLER}
   reply (response: CGI_RESPONSE)
      require
         need_reply
         response /= Void
      local
         ok: BOOLEAN
      do
         state := -1
         if error = Void then
            ok := response.flush(Current, output)
            if not ok then
               prepare_error
               error.append(once "Failed response flush: ")
               error.append(response.out)
            end
         end
         if error /= Void then
            ok := (create {CGI_RESPONSE_DOCUMENT}.set_error(error)).flush(Current, output)
            check ok end
         end
      ensure
         done
      end

   error: STRING

feature {CGI_HANDLER, CGI_RESPONSE}
   auth_type: CGI_AUTH_TYPE
      local
         t: STRING
      do
         t := meta_variable(once "AUTH_TYPE")
         if t = Void or else t.is_empty then
            create {CGI_AUTH_TYPE_NONE} Result
         else
            inspect
               t
            when "Basic" then
               create {CGI_AUTH_TYPE_BASIC} Result
            when "Digest" then
               create {CGI_AUTH_TYPE_DIGEST} Result
            else
               prepare_error
               error.append(once "Unknown AUTH_TYPE: ")
               error.append(t)
            end
         end
      ensure
         Result = Void implies error /= Void
      end

   content_length: CGI_CONTENT_LENGTH
      local
         l: STRING; len: INTEGER
      do
         l := meta_variable(once "CONTENT_LENGTH")
         if l = Void or else l.is_empty then
            check not Result.is_known end
         elseif l.is_integer then
            len := l.to_integer
            if len >= 0 then
               Result.set_length(len)
            else
               Result.set_error
               prepare_error
               error.append(once "Invalid negative CONTENT_LENGTH: ")
               len.append_in(error)
            end
         else
            Result.set_error
            prepare_error
            error.append(once "Invalid CONTENT_LENGTH: ")
            error.append(l)
         end
      ensure
         Result.error implies error /= Void
      end

   content_type: CGI_CONTENT_TYPE
      local
         t: STRING
      do
         Result := content_type_memory
         if Result = Void then
            t := meta_variable(once "CONTENT_TYPE")
            if t /= Void then
               if not t.is_empty then
                  create Result.make(t)
                  if Result.error = Void then
                     content_type_memory := Result
                  else
                     prepare_error
                     error.append(Result.error)
                  end
               end
               pool.recycle(t)
            end
         end
      ensure
         (Result /= Void and then Result.error /= Void) implies error.is_equal(Result.error)
      end

   gateway_interface: CGI_GATEWAY_INTERFACE
      local
         t: STRING
      do
         t := meta_variable(once "GATEWAY_INTERFACE")
         if t /= Void then
            if not t.is_empty then
               Result.set(t)
               if Result.error /= Void then
                  prepare_error
                  error.append(Result.error)
               end
            end
            pool.recycle(t)
         end
      ensure
         Result.error /= Void implies error.is_equal(Result.error)
      end

   path_info: CGI_PATH_INFO
      local
         t: STRING
      do
         Result := path_info_memory
         if Result = Void then
            t := meta_variable(once "PATH_INFO")
            if t /= Void then
               if not t.is_empty then
                  if t.first = '/' then
                     create Result.make(t)
                     path_info_memory := Result
                  else
                     prepare_error
                     error.append(once "Invalid PATH_INFO: ")
                     error.append(t)
                  end
               end
               pool.recycle(t)
            end
         end
      end

   path_translated: CGI_PATH_TRANSLATED
      local
         t: STRING
      do
         Result := path_translated_memory
         if Result = Void then
            t := meta_variable(once "PATH_TRANSLATED")
            if t /= Void then
               if not t.is_empty then
                  create Result.make(t)
                  path_translated_memory := Result
               end
               pool.recycle(t)
            end
         end
      end

   query_string: CGI_QUERY_STRING
      local
         t: STRING
      do
         t := meta_variable(once "QUERY_STRING")
         if t /= Void then
            if not t.is_empty then
               Result.set(t)
               if Result.error /= Void then
                  prepare_error
                  error.append(Result.error)
               end
            end
            pool.recycle(t)
         end
      ensure
         Result.error /= Void implies error.is_equal(Result.error)
      end

   remote_info: CGI_REMOTE_INFO
      local
         addr, host, ident, user: STRING
      do
         Result := remote_info_memory
         if Result = Void then
            addr := meta_variable(once "REMOTE_ADDR")
            host := meta_variable(once "REMOTE_HOST")
            ident := meta_variable(once "REMOTE_IDENT")
            user := meta_variable(once "REMOTE_USER")
            create Result.make(addr, host, ident, user)
            if Result.error = Void then
               remote_info_memory := Result
            else
               prepare_error
               error.append(Result.error)
            end
            if addr /= Void then
               pool.recycle(addr)
            end
            if host /= Void then
               pool.recycle(host)
            end
            if ident /= Void then
               pool.recycle(ident)
            end
            if user /= Void then
               pool.recycle(user)
            end
         end
      ensure
         Result.error /= Void implies error.is_equal(Result.error)
      end

   request_method: CGI_REQUEST_METHOD
      local
         t: STRING
      do
         Result := request_method_memory
         if Result = Void then
            t := meta_variable(once "REQUEST_METHOD")
            if t = Void then
               prepare_error
               error.append(once "Invalid empty or null REQUEST_METHOD")
            elseif t.is_empty then
               prepare_error
               error.append(once "Invalid empty or null REQUEST_METHOD")
               pool.recycle(t)
            else
               inspect
                  t
               when "GET" then
                  create {CGI_REQUEST_METHOD_GET} Result
               when "POST" then
                  create {CGI_REQUEST_METHOD_POST} Result
               when "HEAD" then
                  create {CGI_REQUEST_METHOD_HEAD} Result
               when "PUT" then
                  create {CGI_REQUEST_METHOD_PUT} Result
               when "DELETE" then
                  create {CGI_REQUEST_METHOD_DELETE} Result
               else
                  create {CGI_REQUEST_METHOD_OTHER} Result.make(t.intern)
               end
               request_method_memory := Result
               pool.recycle(t)
            end
         end
      ensure
         Result = Void implies error /= Void
      end

   script_name: CGI_SCRIPT_NAME
      local
         t: STRING
      do
         t := meta_variable(once "SCRIPT_NAME")
         if t /= Void then
            if not t.is_empty then
               Result.set(t)
               if Result.error /= Void then
                  prepare_error
                  error.append(Result.error)
               end
            end
            pool.recycle(t)
         end
      ensure
         Result.error /= Void implies error.is_equal(Result.error)
      end

   server_info: CGI_SERVER_INFO
      local
         name, port, protocol, software, https: STRING
      do
         Result := server_info_memory
         if Result = Void then
            name := meta_variable(once "SERVER_NAME")
            port := meta_variable(once "SERVER_PORT")
            protocol := meta_variable(once "SERVER_PROTOCOL")
            software := meta_variable(once "SERVER_SOFTWARE")
            https := meta_variable(once "HTTPS")
            create Result.make(name, port, protocol, software, https)
            if Result.error = Void then
               server_info_memory := Result
            else
               prepare_error
               error.append(Result.error)
            end
            if name /= Void then
               pool.recycle(name)
            end
            if port /= Void then
               pool.recycle(port)
            end
            if protocol /= Void then
               pool.recycle(protocol)
            end
            if software /= Void then
               pool.recycle(software)
            end
            if https /= Void then
               pool.recycle(https)
            end
         end
      end

   url: URL
      local
         string: STRING; sn: like script_name; qs: like query_string
      do
         Result := url_memory
         if Result = Void then
            string := once ""
            string.clear_count
            if server_info.protocol /= Void then
               string.append(server_info.protocol.name)
            else
               string.append(once "unknown")
            end
            string.append(once "://")
            string.append(header(once "HOST"))
            sn := script_name
            if sn.is_set then
               string.append(sn.name)
            end
            qs := query_string
            if qs.string /= Void then
               string.append(qs.string)
            end
            create Result.absolute(string)
            url_memory := Result
         end
      end

   header_pattern: REGULAR_EXPRESSION
         -- ^[0-9A-Za-z-]+$
      local
         builder: REGULAR_EXPRESSION_BUILDER
      once
         Result := builder.convert_posix_pattern("^[0-9A-Za-z-]+$")
      end

   header (field: ABSTRACT_STRING): FIXED_STRING
      require
         header_pattern.match(field)
      local
         var, value: STRING; i: INTEGER; c: CHARACTER
      do
         var := once ""
         var.copy(once "HTTP_")
         from
            i := field.lower
         until
            i > field.upper
         loop
            c := field.item(i)
            if c = '-' then
               var.extend('_')
            else
               var.extend(c)
            end
            i := i + 1
         end
         value := meta_variable(var)
         if value /= Void then
            Result := value.intern
            pool.recycle(value)
         end
      end

feature {}
   make (a_handler: like handler)
      require
         a_handler /= Void
      do
         handler := a_handler
      ensure
         handler = a_handler
      end

   meta_variable (var: STRING): STRING
      local
         sys: SYSTEM
      do
         Result := sys.get_environment_variable(var)
         if Result /= Void then
            Result := pool.new_twin(Result)
         end
      end

   handler: CGI_HANDLER
   error_memory: STRING ""

   prepare_error
      do
         if error = Void then
            error := error_memory
            error.clear_count
         else
            error.extend('%N')
         end
      end

   state: INTEGER_8

   pool: STRING_RECYCLING_POOL
      once
         create Result.make
      end

   content_type_memory: CGI_CONTENT_TYPE
   path_info_memory: CGI_PATH_INFO
   path_translated_memory: CGI_PATH_TRANSLATED
   remote_info_memory: CGI_REMOTE_INFO
   request_method_memory: CGI_REQUEST_METHOD
   server_info_memory: CGI_SERVER_INFO
   url_memory: URL

feature {}
   dispose
      do
         check done end
      end

invariant
   handler /= Void

end -- class CGI
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
