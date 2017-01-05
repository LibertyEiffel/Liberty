-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class ABSTRACT_BACKTRACKING_POOLABLE
   --
   -- Alternatives and sequences MUST be managed in a pool.
   -- The ability to be in a pool is declared in that class.
   --

feature {ANY}
   release
         -- Called by ABSTRACT_BACKTRACKING to release
         -- current instance to the pool.
      require
         pool /= Void
      do
         pool.release_instance(Current)
      end

   get_twin: like Current
         -- Return a twin of current from the pool
      require
         pool /= Void
      do
         Result := pool.get_instance
         Result.copy(Current)
      ensure
         Result.is_equal(Current)
      end

   pool: ABSTRACT_BACKTRACKING_POOL[like Current]
         -- The pool that will record Current
      deferred
      end

feature {ABSTRACT_BACKTRACKING_POOL}
   pool_link: ABSTRACT_BACKTRACKING_POOLABLE
         -- Internal link used by the pool
         -- to chain its poolable items.
         -- Technical note: to give more freedom for
         -- further usages of 'pool_link' it is not
         -- defined with type anchorage.

   set_pool_link (other: like pool_link)
         -- Set 'pool_link' to 'other'
      do
         pool_link := other
      ensure
         definition: pool_link = other
      end

end -- class ABSTRACT_BACKTRACKING_POOLABLE
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
