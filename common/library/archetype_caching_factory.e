indexing
	description: "A wrapper factory that "
	copyright: "(C) 2006, 2007 Paolo Redaelli"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class ARCHETYPE_CACHING_FACTORY [ITEM->SHARED_C_STRUCT]
	-- A caching factory that creates wrappers from a given archetype
	-- when it doesn't exist. Useful to implement collection of wrapped
	-- objects.

inherit
	CACHING_FACTORY[ITEM]

	ARCHETYPE_FACTORY[ITEM]
		redefine with_archetype, wrapper
		end
	
creation with_archetype
	
feature {WRAPPER,WRAPPER_HANDLER} -- Implementation
	with_archetype (an_archetype: ITEM) is 
		do
			Precursor(an_archetype) 
			create wrappers.make 
		end
	
	wrapper (a_pointer: POINTER): ITEM is
		do
			Result := wrappers.reference_at(a_pointer)
			if Result=Void then
				Result:=archetype.twin
				Result.from_external_pointer(a_pointer)
				wrappers.put(Result,a_pointer)
			end
		end
end
