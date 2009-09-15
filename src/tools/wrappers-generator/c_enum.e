class C_ENUM

inherit 
	GCCXML_NODE
	IDENTIFIED_NODE
	NAMED_NODE
	FILED_NODE

creation make

feature 
	register_into (a_tree: GCCXML_TREE) is
		do
			a_tree.enumerations.put(Current,id)
		end
		
feature {CLASS_MAKER, C_ENUM_VALUE}
	fields: FAST_ARRAY[C_ENUM_VALUE]
invariant name.is_equal(once U"Enumeration")
end

