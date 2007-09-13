indexing
	description: "Wrapper factory creates objects without knowing its type and creation clause at compile-time. Needed to implement generic C data structures."
	copyright: "(C) 2006, 2007 Paolo Redaelli"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class CACHING_FACTORY [ITEM->SHARED_C_STRUCT]
	-- A factory that retrieves wrappers from a dictionary cache

	-- TODO: update-revise the following documentaion, it is out of
	-- date. wrapper factory would be inserted into the class that
	-- needs to use it; if multiple usage are needed it is perhaps
	-- better to use its expanded variant, WRAPPER_RETRIEVER. The
	-- pattern usage is more or less like this:
	
	--  foo: FOO_WRAPPER is 
	-- 		local p: POINTER
	-- 		do
	-- 			p:= get_foo (handle)
	-- 			if wrappers.has(p) then
	-- 				Result ::= wrappers.at(p)
	-- 			else
	-- 				create Result.from_external_pointer(a_pointer)
	-- 			end
	-- 		end
	
	-- I know it is tedious, but it is the only feasible solution
	-- I was able to find.
	
inherit
	ARCHETYPE_FACTORY[ITEM]
		-- TODO: ideally we should avoid the usage of archetypes here
		-- and be as simple as: WRAPPER_FACTORY [ITEM] redefine
		-- default_create end creation default_create
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

	wrappers: HASHED_DICTIONARY [ITEM, POINTER]
			-- Dictionary cache storing wrappers created in the program.
			-- Key is the address (pointer) to the wrapped C structure,
			-- value is the corresponding Eiffel wrapper. This way you
			-- can get back an already-created Eiffel wrapper. Heirs of
			-- SHARED_C_STRUCT, i.e. G_OBJECT could provide alternative
			-- implementation that will not rely on this dictionary.
		
invariant
	wrappers_not_void: wrappers /= Void
end
