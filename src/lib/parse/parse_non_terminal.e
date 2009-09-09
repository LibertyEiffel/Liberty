-- -----------------------------------------------------------------------------------------------------------
-- This file is part of the ESE library.
-- Copyright(C) 2006-2009: Cyril ADRIAN <cyril.adrian@gmail.com> and others (see AUTHORS)
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
-- associated documentation files (the "Software"), to deal in the Software without restriction, including
-- without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the
-- following conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
-- IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
-- USE OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://ese.sourceforge.net
-- -----------------------------------------------------------------------------------------------------------
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

feature {ESE_PARSER, PARSE_NT_NODE}
	parse (buffer: MINI_PARSER_BUFFER; actions: COLLECTION[PARSE_ACTION]): STRING is
		do
			Result := parser_tree.parse(buffer, actions)
			if Result = Void then
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
				add_error_position(Result, buffer)
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
