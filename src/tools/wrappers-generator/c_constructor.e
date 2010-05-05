class C_CONSTRUCTOR
	-- A "Constructor" node in an XML file made by gccxml.
inherit 
	GCCXML_NODE
	NAMED_NODE
	TYPED_NODE
	FILED_NODE
creation make
feature 
	is_fundamental: BOOLEAN is False
	is_void: BOOLEAN is False
	has_wrapper: BOOLEAN is False
	wrapper_type: STRING is do not_yet_implemented end
-- invariant name.is_equal(once U"Constructor")
end -- class C_CONSTRUCTOR

