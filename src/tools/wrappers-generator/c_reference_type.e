class C_REFERENCE_TYPE
inherit 
	GCCXML_NODE
	IDENTIFIED_NODE
	TYPED_NODE
	STORABLE_NODE

creation make
feature 
	store is
		do
			types.fast_put(Current,id)
		end

	is_fundamental: BOOLEAN is False
	-- Note: another rought approximation.

	is_void: BOOLEAN is False

	has_wrapper: BOOLEAN is False

	wrapper_type: STRING is "POINTER"
	-- Note: this is a rought approximation. 

-- invariant name.is_equal(once U"ReferenceType")
end -- class C_REFERENCE_TYPE

