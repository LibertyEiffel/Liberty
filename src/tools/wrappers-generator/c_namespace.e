class C_NAMESPACE
	-- The root node of an XML file made by gccxml.
inherit 
	GCCXML_NODE
	NAMED_NODE
	IDENTIFIED_NODE

creation make
-- invariant name.is_equal(once "Namespace")
end
