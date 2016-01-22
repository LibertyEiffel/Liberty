-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
expanded class URL_VALIDITY

feature {ANY}
   valid_url (a_url: ABSTRACT_STRING): BOOLEAN
         -- True if the STRING represents a real URL (i.e. with a known protocol and a valid URI for that
         -- protocol)
      require
         a_url /= Void
      local
         i: INTEGER; protocol_name, protocol_uri: STRING
         p: PROTOCOL; protocols: PROTOCOLS
      do
         i := a_url.first_index_of(':')
         if a_url.valid_index(i) and then a_url.count > i then
            protocol_name := once ""
            protocol_name.copy_substring(a_url, 1, i-1)
            if protocols.known_protocol(protocol_name) then
               p := protocols.protocol(protocol_name)
               protocol_uri := once ""
               protocol_uri.copy_substring(a_url, i+1, a_url.upper)
               Result := p.valid_uri(protocol_uri)
               protocols.recycle(p)
            end
         end
      end

end -- class URL_VALIDITY
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
