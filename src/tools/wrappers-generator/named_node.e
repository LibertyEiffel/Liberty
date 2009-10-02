deferred class NAMED_NODE
	-- A GCC_XML node that may have a "name" attribute
inherit GCCXML_NODE
feature
	c_name: UNICODE_STRING is
		do
			Result:=attribute_at(once U"name")
		end
end -- class NAMED_NODE

