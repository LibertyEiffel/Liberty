class PARSE_NON_TERMINAL
	--
	-- A non-terminal meant to be put in a PARSE_TABLE.
	--
	-- The only way to create a non-terminal is to use SmartEiffel's manifest notation.
	--
	-- The structure of this notation is:
	--
	--    {PARSE_NON_TERMINAL << rule, agent;
	--                           rule, agent;
	--                             . . .
	--                           rule, agent
	--                        >>}
	--
	-- where each rule is a TRAVERSABLE[STRING] (with each String being the name of an atom of the
	-- PARSE_TABLE), and each agent may either be Void or a PROCEDURE[TUPLE] called when reducing the
	-- non-terminal.
	--

inherit
	PARSE_ATOM
		redefine
			copy, is_equal
		end

creation {ANY}
	manifest_creation

feature {PARSE_TABLE}
	is_coherent: BOOLEAN is
		do
			Result := parser_tree.is_coherent
		end

	set_default_tree_builders (non_terminal_builder: PROCEDURE[TUPLE[STRING, TRAVERSABLE[STRING]]]
		terminal_builder: PROCEDURE[TUPLE[STRING, PARSER_IMAGE]]) is
		do
			if non_terminal_builder /= Void then
				parser_tree.set_default_tree_builder(non_terminal_builder, default_tree_builder_path)
			end
		end

feature {DESCENDING_PARSER, PARSE_NT_NODE}
	parse (buffer: MINI_PARSER_BUFFER; actions: COLLECTION[PARSE_ACTION]): BOOLEAN is
		do
			Result := parser_tree.parse(buffer, actions)
			if Result then
				buffer.set_last_error(Void)
				debug ("parse")
					std_error.put_string(once "%T-->%Tnon-terminal ")
					print_error_position(std_error, buffer)
					std_error.put_character(' ')
					std_error.put_character('"')
					std_error.put_string(name)
					std_error.put_character('"')
					std_error.put_new_line
				end
			else
				debug ("parse")
					std_error.put_string(once "** Expected non-terminal %"")
					std_error.put_string(name)
					std_error.put_string(once "%" ")
					print_error_position(std_error, buffer)
					std_error.put_new_line
				end
			end
		end

feature {ANY}
	copy (other: like Current) is
		do
			name := other.name
			parser_tree := other.parser_tree.twin
			parser_tree.set_non_terminal(Current)
		end

	is_equal (other: like Current): BOOLEAN is
		do
			Result := name.is_equal(other.name) and then parser_tree.is_equal(other.parser_tree)
		end

	add (rule: TRAVERSABLE[STRING]; action: PROCEDURE[TUPLE]) is
		require
			rule /= Void
		do
			parser_tree.add(rule, action)
		end

feature {PARSE_NON_TERMINAL}
	parser_tree: PARSE_NT_NODE

feature {}
	default_tree_builder_path: FAST_ARRAY[STRING] is
		once
			create Result.make(0)
		end

feature {}
	manifest_make (needed_capacity: INTEGER) is
		do
			create parser_tree.root(Current)
		end

	manifest_put (index: INTEGER; rule: TRAVERSABLE[STRING]; action: PROCEDURE[TUPLE[STRING, TRAVERSABLE[STRING]]]) is
		require
			rule /= Void
		do
			parser_tree.add(rule, action)
		end

	manifest_semicolon_check: INTEGER is 2

end -- class PARSE_NON_TERMINAL
