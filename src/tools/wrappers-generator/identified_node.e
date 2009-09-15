deferred class IDENTIFIED_NODE
	-- A Gccxml node with id attribute
inherit GCCXML_NODE

feature 
	id: UNICODE_STRING is 
	do
		Result:=attribute_at(once U"id") 
	ensure Result/=Void
	end
end
