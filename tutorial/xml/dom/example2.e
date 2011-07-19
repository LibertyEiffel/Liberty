class EXAMPLE2
--
-- This example is a bit more complex since it uses a subclass of XML_TREE to provide some validation.
--
insert
	EXAMPLE1
		redefine
			make
		end

create {}
	make

feature {}
	make is
		local
			in: TEXT_FILE_READ
			tree: MY_VALIDATING_TREE
			version: STRING
		do
			-- first create the stream
			create in.connect_to(argument(1))
			if in.is_connected then
				-- then create the tree
				create tree.with_error_handler(in, agent error)
				-- now display the results
				version := tree.attribute_at(once "version")
				if version /= Void then
					io.put_string(once "XML version: ")
					io.put_string(version)
					io.put_new_line
				end
				display_node(tree.root, 0)
			end
		end

end
