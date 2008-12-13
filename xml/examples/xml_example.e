class XML_EXAMPLE
	-- Example for wrappers of libxml2 library
	
insert 
	XML_PARSER
	ARGUMENTS

creation make

feature 
	make is
		-- entry point
	do
		if argument_count<1 then 
			print(once "Provide a document%N")
			die_with_code(0)
		end

		doc := parse_file(argument(1))
		if doc.root/=Void then parse (doc.root)
		else print(once "Got a void root%N")
		end
	end

	doc: XML_DOC

	parse (a_node: XML_NODE) is
		-- Recursively parse `a_node'.
	local child: XML_NODE
	do
		a_node.name.print_on(std_output)
		std_output.put_new_line
		-- if  once " <") until loop end 
		from child:=a_node.first until child=Void
		loop
			parse(child)
			child:=child.next
		end
	end
end -- XML_EXAMPLE
