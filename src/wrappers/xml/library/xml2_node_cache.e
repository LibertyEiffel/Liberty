class XML2_NODE_CACHE
	-- A singleton wrapper factory and cache for XML2_NODEs.

inherit 
	CACHING_FACTORY[XML2_NODE]
		redefine default_create end
	SINGLETON
		redefine default_create end

feature {ANY} 	
	default_create
		do
			create wrappers.make
		end
	
	wrapper (a_pointer: POINTER): XML2_NODE
		-- XML2_NODE wrapper for `a_pointer'
	do
		Result:=wrappers.reference_at(a_pointer)
		if Result=Void then
			create Result.from_external_pointer(a_pointer)
			wrappers.put(Result,a_pointer)
			Result.set_shared
		end
	end
end -- class XML2_NODE_CACHE
