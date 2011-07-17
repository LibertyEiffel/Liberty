class XMLNS_COMPOSITE_NODE
	--
	-- A node in an XMLNS_TREE
	--

inherit
	XMLNS_NODE

creation {XMLNS_TREE}
	make

feature {ANY}
	namespace: UNICODE_STRING
			-- The namespace of the node

	name: UNICODE_STRING
			-- The name of the node

	attribute_namespace (index: INTEGER): UNICODE_STRING is
			-- The namespace of the i'th attribute
		require
			index.in_range(1, attributes_count)
		local
			i, d, n: INTEGER
		do
			if index <= no_namespace_attributes.count then
				Result := Void
			else
				from
					i := attributes.lower
					d := index - no_namespace_attributes.count
				until
					Result /= Void
				loop
					n := attributes.key(i).count
					if d <= n then
						Result := attributes.key(i)
					else
						d := d - n
						i := i + 1
					end
				end
			end
		end

	attribute_name (index: INTEGER): UNICODE_STRING is
			-- The name of the i'th attribute
		require
			index.in_range(1, attributes_count)
		local
			i, d, n: INTEGER
		do
			if index <= no_namespace_attributes.count then
				Result := no_namespace_attributes.key(index)
			else
				from
					i := attributes.lower
					d := index - no_namespace_attributes.count
				until
					Result /= Void
				loop
					n := attributes.key(i).count
					if d <= n then
						Result := attributes.item(i).key(d)
					else
						d := d - n
						i := i + 1
					end
				end
			end
		end

	attribute_value (index: INTEGER): UNICODE_STRING is
			-- The value of the i'th attribute
		require
			index.in_range(1, attributes_count)
		local
			i, d, n: INTEGER
		do
			if index <= no_namespace_attributes.count then
				Result := no_namespace_attributes.item(index)
			else
				from
					i := attributes.lower
					d := index - no_namespace_attributes.count
				until
					Result /= Void
				loop
					n := attributes.key(i).count
					if d <= n then
						Result := attributes.item(i).item(d)
					else
						d := d - n
						i := i + 1
					end
				end
			end
		end

	attribute_at (a_attribute_namespace, a_attribute_name: UNICODE_STRING): UNICODE_STRING is
			-- The value of the attribute given by its name; Void if not set
		local
			att: HASHED_DICTIONARY[UNICODE_STRING, UNICODE_STRING]
		do
			if a_attribute_namespace = Void then
				att := no_namespace_attributes
			else
				att := attributes.reference_at(a_attribute_namespace)
			end
			if att /= Void then
				Result := att.reference_at(a_attribute_name)
			end
		end

	attributes_count: INTEGER is
			-- The number of attributes
		local
			i: INTEGER
		do
			Result := no_namespace_attributes.count
			from
				i := attributes.lower
			until
				i > attributes.upper
			loop
				Result := Result + attributes.item(i).count
				i := i + 1
			end
		end

	child (index: INTEGER): XMLNS_NODE is
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

feature {XMLNS_TREE}
	set_attribute (a_attribute_namespace, a_attribute_name, a_attribute_value: UNICODE_STRING) is
		require
			a_attribute_name /= Void
			a_attribute_value /= Void
		local
			att: HASHED_DICTIONARY[UNICODE_STRING, UNICODE_STRING]
		do
			if a_attribute_namespace = Void then
				att := no_namespace_attributes
			else
				att := attributes.reference_at(a_attribute_namespace)
				if att = Void then
					create att.make
					attributes.add(att, a_attribute_namespace)
				end
			end
			att.add(a_attribute_value, a_attribute_name)
		ensure
			attribute_at(a_attribute_namespace, a_attribute_name) = a_attribute_value
		end

	add_child (node: XMLNS_NODE) is
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
	attributes: HASHED_DICTIONARY[HASHED_DICTIONARY[UNICODE_STRING, UNICODE_STRING], UNICODE_STRING]
	no_namespace_attributes: HASHED_DICTIONARY[UNICODE_STRING, UNICODE_STRING]

	children: FAST_ARRAY[XMLNS_NODE]

	make (a_namespace: like namespace; a_name: like name; a_line: like line; a_column: like column) is
		require
			a_name /= Void
			a_line > 0
			a_column > 0
		do
			namespace := a_namespace
			name := a_name
			line := a_line
			column := a_column
			create attributes.make
			create no_namespace_attributes.make
			create children.make(0)
		end

invariant
	name /= Void

end -- class XMLNS_COMPOSITE_NODE
