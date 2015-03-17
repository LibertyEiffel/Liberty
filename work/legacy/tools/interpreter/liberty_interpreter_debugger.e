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
         -- The object to notify about the running program: entry and exit of functions, code stepping...

   break (a_entry: like entry): BOOLEAN
         -- `entry' is the debug instructions entered by the user.
         --
         -- Returns True if the program should continue running, False if the debugger should display the
         -- prompt again and wait for further instructions.
      require
         a_entry /= Void
      do
         entry.copy(a_entry)
         if not entry.is_empty then
            if entry.first = ':' then
               Result := debug_entry
            else
               execute
               check
                  not Result
               end
            end
         end
      end

feature {}
   debug_entry: BOOLEAN
      require
         entry.first = ':'
      local
         evaled: BOOLEAN
      do
         entry.remove_first
         if not entry.is_empty then
            parser_buffer.initialize_with(entry)
            debug_grammar.reset
            evaled := parser.eval(parser_buffer, debug_grammar.table, once "Entry")
            if not evaled then
               std_error.put_line(once "Incomplete command.")
            elseif parser.error /= Void then
               errors.emit_syntax_error(parser.error, entry, Void)
            else
               debug_grammar.root_node.accept(debug_visitor)
               Result := debug_visitor.should_continue
            end
         end
      end

   execute
      do
         check
            saved_errors.is_empty
         end
         if try_to_execute_expression then
         elseif try_to_execute_instruction then
         else
            print_saved_errors
         end
         saved_errors.clear_count
      end

feature {}
   try_to_execute_expression: BOOLEAN
      local
         ast: LIBERTY_AST_EXPRESSION; exp: LIBERTY_EXPRESSION
         actual_type: LIBERTY_ACTUAL_TYPE; done: BOOLEAN
      do
         error_saved := False
         from
         until
            done
         loop
            ast := interpreter.universe.parse_expression(entry, agent save_error)
            if ast /= Void then
               actual_type ::= interpreter.target.result_type.known_type
               exp := builder.expression(ast, actual_type)
               if exp.result_type /= Void then
                  exp.accept(interpreter.expressions)
                  interpreter.object_printer.print_object(std_output, interpreter.expressions.eval_memory, 0)
                  Result := True
                  done := True
               end
            elseif not error_saved then
               readline.set_prompt(once " ... > ")
               readline.read_line
               entry.extend('%N')
               entry.append(readline.last_string)
            else
               done := True
            end
         end
      end

   try_to_execute_instruction: BOOLEAN
      local
         ast: LIBERTY_AST_INSTRUCTION; ins: LIBERTY_INSTRUCTION
         actual_type: LIBERTY_ACTUAL_TYPE; done: BOOLEAN
      do
         error_saved := False
         from
         until
            done
         loop
            ast := interpreter.universe.parse_instruction(entry, agent save_error)
            if ast /= Void then
               actual_type ::= interpreter.target.result_type.known_type
               ins := builder.instruction(ast, actual_type)
               ins.accept(interpreter.instructions)
               Result := True
               done := True
            elseif not error_saved then
               readline.set_prompt(once " ... > ")
               readline.read_line
               entry.extend('%N')
               entry.append(readline.last_string)
            else
               done := True
            end
         end
      end

   entry: STRING ""

   saved_errors: FAST_ARRAY[PARSE_ERROR]
   error_saved: BOOLEAN

   save_error (parse_error: PARSE_ERROR)
      do
         saved_errors.add_last(parse_error)
         error_saved := True
      end

   print_saved_errors
      do
         saved_errors.do_all(agent print_error)
      end

feature {}
   print_error (a_error: PARSE_ERROR)
      require
         a_error /= Void
      do
         std_error.put_line(a_error.message)
      end

   make (a_interpreter: like interpreter)
      require
         a_interpreter /= Void
      do
         interpreter := a_interpreter
         create steps.make(a_interpreter)
         create debug_visitor.make(a_interpreter)
         create builder.make(a_interpreter)
         create saved_errors.with_capacity(2)
      ensure
         interpreter = a_interpreter
      end

   errors: LIBERTY_ERRORS
   debug_visitor: LIBERTY_INTERPRETER_DEBUGGER_VISITOR_IMPL
   interpreter: LIBERTY_INTERPRETER
   builder: LIBERTY_INTERPRETER_DEBUGGER_SEMANTICS_BUILDER

   debug_grammar: LIBERTY_INTERPRETER_DEBUGGER_GRAMMAR
      once
         create Result.make(create {LIBERTY_INTERPRETER_DEBUGGER_FACTORY}.make)
      end

   parser_buffer: MINI_PARSER_BUFFER
      once
         create Result
      end

   parser: DESCENDING_PARSER
      once
         create Result.make
      end

   readline: READLINE_INPUT_STREAM
      once
         create Result.make
      end

invariant
   interpreter /= Void
   saved_errors /= Void

end -- class LIBERTY_INTERPRETER_DEBUGGER
