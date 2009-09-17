deferred class SINGLETON
	--
	-- Implementation of the "Singleton" design pattern. The singleton pattern is a property of a type 
	-- (yes TYPE, not class) to have at most one single object created at runtime for the corresponding type.
	--
	-- Usage: insert SINGLETON, that's all.
	--
	-- For examples, look at the tools cluster of SmartEiffel.
	--
	-- WARNING: double-check if the object is really a singleton in the conceptual sense.
	--          The singleton pattern is often used in wrong place. See for example:
	--          http://www.theagiledeveloper.com/articles/2005/03/03/singleton-overuse-disclaimer
	--          http://blogs.msdn.com/scottdensmore/archive/2004/05/25/140827.aspx
	--          http://www.softwarereality.com/design/singleton.jsp
	--          or search "Singletonitis" or "singleton overuse".
	--

feature {}
	is_real_singleton: BOOLEAN is
		do
			if singleton_memory_pool.fast_has(generating_type) then
				Result := singleton_memory_pool.fast_at(generating_type) = Current.to_pointer
			else
				singleton_memory_pool.add(Current.to_pointer, generating_type)
				Result := True
			end
		ensure
			assertion_check_only: Result
		end

	singleton_memory_pool: HASHED_DICTIONARY[POINTER, STRING] is
			-- This pool is unique in the whole system. A memory is kept 
			-- for each singleton type (type, not class) in the system.
		once
			create Result.make
		end

	current_is_not_an_expanded_type: BOOLEAN is
			-- Check that the dynamic type of the SINGLETON is not an expanded type.
		local
			like_current: like Current
		do
			Result := like_current = Void
		end
	
invariant
	current_is_not_an_expanded_type
	is_real_singleton

end -- class SINGLETON
