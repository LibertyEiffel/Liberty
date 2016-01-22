-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class FACTORY[O_]
   --
   -- The ''Abstract Factory'' Design Pattern.
   --
   -- Usage: usually, write one FACTORY per concrete class. Several can be merged in a single class using
   -- Eiffel renaming facilities:
   --
   --  class FRUIT_FACTORY
   --  insert
   --     FACTORY[APPLE] rename new as new_apple end
   --     FACTORY[PEAR]  rename new as new_pear end
   --     ...
   --  end
   --

feature {ANY}
   new: O_
         -- Create a new object.
      deferred
      ensure
         Result /= Void
      end

end -- class FACTORY
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
