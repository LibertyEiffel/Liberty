class C_UNION

inherit 
	GCCXML_NODE
	CONTEXTED_NODE
	COMPOSED_NODE
	IDENTIFIED_NODE
	NAMED_NODE
	FILED_NODE
	STORABLE_NODE
	TYPED_NODE

creation make

feature 
	store is
		do
			create {LINKED_LIST[C_FIELD]} fields.make
			unions.fast_put(Current,id)
			types.fast_put(Current,id)
			composed_types.fast_put(Current,id)
		end
	
	is_fundamental: BOOLEAN is False

	is_void: BOOLEAN is False

	has_wrapper: BOOLEAN is False

	wrapper_type: STRING is
		do
			not_yet_implemented
		end
-- invariant name.is_equal(once U"Union")
end

