class EXAMPLE1
--
-- This simple example just uses XML_TREE.
--
-- See EXAMPLE2 on how to extend XML_TREE to add validation features.
--
insert
	ARGUMENTS

create {}
	make

feature {}
	make is
		local
			in: TEXT_FILE_READ
			tree: XML_TREE
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

	display_node (node: XML_NODE; indent: INTEGER) is
		local
			i: INTEGER
		do
			from
				i := 1
			until
				i > indent
			loop
				io.put_string(once "  ")
				i := i + 1
			end
			io.put_string(node.name)
			if node.attributes_count > 0 then
				io.put_character('(')
				from
					i := 1
				until
					i > node.attributes_count
				loop
					if i > 1 then
						io.put_string(once ", ")
					end
					io.put_string(node.attribute_name(i))
					io.put_character('=')
					io.put_string(node.attribute_value(i))
					i := i + 1
				end
				io.put_character(')')
			end
			io.put_new_line
			from
				i := 1
			until
				i > node.children_count
			loop
				display_node(node.child(i), indent + 1)
				i := i + 1
			end
		end

	error (line, column: INTEGER) is
		do
			std_error.put_string(once "Error at ")
			std_error.put_integer(line)
			std_error.put_string(once ", ")
			std_error.put_integer(column)
			std_error.put_string(once "!%N")
			die_with_code(1)
		end

end
