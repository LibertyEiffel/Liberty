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
class ESE_PARSER
	--
	-- The entry point to LL(n) parsing. Currently that top-down parsing is directly implemented in the
	-- PARSE_ATOM classes.
	--

creation {ANY}
	make

feature {ANY}
	parse (buffer: MINI_PARSER_BUFFER; grammar: PARSE_TABLE; start: STRING; a_actions: COLLECTION[PARSE_ACTION]) is
		require
			a_actions /= Void
			grammar.is_coherent
			grammar.has(start)
		local
			atom: PARSE_ATOM
		do
			atom := grammar.item(start)
			if not atom.parse(buffer, a_actions) then
				error_message := buffer.last_error
				if error_message = Void then
					error_message := once "This does not look like Eiffel, not even remotely."
				end
			end
		ensure
			a_actions.count >= old a_actions.count
			error_message /= Void implies a_actions.count = old a_actions.count
		end

	eval (buffer: MINI_PARSER_BUFFER; grammar: PARSE_TABLE; start: STRING) is
		local
			i: INTEGER
		do
			actions.clear_count
			parse(buffer, grammar, start, actions)
			if error_message = Void then
				debug ("parse")
					std_error.put_line(once "Actions:")
					std_error.put_line(once "--8<-------- <start actions>")
					from
						i := actions.lower
					until
						i > actions.upper
					loop
						std_error.put_integer(i)
						std_error.put_character('%T')
						std_error.put_line(actions.item(i).name)
						i := i + 1
					end
					std_error.put_line(once "-------->8-- <end actions>")
				end
				from
					i := actions.lower
				until
					i > actions.upper
				loop
					debug ("parse")
						std_error.put_string(once "Calling action #")
						std_error.put_integer(i)
						std_error.put_string(once ": ")
						std_error.put_line(actions.item(i).name)
					end
					actions.item(i).call
					i := i + 1
				end
			end
		end

	error_message: STRING

feature {}
	make is
		do
		end

	actions: FAST_ARRAY[PARSE_ACTION] is
		once
			create Result.make(0)
		end

end -- class ESE_PARSER
