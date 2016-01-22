-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class XML_STREAM_REPOSITORY [O_ -> STORABLE]
   --
   -- To be used via streams that commit and update the XML repository
   --
inherit
   XML_REPOSITORY_IMPL[O_]

create {ANY}
   connect_to

feature {ANY} -- Updating and committing
   commit
      do
         write_to_stream(out_stream)
      end

   is_commitable: BOOLEAN
      do
         Result := commit_stream /= Void and then commit_stream.is_connected
      end

   update
      do
         read_from_stream(update_stream)
      end

   is_updateable: BOOLEAN
      do
         Result := update_stream /= Void and then update_stream.is_connected
      end

   is_connected: BOOLEAN
      do
         Result := commit_stream /= Void and then commit_stream.is_connected
      end

feature {ANY} -- Creation
   connect_to (a_in_stream: like update_stream; a_out_stream: like commit_stream)
         -- Connect to a repository with streams as physical store.
      do
         make
         update_stream := a_in_stream
         commit_stream := a_out_stream

         if a_out_stream /= Void then
            create out_stream.make(a_out_stream, version)
         end
      end

feature {}
   update_stream: INPUT_STREAM
   commit_stream: OUTPUT_STREAM
   out_stream: XML_REPOSITORY_OUTPUT

end -- class XML_STREAM_REPOSITORY
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
