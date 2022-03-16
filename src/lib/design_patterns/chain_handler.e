-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class CHAIN_HANDLER[C_ -> CHAIN_OF_RESPONSIBILITY]
   --
   -- Part of a chain of responsibility. It must tell if it is able to handle a request, and then handle it.
   --

feature {CHAIN_OF_RESPONSIBILITY}
   can_handle (chain: C_): BOOLEAN
         -- True if the handler can indeed handle a request from the given chain of responsibility.
      require
         chain /= Void
      deferred
      end

   handle (chain: C_)
         -- Handle a request from the given chain of responsibility.
      require
         chain /= Void
         can_handle(chain)
      deferred
      end

end -- class CHAIN_HANDLER
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
