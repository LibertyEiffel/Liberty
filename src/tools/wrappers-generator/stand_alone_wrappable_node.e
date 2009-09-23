deferred class STAND_ALONE_WRAPPABLE_NODE
	-- A node of an XML file produced by gccxml that is wrappable for Liberty
	-- as a stand alone class. This class will contain the wrapping of this
	-- class and wrapped features of many child and/or related nodes.
inherit GCCXML_NODE

feature
	emit_wrapper is
		deferred
		end
end -- class STAND_ALONE_WRAPPABLE_NODE

