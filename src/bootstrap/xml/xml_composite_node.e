class XML_COMPOSITE_NODE
	--
	-- A named node containing children
	--

inherit
	XML_NODE

creation {ANY}
	make

feature {ANY}
	name: UNICODE_STRING
			-- The name of the node

	attribute_name (index: INTEGER): UNICODE_STRING is
			-- The name of the i'th attribute
		require
			index.in_range(1, attributes_count)
		do
			Result := attributes.key(index)
		end

	attribute_value (index: INTEGER): UNICODE_STRING is
			-- The value of the i'th attribute
		require
			index.in_range(1, attributes_count)
		do
			Result := attributes.item(index)
		end

	attribute_at (a_attribute_name: UNICODE_STRING): UNICODE_STRING is
			-- The value of the attribute given by its name; Void if not set
		do
			Result := attributes.reference_at(a_attribute_name)
		end

	attributes_count: INTEGER is
			-- The number of attributes
		do
			Result := attributes.count
		end

	child (index: INTEGER): XML_NODE is
			-- The i'th child
		require
			index.in_range(1, children_count)
		do
			Result := children.item(index - 1)
		end

	children_count: INTEGER is
			-- The number of children
		do
			Result := children.count
		end

feature {XML_TREE}
	set_attribute (a_attribute_name, a_attribute_value: UNICODE_STRING) is
		require
			a_attribute_name /= Void
			a_attribute_value /= Void
		do
			attributes.add(a_attribute_value, a_attribute_name)
		ensure
			attribute_at(a_attribute_name) = a_attribute_value
		end

	add_child (node: XML_NODE) is
		require
			node /= Void
			node.parent = Void
		do
			children.add_last(node)
			node.set_parent(Current)
		ensure
			node.parent = Current
			child(children_count) = node
		end

feature {}
	children: FAST_ARRAY[XML_NODE]

	attributes: HASHED_DICTIONARY[UNICODE_STRING, UNICODE_STRING]

	make (a_name: like name; a_line: like line; a_column: like column) is
		require
			a_line > 0
			a_column > 0
		do
			name := a_name
			line := a_line
			column := a_column
			create attributes.make
			create children.make(0)
		end

invariant
	name /= Void

end -- class XML_COMPOSITE_NODE
