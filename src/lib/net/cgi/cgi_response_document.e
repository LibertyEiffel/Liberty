-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
class CGI_RESPONSE_DOCUMENT
   --
   -- CGI response implementation: CGI-document (the most used)
   --

inherit
   CGI_RESPONSE
      redefine
         out_in_tagged_out_memory
      end

insert
   CGI_RESPONSE_FIELDS
      redefine
         out_in_tagged_out_memory
      end
   CGI_RESPONSE_BODY
      redefine
         set_content_type, out_in_tagged_out_memory
      end

create {ANY}
   set_status_and_error, set_error, set_content_type, set_status

feature {CGI_HANDLER}
   status: INTEGER

   error: FIXED_STRING
      do
         if error_memory /= Void then
            Result := error_memory.intern
         end
      end

feature {CGI, CGI_HANDLER}
   set_error (a_error: ABSTRACT_STRING)
      require
         a_error /= Void
      do
         set_status_and_error(500, a_error)
      end

   set_status_and_error (a_status: INTEGER; a_error: ABSTRACT_STRING)
      require
         is_valid_status(a_status)
         a_status >= 500
         a_error /= Void
      do
         status := a_status
         if error_memory = Void then
            create error_memory.make_from_string(a_error)
         else
            error_memory.extend('%N')
            error_memory.append(a_error)
         end
         set_content_type(once "text/plain")
      end

   set_content_type (a_content_type: ABSTRACT_STRING)
      do
         Precursor(a_content_type)
         if status = 0 then
            status := 200
         end
      end

   set_status (a_status: INTEGER)
      require
         is_valid_status(a_status)
      do
         status := a_status
         if content_type = Void then
            set_content_type(once "text/plain")
         end
      ensure
         status = a_status
      end

   is_valid_status (a_status: INTEGER): BOOLEAN
      do
         Result := reasons.has(a_status)
      end

   status_reason: FIXED_STRING
      do
         Result := reasons.at(status)
      end

feature {CGI}
   flush (a_cgi: CGI; a_output: OUTPUT_STREAM): BOOLEAN
      do
         flush_content_type(a_output)
         if status /= 200 then
            a_output.put_string(once "Status:")
            a_output.put_integer(status)
            a_output.put_string(crlf)
         end
         flush_fields(a_output)
         a_output.put_string(crlf)
         if error = Void then
            flush_body(a_output)
         else
            a_output.put_string(error)
            a_output.put_string(crlf)
         end
         Result := True
      end

feature {ANY}
   out_in_tagged_out_memory
      do
         tagged_out_memory.append(once "{CGI_RESPONSE_DOCUMENT status=")
         status.append_in(tagged_out_memory)
         tagged_out_memory.extend('}')
      end

feature {}
   error_memory: STRING

   reasons: MAP[FIXED_STRING, INTEGER]
      once
         Result := {HASHED_DICTIONARY[FIXED_STRING, INTEGER] <<
            "Continue".intern                                      , 100;
            "Switching Protocols".intern                           , 101;
            "OK".intern                                            , 200;
            "Created".intern                                       , 201;
            "Accepted".intern                                      , 202;
            "Non-Authoritative Information".intern                 , 203;
            "No Content".intern                                    , 204;
            "Reset Content".intern                                 , 205;
            "Partial Content".intern                               , 206;
            "Multiple Choices".intern                              , 300;
            "Moved Permanently".intern                             , 301;
            "Found".intern                                         , 302;
            "See Other".intern                                     , 303;
            "Not Modified".intern                                  , 304;
            "Use Proxy".intern                                     , 305;
            "Temporary Redirect".intern                            , 307;
            "Bad Request".intern                                   , 400;
            "Unauthorized".intern                                  , 401;
            "Payment Required".intern                              , 402;
            "Forbidden".intern                                     , 403;
            "Not Found".intern                                     , 404;
            "Method Not Allowed".intern                            , 405;
            "Not Acceptable".intern                                , 406;
            "Proxy Authentication Required".intern                 , 407;
            "Request Time-out".intern                              , 408;
            "Conflict".intern                                      , 409;
            "Gone".intern                                          , 410;
            "Length Required".intern                               , 411;
            "Precondition Failed".intern                           , 412;
            "Request Entity Too Large".intern                      , 413;
            "Request-URI Too Large".intern                         , 414;
            "Unsupported Media Type".intern                        , 415;
            "Requested range not satisfiable".intern               , 416;
            "Expectation Failed".intern                            , 417;
            "Internal Server Error".intern                         , 500;
            "Not Implemented".intern                               , 501;
            "Bad Gateway".intern                                   , 502;
            "Service Unavailable".intern                           , 503;
            "Gateway Time-out".intern                              , 504;
            "HTTP Version not supported".intern                    , 505;
         >> }
      end

invariant
   is_valid_status(status)

end -- class CGI_RESPONSE_DOCUMENT
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
