class C_FUNCTION

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
			functions.store(Current)
		end
	
	returns: UNICODE_STRING is do Result:=attribute_at(once U"returns") end

invariant name.is_equal(once U"Function")
end
