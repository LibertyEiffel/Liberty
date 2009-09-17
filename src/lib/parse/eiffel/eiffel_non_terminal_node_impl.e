class EIFFEL_NON_TERMINAL_NODE_IMPL

inherit
	EIFFEL_NON_TERMINAL_NODE

creation {EIFFEL_NODE_FACTORY}
	make

feature {ANY}
	name: STRING

	accept (visitor: VISITOR) is
		local
			v: EIFFEL_NON_TERMINAL_NODE_IMPL_VISITOR
		do
			v ::= visitor
			v.visit_eiffel_non_terminal_node_impl(Current)
		end

	name_at (index: INTEGER): STRING is
		do
			Result := names.item(index - lower + names.lower)
		end

	node_at (index: INTEGER): EIFFEL_NODE is
		do
			Result := nodes.item(index)
		end

	valid_index (index: INTEGER): BOOLEAN is
		do
			Result := nodes.valid_index(index)
		end

	lower: INTEGER is
		do
			Result := nodes.lower
		end

	upper: INTEGER is
		do
			Result := nodes.upper
		end

	count: INTEGER is
		do
			Result := nodes.count
		end

	is_empty: BOOLEAN is
		do
			Result := nodes.is_empty
		end

feature {EIFFEL_GRAMMAR}
	set (index: INTEGER; node: EIFFEL_NODE) is
		do
			nodes.put(node, index)
			node.set_parent(Current)
		end

feature {EIFFEL_NODE_HANDLER}
	display (output: OUTPUT_STREAM; indent: INTEGER; p: STRING) is
		local
			i: INTEGER
		do
			do_indent(output, indent, p)
			output.put_character('"')
			output.put_string(name)
			output.put_line(once "%":")
			from
				i := lower
			until
				i > upper
			loop
				node_at(i).display(output, indent + 1, " * ")
				i := i + 1
			end
		end

	generate (o: OUTPUT_STREAM) is
		local
			i: INTEGER
		do
			from
				i := lower
			until
				i > upper
			loop
				node_at(i).generate(o)
				i := i + 1
			end
			generate_forgotten(o)
		end

feature {}
	make (a_name: like name; a_names: TRAVERSABLE[STRING]) is
		do
			name := a_name
			names := a_names
			create nodes.make(a_names.count)
		ensure
			name = a_name
			names = a_names
		end

	names: TRAVERSABLE[STRING]

	nodes: FAST_ARRAY[EIFFEL_NODE]

invariant
	names.count = nodes.count

end -- class EIFFEL_NON_TERMINAL_NODE_IMPL
