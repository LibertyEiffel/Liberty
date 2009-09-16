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
	STORABLE_NODE
	LIBERTY_TYPED

creation make 
feature
	store is
		do
			types.put(Current,id)
		end
	
	wrapper_type: STRING is "POINTER"
end
