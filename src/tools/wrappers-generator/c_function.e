class C_FUNCTION

inherit
	GCCXML_NODE 
	IDENTIFIED_NODE
	NAMED_NODE
	FILED_NODE

creation make

feature 
	register_into (a_tree: GCCXML_TREE) is
		do
			-- a_tree.functions.store(Current)
		end
	
	returns: UNICODE_STRING is do Result:=attribute_at(once U"returns") end

invariant name.is_equal(once U"Function")
end
