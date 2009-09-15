class C_TYPEDEF

inherit 
	GCCXML_NODE
	IDENTIFIED_NODE
	NAMED_NODE
	FILED_NODE
	TYPED_NODE

creation make

feature 
	register_into (a_tree: GCCXML_TREE) is
		do
		end

invariant name.is_equal(once U"Typedef")
end
