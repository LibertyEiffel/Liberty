indexing
	description: "A wrapper factory that "
	copyright: "(C) 2006, 2007 Paolo Redaelli"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class CACHING_FACTORY [ITEM->SHARED_C_STRUCT]
	-- A factory that retrieves wrappers from a cache, usually a
	-- dictionary; used to implement collection of wrapped objects

inherit
	WRAPPER_FACTORY[ITEM]

feature 
	wrappers: HASHED_DICTIONARY [ITEM, POINTER]
			-- Dictionary cache storing wrappers; usually used in 
			-- WRAPPER_COLLECTIONs or WRAPPER_DICTIONARY
			-- Key is the address (pointer) to the wrapped C structure,
			-- value is the corresponding Eiffel wrapper. This way you
			-- can get back an already-created Eiffel wrapper. Heirs of
			-- SHARED_C_STRUCT, i.e. G_OBJECT could provide alternative
			-- implementation that will not rely on this dictionary.
		
invariant
	dictionary_not_void: wrappers /= Void
end
