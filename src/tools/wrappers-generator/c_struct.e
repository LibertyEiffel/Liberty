class C_STRUCT

inherit 
	GCCXML_NODE 
	IDENTIFIED_NODE
	NAMED_NODE
	FILED_NODE
	STORABLE_NODE
	LIBERTY_TYPED
	WRAPPED_BY_A_CLASS

insert NAME_CONVERTER

creation make

feature 
	store is
		do
			types.put(Current,id)
			if c_name/=Void and then is_public(c_name) then 
				structures.fast_put(Current,id)
			end
		end
	
	wrapper_type: STRING is 
		do
			debug 
				print(once 
				"C_STRUCT.wrapper_type requires creation%
				% of external/expanded types")
			end
			Result := class_name
		end

	emit_wrapper is
		do
			log_string(once "TODO: implement C_STRUCT.emit_wrapper")
		end

	suffix: STRING is "_STRUCT"
-- invariant name.is_equal(once U"Struct")
end

