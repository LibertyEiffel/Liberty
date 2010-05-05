class C_STRUCT
	-- A "Struct" node of an XML file made by gccxml.
inherit 
	GCCXML_NODE 
	IDENTIFIED_NODE
	NAMED_NODE
	FILED_NODE
	STORABLE_NODE
	TYPED_NODE
	WRAPPED_BY_A_CLASS

insert NAME_CONVERTER

creation make

feature 
	store is
		do
			types.put(Current,id)
			-- if c_name/=Void and then is_public(c_name) then 
			-- if is_public then
			structures.fast_put(Current,id)
			--end
		end
	
	is_fundamental: BOOLEAN is False

	is_void: BOOLEAN is False

	has_wrapper: BOOLEAN is False
	
	wrapper_type: STRING is 
		do
			debug 
				print(once 
				"C_STRUCT.wrapper_type requires creation%
				% of external/expanded types; currently returning an empty string")
			end
			not_yet_implemented -- Result := class_name
		end

	emit_wrapper is
		-- Emit a reference wrapper for Current C structure.

		-- A reference wrapper handles the structure as a memory area referred by a pointer.
		-- An expanded wrapper is an expanded Eiffel type that is the actual C structure. This require the usage  of "external types" 
	do
		log_string(once "TODO: implement C_STRUCT.emit_wrapper")
		not_yet_implemented
	end

	suffix: STRING is "_STRUCT"
-- invariant name.is_equal(once U"Struct")
end

