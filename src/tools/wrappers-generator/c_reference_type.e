class C_REFERENCE_TYPE
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
			types.fast_put(Current,id)
		end

	wrapper_type: STRING is "POINTER"
	-- Note: this is a grossly approximation. 

invariant name.is_equal(once U"ReferenceType")
end -- class C_REFERENCE_TYPE

