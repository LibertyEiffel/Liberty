-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class WEAK_REFERENCE[G_]
   --
   -- Weak reference to some object of type G_.
   -- This kind of reference does not prevent the object of type G_ from being reclaimed by the garbage
   -- collector (in which case item returns Void).
   -- Item makes it possible to get (a strong reference to) the object.
   -- Inheriting from this class is prohibited.
   --
   -- Notes: when using the "-no_gc" option (i.e. no garbage collector), the behavior of WEAK_REFERENCE
   -- is equivalent to the behavior of REFERENCE.
   --

inherit
   ANY_REFERENCE

create {ANY}
   set_item

feature {ANY}
   item: G_
         -- Return a (strong) reference to the object
      external "built_in"
      end

   set_item (i: like item) assign item
         -- Set the object to be weak referenced
      external "built_in"
      ensure
         item = i
      end

end -- class WEAK_REFERENCE
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
