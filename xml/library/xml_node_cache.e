class XML_NODE_CACHE
	-- A singleton wrapper factory and cache for XML_NODEs.

inherit 
	CACHING_FACTORY[XML_NODE]
		redefine default_create end
	SINGLETON
		redefine default_create end

feature 	
	default_create is
		do
			create wrappers.make
		end
	
	wrapper (a_pointer: POINTER): XML_NODE is
		-- XML_NODE wrapper for `a_pointer'
	do
		Result:=wrappers.reference_at(a_pointer)
		if Result=Void then
			create Result.from_external_pointer(a_pointer)
			wrappers.put(Result,a_pointer)
		end
	end
end
