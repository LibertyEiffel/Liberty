-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class OBSERVABLE
   --
   -- Part of the ''Observer'' Design Pattern. An object of this class should notify its observers whenever its
   -- state changes. Use the `notify' feature for that.
   --
   -- See also OBSERVER.
   --

feature {ANY}
   add (o: OBSERVER[like Current])
         -- Add an observer that should be notified
      do
         observers.add_last(o)
      end

   remove (o: OBSERVER[like Current])
         -- Remove an observer that should not be notified anymore
      require
         has(o)
      local
         i: INTEGER
      do
         i := observers.first_index_of(o)
         observers.remove(i)
      end

   has (o: OBSERVER[like Current]): BOOLEAN
         -- True if the observer will be notified when the state of Current changes
      do
         Result := observers.has(o)
      end

feature {}
   notify
         -- Notify all the observers that the state of Current changed
      do
         observers.for_each(agent {OBSERVER[like Current]}.update(Current))
      end

feature {}
   observers: COLLECTION[OBSERVER[like Current]]
         -- The collection of observers

invariant
   notifiable: observers /= Void

end -- class OBSERVABLE
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
