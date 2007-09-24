indexing
	description: "A wrapper factory that "
	copyright: "(C) 2006, 2007 Paolo Redaelli"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class MAGICAL_CACHING_FACTORY [ITEM->SHARED_C_STRUCT]
	-- A factory that retrieves wrappers from a cache, usually a
	-- dictionary; used to implement collection of wrapped objects

inherit
	CACHING_FACTORY[ITEM]

	MAGICAL_FACTORY[ITEM]
		redefine wrapper
		end
	
creation default_create
	
feature
	wrapper (a_pointer: POINTER): ITEM is
		do
			Result := wrappers.reference_at(a_pointer)
			if Result=Void then
				Result:=Precursor(a_pointer)
				wrappers.put(Result,a_pointer)
			end
		end

end
