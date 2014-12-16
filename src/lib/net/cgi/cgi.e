-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
class CGI
   --
   -- This class provides a simple executable framework for CGI implementation.
   --
   -- See RFC 3875
   --

insert
   SINGLETON

create {CGI_HANDLER}
   make

feature {ANY}
   run is
      local
         crm: CGI_REQUEST_METHOD
      do
         http_status := 200
         crm := request_method
         if error = Void then
            crm.invoke(Current, handler)
         else
            --| **** TODO error
         end
         if http_content_type = Void then
            prepare_error
            error.copy("Missing Content_Type")
            http_content_type := Http_content_type_text_plain
         end
         std_output.put_string(http_content_type_text_plain)
         std_output.put_character(' ')
         std_output.put_integer(http_status)
         std_output.put_new_line
         --| **** TODO headers and body
      end

feature {}
   http_status: INTEGER
   http_content_type: FIXED_STRING

feature {CGI_HANDLER}
   Http_content_type_text_plain: FIXED_STRING
      once
         Result := "text/plain".intern
      end

   Http_content_type_text_html: FIXED_STRING
      once
         Result := "text/html".intern
      end

   Http_content_type_text_xml: FIXED_STRING
      once
         Result := "text/xml".intern
      end

   Http_content_type_application_xml: FIXED_STRING
      once
         Result := "application/xml".intern
      end

   Http_content_type_application_json: FIXED_STRING
      once
         Result := "application/json".intern
      end

   error: STRING

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
               error.copy(once "Unknown AUTH_TYPE: ")
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
         elseif l.is_integer then
            len := l.to_integer
            if len >= 0 then
               Result.set_length(len)
            else
               Result.set_error
               prepare_error
               error.copy(once "Invalid negative CONTENT_LENGTH: ")
               len.append_in(error)
            end
         else
            Result.set_error
            prepare_error
            error.copy(once "Invalid CONTENT_LENGTH: ")
            error.append(l)
         end
      ensure
         Result.error implies error /= Void
      end

   content_type: CGI_CONTENT_TYPE
      local
         t: STRING
      do
         t := meta_variable(once "CONTENT_TYPE")
         if t /= Void and then not t.is_empty then
            create Result.make(t)
            if Result.error /= Void then
               prepare_error
               error.copy(Result.error)
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
         if t /= Void and then not t.is_empty then
            create Result.make(t)
            if Result.error /= Void then
               prepare_error
               error.copy(Result.error)
            end
         end
      ensure
         (Result /= Void and then Result.error /= Void) implies error.is_equal(Result.error)
      end

   path_info: CGI_PATH_INFO
      local
         t: STRING
      do
         t := meta_variable(once "PATH_INFO")
         if t /= Void and then not t.is_empty then
            create Result.make(t)
         end
      end

   path_translated: CGI_PATH_TRANSLATED
      local
         t: STRING
      do
         t := meta_variable(once "PATH_TRANSLATED")
         if t /= Void and then not t.is_empty then
            create Result.make(t)
         end
      end

   query_string: CGI_QUERY_STRING
      local
         t: STRING
      do
         t := meta_variable(once "PATH_TRANSLATED")
         if t /= Void and then not t.is_empty then
            Result.set(t)
            if Result.error /= Void then
               prepare_error
               error.copy(Result.error)
            end
         end
      ensure
         Result.error /= Void implies error.is_equal(Result.error)
      end

   remote_info: CGI_REMOTE_INFO
      local
         addr, host, ident, user: STRING
      do
         addr := meta_variable(once "REMOTE_ADDR")
         host := meta_variable(once "REMOTE_HOST")
         ident := meta_variable("REMOTE_IDENT")
         user := meta_variable("REMOTE_USER")
         create Result.make(addr, info, ident, user)
         if Result.error /= Void then
            prepare_error
            error.copy(Result.error)
         end
      ensure
         Result.error /= Void implies error.is_equal(Result.error)
      end

   request_method: CGI_REQUEST_METHOD
      local
         t: STRING
      do
         t := meta_variable("REQUEST_METHOD")
         if t = Void or else t.is_empty then
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
         else
            prepare_error
            error.copy(once "Invalid REQUEST_METHOD: ")
            error.append(t)
         end
      ensure
         Result = Void implies error /= Void
      end

   script_name: CGI_SCRIPT_NAME
      local
         t: STRING
      do
         t := meta_variable("SCRIPT_NAME")
         if t /= Void and then not t.is_empty then
            Result.set(t)
            if Result.error /= Void then
               prepare_error
               error.copy(Result.error)
            end
         end
      ensure
         Result.error /= Void implies error.is_equal(Result.error)
      end

   server_info: CGI_SERVER_INFO
      local
         name, port, protocol, software: STRING
      do
         name := meta_variable("SERVER_NAME")
         port := meta_variable("SERVER_PORT")
         protocol := meta_variable("SERVER_PROTOCOL")
         software := meta_variable("SERVER_SOFTWARE")
         create Result.make(name, port, protocol, software)
         if Result.error /= Void then
            prepare_error
            error.copy(Result.error)
         end
      end

   header_pattern: REGULAR_EXPRESSION
         -- ^[0-9A-Za-z-]+$
      local
         builder: REGULAR_EXPRESSION_BUILDER
      once
         Result := builder.convert_posix_pattern(once "^[0-9A-Za-z-]+$")
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
         end
      end

feature {}
   make (a_handler: like handler) is
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
      end

   handler: CGI_HANDLER
   error_memory: STRING is ""

   prepare_error
      do
         http_status := 500
         error := error_memory
      end

invariant
   handler /= Void

end -- class CGI
--
-- Copyright (c) 2009-2014 by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software
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
