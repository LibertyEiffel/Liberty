class C_TYPEDEF

inherit 
	GCCXML_NODE
	IDENTIFIED_NODE
	NAMED_NODE
	FILED_NODE
	TYPED_NODE
	LIBERTY_TYPED
	STORABLE_NODE

creation make

feature 
	store is
		do
			typedefs.fast_put(Current,id)
			types.fast_put(Current,id)
		end

	wrapper_type: STRING is
		do
			Result := types.at(type).wrapper_type
		end

-- invariant name.is_equal(once U"Typedef")
end
