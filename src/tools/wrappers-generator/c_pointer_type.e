class C_POINTER_TYPE
inherit 
	GCCXML_NODE
	IDENTIFIED_NODE
	STORABLE_NODE
	TYPED_NODE

creation make
feature 
	is_fundamental: BOOLEAN is True

	is_void: BOOLEAN is False

	has_wrapper: BOOLEAN is True

	wrapper_type: STRING is "POINTER"

	store is
		do
			types.put(Current,id)
		end

-- invariant name.is_equal(once U"PointerType")
end -- class C_POINTER_TYPE
