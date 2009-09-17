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
