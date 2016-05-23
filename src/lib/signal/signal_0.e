-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class SIGNAL_0
   --
   -- See tutorial/signal/signals.txt for usage
   --

create {ANY}
   make

feature {}
   callbacks: FAST_ARRAY[PROCEDURE[TUPLE]]

   index, last: INTEGER
         -- work to do while emit is between index and last.

   make
         -- Initialize new signal object
      do
         create callbacks.make(0)
      ensure
         callbacks.is_empty
      end

feature {ANY}
   connect (p: PROCEDURE[TUPLE])
         -- Connect procedure to be called when signal is emitted
         -- See also last_connect_id
      require
         p /= Void
      do
         callbacks.add_last(p)
      ensure
         not callbacks.is_empty
         last_connect_id = p
      end

   emit
         -- Emit signal, ie. already registered procedure will be called
         -- in registration order except if removed by another before.
      do
         from
            index := callbacks.lower
            last := callbacks.upper
         until
            index > last
         loop
            callbacks.item(index).call([])
            index := index + 1
         end
      end

   last_connect_id: PROCEDURE[TUPLE]
         -- return identifier on the last connect which may be used
         -- for disconnect (unregister procedure)
      require
         not is_empty
      do
         Result := callbacks.last
      ensure
         Result /= Void
      end

   disconnect (connect_identifier: PROCEDURE[TUPLE])
         -- Unregister procedure for this signal. If the same
         -- procedure was registered many times, only first is removed.
      local
         i: INTEGER
      do
         i := callbacks.fast_first_index_of(connect_identifier)
         if callbacks.valid_index(i) then
            callbacks.remove(i)
            last := last - 1
            if i <= index then
               index := index - 1
            end
         end
      ensure
         old callbacks.fast_has(connect_identifier) implies callbacks.count = old callbacks.count - 1
         old (not callbacks.fast_has(connect_identifier)) implies callbacks.count = old callbacks.count
      end

   is_empty: BOOLEAN
         -- return True if no callback is registered for this signal
      do
         Result := callbacks.is_empty
      end

invariant
   callbacks /= Void

end -- class SIGNAL_0
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
