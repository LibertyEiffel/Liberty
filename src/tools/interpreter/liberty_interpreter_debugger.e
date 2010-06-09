-- This file is part of Liberty Eiffel.
--
-- Liberty Eiffel is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, version 3 of the License.
--
-- Liberty Eiffel is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with Liberty Eiffel.  If not, see <http://www.gnu.org/licenses/>.
--
class LIBERTY_INTERPRETER_DEBUGGER

inherit
	LIBERTY_INTERPRETER_DEBUGGER_VISITOR

create {LIBERTY_INTERPRETER}
	make

feature {LIBERTY_INTERPRETER}
	steps: LIBERTY_INTERPRETER_DEBUGGER_STEPS

	break (entry: STRING): BOOLEAN is
		require
			entry /= Void
		do
			if not entry.is_empty then
				if entry.first = ':' then
					Result := debug_entry(entry)
				else
					execute(entry)
					check
						not Result
					end
				end
			end
		end

feature {}
	debug_entry (entry: STRING): BOOLEAN is
		require
			entry.first = ':'
		do
			entry.remove_first
			if not entry.is_empty then
				parser_buffer.initialize_with(entry)
				debug_grammar.reset
				parser.eval(parser_buffer, debug_grammar.table, once "Entry")
				if parser.error /= Void then
					errors.emit_syntax_error(parser.error, entry, Void)
				else
					debug_grammar.root_node.accept(debug_visitor)
					Result := debug_visitor.should_continue
				end
			end
		end

	execute (entry: STRING) is
		do
		end

feature {}
	make (a_interpreter: like interpreter) is
		require
			a_interpreter /= Void
		do
			interpreter := a_interpreter
			create steps.make(a_interpreter)
			create debug_visitor.make(a_interpreter)
		ensure
			interpreter = a_interpreter
		end

	errors: LIBERTY_ERRORS
	debug_visitor: LIBERTY_INTERPRETER_DEBUGGER_VISITOR_IMPL
	interpreter: LIBERTY_INTERPRETER

	debug_grammar: LIBERTY_INTERPRETER_DEBUGGER_GRAMMAR is
		once
			create Result.make(create {LIBERTY_INTERPRETER_DEBUGGER_FACTORY}.make)
		end

	parser_buffer: MINI_PARSER_BUFFER is
		once
			create Result
		end

	parser: DESCENDING_PARSER is
		once
			create Result.make
		end

invariant
	interpreter /= Void

end -- class LIBERTY_INTERPRETER_DEBUGGER
