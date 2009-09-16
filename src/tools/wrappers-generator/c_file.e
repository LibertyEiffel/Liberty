class C_FILE

inherit  
	GCCXML_NODE
	IDENTIFIED_NODE
	NAMED_NODE
	STORABLE_NODE

creation make

feature 
	store is
		do
			files.put(Current,id)
		end
		
	invariant name.is_equal(once U"File")
end

