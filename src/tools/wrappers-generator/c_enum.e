class C_ENUM
	-- An "Enumeration" XML node in a file made by gccxml representing a C
	-- enum.
	
	-- TODO: Currently wrapper_type is "INTEGER"; this assumes two
	-- conditions:
	
	-- 1 - any enum value is actually an int; 
	-- 2 - INTEGER has the same size of int

	-- As far as I know this condition shall apply on all architectures.
inherit 
	GCCXML_NODE
	IDENTIFIED_NODE
	NAMED_NODE
	FILED_NODE
	STORABLE_NODE
	LIBERTY_TYPED
creation make

feature 
	store is
		do
			enumerations.put(Current,id)
			types.put(Current,id)
		end

	wrapper_type: STRING is "INTEGER"
		

--invariant name.is_equal(once U"Enumeration")
end

