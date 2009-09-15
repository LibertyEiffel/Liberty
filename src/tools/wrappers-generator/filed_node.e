deferred class FILED_NODE
	-- A Gccxml node with "file" attribute
inherit GCCXML_NODE

feature 

	file_id: UNICODE_STRING is 
		do 
			Result:=attribute_at(once U"file") 
		ensure Result/=Void
		end

end
