class MY_VALIDATING_TREE
--
-- Just to show how to simply have some home-crafted validation.
-- The principle is to redefine the `new_node' factory.
--

inherit
	XML_TREE
		redefine
			new_node
		end

create {EXAMPLE2}
	with_error_handler

feature {}
	Tree_tag: STRING is "tree"
	Node_tag: STRING is "node"
	Leaf_tag: STRING is "leaf"

	new_node (node_name: STRING; line, column: INTEGER): XML_NODE is
		do
			inspect node_name
			when "tree" then
				if current_node /= Void then
					parse_error(line, column, once "unexpected tree without a parent node")
				else
					create Result.make(Tree_tag, line, column)
				end
			when "node" then
				if current_node = Void or else current_node = Leaf_tag then
					parse_error(line, column, once "unexpected node without parent node or with parent node being a leaf")
				else
					create Result.make(Node_tag, line, column)
				end
			when "leaf" then
				if current_node = Void then
					parse_error(line, column, once "unexpected leaf without parent node")
				else
					create Result.make(Leaf_tag, line, column)
				end
			end
		end

end
