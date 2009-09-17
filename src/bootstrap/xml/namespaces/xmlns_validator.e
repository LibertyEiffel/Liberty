deferred class XMLNS_VALIDATOR
	--
	-- Helps the parser to validate an XMLNS file
	--

feature {XMLNS_PARSER}
	with_attribute (attribute_namespace, attribute_name, attribute_value: UNICODE_STRING; line, column: INTEGER) is
			-- Called by the parser to add an attribute of a node BEFORE calling `open_node'
		require
			not attribute_name.is_empty
			not attribute_value.is_empty
		deferred
		end

	is_valid_open_node (node_namespace, node_name: UNICODE_STRING; line, column: INTEGER): BOOLEAN is
			-- When the parser reads an opening node
		require
			not node_name.is_empty
		deferred
		end

	is_valid_close_node (node_namespace, node_name: UNICODE_STRING; line, column: INTEGER): BOOLEAN is
			-- When the parser reads a closing node
		require
			not node_name.is_empty
			current_node.is_equal(node_name)
		deferred
		end

	is_valid_open_close_node (node_namespace, node_name: UNICODE_STRING; line, column: INTEGER): BOOLEAN is
			-- When the parser reads a node that opens and closes immediately (syntax "<node/>")
		require
			not node_name.is_empty
		deferred
		end

	open_node (node_namespace, node_name: UNICODE_STRING; line, column: INTEGER) is
			-- When the parser reads an opening node
		require
			is_valid_open_node(node_namespace, node_name, line, column)
		deferred
		ensure
			current_node.is_equal(node_name)
		end

	close_node (node_namespace, node_name: UNICODE_STRING; line, column: INTEGER) is
			-- When the parser reads a closing node
		require
			is_valid_close_node(node_namespace, node_name, line, column)
		deferred
		end

	open_close_node (node_namespace, node_name: UNICODE_STRING; line, column: INTEGER) is
			-- When the parser reads a node that opens and closes immediately (syntax "<node/>")
		require
			is_valid_open_close_node(node_namespace, node_name, line, column)
		deferred
		end

	current_node: UNICODE_STRING is
			-- The current node
		deferred
		end

	current_namespace: UNICODE_STRING is
			-- The current namespace
		deferred
		end

	entity (a_entity: UNICODE_STRING; line, column: INTEGER): UNICODE_STRING is
			-- When the parser reads an '''&entity;'''.
		deferred
		end

	is_valid_data (a_data: UNICODE_STRING; line, column: INTEGER): BOOLEAN is
			-- Called by the parser when the node contains raw data
		require
			not a_data.is_empty
		deferred
		end

	data (a_data: UNICODE_STRING; line, column: INTEGER) is
			-- Called by the parser when the node contains raw data
		require
			not a_data.is_empty
		deferred
		end

	the_end is
			-- Called when the xml is totally parsed; usually it is used to recycle memory resources
		deferred
		end

end -- class XMLNS_VALIDATOR
