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
deferred class PARSE_ATOM
	--
	-- A part of the PARSE_TABLE.
	--

feature {ANY}
	name: STRING

	table: PARSE_TABLE

feature {PARSE_TABLE}
	set (a_name: like name; a_table: like table) is
		require
			not a_name.is_empty
			a_table /= Void
		do
			name := a_name
			table := a_table
		ensure
			name = a_name
			table = a_table
		end

	set_table (a_table: like table) is
		require
			a_table /= Void
		do
			table := a_table
		ensure
			table = a_table
		end

	is_coherent: BOOLEAN is
		deferred
		ensure
			must_be_coherent: Result
		end

	set_default_tree_builders (non_terminal_builder: PROCEDURE[TUPLE[STRING, TRAVERSABLE[STRING]]]
		terminal_builder: PROCEDURE[TUPLE[STRING, PARSER_IMAGE]]) is
		require
			is_coherent
		deferred
		end

feature {ESE_PARSER, PARSE_NT_NODE}
	parse (buffer: MINI_PARSER_BUFFER; actions: COLLECTION[PARSE_ACTION]): STRING is
			-- The Result is an error message which is Void if the parse succeeded.
		require
			actions /= Void
		deferred
		ensure
			actions.count >= old actions.count
			Result /= Void implies buffer.current_index = old buffer.current_index and then actions.count = old actions.count
		end

feature {}
	add_error_position (error: STRING; buffer: MINI_PARSER_BUFFER) is
		local
			n, l, c: INTEGER
		do
			n := buffer.current_index
			from
				l := 1
				c := 1
				buffer.set_current_index(1)
			until
				buffer.current_index = n
			loop
				if buffer.current_character = '%N' then
					l := l + 1
					c := 1
				else
					c := c + 1
				end
				buffer.next
			end
			if not error.is_empty then
				error.extend(' ')
			end
			error.append(once "at line ")
			l.append_in(error)
			error.append(once ", column ")
			c.append_in(error)
		end

	print_error_position (o: OUTPUT_STREAM; buffer: MINI_PARSER_BUFFER) is
		local
			s: STRING
		do
			s := once ""
			s.clear_count
			add_error_position(s, buffer)
			o.put_string(s)
		end

end -- class PARSE_ATOM
