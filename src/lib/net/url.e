-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
class URL
   --
   -- Provides meaning to URL (Universal Resource Locator) strings.
   --
   -- See also [http://www.faqs.org/rfcs/rfc1738.html RFC 1738]
   --
   -- Some ideas and first draft of this class kindly provided by Serge Romanchenko [mailto:se@sir.nensi.net]
   --

insert
   HASHABLE
      redefine
         copy, out_in_tagged_out_memory
      end
   RECYCLABLE
      redefine
         copy, is_equal, out_in_tagged_out_memory
      end
   URL_VALIDITY
      redefine
         copy, is_equal, out_in_tagged_out_memory
      end

create {ANY}
   absolute, relative

create {STREAM}
   from_stream

feature {ANY}
   copy (other: like Current)
      local
         u: like uri
      do
         check -- require then
            not is_stream
            not other.is_stream
         end
         if other.protocol = Void then
            unset_protocol
            unset_uri
         else
            set_protocol(other.protocol.name)
            if other.uri = Void then
               unset_uri
            else
               u := protocol.locator(other.uri.uri)
               unset_uri
               uri := u
            end
         end
      ensure then
         not is_connected
      end

   is_equal (other: like Current): BOOLEAN
      do
         if protocol = Void then
            Result := other.protocol = Void
         elseif uri = Void then
            Result := other.uri = Void
               and then protocol.name.is_equal(other.protocol.name)
         else
            Result := protocol.name.is_equal(other.protocol.name)
               and then uri.is_equal(other.uri)
         end
      end

   hash_code: INTEGER
      do
         if uri = Void then
            if protocol /= Void then
               Result := protocol.name.hash_code
            end
         else
            Result := uri.uri.hash_code
         end
      end

   out_in_tagged_out_memory
      do
         if is_stream then
            tagged_out_memory.append(once "URL(stream)")
         else
            append_in(tagged_out_memory)
         end
      end

   append_in (s: STRING)
      require
         s /= Void
      do
         if protocol = Void then
            if uri = Void then
               s.append(once "URL(?)")
            else
               s.append(uri.uri)
            end
         else
            s.append(protocol.name)
            s.extend(':')
            if uri /= Void then
               s.append(uri.uri)
            end
         end
      end

feature {ANY} -- URL connection:
   is_connected: BOOLEAN
         -- True if the URL is connected to the resource it points to.
      do
         Result := protocol /= Void and then protocol.is_connected
      end

   can_connect: BOOLEAN
      do
         Result := uri /= Void
         check
            by_invariant: Result implies protocol /= Void
         end
      end

   connect
         -- Connect to the resource pointed by this URL.
      require
         not is_connected
         can_connect
      do
         protocol.connect_to(Current, read, write)
         if protocol.error /= Void and then error_handler /= Void then
            error_handler.call([protocol.error])
         end
      end

   disconnect
         -- Disconnect from the resource pointed by this URL.
      require
         is_connected
      do
         protocol.disconnect
      ensure
         not is_connected
      end

   input: INPUT_STREAM
         -- Data coming from the resource this URL points to.
      require
         is_connected
         read
      do
         Result := protocol.input
      end

   output: OUTPUT_STREAM
         -- Data going to the resource this URL points to.
      require
         is_connected
         write
      do
         Result := protocol.output
      end

   read_only
      require
         not is_connected
      do
         read := True
         write := False
      ensure
         read
         not write
      end

   write_only
      require
         not is_connected
      do
         read := False
         write := True
      ensure
         not read
         write
      end

   read_write
      require
         not is_connected
      do
         read := True
         write := True
      ensure
         read
         write
      end

   read: BOOLEAN
   write: BOOLEAN
   is_stream: BOOLEAN

feature {ANY} -- URL data:
   absolute (a_url: ABSTRACT_STRING)
      require
         valid_url(a_url)
         not is_stream
      local
         pn, pu: STRING; i: INTEGER
      do
         read_write
         i := a_url.first_index_of(':')
         pn := once ""
         pn.copy_substring(a_url, 1, i - 1)
         set_protocol(pn.intern)
         pu := once ""
         pu.copy_substring(a_url, i + 1, a_url.upper)
         set_uri(pu)
      ensure
         not is_connected
         not is_stream
      end

   relative (url: URL; relative_uri: STRING)
      require
         url /= Void
         not is_stream
      local
         u: like uri
      do
         read_write
         set_protocol(url.protocol.name)
         u := protocol.locator(url.uri.uri)
         u.set_relative(relative_uri)
         unset_uri
         uri := u
      ensure
         not is_connected
         not is_stream
      end

   set_error_handler (a_error_handler: like error_handler)
      do
         error_handler := a_error_handler
      end

feature {STREAM}
   from_stream (a_stream: STREAM; a_read: like read; a_write: like write)
      require
         a_stream /= Void
      local
         p: STREAM_PROTOCOL
      do
         create p.make(a_stream)
         protocol := p
         is_stream := True
         read := a_read
         write := a_write
         p.connect_to(Current, a_read, a_write)
      ensure
         is_stream
      end

feature {}
   set_protocol (protocol_name: FIXED_STRING)
         -- Sets the protocol.
      require
         protocol_name = protocol_name.intern
      local
         protocols: PROTOCOLS
      do
         unset_protocol
         protocol := protocols.protocol(protocol_name)
      ensure
         protocol.name = protocol_name
      end

   set_uri (a_uri: STRING)
         -- Sets the resource name.
      require
         protocol /= Void
         a_uri /= Void
      do
         unset_uri
         uri := protocol.locator(a_uri)
      ensure
         uri.uri.is_equal(a_uri)
      end

   unset_protocol
      local
         pp: PROTOCOLS
      do
         if protocol /= Void then
            pp.recycle(protocol)
            protocol := Void
         end
      ensure
         protocol = Void
      end

   unset_uri
      do
         if uri /= Void then
            protocol.recycle_locator(uri)
            uri := Void
         end
      ensure
         uri = Void
      end

feature {URL, PROTOCOL}
   protocol: PROTOCOL
         -- The resource protocol.

   uri: RESOURCE_LOCATOR
         -- The resource name.

feature {}
   error_handler: PROCEDURE[TUPLE[STRING]]
         -- An optional error handler

   string_pool: STRING_RECYCLING_POOL
      once
         create Result.make
      end

feature {RECYCLING_POOL}
   recycle
      do
         unset_uri
         unset_protocol
      end

invariant
   uri /= Void implies protocol /= Void
   is_stream implies uri = Void
   read or write;
   (read and then is_connected) implies input /= Void
   (write and then is_connected) implies output /= Void

end -- class URL
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
