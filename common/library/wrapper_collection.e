indexing
	description: "A wrapper that is a collection of other wrappers."
	copyright: "(C) 2008 Paolo Redaelli"
	license: "LGPL v2 or later"

deferred class WRAPPER_COLLECTION [ITEM->C_STRUCT]
	-- A collection of wrappers. 

inherit
	WRAPPER_FACTORY[ITEM] 
	WRAPPERS_CACHE[ITEM]

	COLLECTION[ITEM] 
		undefine 
			append_collection,
			clear_all,
			has,
			fast_has,
			-- fast_first_index_of,
			-- first_index_of,
			-- reverse,
			swap
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Implementation
	wrapper(a_pointer: POINTER): ITEM is
			-- The wrapper for `a_pointer'. It could be newly created or
			-- retrieved from a cache, a dictionary, from the underlying
			-- object, depending on the implementation.
		deferred
		ensure then 
			not_void: Result/=Void
			cached_result: cache.has(a_pointer) 
			correct_cached_result: cache.at(a_pointer)=Result
		end	

invariant cache_not_void: cache/=Void
end -- class WRAPPER_COLLECTION
