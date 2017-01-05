-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
class HTTP_PROTOCOL
   --
   -- To access to "http://..." URLs
   --

inherit
   TCP_PROTOCOL
      redefine
         connect_to
      end

create {PROTOCOLS}
   make

feature {ANY}
   name: FIXED_STRING

   is_connected: BOOLEAN
      do
         Result := sockinout /= Void and then sockinout.is_connected
      end

   standard_port: INTEGER

feature {URL}
   input: INPUT_STREAM

   output: OUTPUT_STREAM

   disconnect
      do
         sockinout.detach
         sockinout.disconnect
      end

   connect_to (url: URL; read, write: BOOLEAN)
      local
         proxy: HTTP_PROXY
      do
         if proxy_url /= Void then
            Precursor(proxy_url, read, write)
         elseif proxy.url = Void then
            Precursor(url, read, write)
         else
            proxy_url := proxy.url
            Precursor(proxy_url, read, write)
         end
      end

feature {}
   make (a_name: like name; a_standard_port: like standard_port)
      do
         name := a_name
         standard_port := a_standard_port
      end

   sockinout: SOCKET_INPUT_OUTPUT_STREAM

   proxy_url: URL

   tcp_connect_to (ios: SOCKET_INPUT_OUTPUT_STREAM; url: URL; read, write: BOOLEAN)
      local
         nrl: NETWORK_RESOURCE_LOCATOR
         hin: HTTP_CLIENT_INPUT_STREAM; hout: HTTP_CLIENT_OUTPUT_STREAM
      do
         if hin = Void then
            create hin.connect_to(ios)
            create hout.connect_to(ios)
         else
            hin.connect_to(ios)
            hout.connect_to(ios)
         end
         if read then
            input := hin
         end
         if write then
            output := hout
         end
         sockinout := ios
         if proxy_url /= Void then
            -- we are talking to a proxy
            not_yet_implemented
         else
            -- direct connection to Internet: just issue the simple request
            nrl ::= url.uri
            hout.put_request(nrl)
            sedb_breakpoint
         end
         hin.start
         inspect
            hin.return_code
         when "200" then
            -- hurray!
         when "305" then
            -- use proxy with the given location
            if proxy_url /= Void then
               -- strange!!
            else
               create proxy_url.absolute(hin.header.at(once "location"))
               connect_to(url, read, write)
            end
         else
            not_yet_implemented
         end
      end

end -- class HTTP_PROTOCOL
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
