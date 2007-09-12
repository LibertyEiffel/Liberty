indexing
	description: "A wrapper factory creates objects from an archetype."
	copyright: "(C) 2007 Paolo Redaelli "
	license: "LGPL v2 or later"

class ARCHETYPE_FACTORY [ITEM->SHARED_C_STRUCT]
	-- A factory that creates items from a given archetype.

inherit WRAPPER_FACTORY[ITEM]

creation with_archetype
	
feature {} -- Creation
	with_archetype (an_archetype: ITEM) is
		require archetype_not_void: an_archetype/=Void
		do
			archetype := an_archetype
		end
	
feature {WRAPPER,WRAPPER_HANDLER} -- Implementation
	wrapper (a_pointer: POINTER): ITEM is
			-- A wrapper for the structure at address `a_pointer'.
		do
			Result:=archetype.twin
			Result.from_external_pointer(a_pointer)
		end

	set_archetype (an_archetype: ITEM) is
		require archetype_not_void: an_archetype/=Void
		do
			archetype := an_archetype
		end

	archetype: ITEM
			-- an empty model of an ITEM, from which actual instances are
			-- copied or twinned, instead of creating them. 

invariant
	non_void_archetype: archetype /= Void
end
