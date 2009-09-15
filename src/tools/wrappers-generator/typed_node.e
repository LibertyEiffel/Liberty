deferred class TYPED_NODE
	-- A Gccxml node with "type" attribute
inherit GCCXML_NODE

feature 

	type: UNICODE_STRING is 
		do 
			Result:=attribute_at(once U"type") 
		ensure Result/=Void
		end

end
