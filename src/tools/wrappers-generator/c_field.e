class C_FIELD

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
			a_tree.fields.put(Current,id)
		end

invariant name.is_equal(once U"Field")
end

