-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class CHAIN_OF_RESPONSIBILITY
   --
   -- The ''Chain Of Responsibility'' Design Pattern reified. Such a chain is made of handlers you can add or
   -- remove at your leisure.
   --
   -- The Chain itself is a ''Command'' (see that Design Pattern).  Executing that command looks for a handler
   -- that can handle a request, and let it handle that request.
   --
   -- How you do implement the query is up to you. The handlers are given `Current' i.e. the Chain itself, and
   -- CHAIN_HANDLER is a generic class so you can implement your own protocol.
   --

inherit
   COMMAND

feature {ANY}
   add (c: CHAIN_HANDLER[like Current])
         -- Add a handler to the Chain.
      do
         chain.add_last(c)
      end

   remove (c: CHAIN_HANDLER[like Current])
         -- Remove a handler from the Chain.
      require
         has(c)
      local
         i: INTEGER
      do
         i := chain.first_index_of(c)
         chain.remove(i)
      end

   has (c: CHAIN_HANDLER[like Current]): BOOLEAN
         -- Does the handler belong to the chain?
      do
         Result := chain.has(c)
      end

feature {ANY}
   execute
         -- Find a suitable handler to handle a request.
      local
         i: INTEGER; ok: BOOLEAN
      do
         from
            i := chain.lower
         until
            ok or else i > chain.upper
         loop
            if chain.item(i).can_handle(Current) then
               chain.item(i).handle(Current)
               ok := True
            end
            i := i + 1
         end
      end

feature {}
   chain: FAST_ARRAY[CHAIN_HANDLER[like Current]]

invariant
   chain /= Void

end -- class CHAIN_OF_RESPONSIBILITY
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
