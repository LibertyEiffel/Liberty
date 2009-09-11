-- See the Copyright notice at the end of this file.
--
deferred class ABSTRACT_BACKTRACKING_POOL[X_ -> ABSTRACT_BACKTRACKING_POOLABLE]
	--
	-- Pools for the ABSTRACT_BACKTRACKING
	--

feature {ANY}
	get_instance: X_ is
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

	get_fresh_instance: X_ is
			-- Returns a freshly created instance.
		deferred
		end

	release_instance (inst: X_) is
			-- Records the instance 'inst' into the current pool.
		do
			inst.set_pool_link(pool_of_instances.item)
			pool_of_instances.set_item(inst)
		ensure
			instance_on_top: pool_of_instances.item = inst
			previous_top_chained: inst.pool_link = old pool_of_instances.item
		end

	clear is
			-- Removes all recorded instances from the current pool.
		do
			pool_of_instances.set_item(Void)
		end

feature {}
	pool_of_instances: WEAK_REFERENCE[X_]
			-- Head of the recorded instances

	make is
			-- creation
		do
			create pool_of_instances.set_item(Void)
		end

end -- class ABSTRACT_BACKTRACKING_POOL
--
-- ------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- This file is part of the SmartEiffel standard library.
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
-- documentation files (the "Software"), to deal in the Software without restriction, including without
-- limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
-- the Software, and to permit persons to whom the Software is furnished to do so, subject to the following
-- conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
-- AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
-- OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------
