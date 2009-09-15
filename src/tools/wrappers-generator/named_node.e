deferred class NAMED_NODE
	-- A GCC_XML node having "name" attribute
inherit GCCXML_NODE
feature
	c_name: UNICODE_STRING is
		do
			Result:=attribute_at(once U"name")
		ensure not_void: Result/=Void
		end
end -- class NAMED_NODE

