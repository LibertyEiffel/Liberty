class C_STRUCT

inherit 
	GCCXML_NODE 
	IDENTIFIED_NODE
	NAMED_NODE
		rename c_name as struct_name
		end
	FILED_NODE
	STORABLE_NODE
	LIBERTY_TYPED

insert NAME_CONVERTER

creation make

feature 
	store is
		do
			types.put(Current,id)
			-- TODO: suboptimal implementation. Turn is_public signature into
			-- (a_name: UNICODE_STRING) accepting void.
			if struct_name/=Void and then is_public(struct_name) then 
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
-- invariant name.is_equal(once U"Struct")
end

