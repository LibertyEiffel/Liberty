class C_NAMESPACE
	-- The root node of an XML file made by gccxml.
inherit 
	GCCXML_NODE
	NAMED_NODE
	IDENTIFIED_NODE
	STORABLE_NODE

creation make
feature 
	store is
		do
			namespaces.put(Current,id)
		end

-- invariant name.is_equal(once "Namespace")
end
