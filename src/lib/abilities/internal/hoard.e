-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class HOARD[E_]
   --
   -- A hoard of objects is a collation of many objects sharing the same type. This meta type defines some
   -- traversal features using agents, as long as very simple hoard properties: `count' and `is_empty'.
   --

feature {ANY} -- Counting:
   count: INTEGER is
         -- Number of available items in the hoard.
         --
         -- See also `is_empty'
      deferred
      ensure
         Result >= 0
      end

   is_empty: BOOLEAN is
         -- Is the hoard empty ?
         --
         -- See also `count'.
      deferred
      ensure
         definition: Result = (count = 0)
      end

feature {ANY} -- Agent-based features:
   do_all (action: ROUTINE[TUPLE[E_]]) is
         -- Apply `action' to every item of `Current'.
         --
         -- See also `for_all', `exists'.
      require
         action /= Void
      deferred
      end

   for_all (test: PREDICATE[TUPLE[E_]]): BOOLEAN is
         -- Do all items satisfy `test'?
         --
         -- See also `do_all', `exists'.
      require
         test /= Void
      deferred
      end

   exists (test: PREDICATE[TUPLE[E_]]): BOOLEAN is
         -- Does at least one item satisfy `test'?
         --
         -- See also `do_all', `for_all'.
      require
         test /= Void
      deferred
      end

end -- class HOARD
--
-- Copyright (c) 2009 by all the people cited in the AUTHORS file.
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
