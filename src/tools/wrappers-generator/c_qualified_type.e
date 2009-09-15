class C_QUALIFIED_TYPE

inherit 
	GCCXML_NODE
	IDENTIFIED_NODE
	TYPED_NODE
	LIBERTY_TYPED

creation make

feature 
	register_into (a_tree: GCCXML_TREE) is
		do
			not_yet_implemented
		end

	liberty_type: STRING is
		do
			not_yet_implemented
		end
invariant name.is_equal(once U"CvQualifiedType")
end -- class C_QUALIFIED_TYPE
