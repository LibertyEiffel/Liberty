class C_FILE

inherit  
		GCCXML_NODE redefine make end
	IDENTIFIED_NODE redefine make end
	NAMED_NODE redefine make end

creation make

feature 
	make (a_name: UNICODE_STRING; a_line: INTEGER_32; a_column: INTEGER_32) is
		do
			-- Current SE complains if about multiple Precursor found. Actually
			-- make from IDENTIFIED_NODE and NAMED_NODE is the very same one
			-- from GCCXML_NODE; let's make the compiler happy.
			Precursor {GCCXML_NODE} (a_name,a_line,a_column)
			create functions.make
		end

	functions: LINKED_LIST[C_FUNCTION]

	register_into (a_tree: GCCXML_TREE) is
		do
			a_tree.files.put(Current,id)
		end
		
	invariant name.is_equal(once U"File")
end

