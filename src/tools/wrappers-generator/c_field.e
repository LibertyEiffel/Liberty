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
	
	is_fundamental: BOOLEAN is
		do
			Result:=types.at(dequalify(type)).is_fundamental
		end

	is_void: BOOLEAN is False

	has_wrapper: BOOLEAN is
		do
			Result:=types.at(dequalify(type)).has_wrapper
		end

	wrapper_type: STRING is
		do
			Result:=types.at(dequalify(type)).wrapper_type
		end

-- invariant name.is_equal(once U"Field")
end

