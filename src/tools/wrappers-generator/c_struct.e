class C_STRUCT
	-- A "Struct" node of an XML file made by gccxml.
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
		-- Emit a reference wrapper for Current C structure.

		-- A reference wrapper handles the structure as a memory area referred by a pointer.
		-- An expanded wrapper is an expanded Eiffel type that is the actual C structure. This require the usage  of "external types" 
	do
		log_string(once "TODO: implement C_STRUCT.emit_wrapper")
	end

	suffix: STRING is "_STRUCT"
-- invariant name.is_equal(once U"Struct")
end

