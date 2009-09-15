class C_ARRAY_TYPE
	-- An "ArrayType" node of a gccxml file.

	-- Those nodes have min and max attributes. Most of
	-- the times min is not empty while often max is
	-- empty.

	-- Currently mapped to POINTER.
inherit 
	GCCXML_NODE
	IDENTIFIED_NODE
	TYPED_NODE
	LIBERTY_TYPED
creation make 
feature 
	register_into (a_tree: GCCXML_TREE) is
		do
		end
	liberty_type: STRING is "POINTER"
end
