class C_FIELD

inherit 
	GCCXML_NODE
	IDENTIFIED_NODE
	NAMED_NODE
	FILED_NODE
	TYPED_NODE
	STORABLE_NODE

creation make

feature 
	store is
		do
			fields.put(Current,id)
		end

-- invariant name.is_equal(once U"Field")
end

