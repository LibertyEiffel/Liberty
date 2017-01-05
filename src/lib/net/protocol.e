-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
deferred class PROTOCOL

insert
   RECYCLABLE
   DISPOSABLE

feature {ANY}
   name: FIXED_STRING
      deferred
      end

   is_connected: BOOLEAN
      deferred
      end

   error: STRING
      deferred
      end

feature {URL_VALIDITY}
   valid_uri (a_uri: STRING): BOOLEAN
      deferred
      end

feature {URL}
   connect_to (url: URL; read, write: BOOLEAN)
      require
         url.uri /= Void
         not is_connected
         read or write
      deferred
      end

   disconnect
      require
         is_connected
      deferred
      ensure
         not is_connected
      end

   input: INPUT_STREAM
      require
         is_connected
      deferred
      end

   output: OUTPUT_STREAM
      require
         is_connected
      deferred
      end

   locator (a_uri: STRING): RESOURCE_LOCATOR
         -- PROTOCOL is a factory of RESOURCE_LOCATOR
      require
         valid_uri(a_uri)
      deferred
      ensure
         Result.uri.is_equal(a_uri)
      end

   recycle_locator (a_locator: RESOURCE_LOCATOR)
      require
         a_locator /= Void
      deferred
      end

feature {RECYCLING_POOL}
   recycle
      do
         if is_connected then
            disconnect
            check
               -- Because the previous code is just here to catch
               -- non-clean usage of PROCOTOLs:
               disconnect_after_use: False
            end
         end
      end

feature {}
   dispose
      do
         if is_connected then
            disconnect
            check
               -- Because the previous code is just here to catch
               -- non-clean usage of PROCOTOLs:
               disconnect_after_use: False
            end
         end
      end

invariant
   error /= Void implies not is_connected

end -- class PROTOCOL
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
