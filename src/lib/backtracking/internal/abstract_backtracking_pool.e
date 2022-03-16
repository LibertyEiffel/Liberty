-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class ABSTRACT_BACKTRACKING_POOL[X_ -> ABSTRACT_BACKTRACKING_POOLABLE]
   --
   -- Pools for the ABSTRACT_BACKTRACKING
   --

feature {ANY}
   get_instance: X_
         -- Returns an instance from the current pool.
      local
         link: X_
      do
         Result := pool_of_instances.item
         if Result = Void then
            Result := get_fresh_instance
         else
            link ?= Result.pool_link
            pool_of_instances.set_item(link)
         end
      ensure
         result_not_void: Result /= Void
      end

   get_fresh_instance: X_
         -- Returns a freshly created instance.
      deferred
      end

   release_instance (inst: X_)
         -- Records the instance 'inst' into the current pool.
      do
         inst.set_pool_link(pool_of_instances.item)
         pool_of_instances.set_item(inst)
      ensure
         instance_on_top: pool_of_instances.item = inst
         previous_top_chained: inst.pool_link = old pool_of_instances.item
      end

   clear
         -- Removes all recorded instances from the current pool.
      do
         pool_of_instances.set_item(Void)
      end

feature {}
   pool_of_instances: WEAK_REFERENCE[X_]
         -- Head of the recorded instances

   make
         -- creation
      do
         create pool_of_instances.set_item(Void)
      end

end -- class ABSTRACT_BACKTRACKING_POOL
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
