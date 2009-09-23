class C_POINTER_TYPE
inherit 
	GCCXML_NODE
	IDENTIFIED_NODE
	STORABLE_NODE
	TYPED_NODE
	LIBERTY_TYPED

creation make
feature 
	wrapper_type: STRING is "POINTER"

	store is
		do
			types.fast_put(Current,id)
		end

-- invariant name.is_equal(once U"PointerType")
end -- class C_POINTER_TYPE
