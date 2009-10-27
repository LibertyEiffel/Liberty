-- Copyright (C) 2009 Cyril ADRIAN
--
deferred class LIBERTY_AST_NON_TERMINAL_NODE

inherit
	EIFFEL_NON_TERMINAL_NODE

feature {ANY}
	name_at (index: INTEGER): STRING is
		do
			Result := nodes.item(index).name
		end

	node_at (index: INTEGER): EIFFEL_NODE is
		do
			Result := nodes.item(index)
		end

	valid_index (index: INTEGER): BOOLEAN is
		do
			Result := index.in_range(lower, upper)
		end

	lower: INTEGER is 0

	upper: INTEGER is
		do
			Result := count - 1
		end

	count: INTEGER is
		deferred
		end

	is_empty: BOOLEAN is
		do
			Result := count = 0
		end

	accept (v: VISITOR) is
		do
			check False end
		end

feature {EIFFEL_GRAMMAR}
	set (index: INTEGER; node: EIFFEL_NODE) is
		do
			nodes.put(node, index)
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
	possible_counts: SET[INTEGER] is
		deferred
		end

	nodes: FAST_ARRAY[EIFFEL_NODE]

	make (a_name: STRING; a_names: TRAVERSABLE[STRING]) is
		require
			a_name.is_equal(name)
			possible_counts.has(a_names.count)
		do
			create nodes.make(a_names.count)
		ensure
			nodes.count = a_names.count
		end

invariant
	count = nodes.count
	possible_counts.has(count)

end
