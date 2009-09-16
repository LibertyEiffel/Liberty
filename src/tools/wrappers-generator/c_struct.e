class C_STRUCT

inherit 
	GCCXML_NODE 
	IDENTIFIED_NODE
	NAMED_NODE
	FILED_NODE
	STORABLE_NODE
	LIBERTY_TYPED

insert EIFFEL_NAME_CONVERTER

creation make

feature 
	store is
		do
			types.put(Current,id)
			-- TODO: suboptimal implementation. Turn is_public signature into
			-- (a_name: UNICODE_STRING) accepting void.
			if c_name/=Void and then is_public(c_name.as_utf8) then 
				structures.fast_put(Current,id)
			end
		end
	
	wrapper_type: STRING is 
		do
			debug 
				print(once 
				"C_STRUCT.wrapper_type requires creation%
				% of external/expanded types")
				not_yet_implemented
			end
			Result := ""
		end
invariant name.is_equal(once U"Struct")
end

