deferred class FILED_NODE
	-- A Gccxml node with "file" attribute
inherit GCCXML_NODE
insert SHARED_COLLECTIONS
feature 

	file_id: UNICODE_STRING is 
		do 
			Result:=attribute_at(once U"file") 
		ensure Result/=Void
		end
	
	line_row: UNICODE_STRING is
		-- The line in the source code where Current is defined
		do
			Result:=attribute_at(once U"line")
		ensure Result/=Void
		end

	c_file: C_FILE is
		do
			Result:=files.reference_at(file_id)
		end

end
