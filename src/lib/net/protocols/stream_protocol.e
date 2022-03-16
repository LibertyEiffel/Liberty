-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
class STREAM_PROTOCOL
   --
   -- A protocol used for internal purposes: implementation of STREAM.url
   --

inherit
   PROTOCOL

create {URL}
   make

feature {ANY}
   name: FIXED_STRING
      do
         Result := out.intern -- make it as ugly as possible. Not a possible URL protocol name.
      end

   is_connected: BOOLEAN
      do
         Result := stream.is_connected
      end

   error: STRING
      do
         -- not used; always Void (no error)
      end

feature {URL_VALIDITY}
   valid_uri (a_uri: STRING): BOOLEAN
      do
         check False end
      end

feature {URL}
   connect_to (url: URL; read, write: BOOLEAN)
      require else
         True
      do
         if read and then instream ?:= stream then
            instream ::= stream
         end
         if write and then outstream ?:= stream then
            outstream ::= stream
         end
      end

   disconnect
      do
         stream.disconnect
      end

   input: INPUT_STREAM
      do
         Result := instream
      end

   output: OUTPUT_STREAM
      do
         Result := outstream
      end

   locator (a_uri: STRING): RESOURCE_LOCATOR
      do
         check False end
      end

   recycle_locator (a_locator: RESOURCE_LOCATOR)
      do
         check False end
      end

feature {}
   make (a_stream: like stream)
      require
         a_stream /= Void
      do
         stream := a_stream
      end

   stream: STREAM
   instream: INPUT_STREAM
   outstream: OUTPUT_STREAM

invariant
   stream /= Void
   instream /= Void implies instream = stream
   outstream /= Void implies outstream = stream

end -- STREAM_PROTOCOL
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
