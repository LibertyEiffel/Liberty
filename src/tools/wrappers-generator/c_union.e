class C_UNION

inherit 
	GCCXML_NODE
	IDENTIFIED_NODE
	NAMED_NODE
	FILED_NODE

creation make

feature 
	register_into (a_tree: GCCXML_TREE) is
		do
		end
	fields: FAST_ARRAY[C_FIELD]
invariant name.is_equal(once U"Union")
end

