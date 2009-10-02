class C_FUNCTION_TYPE
	-- A "FunctionType" node in an XML file made by gccxml.

	-- This node usually has a "returns" attribute, currently unused.
inherit 
	GCCXML_NODE
	IDENTIFIED_NODE
	LIBERTY_TYPED
	STORABLE_NODE

creation make

feature 
	store is
		do
			types.fast_put(Current,id)
		end

	wrapper_type: STRING is "POINTER"

-- invariant name.is_equal(once U"FunctionType")
end -- class C_FUNCTION_TYPE
