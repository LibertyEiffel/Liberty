class C_ENUM

inherit 
	GCCXML_NODE
	IDENTIFIED_NODE
	NAMED_NODE
	FILED_NODE
	STORABLE_NODE

creation make

feature 
	store is
		do
			enumerations.put(Current,id)
		end
		
invariant name.is_equal(once U"Enumeration")
end

